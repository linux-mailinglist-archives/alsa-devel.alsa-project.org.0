Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEDA5256F
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2019 09:54:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C330D86E;
	Tue, 25 Jun 2019 09:53:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C330D86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561449256;
	bh=MMyF+KnAxgDefkjjLRTQsaIbVUxJGB4dQRhqUqw/PXo=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cnQWzw10cAZxhtWVzvp4jHnNpWVP22X3uvDt29LvcGYBjYLcu4bAcmI4+0XS6BnLB
	 xUI83CO6ggrfVx7GaGjsFNyEHUxIQQzxHd92xNXZvCr6qujAcqDfYQFhGER3Ali6JX
	 +CxLKqBNVZpFcMN99JaT2PxEPLXeMCEkjG4PctrQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A5B2F89743;
	Tue, 25 Jun 2019 09:50:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3154BF89730; Tue, 25 Jun 2019 09:49:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140137.outbound.protection.outlook.com [40.107.14.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38705F896F9
 for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2019 09:49:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38705F896F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="tdIt9xu7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRYYtmonHvUYBlSVfDtQqNr2C/uSAPqA/UDX95NWOc0=;
 b=tdIt9xu7f1hdMGuCMugHWpx5ZSReOxSQjZbo+DO0pRpSkVveytxvI2CcTbkInN2nhwZmibr2Qf7TWFRLutLf9Ontms22uF8p/U3kVkAOw1jYFYB2Tq87nr8ocnWDZJgoD7i/KNF5blHERsVdC0eogqhDnDk9HccYkVm6MLqQoOQ=
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com (20.179.18.16) by
 AM6PR05MB5352.eurprd05.prod.outlook.com (20.177.197.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.13; Tue, 25 Jun 2019 07:49:53 +0000
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::2c23:fdba:9ce4:7397]) by AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::2c23:fdba:9ce4:7397%7]) with mapi id 15.20.2008.007; Tue, 25 Jun 2019
 07:49:53 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Fabio Estevam <festevam@gmail.com>
Thread-Topic: [PATCH v2 4/6] ASoC: sgtl5000: Fix charge pump source assignment
Thread-Index: AQHVKyqSr5wMwMJHy0K1cP447Sh3EA==
Date: Tue, 25 Jun 2019 07:49:52 +0000
Message-ID: <20190625074937.2621-5-oleksandr.suvorov@toradex.com>
References: <20190625074937.2621-1-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190625074937.2621-1-oleksandr.suvorov@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0078.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::19) To AM6PR05MB6535.eurprd05.prod.outlook.com
 (2603:10a6:20b:71::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [194.105.145.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3bb7b01-6c20-4153-cfed-08d6f941b52e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR05MB5352; 
x-ms-traffictypediagnostic: AM6PR05MB5352:
x-microsoft-antispam-prvs: <AM6PR05MB535271CF2EEF55CE0719F169F9E30@AM6PR05MB5352.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(396003)(136003)(39850400004)(376002)(199004)(189003)(26005)(5660300002)(1076003)(54906003)(71190400001)(1411001)(71200400001)(2906002)(36756003)(305945005)(86362001)(53936002)(6486002)(8676002)(478600001)(6512007)(25786009)(50226002)(14454004)(6436002)(6116002)(3846002)(7736002)(316002)(68736007)(44832011)(486006)(476003)(2616005)(66556008)(81166006)(4326008)(6916009)(256004)(66476007)(81156014)(64756008)(66446008)(8936002)(66946007)(73956011)(386003)(102836004)(6506007)(52116002)(11346002)(446003)(76176011)(99286004)(186003)(66066001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR05MB5352;
 H:AM6PR05MB6535.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ef6ANZ1qvLppuojL7sNZv/S8kWvL1O5Fp95SpeRnmj6Sn5WLDYOuX16l0hcZoX0dY+AjFFNP18xMa+Nm2b2gmbuhsNd5bbM6GwYPzUkxAdnIWBoiQ1SHeJ/pj3TfYENOdtNsJF8/ZOm1N3JReNJ9IUuUcRWH7BebYIfDVW/n9U3cwwFlaAHYI/65cXUh6vJ/wto8WTEhIzEaxMH11rQwhAAdFhfd70v1jSTtgSYFEt6LBCru1DC2yvnJRoG3q+uJqgAEzwvd/Pt2NuEpTrsrWWT1ynA6wzRKwAzrYeNMAugKdMhCUO5WJSt2vbUqzMPsarpxtYVBUWOaXt7yE5Y0pUg7uvhPiqJx798fKMSfdloBiEyL+kOTLKnisE7yitLVC/KWMrC2uPlm08bMJEtKpU3hJMDSQQAR9fcFr36oeUQ=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3bb7b01-6c20-4153-cfed-08d6f941b52e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 07:49:52.9587 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oleksandr.suvorov@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5352
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH v2 4/6] ASoC: sgtl5000: Fix charge pump source
	assignment
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

If VDDA != VDDIO and any of them is greater than 3.1V, charge pump
source can be assigned automatically.

Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
---

 sound/soc/codecs/sgtl5000.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index e813a37910af4..ee1e4bf613227 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -1174,12 +1174,16 @@ static int sgtl5000_set_power_regs(struct snd_soc_component *component)
 					SGTL5000_INT_OSC_EN);
 		/* Enable VDDC charge pump */
 		ana_pwr |= SGTL5000_VDDC_CHRGPMP_POWERUP;
-	} else if (vddio >= 3100 && vdda >= 3100) {
+	} else {
 		ana_pwr &= ~SGTL5000_VDDC_CHRGPMP_POWERUP;
-		/* VDDC use VDDIO rail */
-		lreg_ctrl |= SGTL5000_VDDC_ASSN_OVRD;
-		lreg_ctrl |= SGTL5000_VDDC_MAN_ASSN_VDDIO <<
-			    SGTL5000_VDDC_MAN_ASSN_SHIFT;
+		/* if vddio == vdda the source of charge pump should be
+		 * assigned manually to VDDIO
+		 */
+		if (vddio == vdda) {
+			lreg_ctrl |= SGTL5000_VDDC_ASSN_OVRD;
+			lreg_ctrl |= SGTL5000_VDDC_MAN_ASSN_VDDIO <<
+				    SGTL5000_VDDC_MAN_ASSN_SHIFT;
+		}
 	}
 
 	snd_soc_component_write(component, SGTL5000_CHIP_LINREG_CTRL, lreg_ctrl);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
