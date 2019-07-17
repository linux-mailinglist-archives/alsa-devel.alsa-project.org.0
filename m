Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C74B76BFAF
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 18:35:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AF431691;
	Wed, 17 Jul 2019 18:34:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AF431691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563381308;
	bh=e1mxaf2y5Wjk22BxYFegf2uxwAjQ1+oqXqYLaM5mIyk=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YK84uBPIQ/XWznHXrcdsA0Yj8WhetZvDz/cfPdIq+3O2q05NbgQSpSsLRqnPOxSbW
	 yq8ySsDjwiDTUkxx6WVqXKGZHsiD6Qk9vHIf9zhLLemBogYCa3YOQSMlsFupfL0wap
	 bs02osL1MB38XXseEUUDClSwIN3l+ZX/ct0B9VQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F8EDF80481;
	Wed, 17 Jul 2019 18:31:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 838C3F80445; Wed, 17 Jul 2019 18:30:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20092.outbound.protection.outlook.com [40.107.2.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC98AF80444
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 18:30:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC98AF80444
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="LoO9Va12"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANQ9we1GF4lX3578fbnnR1a6e+eaLaAw1lbx3oVqGfkEh7M2msst8Xv80dZmVm6okQ4zfUhbQJJLFrj0QwVleqJqoKZJfuo9S2ayCCvrx9oateMgQ+TRCHItI+KC84vN/5EVXKi/8X2krvxreFDNPw7vY3D9d8AgxK5RDDH6s5xPMC0G4wR3ZeQA2ENtRq/IVJX8l8htnNC7Iyj247kOHKDVDRpRpVBlxYmlPLXF2dIwsnGPBhVMOin09KMsTQi9K1QHuvSc2mDAMp2taJ8irQPA1M6ezMlKgZNFtrZlybmj6WRWYqQhMpDyrNExs+OvBzDpDjkTYs5mH1vnqiB7Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T50sXYNMNxjCZ3iAUZ/fyNPX/WDT5uQTAGK0OKZJgM8=;
 b=A1VDbrdYGv3L2ga3DjCKrddUu8zM8p+Se/n3anohVk8/QQP6E4E2lPhNFnJCSwap+Yfm0Qz2Y4sD8vF0o3KdPl0EtBYboqEtMv7+l9KrmNuN94SgJR8zmWL7QGgGQbPszlAVZbsZsnLls5bZWPHxqR7x6i8ejdYC+YIQaUsSIp/wtStI0UqLLdArPSK9wMtM3syIvuYw7k0Ky7oH3ipthNljvS673mQKq2N0cUfyv3rLUZHyJdKSTj2lfpA3dyeOnDOyOSN/GdzzisGeHn99r2cNQ4qQGk4E4AUTEcJh3doOLl7nDmz9zgwee6J/3pR0V6ggWBbYbtUG+tRN6Ep9KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=toradex.com;dmarc=pass action=none
 header.from=toradex.com;dkim=pass header.d=toradex.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T50sXYNMNxjCZ3iAUZ/fyNPX/WDT5uQTAGK0OKZJgM8=;
 b=LoO9Va12yJuNaPQ8PoNMxKL/FACYzLUdtPXf8FlXAdLkSq9weXnotV2aHLKo98gvBr+VYdlLaUs/v8a68qhtU/Q7opMDW57CsP+b2ce6HPNU4mT/ZIVpOCh5qMHCpwS2dzxBESY7jJl68qMdxA+xFAh6ty7zezDBz7IQX6bYcFM=
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com (20.179.18.16) by
 AM6PR05MB6408.eurprd05.prod.outlook.com (20.179.6.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 16:30:51 +0000
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9]) by AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9%6]) with mapi id 15.20.2094.011; Wed, 17 Jul 2019
 16:30:51 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Fabio Estevam <festevam@gmail.com>
