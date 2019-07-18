Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 869C06CB74
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2019 11:04:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15F521680;
	Thu, 18 Jul 2019 11:03:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15F521680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563440676;
	bh=4aXCKNosJemo3lLxFFm9Qor7Z2ABd8QfatUyTPLsxEs=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FisdPXlFXvWQttwW8grT/FLPirEP/KutGRx9qyme1ZxPkC5g96ZmTvXMRPJn5nJdK
	 NciQvvZxdfDsEPYfm9Gy1AvIaICkEJaFZ1eHqMEeBPZ2SYa+OMsUfGE5uIS03bjruM
	 UJfIdKsArXCOIDpEjfktLXshKdSlVSQaU+eUMPZE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67458F8038F;
	Thu, 18 Jul 2019 11:02:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82AEFF80376; Thu, 18 Jul 2019 11:02:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40095.outbound.protection.outlook.com [40.107.4.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3EEFF8015B
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 11:02:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3EEFF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="GKDK60aT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QF8aqQvjepihxdOqJpfr9UEAD+8YRZnYVqTWhjFl8EbMVm4hI1Z+SRb5v48k74NHbQAUbI/32ujfNz/ideZd+K0snR8b5F6wc3lvXi9qXdm3J+4CCVktCcuFgHtOAFFBPDxcubJvtm9PwSNe11Mq3jpJddToztGGDhIQITIXsDlYD+zIAG+DZugBddLd1+SFxK6iGaElO8BaD+WOszkso6hmEN1Bx11P/h1ZjOKaAtk6KnhsAwNucUFMNKZefmAdV7no2/tuGR87tAlYEFQ9x1xgPsMyxnVNHFdxaHl3bOwvPBjjUqbKLwBLNGTXuhheMANbYIUH40LjjOv3BNX9rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGpVGZImbmc95FSXPYKBCpMGSiJdr0hGDbnoCUCGxtM=;
 b=oNTJMt0eXKd69iJXUmuMMHcgKELUblDk/oemnd3Uedxc5MUQyHBeVVkie0Fmf4TYKn6egLPfLLOlapthvGT7r7XUIONDqweSSfhLjrPWhN7DBzP29bxZMipJgGrGZ2gKVRzn8AtTq5SJeM93qAPNKi6clhFkfAmPPjVotVi9XU+F3HEJGG2f65b0lvDa0dGmngd/+cJi4aXjx+mGOGWYVEr8fzlJougMNOBCXCAtlk0LlXujNaC+CujMauJOhX0PkpX22RdA7z38WiqfvQlJnbtLEat7BJAG4TTmEejNLAO4SMgJ+Pyw21gBzTyDfTZTmo3ZmyHwSH6awF9VY2x9ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=toradex.com;dmarc=pass action=none
 header.from=toradex.com;dkim=pass header.d=toradex.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGpVGZImbmc95FSXPYKBCpMGSiJdr0hGDbnoCUCGxtM=;
 b=GKDK60aTNIUh/FDYW+qRuy4oDLZNhVkZ8BS3oMWO0ANEwBg21AyXrM2dZtvrZhPyxcTYq4vpITTo1A6CuQTooD0XxR7Yqnj9vzOrbYrMpAreP7nfRbCuJq0ugmDHsmEU2YUEYynkVx169QREPyDuKE+jgF0rRx50h4OmJTRIdTY=
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com (20.179.18.16) by
 AM6PR05MB5013.eurprd05.prod.outlook.com (20.177.35.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Thu, 18 Jul 2019 09:02:44 +0000
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9]) by AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9%6]) with mapi id 15.20.2094.011; Thu, 18 Jul 2019
 09:02:43 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Fabio Estevam <festevam@gmail.com>
