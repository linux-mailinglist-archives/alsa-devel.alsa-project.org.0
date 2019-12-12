Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7770411CFB8
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 15:24:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B7B116EE;
	Thu, 12 Dec 2019 15:23:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B7B116EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576160679;
	bh=zt4zx2Tkc4FSqstMSfh7OmjgJMv0ZtaNKjouWBkJT1M=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DayxuH/KI6+VJLO13SbKlPD7L8Nf6hmX4xzj5s9SPuLOcpSh1C9pI3ddqzKCi4TvL
	 qarkkUqHqzaxcGLuC43WHrIuq6UJnBDIbeCdWTp5mo+/gcU+Srse7SB6y15ENnV5Iq
	 1B2ctXL4Kh5lNq3VUCNvRWTEZMVOtzbosQcXQJac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 180E8F8026F;
	Thu, 12 Dec 2019 15:19:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B650F8020C; Thu, 12 Dec 2019 08:19:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30060.outbound.protection.outlook.com [40.107.3.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66AA8F800EC
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 08:19:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66AA8F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="DwhqQs+h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRHotmC4zMtgJMsxsJ9ANRiJ85JPJD5SP6bN6m8Rk1nU8SSlNVIVaOphasEjv4aANJHASJ7Rdwrpm2ZPcH5qCG5QaKdUFVvT3xFDc+7yK122RQZvOHRUp4/PTjr7FeLd7UPTOPOFzywll2tpY6NVdiGBODZPv/ac+Lh1T99rnB8hJLjz/+QAAIuNUnehhXR6b/pPxAFNxhwma+Y024hIjdwMLj4BVRu2XjljC02pCWbSSgkWlx9tb/J+wglxVDluU8cE+MMluBDogaHkg/oY8Ahw1clbfrTYyTsJTnw/iAB2FgP3oSDOLkxC6p57PegPCxUoI+Ddla6SIddfoktD3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9aBIVTacYsMdaN01HP8pPUXzfZlkCetyBhNdjp4vPU=;
 b=W9kYU+GChoy6/3xz0tCFsW47vcv9XU/GaF8eGCTO8DdC6VnyCBKZgswpGVajHTbV0SFw+wHqHwGyGNhFyDNrLIUoArO+YlGs7t8ymXAKOaAngFF0NXZDMOCkSLOMHCFnQAwYPvhyOSMQQ/RYaTEKmEIpeg8xbhwYQBm85rk/aio+6jvPazFWHSob2jztvJIG8DvHW0eCb+da8sZOthZ5Y3GRUJaquQzPeWM+2oyq1xV206lGEjG4yrTH2H/Map53uZNb+deiYo/50hxTc9437jvycpJuWF1Ruvxyt74yaFieDHxr/KWoGAHtMvUNhBwT8m74crlbJqsEEc8nsOgAzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9aBIVTacYsMdaN01HP8pPUXzfZlkCetyBhNdjp4vPU=;
 b=DwhqQs+hJKBGLSC5wnLRbdnbkVB3w9vfZiAC0ZbhmTC+NXEExvspkvtl4UzfTNdtOk1bN7z/yoJG9Ud2pTrMRzhTP3bY+9RyTKEAbAc8LLqi6IKaBEm8c7OS2MA2sHvFVbmQpv+2Q0lHbjq+SzK0Zcsf87zkEVEhA5GRFxHLe/4=
Received: from VI1PR04MB4062.eurprd04.prod.outlook.com (52.133.12.32) by
 VI1PR04MB3023.eurprd04.prod.outlook.com (10.170.228.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.17; Thu, 12 Dec 2019 07:19:47 +0000
Received: from VI1PR04MB4062.eurprd04.prod.outlook.com
 ([fe80::20fe:3e38:4eec:ea03]) by VI1PR04MB4062.eurprd04.prod.outlook.com
 ([fe80::20fe:3e38:4eec:ea03%7]) with mapi id 15.20.2516.018; Thu, 12 Dec 2019
 07:19:46 +0000
From: Alison Wang <alison.wang@nxp.com>
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>, "igor.opaniuk@toradex.com"
 <igor.opaniuk@toradex.com>, "festevam@gmail.com" <festevam@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com"
 <lgirdwood@gmail.com>, "oleksandr.suvorov@toradex.com"
 <oleksandr.suvorov@toradex.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH] ASoC: sgtl5000: Revert "ASoC: sgtl5000: Fix of unmute
 outputs on probe"
Thread-Index: AQHVsLyIRDFbzLs7vEuxsFkXl6DgTA==
Date: Thu, 12 Dec 2019 07:19:46 +0000
Message-ID: <20191212071847.45561-1-alison.wang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0149.apcprd02.prod.outlook.com
 (2603:1096:202:16::33) To VI1PR04MB4062.eurprd04.prod.outlook.com
 (2603:10a6:803:40::32)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=alison.wang@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 46bd6296-15a6-41a9-8d44-08d77ed3aae0
x-ms-traffictypediagnostic: VI1PR04MB3023:|VI1PR04MB3023:|VI1PR04MB3023:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB302364BC9B193283C54078F2F4550@VI1PR04MB3023.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:356;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(199004)(189003)(52116002)(66446008)(5660300002)(316002)(110136005)(6506007)(2906002)(4326008)(86362001)(66946007)(36756003)(66476007)(66556008)(64756008)(186003)(44832011)(26005)(2616005)(8676002)(6512007)(8936002)(71200400001)(6486002)(81156014)(81166006)(1076003)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB3023;
 H:VI1PR04MB4062.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9cGBAOtMIlMP3R1QkZ0ifqKRsj6xXzP/apxaHTZRbJ3Ks2QEVRg0nk6cjqSFyc8l9Q3LtTjMTMAG7C90HCtZWUAwfpo/m/I+Ts7yYdNwS+QGBgmJoeRazMGzh8gr2KfGxOGAQQYy81zW8kmYuPS3Qfj4axnA/lPkEAbFLAdh0pyCOAFqoCwL5KhfHJ1bcIL5zrjNXtlz5zV8mzshctiz/9Ywnwqbdmlix4aTxz9e4vF1WaB8+RrZHcM6Z2iebf7T58Yq9uH2c3lqaRAiMbuaZsPzDWtLzRJ+aG5/nv96l8B+wGQ8SB1EheqtSssT3qqKtE1I6laMV+V0xX+XSTawzZ13+VctQ5rRj7DxG3g+LOHsyriICc+POffJFZVQ3k3SDl3PywNQbCFKOvBkFTX+75ibZ+QTKnRYDwIia5MBRMWGUnGumxeaULYtwikCG6yf
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46bd6296-15a6-41a9-8d44-08d77ed3aae0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 07:19:46.8605 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LrQJ1DkNLq44XWw5XOIIB1S04BmfJul4822A9+JmH39SSv/l0UyjyaR/L6wmxe4/RN/IgQvNsGNv70FVX6NZ0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3023
X-Mailman-Approved-At: Thu, 12 Dec 2019 15:19:27 +0100
Cc: Alison Wang <alison.wang@nxp.com>
Subject: [alsa-devel] [PATCH] ASoC: sgtl5000: Revert "ASoC: sgtl5000: Fix of
 unmute outputs on probe"
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

This reverts commit 631bc8f0134ae9620d86a96b8c5f9445d91a2dca.

In commit 631bc8f0134a, snd_soc_component_update_bits is used instead of
snd_soc_component_write. Although EN_HP_ZCD and EN_ADC_ZCD are enabled
in ANA_CTRL register, MUTE_LO, MUTE_HP and MUTE_ADC bits are remained as
the default value. It causes LO, HP and ADC are all muted after driver
probe.

The patch is to revert this commit, snd_soc_component_write is still
used and MUTE_LO, MUTE_HP and MUTE_ADC are set as zero (unmuted).

Signed-off-by: Alison Wang <alison.wang@nxp.com>
---
 sound/soc/codecs/sgtl5000.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index aa1f963..0b35fca 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -1458,7 +1458,6 @@ static int sgtl5000_probe(struct snd_soc_component *component)
 	int ret;
 	u16 reg;
 	struct sgtl5000_priv *sgtl5000 = snd_soc_component_get_drvdata(component);
-	unsigned int zcd_mask = SGTL5000_HP_ZCD_EN | SGTL5000_ADC_ZCD_EN;
 
 	/* power up sgtl5000 */
 	ret = sgtl5000_set_power_regs(component);
@@ -1486,8 +1485,9 @@ static int sgtl5000_probe(struct snd_soc_component *component)
 	       0x1f);
 	snd_soc_component_write(component, SGTL5000_CHIP_PAD_STRENGTH, reg);
 
-	snd_soc_component_update_bits(component, SGTL5000_CHIP_ANA_CTRL,
-		zcd_mask, zcd_mask);
+	snd_soc_component_write(component, SGTL5000_CHIP_ANA_CTRL,
+			SGTL5000_HP_ZCD_EN |
+			SGTL5000_ADC_ZCD_EN);
 
 	snd_soc_component_update_bits(component, SGTL5000_CHIP_MIC_CTRL,
 			SGTL5000_BIAS_R_MASK,
-- 
2.9.5

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