Thread-Topic: [PATCH v4 4/6] ASoC: sgtl5000: add ADC mute control
Thread-Index: AQHVPLz/r35mERsc3kyuoDGGQ3JgOg==
Date: Wed, 17 Jul 2019 16:30:51 +0000
Message-ID: <20190717163014.429-5-oleksandr.suvorov@toradex.com>
References: <20190717163014.429-1-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190717163014.429-1-oleksandr.suvorov@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4P190CA0020.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::30) To AM6PR05MB6535.eurprd05.prod.outlook.com
 (2603:10a6:20b:71::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [194.105.145.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a26a0f5-d332-4ed9-bdf9-08d70ad421e2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR05MB6408; 
x-ms-traffictypediagnostic: AM6PR05MB6408:
x-microsoft-antispam-prvs: <AM6PR05MB640855DB7D3BBE312E29CF84F9C90@AM6PR05MB6408.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39850400004)(136003)(346002)(396003)(376002)(366004)(189003)(199004)(486006)(305945005)(7736002)(2616005)(11346002)(476003)(446003)(1076003)(52116002)(36756003)(53936002)(66066001)(81156014)(81166006)(71200400001)(8676002)(6436002)(4744005)(6512007)(50226002)(8936002)(256004)(71190400001)(4326008)(3846002)(44832011)(6486002)(68736007)(14454004)(6116002)(2906002)(316002)(5660300002)(1411001)(99286004)(478600001)(66476007)(66556008)(64756008)(66446008)(66946007)(76176011)(86362001)(6916009)(6506007)(102836004)(386003)(26005)(186003)(54906003)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR05MB6408;
 H:AM6PR05MB6535.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iiKweZZyZqdi75JInVB4OHX4ShqIWTMl31biMdF3f2bc0AbioljY4sXXJOu5E+Bb2ENPl29rDfVSVlCcTa7FL6oq6V6j2RjgYVJpCFLTsd12LGC+KgDL1mOOHujz9RixPd15phct21fcQ6z1tfGmchsXiivtYA5TE4kFmGW6GjZYCHjiteQTucpyNPK9AQEVdov/ya/YS+Gtsl+xt+WAelgqSR7kcn4UQSPkHiSn3U5Ha/mEKrbfjt4S55NN1JB2UV1Fyv4EDF1wPEmvIGn+B7c7cw2DhjZ86BKCyRD8A1UGAN5cRiABm5jP2Uchgf9m1Bv5cv4+4cEJ3tvK1ZdjVUBydYriACXebbn9fIFgFB99NwXBtVSJ/y755xO3BIkSRBXqJYE16jdRpsBqqDHQpVuivtlLUeNLxSsjhUNOoM4=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a26a0f5-d332-4ed9-bdf9-08d70ad421e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 16:30:51.5036 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oleksandr.suvorov@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB6408
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH v4 4/6] ASoC: sgtl5000: add ADC mute control
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

This control mute/unmute the ADC input of SGTL5000
using its CHIP_ANA_CTRL register.

Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Reviewed-by: Igor Opaniuk <igor.opaniuk@toradex.com>

---

Changes in v4: None
Changes in v3: None
Changes in v2:
- Fix patch formatting

 sound/soc/codecs/sgtl5000.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index a8d55c21a5f2d..0123d9cfcb473 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -710,6 +710,7 @@ static const struct snd_kcontrol_new sgtl5000_snd_controls[] = {
 			SGTL5000_CHIP_ANA_ADC_CTRL,
 			8, 1, 0, capture_6db_attenuate),
 	SOC_SINGLE("Capture ZC Switch", SGTL5000_CHIP_ANA_CTRL, 1, 1, 0),
+	SOC_SINGLE("Capture Switch", SGTL5000_CHIP_ANA_CTRL, 0, 1, 1),
 
 	SOC_DOUBLE_TLV("Headphone Playback Volume",
 			SGTL5000_CHIP_ANA_HP_CTRL,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