Thread-Topic: [PATCH v5 0/6] VAG power control improvement for sgtl5000 codec
Thread-Index: AQHVPUeP/ONI1wldyUSM7jeicVl0+w==
Date: Thu, 18 Jul 2019 09:02:43 +0000
Message-ID: <20190718090240.18432-1-oleksandr.suvorov@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR08CA0060.eurprd08.prod.outlook.com
 (2603:10a6:205:2::31) To AM6PR05MB6535.eurprd05.prod.outlook.com
 (2603:10a6:20b:71::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [194.105.145.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe4f0ca2-27a7-434c-5ca0-08d70b5eb1fd
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR05MB5013; 
x-ms-traffictypediagnostic: AM6PR05MB5013:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM6PR05MB50134B7168E056BCE6AFC66DF9C80@AM6PR05MB5013.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:241;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39850400004)(346002)(366004)(376002)(396003)(136003)(199004)(189003)(2616005)(99286004)(68736007)(476003)(50226002)(486006)(86362001)(8936002)(81166006)(81156014)(26005)(14454004)(4326008)(186003)(386003)(6506007)(316002)(102836004)(6916009)(54906003)(52116002)(36756003)(6486002)(6436002)(71190400001)(71200400001)(6306002)(6512007)(25786009)(14444005)(66066001)(256004)(966005)(66946007)(64756008)(66476007)(66556008)(66446008)(1076003)(1411001)(5660300002)(8676002)(478600001)(7736002)(44832011)(6116002)(3846002)(305945005)(53936002)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR05MB5013;
 H:AM6PR05MB6535.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HjPMpirg55Hfib9grPLE+5DmoMUtNsmea5b8MthajO6Jcp1F5oMUd6XW0ApwwMS9O0W+9w69yxPIG5Ih2gh+lI7orv5DLsth/UmX8G5BppPA6h/pXtqY3WLDwBaFZyG+62gtMe+uOVVHiuhqTNCJE5KeVZjEInG7Fh0b6Kec+2YsHjRWxwhBPmy+j1w3n3AERl/J5yOt3nHTX77PXlHAA0rbCD/bPos/YvjpCstk/M4TWyvBvQdm8BqvbqSzEGM46mTXQ7intcqibiR5zMCz24BixM2RoWynIwZVaY9LgFNBRF7Iz1oOyp9C7fX4VBvi+B9fFAXbQgaa3nE9tnQCGNPsxMqj2u7fuMGb6SaDLx3dcaV5vwM/QO1Y/MdpMHSOK/Y/6PkrF6B70Q4CQrAUF6pUOUiEhimFPk9fyQAEZAk=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe4f0ca2-27a7-434c-5ca0-08d70b5eb1fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 09:02:43.8246 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oleksandr.suvorov@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5013
Cc: Sasha Levin <sashal@kernel.org>, Igor Opaniuk <igor.opaniuk@toradex.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH v5 0/6] VAG power control improvement for
	sgtl5000 codec
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


VAG power control is improved to fit the manual [1]. This patchset fixes as
minimum one bug: if customer muxes Headphone to Line-In right after boot,
the VAG power remains off that leads to poor sound quality from line-in.

I.e. after boot:
- Connect sound source to Line-In jack;
- Connect headphone to HP jack;
- Run following commands:
$ amixer set 'Headphone' 80%
$ amixer set 'Headphone Mux' LINE_IN

Also this series includes fixes of non-important bugs in sgtl5000 codec
driver.

[1] https://www.nxp.com/docs/en/data-sheet/SGTL5000.pdf

Changes in v5:
- Add explicit stable tag
- Improve commit message
- Add explicit stable tag

Changes in v4:
- CC the patch to kernel-stable
- Code optimization, simplify function signature
  (thanks to Cezary Rojewski <cezary.rojewski@intel.com> for an idea)
- CC the patch to kernel-stable
- Add a Fixes tag

Changes in v3:
- Add the reference to NXP SGTL5000 data sheet to commit message
- Add the reference to NXP SGTL5000 data sheet to commit message
- Fix multi-line comment format

Changes in v2:
- Fix patch formatting
- Fix patch formatting
- Fix patch formatting
- Fix patch formatting
- Fix patch formatting
- Fix patch formatting

Oleksandr Suvorov (6):
  ASoC: Define a set of DAPM pre/post-up events
  ASoC: sgtl5000: Improve VAG power and mute control
  ASoC: sgtl5000: Fix definition of VAG Ramp Control
  ASoC: sgtl5000: add ADC mute control
  ASoC: sgtl5000: Fix of unmute outputs on probe
  ASoC: sgtl5000: Fix charge pump source assignment

 include/sound/soc-dapm.h    |   2 +
 sound/soc/codecs/sgtl5000.c | 240 ++++++++++++++++++++++++++++++------
 sound/soc/codecs/sgtl5000.h |   2 +-
 3 files changed, 203 insertions(+), 41 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
