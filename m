Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A834D93DE
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Mar 2022 06:30:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FC961816;
	Tue, 15 Mar 2022 06:30:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FC961816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647322257;
	bh=tSPcdSNY7KPOg41tgVm5wlnmTmrNY0nmO+OZD0k5/rI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=stdvukjiC1gIlkDIXUmUeUCq8nU9XPGnHF8qRV8uAZg91FfAezyKPZsBtE5w5K6Q7
	 H7+OouebymXFekM33dd4HWZGDpwAJQCaSRibeJmRiXNP3CrjDPUQoNjA78yPjecIDy
	 PTUB17F00QqjwO6zGzQqbyFNUPltVlzelYAsPgiM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0527DF80095;
	Tue, 15 Mar 2022 06:29:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0557CF80162; Tue, 15 Mar 2022 06:29:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, HTML_MESSAGE, PRX_APP_ATTACH, PRX_BODY_135, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24302F80095
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 06:29:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24302F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MPNmBK+c"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22F5Tirl044868;
 Tue, 15 Mar 2022 00:29:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1647322184;
 bh=SqHi4LS8d/z0gDUVfxNr33OfOb/toUwNwrLBXAEbkYg=;
 h=From:To:CC:Subject:Date;
 b=MPNmBK+cwCpXE3IK165J1tYnp+Zm246uvLgJOzx598POqM5L3etXCn4CNxz4akTK5
 V6R+UGgcDldH7Icc6KxtvH+Y7ODuvSPO8yKSfZGU18l7YG534KZLiXDY9u4AwzItrA
 q+aNwA/VvxJSWeb+GP+d6ZFIco4BLWFKKBt/yEuc=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22F5TiBq057909
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Mar 2022 00:29:44 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 15
 Mar 2022 00:29:44 -0500
Received: from DFLE107.ent.ti.com ([fe80::86f:14f0:164b:4dbe]) by
 DFLE107.ent.ti.com ([fe80::86f:14f0:164b:4dbe%17]) with mapi id
 15.01.2308.014; Tue, 15 Mar 2022 00:29:44 -0500
From: "Xu, Yang" <raphael-xu@ti.com>
To: "broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.com"
 <tiwai@suse.com>
Subject: [PATCH 2/4] Asoc: tas2764 : new tas27xx driver to support either
 tas2764 or tas2780
Thread-Topic: [PATCH 2/4] Asoc: tas2764 : new tas27xx driver to support either
 tas2764 or tas2780
Thread-Index: Adg4Lat59dcHimcAQWaFRtMa8w3KSg==
Date: Tue, 15 Mar 2022 05:29:44 +0000
Message-ID: <90c95b65402c45c7a8fe82f48b1bbcb4@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.162.214]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/mixed;
 boundary="_004_90c95b65402c45c7a8fe82f48b1bbcb4ticom_"
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Ding,
 Shenghao" <shenghao-ding@ti.com>
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

--_004_90c95b65402c45c7a8fe82f48b1bbcb4ticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Change log:
Path:  sound/soc/codecs

  1.  This patch to support either TAS2764 or TAS2780 device from TI
  2.  Fixed "no sound" issue on some platforms.

Regards
Raphael

--_004_90c95b65402c45c7a8fe82f48b1bbcb4ticom_
Content-Type: application/octet-stream; name="tas27xx.h.patch"
Content-Description: tas27xx.h.patch
Content-Disposition: attachment; filename="tas27xx.h.patch"; size=2227;
	creation-date="Tue, 15 Mar 2022 05:29:00 GMT";
	modification-date="Tue, 15 Mar 2022 05:29:00 GMT"
Content-Transfer-Encoding: base64

