Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FC046AF65
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 01:51:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AE70227D;
	Tue,  7 Dec 2021 01:50:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AE70227D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638838294;
	bh=nyDM2d0g352+BJcxEEO4sOhiMrq6nXnmYl3dICXU+Mk=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=sY6F9MrBCZwlnHsyav8SZ12wKxELO2e5U6XD79T/VAj6QHw0UQGVEk7Z3+HkmJ6BC
	 4IUU6PXG1U08nOKOa9goIdwq4E1GZnfwH8wTQ2CZ/NpLmdbyuxnVT6SK+YdepGig9/
	 1mf6BcS9gG3efS7zv+Dg7COWobuG85xDIpue3KEQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99712F804ED;
	Tue,  7 Dec 2021 01:50:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52D2FF804EC; Tue,  7 Dec 2021 01:50:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F30C6F804AE
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 01:50:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F30C6F804AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=diagnostix.io header.i=@diagnostix.io
 header.b="u3N1dqCe"
Date: Tue, 07 Dec 2021 00:50:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=diagnostix.io;
 s=protonmail; t=1638838211;
 bh=J8ZM9e8fX5LbqrR6NIVI4sZDWwYjPwCIWd2Xkrbh1E0=;
 h=Date:To:From:Reply-To:Subject:Message-ID:From:To:Cc;
 b=u3N1dqCeZDpc0XGnkyY10r6/+ZaZfFh/49/FafeE/Q6rU4KSOI9BgsTNDL6IyasR1
 afkCqW3hLMja1TMoeMOMqFrn1io54naSLJUPsNIXniZgdh21xeWZCZYD5t23Hn0Q/g
 L896HEUbaQq22kxemeaWx3tX+jzpoXbiTMd7fogJLgS1Ht5ZodfSEBdDwMhUuxr12Q
 xriy0tLYEuwSNpushBgc+hvLM/Php9zY0aol2O0+qmNwINWJKrS7XD8URqUq+Hs/KD
 yzQupeRj5g/5jrVS1F4AEOvNV/YDo+fKGyZ2sPeaahaQvn3pljgwh10OnrSzuxzFkZ
 hkZ9qIKrJnOFQ==
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: Dylanger Daly <dylanger@diagnostix.io>
Subject: Issues with plughw working, however raw hw not on MAX98360A
Message-ID: <gEkyvXPRjG124KR7bCDCZlMIsPudpIp-jc-43diIRbjs8_U55y6SmH50Hc7wjbeD1SEtRcLeI62F36F-HcRc1mVMc-YI_oOv0775rv630Vg=@diagnostix.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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
Reply-To: Dylanger Daly <dylanger@diagnostix.io>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SGkgYWxsLAoKSSdtIGN1cnJlbnRseSBoYXZpbmcgaXNzdWVzIHdpdGggbXkgc3BlYWtlcnMgb24g
YSBDaHJvbWVib29rIHJ1bm5pbmcgdGhlIE1BWDk4MzYwQSBEQUMuCgpkaXJlY3RvckBEUklGVFdP
T0Q6fiQgYXBsYXkgLUQgaHc6c2M3MTgwcnQ1NjgybWF4LDEgLS1kdW1wLWh3LXBhcmFtcyAvdXNy
L3NoYXJlL3NvdW5kcy9hbHNhL0Zyb250X0NlbnRlci53YXYKWERHX1JVTlRJTUVfRElSICgvcnVu
L3VzZXIvMCkgaXMgbm90IG93bmVkIGJ5IHVzICh1aWQgMTAwMCksIGJ1dCBieSB1aWQgMCEgKFRo
aXMgY291bGQgZS5nLiBoYXBwZW4gaWYgeW91IHRyeSB0byBjb25uZWN0IHRvIGEgbm9uLXJvb3Qg
UHVsc2VBdWRpbyBhcyBhIHJvb3QgdSkKUGxheWluZyBXQVZFICcvdXNyL3NoYXJlL3NvdW5kcy9h
bHNhL0Zyb250X0NlbnRlci53YXYnIDogU2lnbmVkIDE2IGJpdCBMaXR0bGUgRW5kaWFuLCBSYXRl
IDQ4MDAwIEh6LCBNb25vCkhXIFBhcmFtcyBvZiBkZXZpY2UgImh3OnNjNzE4MHJ0NTY4Mm1heCwx
IjoKLS0tLS0tLS0tLS0tLS0tLS0tLS0KQUNDRVNTOiBNTUFQX0lOVEVSTEVBVkVEIFJXX0lOVEVS
TEVBVkVECkZPUk1BVDogUzE2X0xFClNVQkZPUk1BVDogU1REClNBTVBMRV9CSVRTOiAxNgpGUkFN
RV9CSVRTOiA2NApDSEFOTkVMUzogNApSQVRFOiA0ODAwMApQRVJJT0RfVElNRTogNjQwMDAKUEVS
SU9EX1NJWkU6IDMwNzIKUEVSSU9EX0JZVEVTOiAyNDU3NgpQRVJJT0RTOiAyCkJVRkZFUl9USU1F
OiAxMjgwMDAKQlVGRkVSX1NJWkU6IDYxNDQKQlVGRkVSX0JZVEVTOiA0OTE1MgpUSUNLX1RJTUU6
IEFMTAotLS0tLS0tLS0tLS0tLS0tLS0tLQphcGxheTogc2V0X3BhcmFtczoxMzU4OiBDaGFubmVs
cyBjb3VudCBub24gYXZhaWxhYmxlCmRpcmVjdG9yQERSSUZUV09PRDp+JCBhcGxheSAtRCBwbHVn
aHc6c2M3MTgwcnQ1NjgybWF4LDEgLS1kdW1wLWh3LXBhcmFtcyAvdXNyL3NoYXJlL3NvdW5kcy9h
bHNhL0Zyb250X0NlbnRlci53YXYKWERHX1JVTlRJTUVfRElSICgvcnVuL3VzZXIvMCkgaXMgbm90
IG93bmVkIGJ5IHVzICh1aWQgMTAwMCksIGJ1dCBieSB1aWQgMCEgKFRoaXMgY291bGQgZS5nLiBo
YXBwZW4gaWYgeW91IHRyeSB0byBjb25uZWN0IHRvIGEgbm9uLXJvb3QgUHVsc2VBdWRpbyBhcyBh
IHJvb3QgdSkKUGxheWluZyBXQVZFICcvdXNyL3NoYXJlL3NvdW5kcy9hbHNhL0Zyb250X0NlbnRl
ci53YXYnIDogU2lnbmVkIDE2IGJpdCBMaXR0bGUgRW5kaWFuLCBSYXRlIDQ4MDAwIEh6LCBNb25v
CkhXIFBhcmFtcyBvZiBkZXZpY2UgInBsdWdodzpzYzcxODBydDU2ODJtYXgsMSI6Ci0tLS0tLS0t
LS0tLS0tLS0tLS0tCkFDQ0VTUzogTU1BUF9JTlRFUkxFQVZFRCBNTUFQX05PTklOVEVSTEVBVkVE
IE1NQVBfQ09NUExFWCBSV19JTlRFUkxFQVZFRCBSV19OT05JTlRFUkxFQVZFRApGT1JNQVQ6IFM4
IFU4IFMxNl9MRSBTMTZfQkUgVTE2X0xFIFUxNl9CRSBTMjRfTEUgUzI0X0JFIFUyNF9MRSBVMjRf
QkUgUzMyX0xFIFMzMl9CRSBVMzJfTEUgVTMyX0JFIEZMT0FUX0xFIEZMT0FUX0JFIEZMT0FUNjRf
TEUgRkxPQVQ2NF9CRSBNVV9MQVcgQV9MQVcgSU1BX0FFClNVQkZPUk1BVDogU1REClNBTVBMRV9C
SVRTOiBbNCA2NF0KRlJBTUVfQklUUzogWzQgNjQwMDAwXQpDSEFOTkVMUzogWzEgMTAwMDBdClJB
VEU6IFs0MDAwIDQyOTQ5NjcyOTUpClBFUklPRF9USU1FOiA2NDAwMApQRVJJT0RfU0laRTogWzI1
NiAyNzQ4Nzc5MDcpClBFUklPRF9CWVRFUzogWzEyOCA0Mjk0OTY3Mjk1KQpQRVJJT0RTOiAoMCAy
MTQ3NDg0KQpCVUZGRVJfVElNRTogWzEgNDI5NDk2NzI5NV0KQlVGRkVSX1NJWkU6IFs1MTIgNTQ5
NzU1ODEzXQpCVUZGRVJfQllURVM6IFsyNTYgNDI5NDk2NzI5NV0KVElDS19USU1FOiBBTEwKLS0t
LS0tLS0tLS0tLS0tLS0tLS0KV2hlbiBJIHNwZWNpZnkgcGx1Z2h3LCBtZWFuaW5nICJhZGQgc29m
dHdhcmUgcHJvY2Vzc2luZyIsIEkgY2FuIGhlYXIgcGVyZmVjdCBvdXRwdXQsIGhvd2V2ZXIgaWYg
SSBhdHRlbXB0IHRvIHVzZSB0aGUgcmF3IGh3IGhhbmRsZSwgSSBnZXQgc2lnbmlmaWNhbnRseSBs
ZXNzIGZvcm1hdCBzdXBwb3J0IGFuZCB0aGUgY2hhbm5lbCBjb3VudCBpc24ndCBldmVuIGtub3du
LCBhbmQgdGhlcmUgaXMgbm8gc291bmQgb3V0cHV0LgoKSSBiZWxpZXZlIHRoaXMgaXMgaGFwcGVu
aW5nIGJlY2F1c2UgdGhlIGRyaXZlciBpc24ndCBiZWluZyBwaWNrZWQgdXAsIGFuZCBwbHVnaHcg
c2ltcGx5IGFkZHMgd2hhdCBpdCBjYW4gdG8gdGhlIGRldmljZSBtYWtpbmcgaXQgd29yay4KClRo
ZSBlbmQgcmVzdWx0IGlzIG5laXRoZXIgUGlwZVdpcmUgb3IgUGx1c2VBdWRpbyBkZXRlY3QgdGhl
IHNwZWFrZXIgZGV2aWNlLCBJIGFzc3VtZSB0aGlzIGlzIGJlY2F1c2UgdGhleSdyZSBleHBlY3Rp
bmcgdG8gdXNlIHRoZSByYXcgaHcgZGV2aWNlIGhhbmRsZQoKSGVyZSdzIG15IHVjbTIgY29uZmln
OiBodHRwczovL2dpdGh1Yi5jb20vaGV4ZHVtcDA4MTUvaW1hZ2VidWlsZGVyL2Jsb2IvZDAyYTcx
YWNlN2I5M2I4ZWZiZmY4NDI2NjI0NDU4YTY2NjhmZTY4MC9zeXN0ZW1zL2Nocm9tZWJvb2tfdHJv
Z2Rvci9leHRyYS1maWxlcy91c3Ivc2hhcmUvYWxzYS91Y20yL1NDNzE4MC9IaUZpLmNvbmYKCkFu
eSBoZWxwIHdvdWxkIGJlIGFwcHJlY2lhdGVkLCB0aGFuayB5b3U=
