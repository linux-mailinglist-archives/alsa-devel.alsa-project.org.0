Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4A014B24D
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 11:10:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E12F167B;
	Tue, 28 Jan 2020 11:09:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E12F167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580206208;
	bh=KAVaf73TjcUBzWvrZx7d9sLzX5yj6irKLGqFSg4JAZ4=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rS4zk9n9eqeqPA/C4Nknb5qXIAy2i+R+XiKDZWe1TJW6m+VpzWfxR8DFHlkq78O62
	 Zgeco2HrIYutsAyX5w2+xbuFlxphMOtfYNz9SLMjT4y4/9+QV3ZkIs5wscEybalMbI
	 +vPFGlNR5JTYM0qmJtnp4pDYq1gX1d97HRx1Q8+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20994F8028D;
	Tue, 28 Jan 2020 11:05:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C48F3F80276; Tue, 28 Jan 2020 09:06:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10063.outbound.protection.outlook.com [40.107.1.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AC9CF80273
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 09:06:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AC9CF80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="LbHHADT6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iU3NVbi6vX+h5oT5XY8df15BR2eNk9dG6jBeX/Xuyaxq0R35c0xIvV5OABkpgZyi/tKcwsrblHrdAXrSLULTg1DteQ4Xj7BxfTsY1dlEqk1X+Vi9GPCLRZS5ysFjRm4/jih30ro78MsLBEhWqbp80h8HjgFEVQloBBL12EFInAEGHw5JSdoYgs6FE45HJiYvQuezbrnmtjMrsnviplc0K0yfjmeK9Sa3l2R7YgfwRDJPXjH5pSHpuPpwyNbSCQ/oRb4Zc346alAFQ2nQrh9Eqc4/HZTweBGu/d71ar1INjCeKSIpil3Zt7ZNF2s0xuA9QLhStzNmzWfU/l9HHlLHmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ippRL3gKhAvxUK9cSq3OolHLCZ0QPiDMfMPQLTG0GoY=;
 b=I5JU3LoLS96QNzWknUojnuPKO+QVFDrFlpFjg08XsmagbseiPlSWBgqLKZTF2Ke8OHFXthCNkGKbEt1P2nneeqxJnRckdTCP65zjBYdXiCYsE8pfM+RwKtLI/CBFQb3d95bapqC9qCWq5/N8/FWrUNnapzClimEzgm1Cq7FmSy/bEXmcMiKpqJ2Ts1WegI+y+O8FKvPkDSp3ywtUa7zGuy7yiZXM+Jj2fs8dZuZ7hIQB4BNAuQD/BI3MGOo5txI6t4GyPw6tfD2Igr6TOS7dei5lASMubtXLNs+9MfONob3JGoFTBHWC0cMSHJvxDyCYVzVHJ6u6ioFSurDJV3BcEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ippRL3gKhAvxUK9cSq3OolHLCZ0QPiDMfMPQLTG0GoY=;
 b=LbHHADT6HIwBFfyyHnhCw+3GdMI99rMuiX7n01wvTlb8XwSJZ+a9fAmky76hMnrTNmN458TVvXiZVs3fjIP8hgaDwO91IBKakevXbY1Xp0Ydbrf3e/nM0TzeEElFKozzUcjqeTTA6JXRMT4pi2k9G+SscGJjbQkjamnPBgL5Hb4=
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com (52.134.16.147) by
 VI1PR0402MB3646.eurprd04.prod.outlook.com (52.134.13.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.23; Tue, 28 Jan 2020 08:06:34 +0000
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::8881:e155:f058:c0d1]) by VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::8881:e155:f058:c0d1%4]) with mapi id 15.20.2665.026; Tue, 28 Jan 2020
 08:06:34 +0000
