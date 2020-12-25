Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 677E32E2A73
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Dec 2020 09:44:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED8F11845;
	Fri, 25 Dec 2020 09:43:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED8F11845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608885888;
	bh=VJS/J2TP9T00uwaMsyS1+eoIM/9n5h1Or7YKTLjDaBA=;
	h=To:Subject:From:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vvMHV93bW102PjCEDbU4OBWgnoNQ1q+EC0slYUnKwVW0wCUf3godstwUChMX8Ays5
	 XSQp8B0OpNlERCXSp3++Dh/0ZKwrZMIZxS4Gf7buM183cc9bKB2UvoXkj3Vwf9h6vc
	 ZVVnSX1DAAHaAC462vTjN2aSY16uHpjKF569SoVs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39C63F801EB;
	Fri, 25 Dec 2020 09:43:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A42C2F801D5; Fri, 25 Dec 2020 09:43:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=MSGID_FROM_MTA_HEADER,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m176148.mail.qiye.163.com (m176148.mail.qiye.163.com
 [59.111.176.148])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D63EFF80113
 for <alsa-devel@alsa-project.org>; Fri, 25 Dec 2020 09:43:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D63EFF80113
Received: from vivo.com (wm-8.qy.internal [127.0.0.1])
 by m176148.mail.qiye.163.com (Hmail) with ESMTP id 63AAF1A4F3A;
 Fri, 25 Dec 2020 16:42:48 +0800 (CST)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <AAoArwDfDnoefyxzy2wyiaqm.1.1608885766936.Hmail.zhucancan@vivo.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: =?UTF-8?B?QVNvQzogc29jLXBjbTogZGlzY29ubmVjdCBCRXMgaWYgdGhlIEZFIGlzIG5vdCByZWFkeQ==?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 58.251.74.232
MIME-Version: 1.0
Received: from zhucancan@vivo.com( [58.251.74.232) ] by ajax-webmail (
 [127.0.0.1] ) ; Fri, 25 Dec 2020 16:42:46 +0800 (GMT+08:00)
From: =?UTF-8?B?5pyx54G/54G/?= <zhucancan@vivo.com>
Date: Fri, 25 Dec 2020 16:42:46 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZHh4fSkgfTB5IHxpOVkpNS0NDQ05MTEpPSElVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQQ8JDh5XWRIfHhUPWUFZRzo6FDoJDD8dPxUUHh0CAwECSQwC
 EhoKFlVKVUpNS0NDQ05MTElJQ0hVMxYaEhdVARMOGBoVGBoVOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlISVlXWQgBWUFPT09PNwY+
X-HM-Tid: 0a7699109abb9394kuws63aaf1a4f3a
Cc: kernel@vivo.com, trivial@kernel.org, zhucancan@vivo.com
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

