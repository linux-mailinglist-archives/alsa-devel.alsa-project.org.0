Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B889333F9E9
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Mar 2021 21:23:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AF3E16C0;
	Wed, 17 Mar 2021 21:22:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AF3E16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616012617;
	bh=v5xpBELuX5psfLjMxgW3Qy6ufbAHmn3VSfPn8XS45GY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dO3OCKSPH5XbLEl/lU49lmRtdejRkn6CoOQX3eBR2V0Iu/IHGR6Qkl/O2r0mf7tgj
	 Esx22+qZs9Y6Ukg5ZXY6KEcc0mPgR8W8rOhknHO5nW46+TSdWh8fvjs3Wg7p1pgv0q
	 OGMUXwf4fjaAgeFvPIlZ6+cLGDmHATeqmr31lp+U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE370F801F7;
	Wed, 17 Mar 2021 21:22:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 836F0F8023E; Wed, 17 Mar 2021 21:22:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-oln040092003012.outbound.protection.outlook.com [40.92.3.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC3B9F8023C
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 21:21:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC3B9F8023C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="irt5q0k7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ez9V5TKiLyi4ekxOY/mAnRP+eD5MIEM3y91wreJWmcwj+l+Yib8gbYCal5uTgJKblSnGtTcR92y1bXucs4lwKGMAwbIsIU2RL1kDVCollmDqj6BtiPsrxzAxQH6A1puA5sl77BlnNuBrAT2fA39UIaAjEo07cXoelU5VLpVbYUQf2NSQi/yqQYFNQ62Jgu+B3jWc2QKJn6jCAYA4ezOekjQKtIPB7zDC2jN5hG5w1IaChHFw5eDavhPyARA4VBU/+bsur6xj2BezVPD/ahJfzYjbVt2zqw9zLRU0H4CINIpGVXD1AIQc3mH4QrxCVj+LrcTk2m55PvR1bgrIbZnKhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x50LQvDWutNJMsw6lIMSrwIi1WpziCOzcqAjP1Tklo8=;
 b=f5gM8Zw57F5rT08Xl+2OqruXDMC8rdsvwJuqxfp6n5p0YDNaqSGNjwoB/iotMqCHyntefn67z4A4xvSyXuoKH5JDoXMEmFNdnDsx84IOTkXTEY4DwOmxEocc0BVSKoFF/jhHRquwPJgbqcrUzPCCx33Ply0e9i9AgfOhCOn7sXSlh/sRBtVeUvgoS2JpHqxS2QZumLl9n/lFj+hH8zmH3PH1vjrgKpFGXguGxtJGO1TlbX8yKlwaWJPnoGBTGZPSVSqochh2XBwQUw96cWdQm3pee7ZbjkUACMd78Zv1DIOLY4JPRUZOqsBU+9VbR7VtsQqy5heNvdAGoIEvhF60Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x50LQvDWutNJMsw6lIMSrwIi1WpziCOzcqAjP1Tklo8=;
 b=irt5q0k75mFjjS4rYNmKEFsI8HXbPZCGOaAUY31q/EsUlpXiqgIEet9zVfS9Q8tWCHioTaY1IJ6OEZHfr3pULHysJOkmT2BmOp6p/GrQCQzsmAzyxBvhaJyVy9EdtgVJLMEFnLTJvjqllc4YrHWtkpdLQISx8BtWvZipgALetjxlzuVFMjPliEMNAGlj28XetPvk4Y+Fpxi9Xw4oqhsYzQ2lQfrUskpyhaMsDu2EigH4s+k6XPDRwfsjuhyz7VUioWIUhV0+LdVDt7JMBEYMbMzsJ6bRQ+FK/C8NlrANQHb4dR9KQfOfZqMkOboNMzwXicc4s9hrNiYrj4XOlBupQw==
Received: from SN1NAM02FT061.eop-nam02.prod.protection.outlook.com
 (10.152.72.53) by SN1NAM02HT097.eop-nam02.prod.protection.outlook.com
 (10.152.73.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 20:21:57 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:7e44::4d) by SN1NAM02FT061.mail.protection.outlook.com
 (2a01:111:e400:7e44::196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Wed, 17 Mar 2021 20:21:57 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:CB42045C6A222EE72C653B80B12C79BABC9E8CBDD48DA463497EB9E53C7587CA;
 UpperCasedChecksum:B1FEE994262133ABBAC62486CC5B18C95A36C04952DC52164CF2D1179DE3A121;
 SizeAsReceived:7511; Count:47
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 20:21:57 +0000
From: Chris Morgan <macromorgan@hotmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 3/3] mfd: Add Rockchip rk817 audio CODEC support
Date: Wed, 17 Mar 2021 15:21:17 -0500
Message-ID: <SN6PR06MB5342682A0FDE5D84738EE760A56A9@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317202117.29926-1-macromorgan@hotmail.com>
References: <20210317202117.29926-1-macromorgan@hotmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [oFIqVit+VX1AcpMNxyyxt2rEqxlA0LRE]
X-ClientProxiedBy: SN6PR2101CA0021.namprd21.prod.outlook.com
 (2603:10b6:805:106::31) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210317202117.29926-3-macromorgan@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN6PR2101CA0021.namprd21.prod.outlook.com (2603:10b6:805:106::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.2 via Frontend
 Transport; Wed, 17 Mar 2021 20:21:56 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 136ecda2-370c-4e27-5ce8-08d8e9824fe3
X-MS-Exchange-SLBlob-MailProps: 7MJMDUNTCtzvuUeD2xvVwgN9XAtIsWsl+MoMV+lxLb9dN2Cme7cXKPYOeDgahEm69W6LUWHFQqcl5iTR567Hjqd5+9dLMzaVui74MPkmYdNhxIrKJNsqEzZdzbxs+DyD0PRAqF3Kpggh7ThQbcGf5yIsUaZ21y+ovx2bKtfV99uVJFMFyzfhzQTpSWotLSzBTtkKg15hhmf10liqnlxLNnEnKpdGKx3sJnjpi7RIXefFhjGPFqt2qStBHuGVi4z1qXuix9rSeL3zlJ35W3oszw4nLyQ5RrwaOl1maPcqBMmtCVqYSN4N7Ifq8I4fOLsiZ/EevKLOPjlvBrZnx7Zf9Zb9dpHl5gkAd1YBBI4ga14AoQmd3v1kzoh2oT747mTRfcC7xvi5qnMkDfTstjmPLX2FRj6lCbNDEKsvOy8sC520vh09bREoWtWNiIbau7BI8LF5jMnv90gansz8iSP6dAi8NUlkd9JHJTxw4EamfFVJtefDJu65fJulvefYHzGrqe03RRPzqlrnfD7SFsGPkk5uzUguXU2LtFfJtpslEOnxUYhNNZpZfxdPHm0cZuRx9wMtWM6UiEjiuszXm+dPf5s3EsAVjnJWnUyKhDGcKnsiEPt/KBEQ1M/j7Zb05N1bfGoQP8XHrM4SrLN5uVXBXKYIEOoXceTpQ7vbkx/YG5MPlOws89j9mgv1H9Latrt1bEZyosnYRjiQFwbc1W+tqVwouxmKWZlpR8BeeflxzZj/VJS6hCgunw==
X-MS-TrafficTypeDiagnostic: SN1NAM02HT097:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s72eItm9iWt3beKNZP7saeV0CvBsTXWejvyicKQ65YJRAOHtGQEn4Qgtk1tullsMoINqJNnwGrFXoSg1iIqaHnIUig9ERTF50wjgGRSOgkhw10TIRfYMORTm/w36QAaUkACS8FyFednYnJuwO6hPcozWBoFeHp5H6eUeEEU/c++81Anq8BEoMwBm7wsEP4qi8AggCZABUtLdisHx3GjzkKo372hndBezjZoQ87HOe+Jb8HqP14TiK5gtqT4KrcIuBjsPRQCFAy96VNJ76lUZrBfEaJIkCPWiZEFGNQ1nCHHkzPXwr28lfywrMnJA2U1FZwF3z2OoE+/GQYwCfDWBZP5mQNtsHGRWOkI8E7LG69F8DJufWRHy4lEsmjG7Uf3gIeJNuS2FuLUgyzUPtP9vvg==
X-MS-Exchange-AntiSpam-MessageData: Edt0pB9GQwesubhJcIPLrx9qjU8oy0YAN0lHBpbIcB52FTwOUZF6ka978izZVLiY4R62GT3LE7HFB08jztqc6ZnXcW6lBvQWG4twOkDK/zRAh+OuXDXpFF5ArWrLQAvZeVK6Wb1Aj0MXn9m6PbpElA==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 136ecda2-370c-4e27-5ce8-08d8e9824fe3
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 20:21:57.1694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT061.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT097
Cc: broonie@kernel.org, pierre-louis.bossart@linux.intel.com,
 Chris Morgan <macromorgan@hotmail.com>, tiwai@suse.com
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

Add rk817 codec support cell to rk808 mfd driver.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/mfd/rk808.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mfd/rk808.c b/drivers/mfd/rk808.c
index ad923dd4e007..adb8a7da29db 100644
--- a/drivers/mfd/rk808.c
+++ b/drivers/mfd/rk808.c
@@ -163,6 +163,12 @@ static const struct mfd_cell rk817s[] = {
 		.num_resources = ARRAY_SIZE(rk817_rtc_resources),
 		.resources = &rk817_rtc_resources[0],
 	},
+#ifdef CONFIG_SND_SOC_RK817
+	{
+		.name = "rk817-codec",
+		.of_compatible = "rockchip,rk817-codec",
+	},
+#endif
 };
 
 static const struct mfd_cell rk818s[] = {
-- 
2.25.1

