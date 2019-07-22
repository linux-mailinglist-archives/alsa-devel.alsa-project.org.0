Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E4670078
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 15:03:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6888017E6;
	Mon, 22 Jul 2019 15:02:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6888017E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563800598;
	bh=BHgnxN7E70Bdiz064J3kTSayLeEntJ/UHiZVP2wNGmw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OeLPPg0SQMRta12OTBid3rCA4+gWoKp6YMQDv34uklD1RryVY073Pyb8nE1omtkX3
	 zqVCEvvPfOxj3LEC+0dMvsPpoG7Haz2eCIaOquN/HGFhMMgy/WJgOYpItHQJ4KzxmA
	 bqdYFoDr9Lo1Vt83yL1v26fQXW6XRUaYlrbWMmFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD65EF803D7;
	Mon, 22 Jul 2019 15:01:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77023F803D5; Mon, 22 Jul 2019 15:01:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C67E4F800E8
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 15:01:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C67E4F800E8
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hpXwN-0005n3-Uu; Mon, 22 Jul 2019 15:01:19 +0200
Message-ID: <1563800477.2311.12.camel@pengutronix.de>
From: Lucas Stach <l.stach@pengutronix.de>
To: Daniel Baluta <daniel.baluta@nxp.com>, broonie@kernel.org
Date: Mon, 22 Jul 2019 15:01:17 +0200
In-Reply-To: <20190722124833.28757-8-daniel.baluta@nxp.com>
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
 <20190722124833.28757-8-daniel.baluta@nxp.com>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, viorel.suman@nxp.com, timur@kernel.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, shengjiu.wang@nxp.com,
 angus@akkea.ca, tiwai@suse.com, nicoleotsuka@gmail.com, linux-imx@nxp.com,
 kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 07/10] ASoC: fsl_sai: Add support for FIFO
	combine mode
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

