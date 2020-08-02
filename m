Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2C7235707
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Aug 2020 15:16:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC0F716DA;
	Sun,  2 Aug 2020 15:16:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC0F716DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596374214;
	bh=on8h5+JRjBnbAALQ8soHcQY4n+vqYHUfI3jbBuIOdZw=;
	h=To:Subject:In-Reply-To:From:Date:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=qFevm0Bvaw4qt/xKFP1BTqL6rkDoOuBbIwDu6IUO+dF26CUjIioXj5eM3hXvRNQ9y
	 rHx+db6kve/m2aCXyzd4PgNUqQTVAKXckLjA8r/WmRAdPcmry0rJNnvZfC23k7SiUI
	 jD5T8yoX6LpkqZJd0jwOtBzjz6+44SdyOKI9PsyQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE79EF800B7;
	Sun,  2 Aug 2020 15:15:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D5ADF80150; Sun,  2 Aug 2020 15:15:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=MSGID_FROM_MTA_HEADER,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-m127107.qiye.163.com (mail-m127107.qiye.163.com
 [115.236.127.107])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94545F800B7
 for <alsa-devel@alsa-project.org>; Sun,  2 Aug 2020 15:14:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94545F800B7
Received: from vivo.com (wm-12.qy.internal [127.0.0.1])
 by mail-m127107.qiye.163.com (Hmail) with ESMTP id 99F0281725;
 Sun,  2 Aug 2020 21:14:48 +0800 (CST)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <ADUAnwD8DVByMMSsrG-r3Kri.3.1596374087585.Hmail.wenhu.wang@vivo.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSF0gc29jOiBxbWk6IGFsbG93IHVzZXIgdG8gc2V0IGhhbmRsZSB3cSB0byBoaXByaW8=?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 58.251.74.226
In-Reply-To: <20200727204521.GB229995@builder.lan>
MIME-Version: 1.0
Received: from wenhu.wang@vivo.com( [58.251.74.226) ] by ajax-webmail (
 [127.0.0.1] ) ; Sun, 2 Aug 2020 21:14:47 +0800 (GMT+08:00)
From: =?UTF-8?B?546L5paH6JmO?= <wenhu.wang@vivo.com>
Date: Sun, 2 Aug 2020 21:14:47 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZTR1KTktOSx4aQkpOVkpOQk1ITE9LQ0JLSE5VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVKS0tZBg++
X-HM-Sender-Digest: e1kJHlYWEh9ZQU5MTU1OSEpOS0tJN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6Py46FQw*Qz8tOQI2NigICTxWCUgwCRJVSFVKTkJNSExPS0NCQ0lDVTMWGhIXVQweFRMOVQwa
 FRw7DRINFFUYFBZFWVdZEgtZQVlOQ1VJTkpVTE9VSUlNWVdZCAFZQU5LS0I3Bg++
X-HM-Tid: 0a73af4f7bbb986bkuuu99f0281725
Cc: ohad@wizery.com, linux-wireless@vger.kernel.org,
 alsa-devel@alsa-project.org, elder@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath10k@lists.infradead.org, ath11k@lists.infradead.org, agross@kernel.org,
 srinivas.kandagatla@linaro.org, sibis@codeaurora.org, netdev@vger.kernel.org,
 kuba@kernel.org, davem@davemloft.net, kvalo@codeaurora.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Cj4+IEN1cnJlbnRseSB0aGUgcW1pX2hhbmRsZSBpcyBpbml0aWFsaXplZCBzaW5nbGUgdGhyZWFk
