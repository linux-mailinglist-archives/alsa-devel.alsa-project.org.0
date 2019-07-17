Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D246BFAD
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 18:34:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20A741693;
	Wed, 17 Jul 2019 18:33:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20A741693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563381274;
	bh=qm0Enab7fDQSWonr+r1hW8wHJtXKYcbR4XwaP9Nx2mY=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N+euhLChgIPLW7taS8pj6uH/O/3rXZl6gKmUsw0pj9B7n2GAgxF+i1aSHoJmZjSfy
	 4CZOUbBSHFOIMKT69viYll6xGSEQjxlFLoOZ9Ax7/c4fe+pqY/ERkqr4bppiabuh46
	 nFXPnTzO/SZ4KZ51hjd4VojK3+x5dL443HM3E/fI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C56C8F8044B;
	Wed, 17 Jul 2019 18:31:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FE40F80446; Wed, 17 Jul 2019 18:30:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20092.outbound.protection.outlook.com [40.107.2.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89F33F800C2
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 18:30:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89F33F800C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="kK1Ew/uj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G+iYmNzXKpQmyxnOMp7XufATGeUEskBVKacY3uOxxy/Q+Q19K9PWFAtbI1D/7E8twtIE4ddgzifPd6v7g+9OI+vwDbVrlCZU5WNTD3Psay2ZAgbbH8s4q07aiT/5dwfutIdn4y2zcsdW0qieUOEqTyf6Pl3M625UxoZQ0JWP2V7QEe6n9pHwCRFG4dtz56R3Bwrpoc2AtyCvUJs/NPkO0eRa2mHCuRTbt/T8RoFB15BwD/2jLtDH598lXmtqrMP0XVklq3iwA3A0+xftaYGsNdQez4DlmiC+gcw7O0cUL2QX056eBG21euhIaU/Erv690VXZhhp0hMA+Ia6kZwNXWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zgKS5w0Kd5kAm9IRjctrX1ULbWsjFi2NOA54etofv0=;
 b=L5Uy2SU0eS8UuG7FJjnAGdbT2V3HPxaUetzxYSGrciKUMQOnEmjqw4W4xnbh1mf6hXxciGa475LtI02GUMr9L79TRBXgOeucjuhfMlRfcEj6X4P/tOGCsFOKM/Aq3/dyR3fW2lIpQ0u5/qKhYqF4UfsEbYFNHzjpPBH9k40aYSDjKw0k/lZRaVa6egDtVJKuisMJCFzNb2kc0iQHARWgFWUTGRpk8MfMGtiFwzM4EOcw0EcioGHxNVAMkhNLRArUWvod4m61xqb7DLMKLffHPmq39jFlgEP+QMGb590cbm6L87OjvizPUzhem5/MSlvOTVnrG8J3bj6e+iti8TyFKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=toradex.com;dmarc=pass action=none
 header.from=toradex.com;dkim=pass header.d=toradex.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zgKS5w0Kd5kAm9IRjctrX1ULbWsjFi2NOA54etofv0=;
 b=kK1Ew/uj7k+AH0urLS9j7kZojYth8jA5m+Iksjk6Eaf/QtTkhzLpV0/if/64hbVmeHyOCXhP9dJxOUoQg7NSLSf9SU33j0Sc1K9WVvzpzKZ9z4x820iduf19lLyfmYwjzOr9bczUTbQZfzJmGS3sS5C9kjMggltyAozRjwXfUFg=
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com (20.179.18.16) by
 AM6PR05MB6408.eurprd05.prod.outlook.com (20.179.6.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 16:30:50 +0000
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9]) by AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9%6]) with mapi id 15.20.2094.011; Wed, 17 Jul 2019
 16:30:50 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Fabio Estevam <festevam@gmail.com>