RkUgaXMgY29ubmVjdGVkIHRvIHR3byBCRXMsIEJFMSBpcyBhY3RpdmUsIEJFMiBpcyBkZWFjdGl2
ZS4KV2hlbiBjbG9zaW5nIEJFMSwgRkUvQkUxIGlzIGluIEhXX0ZSRUUgc3RhdGUsIHRoZW4gQkUy
IGlzCnN0YXJ0dXAgYnkgbWl4ZXIgcnVudGltZSB1cGRhdGUuCgpGb3IgRkUgaXMgaW4gSFdfRlJF
RSBzdGF0ZSwgZHBjbV9ydW5fdXBkYXRlX3N0YXJ0dXAoKSB3aWxsIHNraXAKQkUyJ3Mgc3RhcnR1
cCBiZWNhdXNlIEZFJ3Mgc3RhdGUgaXMgSFdfRlJFRSwgQkUyIHN0YXlzIGluIEZFJ3MKYmVfY2xp
ZW50cyBsaXN0LgoKRHVyaW5nIEZFJ3MgY2xvc2VkLCB0aGUgZHBjbV9mZV9kYWlfY2xvc2UoKSB3
aWxsIGNsb3NlIGFsbCByZWxhdGVkCkJFcywgQkUyIHdpbGwgYmUgY2xvc2VkLiBUaGlzIHdpbGwg
bGVhZCB0byBCRTIncyBkcGNtW3N0cmVhbV0udXNlcnMKbWlzbWF0Y2guCgpXZSBuZWVkIGRpc2Nv
bm5ldCBhbGwgcGVuZGluZyBCRXMgaW4gdGhlIGNvcm5lciBjYXNlLgoKU2lnbmVkLW9mZi1ieTog
emh1Y2FuY2FuIDx6aHVjYW5jYW5Adml2by5jb20+Ci0tLQogc291bmQvc29jL3NvYy1wY20uYyB8
IDE5ICsrKysrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCsp
LCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9zb2MtcGNtLmMgYi9zb3Vu
ZC9zb2Mvc29jLXBjbS5jCmluZGV4IGRjYWI5NTI3YmEzZC4uMDRhZDUzZjBhZTRmIDEwMDY0NAot
LS0gYS9zb3VuZC9zb2Mvc29jLXBjbS5jCisrKyBiL3NvdW5kL3NvYy9zb2MtcGNtLmMKQEAgLTI0
NTEsOCArMjQ1MSwxMSBAQCBzdGF0aWMgaW50IGRwY21fcnVuX3VwZGF0ZV9zdGFydHVwKHN0cnVj
dCBzbmRfc29jX3BjbV9ydW50aW1lICpmZSwgaW50IHN0cmVhbSkKIAogCS8qIE9ubHkgc3RhcnQg
dGhlIEJFIGlmIHRoZSBGRSBpcyByZWFkeSAqLwogCWlmIChmZS0+ZHBjbVtzdHJlYW1dLnN0YXRl
ID09IFNORF9TT0NfRFBDTV9TVEFURV9IV19GUkVFIHx8Ci0JCWZlLT5kcGNtW3N0cmVhbV0uc3Rh
dGUgPT0gU05EX1NPQ19EUENNX1NUQVRFX0NMT1NFKQotCQlyZXR1cm4gLUVJTlZBTDsKKwkJZmUt
PmRwY21bc3RyZWFtXS5zdGF0ZSA9PSBTTkRfU09DX0RQQ01fU1RBVEVfQ0xPU0UpIHsKKwkJZGV2
X2VycihmZS0+ZGV2LCAiQVNvQzogRkUgJXMgaXMgbm90IHJlYWR5ICVkXG4iLAorCQkJZmUtPmRh
aV9saW5rLT5uYW1lLCBmZS0+ZHBjbVtzdHJlYW1dLnN0YXRlKTsKKwkJZ290byBkaXNjb25uZWN0
OworCX0KIAogCS8qIHN0YXJ0dXAgbXVzdCBhbHdheXMgYmUgY2FsbGVkIGZvciBuZXcgQkVzICov
CiAJcmV0ID0gZHBjbV9iZV9kYWlfc3RhcnR1cChmZSwgc3RyZWFtKTsKQEAgLTI1MTMsMTIgKzI1
MTYsMTggQEAgc3RhdGljIGludCBkcGNtX3J1bl91cGRhdGVfc3RhcnR1cChzdHJ1Y3Qgc25kX3Nv
Y19wY21fcnVudGltZSAqZmUsIGludCBzdHJlYW0pCiBjbG9zZToKIAlkcGNtX2JlX2RhaV9zaHV0
ZG93bihmZSwgc3RyZWFtKTsKIGRpc2Nvbm5lY3Q6Ci0JLyogZGlzY29ubmVjdCBhbnkgY2xvc2Vk
IEJFcyAqLworCS8qIGRpc2Nvbm5lY3QgYW55IHBlbmRpbmcgQkVzICovCiAJc3Bpbl9sb2NrX2ly
cXNhdmUoJmZlLT5jYXJkLT5kcGNtX2xvY2ssIGZsYWdzKTsKIAlmb3JfZWFjaF9kcGNtX2JlKGZl
LCBzdHJlYW0sIGRwY20pIHsKIAkJc3RydWN0IHNuZF9zb2NfcGNtX3J1bnRpbWUgKmJlID0gZHBj
bS0+YmU7Ci0JCWlmIChiZS0+ZHBjbVtzdHJlYW1dLnN0YXRlID09IFNORF9TT0NfRFBDTV9TVEFU
RV9DTE9TRSkKLQkJCWRwY20tPnN0YXRlID0gU05EX1NPQ19EUENNX0xJTktfU1RBVEVfRlJFRTsK
KworCQkvKiBpcyB0aGlzIG9wIGZvciB0aGlzIEJFID8gKi8KKwkJaWYgKCFzbmRfc29jX2RwY21f
YmVfY2FuX3VwZGF0ZShmZSwgYmUsIHN0cmVhbSkpCisJCQljb250aW51ZTsKKworCQlpZiAoYmUt
PmRwY21bc3RyZWFtXS5zdGF0ZSA9PSBTTkRfU09DX0RQQ01fU1RBVEVfQ0xPU0UgfHwKKwkJCWJl
LT5kcGNtW3N0cmVhbV0uc3RhdGUgPT0gU05EX1NPQ19EUENNX1NUQVRFX05FVykKKwkJCQlkcGNt
LT5zdGF0ZSA9IFNORF9TT0NfRFBDTV9MSU5LX1NUQVRFX0ZSRUU7CiAJfQogCXNwaW5fdW5sb2Nr
X2lycXJlc3RvcmUoJmZlLT5jYXJkLT5kcGNtX2xvY2ssIGZsYWdzKTsKIAotLSAKMi4yMS4wCgoK
DQoNCg==