ZWQgYW5kIHN0cmljdGx5Cj4+IG9yZGVyZWQgd2l0aCB0aGUgYWN0aXZlIHNldCB0byAxLiBUaGlz
IGlzIHByZXR0eSBzaW1wbGUgYW5kIHNhZmUgYnV0Cj4+IHNvbWV0aW1lcyBpbmVmZmVuY3kuIFNv
IGl0IGlzIGJldHRlciB0byBhbGxvdyB1c2VyIHRvIGRlY2lkZSB3aGV0aGVyCj4+IGEgaGlnaCBw
cmlvcml0eSB3b3JrcXVldWUgc2hvdWxkIGJlIHVzZWQuCj4KPkNhbiB5b3UgcGxlYXNlIGRlc2Ny
aWJlIGEgc2NlbmFyaW8gd2hlcmUgdGhpcyBpcyBuZWVkZWQvZGVzaXJlZCBhbmQKPnBlcmhhcHMg
YWxzbyBjb21tZW50IG9uIHdoeSB0aGlzIGlzIG5vdCBhbHdheXMgZGVzaXJlZD8KPgoKV2VsbCwg
b25lIHNjZW5hcmlvIGlzIHRoYXQgd2hlbiB0aGUgQVAgd2FudHMgdG8gY2hlY2sgdGhlIHN0YXR1
cyBvZiB0aGUKc3Vic3lzdGVtcyBhbmQgdGhlIHdob2xlIFFNSSBkYXRhIHBhdGguIEl0IGZpcnN0
IHNlbmRzIG91dCBhbiBpbmRpY2F0aW9uCndoaWNoIGFza3MgdGhlIHN1YnN5c3RlbXMgdG8gcmVw
b3J0IHRoZWlyIHN0YXR1cy4gQWZ0ZXIgdGhlIHN1YnN5c3RlbXMgc2VuZApyZXNwb25zZXMgdG8g
dGhlIEFQLCB0aGUgcmVzcG9uc2VzIHRoZW4gYXJlIHF1ZXVlZCBvbiB0aGUgd29ya3F1ZXVlIG9m
CnRoZSBRTUkgaGFuZGxlci4gQWN0dWFsbHkgdGhlIEFQIGlzIGNvbmZpZ3VyZWQgdG8gZG8gdGhl
IGNoZWNrIGluIGEgc3BlY2lmaWMKaW50ZXJ2YWwgcmVndWxhcmx5LiBBbmQgaXQgY2hlY2sgdGhl
IHJlcG9ydCBjb3VudHMgd2l0aGluIGEgc3BlY2lmaWMgZGVsYXkgYWZ0ZXIKaXQgc2VuZHMgb3V0
IHRoZSByZWxhdGVkIGluZGljYXRpb24uIFdoZW4gdGhlIEFQIGhhcyBiZWVuIHVuZGVyIGEgaGVh
dnkKbG9hZCBmb3IgbG9uZywgdGhlIHJlcG9ydHMgYXJlIHF1ZXVlIHRoZWlyIHdpdGhvdXQgQ1BV
IHJlc291cmNlIHRvIHVwZGF0ZQp0aGUgcmVwb3J0IGNvdW50cyB3aXRoaW4gdGhlIHNwZWNpZmlj
IGRlbGF5LiBBcyBhIHJlc3VsdCwgdGhlIHRocmVhZCB0aGF0IGNoZWNrcwp0aGUgcmVwb3J0IGNv
dW50cyB0YWtlcyBpdCBtaXNsZWFkaW5nbHkgdGhhdCB0aGUgUU1JIGRhdGEgcGF0aCBvciB0aGUg
c3Vic3lzdGVtcwphcmUgY3Jhc2hlZC4KClRoZSBwYXRjaCBjYW4gcmVhbGx5IHJlc29sdmUgdGhl
IHByb2JsZW0gbWVudGlvbmVkIGFib2x2ZS4KCkZvciBuYXJtYWwgc2l0dWF0aW9ucywgaXQgaXMg
ZW5vdWdoIHRvIGp1c3QgdXNlIG5vcm1hbCBwcmlvcml0eSBRTUkgd29ya3F1ZXVlLgoKPlJlZ2Fy
ZHMsCj5Cam9ybgo+Cj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBXYW5nIFdlbmh1IDx3ZW5odS53YW5n
QHZpdm8uY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvbmV0L2lwYS9pcGFfcW1pLmMgICAgICAgICAg
ICAgfCA0ICsrLS0KPj4gIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvcW1pLmMgfCAy
ICstCj4+ICBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL3FtaS5jIHwgMiArLQo+PiAg
ZHJpdmVycy9yZW1vdGVwcm9jL3Fjb21fc3lzbW9uLmMgICAgICB8IDIgKy0KPj4gIGRyaXZlcnMv
c2xpbWJ1cy9xY29tLW5nZC1jdHJsLmMgICAgICAgfCA0ICsrLS0KPj4gIGRyaXZlcnMvc29jL3Fj
b20vcGRyX2ludGVyZmFjZS5jICAgICAgfCA0ICsrLS0KPj4gIGRyaXZlcnMvc29jL3Fjb20vcW1p
X2ludGVyZmFjZS5jICAgICAgfCA5ICsrKysrKystLQo+PiAgaW5jbHVkZS9saW51eC9zb2MvcWNv
bS9xbWkuaCAgICAgICAgICB8IDMgKystCj4+ICBzYW1wbGVzL3FtaS9xbWlfc2FtcGxlX2NsaWVu
dC5jICAgICAgIHwgNCArKy0tCj4+ICA5IGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyks
IDE0IGRlbGV0aW9ucygtKQ0KDQo=
