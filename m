Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 389F04D93DF
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Mar 2022 06:31:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 149901848;
	Tue, 15 Mar 2022 06:30:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 149901848
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647322296;
	bh=9Blaev02yNSgmZ1z8kgdJa7Cp/L0sPq4HZJOHkqYPuc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ePi7giGa6tp0g+N3qaaXTYLccmPaFOXKfFuzoJEUlthyzqRsMZ9ZPe9qZv2R0MCQM
	 kxGh1w23C+NIdzJDNQ1CoswDuYA3OsXuKIgsSdmFJeT95oetLwP8P9SMg7TSUlBUbV
	 vZhzu7ofcTtM1bY+N1s86AXKtLlJuKm1TaOekBO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF24AF80162;
	Tue, 15 Mar 2022 06:30:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D456F801F7; Tue, 15 Mar 2022 06:30:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, HTML_MESSAGE, PRX_APP_ATTACH, PRX_BODY_135, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57E85F800FF
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 06:30:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57E85F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wFqqS8uD"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22F5UXhI053476;
 Tue, 15 Mar 2022 00:30:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1647322233;
 bh=SCx2IT3fF4wL3GXghgFeS7b7YebquL4DsFXGL6tIUbg=;
 h=From:To:CC:Subject:Date;
 b=wFqqS8uDuQDp5tg8eXA0xE6zcfpp0gkxIyM8Uz/Q8+alUlKZzrsfMF03FC2At6InV
 zADapfaN8oaCA2fuLuUMA5ebbTfudnLVeS/4dOVl6frmFCzOh8RSrcczxQrg8Fr4CT
 fHAWu0tnvCN4BrQxsscbvgUS1vFJFrzArlElFSrI=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22F5UWQG060157
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Mar 2022 00:30:33 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 15
 Mar 2022 00:30:31 -0500
Received: from DFLE107.ent.ti.com ([fe80::86f:14f0:164b:4dbe]) by
 DFLE107.ent.ti.com ([fe80::86f:14f0:164b:4dbe%17]) with mapi id
 15.01.2308.014; Tue, 15 Mar 2022 00:30:31 -0500
From: "Xu, Yang" <raphael-xu@ti.com>
To: "broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.com"
 <tiwai@suse.com>
Subject: [PATCH 3/4] Asoc: tas2764 : new tas27xx driver to support either
 tas2764 or tas2780
Thread-Topic: [PATCH 3/4] Asoc: tas2764 : new tas27xx driver to support either
 tas2764 or tas2780
Thread-Index: Adg4Lb6gPuJSNKXdTFOOHiJXT0zmWw==
Date: Tue, 15 Mar 2022 05:30:31 +0000
Message-ID: <d175cd4f742d4ddd9e5567d56feb6e81@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.162.214]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/mixed;
 boundary="_004_d175cd4f742d4ddd9e5567d56feb6e81ticom_"
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

--_004_d175cd4f742d4ddd9e5567d56feb6e81ticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Change log:
Path:  sound/soc/codecs

  1.  This patch to support either TAS2764 or TAS2780 device from TI
  2.  Fixed "no sound" issue on some platforms.

Regards
Raphael

--_004_d175cd4f742d4ddd9e5567d56feb6e81ticom_
Content-Type: application/octet-stream; name="Kconfig.patch"
Content-Description: Kconfig.patch
Content-Disposition: attachment; filename="Kconfig.patch"; size=670;
	creation-date="Tue, 15 Mar 2022 05:30:26 GMT";
	modification-date="Tue, 15 Mar 2022 05:30:26 GMT"
Content-Transfer-Encoding: base64

LS0tIGtlcm5lbC01LTE2LTEzL0tjb25maWcJMjAyMi0wMy0wOSAxMzowNDozOS41NDc2NjkxMDAg
KzA4MDAKKysrIGtlcm5lbC01LTE2LTEzLW1vZGlmaWVkL0tjb25maWcJMjAyMi0wMy0wOSAxMzo0
NToxMC40MTMyMDE0MDAgKzA4MDAKQEAgLTIxMyw2ICsyMTMsNyBAQCBjb25maWcgU05EX1NPQ19B
TExfQ09ERUNTCiAJaW1wbHkgU05EX1NPQ19UQVMyNTYyCiAJaW1wbHkgU05EX1NPQ19UQVMyNzY0
CiAJaW1wbHkgU05EX1NPQ19UQVMyNzcwCisJaW1wbHkgU05EX1NPQ19UQVMyN1hYCiAJaW1wbHkg
U05EX1NPQ19UQVM1MDg2CiAJaW1wbHkgU05EX1NPQ19UQVM1NzFYCiAJaW1wbHkgU05EX1NPQ19U
QVM1NzIwCkBAIC0xNDQxLDYgKzE0NDIsMTAgQEAgY29uZmlnIFNORF9TT0NfVEFTMjc3MAogCXRy
aXN0YXRlICJUZXhhcyBJbnN0cnVtZW50cyBUQVMyNzcwIHNwZWFrZXIgYW1wbGlmaWVyIgogCWRl
cGVuZHMgb24gSTJDCiAKK2NvbmZpZyBTTkRfU09DX1RBUzI3eHgKKwl0cmlzdGF0ZSAiVGV4YXMg
SW5zdHJ1bWVudHMgVEFTMjd4eCBzcGVha2VyIGFtcGxpZmllciIKKwlkZXBlbmRzIG9uIEkyQwor
CQogY29uZmlnIFNORF9TT0NfVEFTNTA4NgogCXRyaXN0YXRlICJUZXhhcyBJbnN0cnVtZW50cyBU
QVM1MDg2IHNwZWFrZXIgYW1wbGlmaWVyIgogCWRlcGVuZHMgb24gSTJDCg==

--_004_d175cd4f742d4ddd9e5567d56feb6e81ticom_--
