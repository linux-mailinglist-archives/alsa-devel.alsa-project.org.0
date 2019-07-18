Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C81FE6CB84
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2019 11:07:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E876168A;
	Thu, 18 Jul 2019 11:06:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E876168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563440833;
	bh=EJZAdtzzHWYt0O014G9iP4cTHSw5vZvc7LXZli2zEIg=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AyVhw9/MK/RxBvwAVCCEmWPiJDj8lQ6ZLnDuMN92gu2YOPx1b/8PKIKjVPTk+F/I1
	 o5KGDNP0wfnT8UeDRBmCwSQctZxOJf0tvY+5fhwdx4VncC81mWrUBjOKABTmHPOwNk
	 5E3G4xaIQMRtJNnVd4xx76T7ExEbACaA1R+o+ElE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E65AF80482;
	Thu, 18 Jul 2019 11:03:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55E10F803F4; Thu, 18 Jul 2019 11:02:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150109.outbound.protection.outlook.com [40.107.15.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F0CCF80391
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 11:02:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F0CCF80391
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="SrEJySmM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DjNEVLu5YDKYDry32xW80etNyJ1iU99mRu/+9yCJhIrOslIwFg7r1rOI2t6efhSodWFxFqyrWoKHqKuTriOH+hmRu97VCBC6OYb4mvt5s7sTC8d+pIEM5Bx0iVuxQ8dBoRi1Uxe8PvcnWsv1cbIZyi/m45DNNsf93yNfgURq7sAJDC7rOaOM5GJYeW2pNe+QaM3XNoffvUGXZ51L9OAkD0mVcFrIaAjvD4VtjUWA4HYlwHiuuAUITDANijcMp9uOU+HBnox3a94ejFrcBHsMHDz0rofRL6tZ/vtA7temyIpVAYgAvbOUWtzDe4WowWGYgaVEw20vgRT7h6QDnfWjmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45X+Y2bERyBfazVTmZxOV1DjVVuSO5pnlowazssve3c=;
 b=hN7qLEflPlQ1QhNS3kY4kTuGwrWsJdGW+aMYwUF97rniOFAbp1Eq6dH3K8nm4GudV/gPFU/5GW7H4JsbpQ4SwW4ehs3gkELB/1fG/Zcs0jmxaOuxcziE5nbl9azw9Nr9/R91JPRryxKJbek24n7LV+m/+T8iRO5vj42alECQqLktkmAxQGAvowZAyYStIv8Le/FTK4u8kFYxM0243H3npT88ZxjRi13UR3JmpHPKJxPQ7cbAgFD2RY9kJ/KlXIsGdHLOoGztsXR0gI9PQlWyU1XJ5CZGwEshBGtkN7fxmyskoBQRXmspB2it90G2jUB5lGyTD7LYfJrVz9ZQnhqnTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=toradex.com;dmarc=pass action=none
 header.from=toradex.com;dkim=pass header.d=toradex.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45X+Y2bERyBfazVTmZxOV1DjVVuSO5pnlowazssve3c=;
 b=SrEJySmM1iY2dCpRPscd6btFW1n1emjA2SjCOVfLHT3tp25rn3Do5BbN7P5tKlVAd/3DcefJWKm+cVbRX21jYaLJR/c6HBNBPuYyJQ6x94RQKHVHVQ4E2ERTd3cSk/FCNTZktgZ0+EKByCm0xL9PKzMEuRENvaOyaPPVFIHF7b4=
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com (20.179.18.16) by
 AM6PR05MB5013.eurprd05.prod.outlook.com (20.177.35.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Thu, 18 Jul 2019 09:02:51 +0000
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9]) by AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9%6]) with mapi id 15.20.2094.011; Thu, 18 Jul 2019
 09:02:51 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Fabio Estevam <festevam@gmail.com>
Thread-Topic: [PATCH v5 4/6] ASoC: sgtl5000: add ADC mute control
Thread-Index: AQHVPUeTL7C42F/420K4CqAM90BbWw==
Date: Thu, 18 Jul 2019 09:02:51 +0000
Message-ID: <20190718090240.18432-5-oleksandr.suvorov@toradex.com>
References: <20190718090240.18432-1-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190718090240.18432-1-oleksandr.suvorov@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR08CA0058.eurprd08.prod.outlook.com
 (2603:10a6:205:2::29) To AM6PR05MB6535.eurprd05.prod.outlook.com
 (2603:10a6:20b:71::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [194.105.145.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ceb33f8-3a81-4a7d-c879-08d70b5eb654
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR05MB5013; 
x-ms-traffictypediagnostic: AM6PR05MB5013:
x-microsoft-antispam-prvs: <AM6PR05MB5013EECB2FFF8C645AC95A62F9C80@AM6PR05MB5013.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39850400004)(346002)(366004)(376002)(396003)(136003)(199004)(189003)(2616005)(99286004)(68736007)(476003)(446003)(50226002)(11346002)(486006)(86362001)(8936002)(81166006)(76176011)(81156014)(26005)(14454004)(4326008)(186003)(386003)(6506007)(316002)(102836004)(6916009)(54906003)(52116002)(36756003)(6486002)(6436002)(71190400001)(71200400001)(6512007)(25786009)(66066001)(256004)(66946007)(64756008)(66476007)(66556008)(66446008)(1076003)(1411001)(5660300002)(4744005)(8676002)(478600001)(7736002)(44832011)(6116002)(3846002)(305945005)(53936002)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR05MB5013;
 H:AM6PR05MB6535.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: S7wzwTfOrl9dYaeAUK5URitFYxl9sn4UBtBfgZfv4KPooKlR9/thtyub4Az3sW3ftV72z5vfu/34nIM3CgJkxZZ/OHmt6I1q2Lljb63hc/Th/Mp0ZE3afsBvESIAiyzKRjLzHrUd3+A87WmmO8RUFmCtbIo7CAUzEeTH0U48apZelRv943pW0zzjjvqJbVsVj5J+Fc5FF/jc1TdkRFuZJKtcuvjm1GfHclKEMbGMW9PamgNvJu62QHk0Qzw9yUDxGLFjqiLNOSUN+3E0yC8p9aMd9RCnhKodyNN3zPQ4W7og8idH80YnsMA1IdMi91YoHKLsN/6Z0TNnpBFgnD4zx+3vOOv/B9YD0wcKKcLsigvMsieb9bidjAi23PrcXOS7BNgjswbEElmf8DRI6/RsgNyni7HXeiDrBl1SYBHqeAM=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ceb33f8-3a81-4a7d-c879-08d70b5eb654
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 09:02:51.1644 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oleksandr.suvorov@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5013
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH v5 4/6] ASoC: sgtl5000: add ADC mute control
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
Reviewed-by: Fabio Estevam <festevam@gmail.com>

---

Changes in v5: None
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