LS0tIGtlcm5lbC01LTE2LTEzL3RhczI3NjQuaAkyMDIyLTAzLTA5IDEzOjIyOjE0LjQxNDY5NDgw
MCArMDgwMAorKysga2VybmVsLTUtMTYtMTMtbW9kaWZpZWQvdGFzMjd4eC5oCTIwMjItMDMtMTEg
MTQ6MDc6MjAuMDczNjU2ODAwICswODAwCkBAIC0xLDI0ICsxLDMyIEBACiAvKiBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5ICovCiAvKgotICogdGFzMjc2NC5oIC0gQUxTQSBT
b0MgVGV4YXMgSW5zdHJ1bWVudHMgVEFTMjc2NCBNb25vIEF1ZGlvIEFtcGxpZmllcgorICogdGFz
Mjc2NC5oIC0gQUxTQSBTb0MgVGV4YXMgSW5zdHJ1bWVudHMgVEFTMjc2NC9UQVMyNzgwIE1vbm8g
QXVkaW8gQW1wbGlmaWVyCiAgKgotICogQ29weXJpZ2h0IChDKSAyMDIwIFRleGFzIEluc3RydW1l
bnRzIEluY29ycG9yYXRlZCAtICBodHRwczovL3d3dy50aS5jb20KKyAqIENvcHlyaWdodCAoQykg
MjAyMiBUZXhhcyBJbnN0cnVtZW50cyBJbmNvcnBvcmF0ZWQgLSAgaHR0cHM6Ly93d3cudGkuY29t
CiAgKgotICogQXV0aG9yOiBEYW4gTXVycGh5IDxkbXVycGh5QHRpLmNvbT4KKyAqIEF1dGhvcjpS
YXBoYWVsIFh1CiAgKi8KIAotI2lmbmRlZiBfX1RBUzI3NjRfXwotI2RlZmluZSBfX1RBUzI3NjRf
XworI2lmbmRlZiBfX1RBUzI3WFhfXworI2RlZmluZSBfX1RBUzI3WFhfXwogCiAvKiBCb29rIENv
bnRyb2wgUmVnaXN0ZXIgKi8KLSNkZWZpbmUgVEFTMjc2NF9CT09LQ1RMX1BBR0UJMAotI2RlZmlu
ZSBUQVMyNzY0X0JPT0tDVExfUkVHCTEyNworI2RlZmluZSBUQVMyN1hYX0JPT0tDVExfUEFHRQkw
CisjZGVmaW5lIFRBUzI3WFhfQk9PS0NUTF9SRUcJMTI3CiAjZGVmaW5lIFRBUzI3NjRfUkVHKHBh
Z2UsIHJlZykJKChwYWdlICogMTI4KSArIHJlZykKIAogLyogUGFnZSAqLwogI2RlZmluZSBUQVMy
NzY0X1BBR0UJCVRBUzI3NjRfUkVHKDBYMCwgMHgwMCkKICNkZWZpbmUgVEFTMjc2NF9QQUdFX1BB
R0VfTUFTSwkyNTUKIAorI2RlZmluZSBUQVMyN1hYX1JFRyhib29rLCBwYWdlLCByZWcpICAoKChi
b29rICogMjU2ICogMTI4KSArIFwKKwkJCQkJKHBhZ2UgKiAxMjgpKSArIHJlZykKKyNkZWZpbmUg
VEFTMjdYWF9QMjUzX1JFR19EIAkJVEFTMjdYWF9SRUcoMHgwLCAweGZkLCAweGQpCisjZGVmaW5l
IFRBUzI3WFhfU1BFQ0lBTF9JRAkJVEFTMjdYWF9SRUcoMHgwLCAweGZkLCAweDdjKQorI2RlZmlu
ZSBUQVMyN1hYX0JPT0tfSUQocmVnKQkocmVnIC8gKDI1NiAqIDEyOCkpCisjZGVmaW5lIFRBUzI3
WFhfUEFHRV9JRChyZWcpCSgocmVnICUgKDI1NiAqIDEyOCkpIC8gMTI4KQorI2RlZmluZSBUQVMy
N1hYX1BBR0VfUkVHKHJlZykJKChyZWcgJSAoMjU2ICogMTI4KSkgJSAxMjgpCisKIC8qIFNvZnR3
YXJlIFJlc2V0ICovCiAjZGVmaW5lIFRBUzI3NjRfU1dfUlNUCVRBUzI3NjRfUkVHKDBYMCwgMHgw
MSkKICNkZWZpbmUgVEFTMjc2NF9SU1QJQklUKDApCkBAIC03Nyw2ICs4NSwxMCBAQAogI2RlZmlu
ZSBUQVMyNzY0X1RETV9DRkczX1JYU19TSElGVAkweDQKICNkZWZpbmUgVEFTMjc2NF9URE1fQ0ZH
M19NQVNLCQlHRU5NQVNLKDMsIDApCiAKKy8qIFRETSBDb25maWd1cmF0aW9uIFJlZzQgKi8KKyNk
ZWZpbmUgVEFTMjc2NF9URE1fQ0ZHNAkJVEFTMjc2NF9SRUcoMFgwLCAweDBkKQorI2RlZmluZSBU
QVMyNzY0X1RETV9DRkc0X1RYX09GRlNFVF9NQVNLCUdFTk1BU0soMywgMSkKKwogLyogVERNIENv
bmZpZ3VyYXRpb24gUmVnNSAqLwogI2RlZmluZSBUQVMyNzY0X1RETV9DRkc1CQlUQVMyNzY0X1JF
RygwWDAsIDB4MGUpCiAjZGVmaW5lIFRBUzI3NjRfVERNX0NGRzVfVlNOU19NQVNLCUJJVCg2KQpA
QCAtODksNCArMTAxLDE0IEBACiAjZGVmaW5lIFRBUzI3NjRfVERNX0NGRzZfSVNOU19FTkFCTEUJ
QklUKDYpCiAjZGVmaW5lIFRBUzI3NjRfVERNX0NGRzZfNTBfTUFTSwlHRU5NQVNLKDUsIDApCiAK
LSNlbmRpZiAvKiBfX1RBUzI3NjRfXyAqLworLyogSU5UJkNMSyBDRkcgKi8KKyNkZWZpbmUgVEFT
MjdYWF9DTEtfQ0ZHCQkJVEFTMjc2NF9SRUcoMFgwLCAweDVjKQorI2RlZmluZSBUQVMyN1hYX0NM
S19DRkdfTUFTSwkJR0VOTUFTSyg3LCA2KQorI2RlZmluZSBUQVMyN1hYX0NMS19DRkdfRU5BQkxF
CQkoQklUKDcpIHwgQklUKDYpKQorCit0eXBlZGVmIGVudW0gdGFzMjd4eCB7CisJVEFTMjc2NCA9
IDAsCisJVEFTMjc4MCA9IDEsCit9IHRhczI3eHhfdDsKKworI2VuZGlmIC8qIF9fVEFTMjdYWF9f
ICovCg==

--_004_90c95b65402c45c7a8fe82f48b1bbcb4ticom_--