Thread-Topic: [PATCH v4 3/6] ASoC: sgtl5000: Fix definition of VAG Ramp Control
Thread-Index: AQHVPLz+9/raU08NxU2wpAf8CiU9kQ==
Date: Wed, 17 Jul 2019 16:30:49 +0000
Message-ID: <20190717163014.429-4-oleksandr.suvorov@toradex.com>
References: <20190717163014.429-1-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190717163014.429-1-oleksandr.suvorov@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR07CA0106.eurprd07.prod.outlook.com
 (2603:10a6:207:7::16) To AM6PR05MB6535.eurprd05.prod.outlook.com
 (2603:10a6:20b:71::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [194.105.145.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 22c87ec3-a4a2-42d8-ab5b-08d70ad420f6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR05MB6408; 
x-ms-traffictypediagnostic: AM6PR05MB6408:
x-microsoft-antispam-prvs: <AM6PR05MB6408CA3EFBCCCE0095596AFFF9C90@AM6PR05MB6408.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39850400004)(136003)(346002)(396003)(376002)(366004)(189003)(199004)(486006)(305945005)(7736002)(2616005)(11346002)(476003)(446003)(1076003)(52116002)(36756003)(53936002)(66066001)(81156014)(81166006)(71200400001)(8676002)(6436002)(6512007)(50226002)(8936002)(14444005)(256004)(71190400001)(4326008)(3846002)(44832011)(6486002)(68736007)(14454004)(6116002)(2906002)(316002)(5660300002)(1411001)(99286004)(478600001)(66476007)(66556008)(64756008)(66446008)(66946007)(76176011)(86362001)(6916009)(6506007)(102836004)(386003)(26005)(186003)(54906003)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR05MB6408;
 H:AM6PR05MB6535.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: S9TyZbdoq284WwrwY8YueBJuIixgCKlKgheDS+SsWu6/cK2PsA3UK6crKNk84heTh8NYpfxq85y9ZmudBTr1yHylnEDeKHORIVICwn+UPdzdLxrl95Gr0cK6aBHs1Uiij5xHL2sMF2roI7VKknDau9uV1kMXh1cSeLBQvziK5JXwH6dznQWnQ8PCUkOKrrR+zrdWW0tTb+XWGLJwj/f0LlLexm7V21B68n/pV3EypKMAMEjnURpNLMSIcV/J1K1Y2/EmW89I+dfd35EPBy3hqFuKFJNFPbIi24OiryFOybgTQRkoWDBwdMBuQu8UyEwvtVP9oTRTml8iSA8yDGSu2kWbfVHFBUiqhAcbw1TbwRe3GShozM5+6AXPFiAaqMB43tJgdnI+fQdv7tFvAgFZSIrgi8Vil/nNCp4+dIEw9WI=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c87ec3-a4a2-42d8-ab5b-08d70ad420f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 16:30:49.9575 (UTC)
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
Subject: [alsa-devel] [PATCH v4 3/6] ASoC: sgtl5000: Fix definition of VAG
	Ramp Control
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

SGTL5000_SMALL_POP is a bit mask, not a value. Usage of
correct definition makes device probing code more clear.

Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Reviewed-by: Igor Opaniuk <igor.opaniuk@toradex.com>

---

Changes in v4: None
Changes in v3: None
Changes in v2:
- Fix patch formatting

 sound/soc/codecs/sgtl5000.c | 2 +-
 sound/soc/codecs/sgtl5000.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index a2aeb5fb9b537..a8d55c21a5f2d 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -1450,7 +1450,7 @@ static int sgtl5000_probe(struct snd_soc_component *component)
 
 	/* enable small pop, introduce 400ms delay in turning off */
 	snd_soc_component_update_bits(component, SGTL5000_CHIP_REF_CTRL,
-				SGTL5000_SMALL_POP, 1);
+				SGTL5000_SMALL_POP, SGTL5000_SMALL_POP);
 
 	/* disable short cut detector */
 	snd_soc_component_write(component, SGTL5000_CHIP_SHORT_CTRL, 0);
diff --git a/sound/soc/codecs/sgtl5000.h b/sound/soc/codecs/sgtl5000.h
index 18cae08bbd3a6..a4bf4bca95bf7 100644
--- a/sound/soc/codecs/sgtl5000.h
+++ b/sound/soc/codecs/sgtl5000.h
@@ -273,7 +273,7 @@
 #define SGTL5000_BIAS_CTRL_MASK			0x000e
 #define SGTL5000_BIAS_CTRL_SHIFT		1
 #define SGTL5000_BIAS_CTRL_WIDTH		3
-#define SGTL5000_SMALL_POP			1
+#define SGTL5000_SMALL_POP			0x0001
 
 /*
  * SGTL5000_CHIP_MIC_CTRL
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
