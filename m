Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ECD4D93E0
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Mar 2022 06:32:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D07381856;
	Tue, 15 Mar 2022 06:31:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D07381856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647322345;
	bh=02rsLoDwO89u4ryKg01wDRlGP+QvlDqV8FsAuod87vI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UwdURlatYPOzjCZIFmV4KtK8GgZtmH4+KetoZDD1epIinFSOXxbVl7ePKiWgIYXi5
	 nsbm1fxvfUABIfoeVTtaK/97ujH8C84UsJCIJm+F3yfyLPZZSHu7B/JqtrTUokAShk
	 sTmiWSItJtHztVZKelRVwrMcEcAVpSMtR6QAK5hk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62080F8025B;
	Tue, 15 Mar 2022 06:31:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B83AEF80095; Tue, 15 Mar 2022 06:31:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, HTML_MESSAGE, PRX_APP_ATTACH, PRX_BODY_135, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 248E1F80095
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 06:31:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 248E1F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VvhmFPQV"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22F5VSqS045789;
 Tue, 15 Mar 2022 00:31:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1647322288;
 bh=SN+oZVtwUDp4Qj4ewdPTQI44xvmKkdznGxjFnNPRjKM=;
 h=From:To:CC:Subject:Date;
 b=VvhmFPQV81Z7gcig/7TAd9AFBFv5trP3gdx78V+XaxcvE5ucJxvdIXZKVSWmyAkCl
 vhVS2n8EDpn8KWm9UcoWfCIIDpDwExzE/hvteKg7ucWhtvsIV/Nx7ApWsnDGZCOyvv
 QmTPOGlClitSmnxtleHsi7FCBaA73BSV//KFjsZQ=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22F5VSD1053866
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Mar 2022 00:31:28 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 15
 Mar 2022 00:31:28 -0500
Received: from DFLE107.ent.ti.com ([fe80::86f:14f0:164b:4dbe]) by
 DFLE107.ent.ti.com ([fe80::86f:14f0:164b:4dbe%17]) with mapi id
 15.01.2308.014; Tue, 15 Mar 2022 00:31:28 -0500
From: "Xu, Yang" <raphael-xu@ti.com>
To: "broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.com"
 <tiwai@suse.com>
Subject: [PATCH 4/4] Asoc: tas2764 : new tas27xx driver to support either
 tas2764 or tas2780
Thread-Topic: [PATCH 4/4] Asoc: tas2764 : new tas27xx driver to support either
 tas2764 or tas2780
Thread-Index: Adg4Ld30U3WCua75QgaeAN21hzU+zg==
Date: Tue, 15 Mar 2022 05:31:27 +0000
Message-ID: <7d42e930b11344b785b5e1e6eefd627b@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.162.214]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/mixed;
 boundary="_004_7d42e930b11344b785b5e1e6eefd627bticom_"
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

--_004_7d42e930b11344b785b5e1e6eefd627bticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Change log:
Path:  sound/soc/codecs

  1.  This patch to support either TAS2764 or TAS2780 device from TI
  2.  Fixed "no sound" issue on some platforms.

Regards
Raphael

--_004_7d42e930b11344b785b5e1e6eefd627bticom_
Content-Type: application/octet-stream; name="Makefile.patch"
Content-Description: Makefile.patch
Content-Disposition: attachment; filename="Makefile.patch"; size=810;
	creation-date="Tue, 15 Mar 2022 05:31:22 GMT";
	modification-date="Tue, 15 Mar 2022 05:31:22 GMT"
Content-Transfer-Encoding: base64

LS0tIGtlcm5lbC01LTE2LTEzL01ha2VmaWxlCTIwMjItMDMtMDkgMTM6MDU6MDEuMDI3NDczNDAw
ICswODAwCisrKyBrZXJuZWwtNS0xNi0xMy1tb2RpZmllZC9NYWtlZmlsZQkyMDIyLTAzLTA5IDEz
OjQ3OjQ4LjE5ODIyMDIwMCArMDgwMApAQCAtMzMxLDYgKzMzMSw3IEBAIHNuZC1zb2MtdHBhNjEz
MGEyLW9ianMgOj0gdHBhNjEzMGEyLm8KIHNuZC1zb2MtdGFzMjU1Mi1vYmpzIDo9IHRhczI1NTIu
bwogc25kLXNvYy10YXMyNTYyLW9ianMgOj0gdGFzMjU2Mi5vCiBzbmQtc29jLXRhczI3NjQtb2Jq
cyA6PSB0YXMyNzY0Lm8KK3NuZC1zb2MtdGFzMjd4eC1vYmpzIDo9IHRhczI3eHgubwogIyBNdXgK
IHNuZC1zb2Mtc2ltcGxlLW11eC1vYmpzIDo9IHNpbXBsZS1tdXgubwogCkBAIC01NjQsNiArNTY1
LDcgQEAgb2JqLSQoQ09ORklHX1NORF9TT0NfU1RJX1NBUykJKz0gc25kLXNvYwogb2JqLSQoQ09O
RklHX1NORF9TT0NfVEFTMjU1MikJKz0gc25kLXNvYy10YXMyNTUyLm8KIG9iai0kKENPTkZJR19T
TkRfU09DX1RBUzI1NjIpCSs9IHNuZC1zb2MtdGFzMjU2Mi5vCiBvYmotJChDT05GSUdfU05EX1NP
Q19UQVMyNzY0KQkrPSBzbmQtc29jLXRhczI3NjQubworb2JqLSQoQ09ORklHX1NORF9TT0NfVEFT
Mjd4eCkJKz0gc25kLXNvYy10YXMyN3h4Lm8KIG9iai0kKENPTkZJR19TTkRfU09DX1RBUzUwODYp
CSs9IHNuZC1zb2MtdGFzNTA4Ni5vCiBvYmotJChDT05GSUdfU05EX1NPQ19UQVM1NzFYKQkrPSBz
bmQtc29jLXRhczU3MXgubwogb2JqLSQoQ09ORklHX1NORF9TT0NfVEFTNTcyMCkJKz0gc25kLXNv
Yy10YXM1NzIwLm8K

--_004_7d42e930b11344b785b5e1e6eefd627bticom_--
