import { delay } from 'rxjs/operators';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from '../../../../../environments/environment';
import { HttpClient } from '@angular/common/http';

@Injectable()
export class TellerListService {

  constructor(private httpClient: HttpClient) {
  }

  getTellerList(): Observable<any> {
    return this.httpClient.get(`${environment.API_ENDPOINT}users/tellers`)
      .pipe(delay(environment.RESPONSE_DELAY));
  }
}