Received: from fsr-ub1864-103.ro-buh02.nxp.com (89.37.124.34) by
 AM4PR0701CA0015.eurprd07.prod.outlook.com (2603:10a6:200:42::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.13 via Frontend
 Transport; Tue, 28 Jan 2020 08:06:32 +0000
From: "Daniel Baluta (OSS)" <daniel.baluta@oss.nxp.com>
To: "broonie@kernel.org" <broonie@kernel.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Thread-Topic: [PATCH 3/4] ASoC: SOF: Add i.MX8QM device descriptor
Thread-Index: AQHV1bHa4q1UohZ6fEmmFQ/wI2RSEw==
Date: Tue, 28 Jan 2020 08:06:33 +0000
Message-ID: <20200128080518.29970-4-daniel.baluta@oss.nxp.com>
References: <20200128080518.29970-1-daniel.baluta@oss.nxp.com>
In-Reply-To: <20200128080518.29970-1-daniel.baluta@oss.nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR0701CA0015.eurprd07.prod.outlook.com
 (2603:10a6:200:42::25) To VI1PR0402MB3839.eurprd04.prod.outlook.com
 (2603:10a6:803:21::19)
x-mailer: git-send-email 2.17.1
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@oss.nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a9bde7d1-b52b-4be3-564b-08d7a3c8fd5d
x-ms-traffictypediagnostic: VI1PR0402MB3646:|VI1PR0402MB3646:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB3646E97F9904DE0836DADE27B80A0@VI1PR0402MB3646.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:293;
x-forefront-prvs: 029651C7A1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(189003)(199004)(86362001)(6506007)(6512007)(54906003)(110136005)(2906002)(316002)(478600001)(81156014)(6486002)(956004)(66946007)(71200400001)(66476007)(2616005)(64756008)(66446008)(1076003)(8936002)(16526019)(81166006)(5660300002)(186003)(4326008)(66556008)(26005)(8676002)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3646;
 H:VI1PR0402MB3839.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: oss.nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gJIe7R9h7b19n4fU22dR84ZFAZ/hetb2bx4QspcGYyvZZWh9TGXYy7X0kd6iZzVtOLRonaKAMDBCzzOvrzG+6qhtX1BI39SM2Ku7oMno/uzdwZdHgIVtDJegD0wPbA4byuPaS9rb/mt4SCNMkhNB5c8+77AOf2XaZK4MRSVXNvB8GUa2XWV/BOo4CFFV72/Mp21dxewZqCKz3wuivHt7bdd3/6Xqf8JJq4v9Lmiyk5s7hnrjYjKnGJe/yHGzoLajnW0ZPEld6Hbw10Ft427ORJIR7Qlhx9RJPAJWUNzQ17U65z02vr+uwwk8IdLb+S/KS/hGfX9zfD3/NRa2FYRt0pvF8ZGh47GjzmuVDk25su/MFXXFDuLJ2hO9rpAMuJsfeHwAoUhJl3D5Atn0C/eT7gowGnPwTyLc1QMP+RcmPt5qmqvgNty6litH+tZR9mj+
x-ms-exchange-antispam-messagedata: LOHGVyXoebp8Y8a0PLkrYQktcvVK3dayri5Acj5P0hwjQbB80pFcu4fOuZtLHg5Gpgu/g1ijQYUdr94EWU+1yJscuOkASK5y99wiwmVtmSMk/F/LX28dKvlbo22pQX7DotQ6O2nuQ4k0PcQOqoFDQg==
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9bde7d1-b52b-4be3-564b-08d7a3c8fd5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2020 08:06:33.8562 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cPfj0NJfDpJ0lF+kRXMV9wX3/vSNty+X/g5E0oTkwH4+Q3cDhslQ0FTaH7FRVkwvxsWKojGvGrtbGBBB30izYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3646
X-Mailman-Approved-At: Tue, 28 Jan 2020 11:05:35 +0100
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 Paul Olaru <paul.olaru@nxp.com>, dl-linux-imx <linux-imx@nxp.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [alsa-devel] [PATCH 3/4] ASoC: SOF: Add i.MX8QM device descriptor
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

From: Paul Olaru <paul.olaru@nxp.com>

Add SOF device and DT descriptors for i.MX8QM platform.

Signed-off-by: Paul Olaru <paul.olaru@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/sof-of-dev.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index 2da1bd859d98..16e49f2ee629 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -13,6 +13,7 @@
 #include "ops.h"
 
 extern struct snd_sof_dsp_ops sof_imx8_ops;
+extern struct snd_sof_dsp_ops sof_imx8x_ops;
 
 /* platform specific devices */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_IMX8)
@@ -23,6 +24,14 @@ static struct sof_dev_desc sof_of_imx8qxp_desc = {
 	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
 	.ops = &sof_imx8x_ops,
 };
+
+static struct sof_dev_desc sof_of_imx8qm_desc = {
+	.default_fw_path = "imx/sof",
+	.default_tplg_path = "imx/sof-tplg",
+	.default_fw_filename = "sof-imx8.ri",
+	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
+	.ops = &sof_imx8_ops,
+};
 #endif
 
 static const struct dev_pm_ops sof_of_pm = {
@@ -103,6 +112,7 @@ static int sof_of_remove(struct platform_device *pdev)
 static const struct of_device_id sof_of_ids[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_IMX8)
 	{ .compatible = "fsl,imx8qxp-dsp", .data = &sof_of_imx8qxp_desc},
+	{ .compatible = "fsl,imx8qm-dsp", .data = &sof_of_imx8qm_desc},
 #endif
 	{ }
 };
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