QW0gTW9udGFnLCBkZW4gMjIuMDcuMjAxOSwgMTU6NDggKzAzMDAgc2NocmllYiBEYW5pZWwgQmFs
dXRhOgo+IEZJRk8gY29tYmluaW5nIG1vZGUgYWxsb3dzIHRoZSBzZXBhcmF0ZSBGSUZPcyBmb3Ig
bXVsdGlwbGUgZGF0YQo+IGNoYW5uZWxzCj4gdG8gYmUgdXNlZCBhcyBhIHNpbmdsZSBGSUZPIGZv
ciBlaXRoZXIgc29mdHdhcmUgYWNjZXNzZXMgb3IgYSBzaW5nbGUKPiBkYXRhCj4gY2hhbm5lbCBv
ciBib3RoLgo+IAo+IEZJRk8gY29tYmluZWQgbW9kZSBpcyBkZXNjcmliZWQgaW4gY2hhcHRlciAx
My4xMC4zLjUuNCBmcm9tIGkuTVg4TVEKPiByZWZlcmVuY2UgbWFudWFsIFsxXS4KPiAKPiBGb3Ig
ZWFjaCBkaXJlY3Rpb24gKFJYL1RYKSBmaWZvIGNvbWJpbmUgbW9kZSBpcyByZWFkIGZyb20gZnNs
LGZjb21iLQo+IG1vZGUKPiBEVCBwcm9wZXJ0eS4gQnkgZGVmYXVsdCwgaWYgbm8gcHJvcGVydHkg
aXMgc3BlY2lmaWVkIGZpZm8gY29tYmluZQo+IG1vZGUKPiBpcyBkaXNhYmxlZC4KPiAKPiBbMV1o
dHRwczovL2NhY2hlLm54cC5jb20vc2VjdXJlZC9hc3NldHMvZG9jdW1lbnRzL2VuL3JlZmVyZW5j
ZS1tYW51YWwKPiAvSU1YOE1EUUxRUk0ucGRmP19fZ2RhX189MTU2MzcyODcwMV8zOGJlYTdmMGY3
MjY0NzJjYzY3NWNiMTQxYjkxYmVjNyYKPiBmaWxlRXh0PS5wZGYKPiAKPiBTaWduZWQtb2ZmLWJ5
OiBEYW5pZWwgQmFsdXRhIDxkYW5pZWwuYmFsdXRhQG54cC5jb20+Cj4gLS0tCj4gwqBzb3VuZC9z
b2MvZnNsL2ZzbF9zYWkuYyB8IDM3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPiDCoHNvdW5kL3NvYy9mc2wvZnNsX3NhaS5oIHzCoMKgOSArKysrKysrKysKPiDCoDIgZmls
ZXMgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2Mv
ZnNsL2ZzbF9zYWkuYyBiL3NvdW5kL3NvYy9mc2wvZnNsX3NhaS5jCj4gaW5kZXggZDBmYTAyMTg4
YjdjLi4xNDAwMTQ5MDFmY2UgMTAwNjQ0Cj4gLS0tIGEvc291bmQvc29jL2ZzbC9mc2xfc2FpLmMK
PiArKysgYi9zb3VuZC9zb2MvZnNsL2ZzbF9zYWkuYwo+IEBAIC00NzUsNiArNDc1LDM1IEBAIHN0
YXRpYyBpbnQgZnNsX3NhaV9od19wYXJhbXMoc3RydWN0Cj4gc25kX3BjbV9zdWJzdHJlYW0gKnN1
YnN0cmVhbSwKPiDCoAkJfQo+IMKgCX0KPiDCoAo+ICsJc3dpdGNoIChzYWktPnNvY19kYXRhLT5m
Y29tYl9tb2RlW3R4XSkgewo+ICsJY2FzZSBGU0xfU0FJX0ZDT01CX05PTkU6Cj4gKwkJcmVnbWFw
X3VwZGF0ZV9iaXRzKHNhaS0+cmVnbWFwLCBGU0xfU0FJX3hDUjQodHgpLAo+ICsJCQkJwqDCoMKg
RlNMX1NBSV9DUjRfRkNPTUJfU09GVCB8Cj4gKwkJCQnCoMKgwqBGU0xfU0FJX0NSNF9GQ09NQl9T
SElGVCwgMCk7Cj4gKwkJYnJlYWs7Cj4gKwljYXNlIEZTTF9TQUlfRkNPTUJfU0hJRlQ6Cj4gKwkJ
cmVnbWFwX3VwZGF0ZV9iaXRzKHNhaS0+cmVnbWFwLCBGU0xfU0FJX3hDUjQodHgpLAo+ICsJCQkJ
wqDCoMKgRlNMX1NBSV9DUjRfRkNPTUJfU09GVCB8Cj4gKwkJCQnCoMKgwqBGU0xfU0FJX0NSNF9G
Q09NQl9TSElGVCwKPiArCQkJCcKgwqDCoEZTTF9TQUlfQ1I0X0ZDT01CX1NISUZUKTsKPiArCQli
cmVhazsKPiArCWNhc2UgRlNMX1NBSV9GQ09NQl9TT0ZUOgo+ICsJCXJlZ21hcF91cGRhdGVfYml0
cyhzYWktPnJlZ21hcCwgRlNMX1NBSV94Q1I0KHR4KSwKPiArCQkJCcKgwqDCoEZTTF9TQUlfQ1I0
X0ZDT01CX1NPRlQgfAo+ICsJCQkJwqDCoMKgRlNMX1NBSV9DUjRfRkNPTUJfU0hJRlQsCj4gKwkJ
CQnCoMKgwqBGU0xfU0FJX0NSNF9GQ09NQl9TT0ZUKTsKPiArCQlicmVhazsKPiArCWNhc2UgRlNM
X1NBSV9GQ09NQl9CT1RIOgo+ICsJCXJlZ21hcF91cGRhdGVfYml0cyhzYWktPnJlZ21hcCwgRlNM
X1NBSV94Q1I0KHR4KSwKPiArCQkJCcKgwqDCoEZTTF9TQUlfQ1I0X0ZDT01CX1NPRlQgfAo+ICsJ
CQkJwqDCoMKgRlNMX1NBSV9DUjRfRkNPTUJfU0hJRlQsCj4gKwkJCQnCoMKgwqBGU0xfU0FJX0NS
NF9GQ09NQl9TT0ZUIHwKPiArCQkJCcKgwqDCoEZTTF9TQUlfQ1I0X0ZDT01CX1NISUZUKTsKPiAr
CQlicmVhazsKPiArCWRlZmF1bHQ6Cj4gKwkJYnJlYWs7Cj4gKwl9CgpUaGlzIHdvdWxkIHByb2Jh
Ymx5IGxvb2sgbGVzcyByZWR1bmRhbnQgaWYgeW91IG9ubHkgc2VsZWN0IHRoZSBiaXRzIHRvCnNl
dCBpbiB0aGUgc3dpdGNoIHN0YXRlbWVudCBhbmQgbW92ZSB0aGUgcmVnbWFwX3VwZGF0ZV9iaXRz
IGFmdGVyIHRoZQpzd2l0Y2guCgpSZWdhcmRzLApMdWNhcwoKPiDCoAlyZWdtYXBfdXBkYXRlX2Jp
dHMoc2FpLT5yZWdtYXAsIEZTTF9TQUlfeENSNCh0eCksCj4gwqAJCQnCoMKgwqBGU0xfU0FJX0NS
NF9TWVdEX01BU0sgfAo+IEZTTF9TQUlfQ1I0X0ZSU1pfTUFTSywKPiDCoAkJCcKgwqDCoHZhbF9j
cjQpOwo+IEBAIC04ODcsNiArOTE2LDE0IEBAIHN0YXRpYyBpbnQgZnNsX3NhaV9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlCj4gKnBkZXYpCj4gwqAJCX0KPiDCoAl9Cj4gwqAKPiArCS8qIEZJ
Rk8gY29tYmluZSBtb2RlIGZvciBUWC9SWCwgZGVmYXVsdHMgdG8gZGlzYWJsZWQgKi8KPiArCXNh
aS0+ZmNvbWJfbW9kZVtSWF0gPSBGU0xfU0FJX0ZDT01CX05PTkU7Cj4gKwlzYWktPmZjb21iX21v
ZGVbVFhdID0gRlNMX1NBSV9GQ09NQl9OT05FOwo+ICsJb2ZfcHJvcGVydHlfcmVhZF91MzJfaW5k
ZXgobnAsICJmc2wsZmNvbWItbW9kZSIsIFJYLAo+ICsJCQkJwqDCoMKgJnNhaS0+ZmNvbWJfbW9k
ZVtSWF0pOwo+ICsJb2ZfcHJvcGVydHlfcmVhZF91MzJfaW5kZXgobnAsICJmc2wsZmNvbWItbW9k
ZSIsIFRYLAo+ICsJCQkJwqDCoMKgJnNhaS0+ZmNvbWJfbW9kZVtUWF0pOwo+ICsKPiDCoAkvKiBh
Y3RpdmUgZGF0YSBsaW5lcyBtYXNrIGZvciBUWC9SWCwgZGVmYXVsdHMgdG8gMSAob25seSB0aGUK
PiBmaXJzdAo+IMKgCcKgKiBkYXRhIGxpbmUgaXMgZW5hYmxlZAo+IMKgCcKgKi8KPiBkaWZmIC0t
Z2l0IGEvc291bmQvc29jL2ZzbC9mc2xfc2FpLmggYi9zb3VuZC9zb2MvZnNsL2ZzbF9zYWkuaAo+
IGluZGV4IDZkMzJmMDk1MGVjNS4uYWJmMTQwOTUxMTg3IDEwMDY0NAo+IC0tLSBhL3NvdW5kL3Nv
Yy9mc2wvZnNsX3NhaS5oCj4gKysrIGIvc291bmQvc29jL2ZzbC9mc2xfc2FpLmgKPiBAQCAtMTE1
LDYgKzExNSw4IEBACj4gwqAjZGVmaW5lIEZTTF9TQUlfQ1IzX1dERkxfTUFTSwkweDFmCj4gwqAK
PiDCoC8qIFNBSSBUcmFuc21pdCBhbmQgUmVjZWl2ZSBDb25maWd1cmF0aW9uIDQgUmVnaXN0ZXIg
Ki8KPiArI2RlZmluZSBGU0xfU0FJX0NSNF9GQ09NQl9TSElGVCBCSVQoMjYpCj4gKyNkZWZpbmUg
RlNMX1NBSV9DUjRfRkNPTUJfU09GVMKgwqBCSVQoMjcpCj4gwqAjZGVmaW5lIEZTTF9TQUlfQ1I0
X0ZSU1ooeCkJKCgoeCkgLSAxKSA8PCAxNikKPiDCoCNkZWZpbmUgRlNMX1NBSV9DUjRfRlJTWl9N
QVNLCSgweDFmIDw8IDE2KQo+IMKgI2RlZmluZSBGU0xfU0FJX0NSNF9TWVdEKHgpCSgoKHgpIC0g
MSkgPDwgOCkKPiBAQCAtMTU1LDYgKzE1NywxMiBAQAo+IMKgI2RlZmluZSBGU0xfU0FJX01BWEJV
UlNUX1RYIDYKPiDCoCNkZWZpbmUgRlNMX1NBSV9NQVhCVVJTVF9SWCA2Cj4gwqAKPiArLyogRklG
TyBjb21iaW5lIG1vZGVzICovCj4gKyNkZWZpbmUgRlNMX1NBSV9GQ09NQl9OT05FwqDCoMKgwqDC
oDAKPiArI2RlZmluZSBGU0xfU0FJX0ZDT01CX1NISUZUwqDCoMKgwqAxCj4gKyNkZWZpbmUgRlNM
X1NBSV9GQ09NQl9TT0ZUwqDCoMKgwqDCoDIKPiArI2RlZmluZSBGU0xfU0FJX0ZDT01CX0JPVEjC
oMKgwqDCoMKgMwo+ICsKPiDCoHN0cnVjdCBmc2xfc2FpX3NvY19kYXRhIHsKPiDCoAlib29sIHVz
ZV9pbXhfcGNtOwo+IMKgCXVuc2lnbmVkIGludCBmaWZvX2RlcHRoOwo+IEBAIC0xNzcsNiArMTg1
LDcgQEAgc3RydWN0IGZzbF9zYWkgewo+IMKgCXVuc2lnbmVkIGludCBzbG90X3dpZHRoOwo+IMKg
Cj4gwqAJdW5zaWduZWQgaW50IGRsX21hc2tbMl07Cj4gKwl1bnNpZ25lZCBpbnQgZmNvbWJfbW9k
ZVsyXTsKPiDCoAo+IMKgCWNvbnN0IHN0cnVjdCBmc2xfc2FpX3NvY19kYXRhICpzb2NfZGF0YTsK
PiDCoAlzdHJ1Y3Qgc25kX2RtYWVuZ2luZV9kYWlfZG1hX2RhdGEgZG1hX3BhcmFtc19yeDsKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBt
YWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5h
bHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
