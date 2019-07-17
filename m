Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CAF6BFB2
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 18:36:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3E93169C;
	Wed, 17 Jul 2019 18:35:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3E93169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563381399;
	bh=7xwP9GKwHpiyRURJrsLVfYtcd3J/PwxINxGaLiDzCFQ=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OEz1XNXFPDEX4DAEdXOXwaSFli9odHNS+TqYf4XkSgJd/pgLuVL+P6kCuWNE0vUE9
	 +kQY57SYr9abrPnVnW4wrA02YFNXe1VQr7PsgIo9ho0+oym2QxRSuIk/p5WrzlyJOF
	 kGJz3EisgWpNPU7ozAA4vgQrm2kLBy5kS0UyPqc0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41327F8049B;
	Wed, 17 Jul 2019 18:31:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AF35F80445; Wed, 17 Jul 2019 18:31:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60102.outbound.protection.outlook.com [40.107.6.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B7BDF800C2
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 18:30:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B7BDF800C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="AsAd+HP5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJ1tQErUAcXkpXPaRrTlbsOY3wdgalFCMx1/CIzfsL0s4fwJN/AS7m7XmFSzi3xyDZv+3P25WbXLihpVpbEzMgESHn0rsaef7Vis9M6MjGcsN6xUg97QdwONXroBdJicm4vzsvv6Woy9uUFu9mVhoAeXtU3EdK8BeQ8cmsza18P6DwifBqMqicPPfaqkKHlw1yk+tjJXHyRxcE+YmZF4W0Udel/S6oHTSE2k++5A77ZHnZcGDO3rrGAH2oOM61lW9YIk+VYj2sBgIRD2UdidVPMLiXHR7QCGAvu+14J06nLFkO2kuiRtrmY+INOYomd/MIROm4fdSF4vnVyJK1sS7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GsUCfA7TQyvCZr2KqIuza0U8qfFvAbZZvMTpLacaLz8=;
 b=LZd46ZsDwM54uu63AfuWOyO0DPVig3RbLn3ULRRKXVxkhBmERQJwx+iSkOTicsZRs/6+88t5HUAMtqtxCN4g6ulG48lI3lh/Hbd0twrCRf4Otc5d3IbiTac+Z0FRG/ly2+VkfSY9mJXrBn5l5vHiqBm0BKeUTaswtxrRe9BU1xwgjzLrICFb9Kf4hmvOhrvNt0jAqikknGTicwY1XmAJFK0Be/XmXGQjNftERihUIRvlaW7DZ7SqzVOZ/OP8CHcUb0OT7TNKA46HkPGkIk6M2Cb8dxqV1hTO/0x8OAcDLKjcSV/7WovJIBC+9Q8Fs3SMq5GJmzTCvLla+TzX+WbHzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=toradex.com;dmarc=pass action=none
 header.from=toradex.com;dkim=pass header.d=toradex.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GsUCfA7TQyvCZr2KqIuza0U8qfFvAbZZvMTpLacaLz8=;
 b=AsAd+HP5OmLHXAmVuNye2JB/LsWXM+19z0BB/mKrWA5c9y0zjKyRT4J84WyxaWpJja5ubzo0DxCLqlb3U15Vu5b3ZKRdhaMW4GV+TLW2gq1DbYIu0p5eBosnTf8VajKlQ2y/D5COM/Zr0zbFitFOiVs2vP6W80bjJ8QI4bhDSL4=
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com (20.179.18.16) by
 AM6PR05MB4455.eurprd05.prod.outlook.com (52.135.162.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Wed, 17 Jul 2019 16:30:54 +0000
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9]) by AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9%6]) with mapi id 15.20.2094.011; Wed, 17 Jul 2019
 16:30:54 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Fabio Estevam <festevam@gmail.com>
Thread-Topic: [PATCH v4 6/6] ASoC: sgtl5000: Fix charge pump source assignment
Thread-Index: AQHVPL0B+q/A+n5bN0Kf42jiqIXQuQ==
Date: Wed, 17 Jul 2019 16:30:54 +0000
Message-ID: <20190717163014.429-7-oleksandr.suvorov@toradex.com>
References: <20190717163014.429-1-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190717163014.429-1-oleksandr.suvorov@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR07CA0082.eurprd07.prod.outlook.com
 (2603:10a6:207:6::16) To AM6PR05MB6535.eurprd05.prod.outlook.com
 (2603:10a6:20b:71::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [194.105.145.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 770b3b11-bf38-489b-7aeb-08d70ad423bd
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR05MB4455; 
x-ms-traffictypediagnostic: AM6PR05MB4455:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM6PR05MB4455B9DB5E676CF2B6D102BDF9C90@AM6PR05MB4455.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(396003)(39850400004)(376002)(366004)(189003)(199004)(7736002)(4326008)(6916009)(966005)(478600001)(66556008)(66476007)(66446008)(81166006)(5660300002)(50226002)(305945005)(66946007)(71190400001)(64756008)(66066001)(71200400001)(1076003)(8936002)(2616005)(6436002)(81156014)(256004)(476003)(2906002)(8676002)(446003)(11346002)(3846002)(52116002)(53936002)(44832011)(186003)(486006)(99286004)(102836004)(6506007)(386003)(76176011)(1411001)(26005)(68736007)(36756003)(86362001)(14454004)(25786009)(316002)(6512007)(6306002)(54906003)(6486002)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR05MB4455;
 H:AM6PR05MB6535.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4NKyXphBDfnNA/oSAAZOuzi1zCxofok/9mAGjGlIEf8Ro2psjbOxQIfUYkXiddUTBops5JWNOjJgSXOdW/ukqk9+tx3zdnWJuZAAiLX7BkZhmvsU56VlxkNjEBqO9N4hEwOTdAtdjMEugbPIEJV3Yckk7rlqnTrWAFABXQ+HQKBAsPWzB5AQRfuuxBzBhzko1ZsaYt5iLx89hxvgYBQzRP/zSOs2dY4phZo5RXtdVf0gMoE2/Rcr7ZZgbGQULkq1zphDt/VreP7jhj72iAxmOUVIk2TkbFGa3uwpT9huah1XNfFO9IxxnZEo5Ht7GiEnhCrdmV7DPdjO/F1WBKMKpIdaKbkwzvEg4q3c4fYp5lLcumvKwJG7et361jDPq6XSYhbTBUWTxMFvpiJVpa5KO6RUmAWBIszXpOzlZIYxakY=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 770b3b11-bf38-489b-7aeb-08d70ad423bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 16:30:54.6018 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oleksandr.suvorov@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB4455
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH v4 6/6] ASoC: sgtl5000: Fix charge pump source
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
source can be assigned automatically [1].

[1] https://www.nxp.com/docs/en/data-sheet/SGTL5000.pdf

Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Reviewed-by: Igor Opaniuk <igor.opaniuk@toradex.com>
---

Changes in v4: None
Changes in v3:
- Add the reference to NXP SGTL5000 data sheet to commit message
- Fix multi-line comment format

Changes in v2:
- Fix patch formatting

 sound/soc/codecs/sgtl5000.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index 31d546abde717..a04cba66615de 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -1328,12 +1328,17 @@ static int sgtl5000_set_power_regs(struct snd_soc_component *component)
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
+		/*
+		 * if vddio == vdda the source of charge pump should be
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
