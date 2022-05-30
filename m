Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D94537B5B
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 15:24:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 411A91AD9;
	Mon, 30 May 2022 15:23:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 411A91AD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653917056;
	bh=n2a+VBlotDwS1w46jKFBa78Fu5F3v7YYimj6Bg0euEk=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ow77ustCsvcvsSIyNZE33WI9XUqRKYUrr8Mi98UGtqvwWKRmZT3ypFDRakLZF058m
	 eAfiOgYMjFQSoOo4de5fVFXz/hdMTzgh+5GSkf6m2bGofx8ZTnaWoayAM3EahmjL6x
	 FA3naekUoyGfTmAm4OEOPJBqr8EetVtiMqYq1two=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96136F8051F;
	Mon, 30 May 2022 15:22:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FDC9F800DE; Mon, 30 May 2022 15:22:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BF15F800DE
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 15:22:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BF15F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="iaOzPl6D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbsJG4cPy0aVKFuKRAgC4uhCvLlcHPUyCVarDFkvQPG+TS+Ttk6xqLd6X7CYOp3CmTvXceBcGgjRdnEwqtyEshiwnElVk9d6gG8QzidTI6T5mO+QqIYCsC7+EVKrcbN9G8/UAKv0F2G3h3GzA7R0l9LUuaa/P3DHl8oSbTX6q7IRENcd2xQ/nKHGMFXNSwDVASdtz60S/WeFsFXzlXihPm9Ycn7eP3XroZJzRM6/kc+nJZsaEqRGys/BRWkpkLIkTBNLywKSKEL2bR+Rn6aZG98PF8zASulw5Wv1eCFkwAUFFi6GC4Y3rJhdedm6eDKGANpW4cs2JRgBFyJWQ7yEbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSPIjFNdnRk4IR0W2usJZ+hjMggEmzmUzq/f11tyuVI=;
 b=PMUEi0wZIG0cqN9kVZg9mOE7h6xAIbki0rkgIG2SFQk9m8e3DTw6MXrhWtRRn0tR/mp0LI74GWJI59MRD1dCF2Oga6gFn+/ZaZMTkBzHvyykc1AYUvQuHWwwKmoFFjKx7w3VXETfoNnnxvaj0g8nVzOIPCoNkYFF26QdMoPeor3sNTFLtLmou2fr4ZCf98br7E0xgA0pM8bKzsDikMbWfhI1Vhv4gAOtmCqhU1kEHSK5s/OKRMUSgC1XlkwW7nNd0C3fLR2Mcbt2Wbb59VQz5rtYbil1b9jzSMA+x6bEJb8yaEF2sNJVN3WanhzyBc11pzQgpeXicrPINmQpEGcN2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 193.240.239.45) smtp.rcpttodomain=alsa-project.org
 smtp.mailfrom=diasemi.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=dm.renesas.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSPIjFNdnRk4IR0W2usJZ+hjMggEmzmUzq/f11tyuVI=;
 b=iaOzPl6D74ZpiOmz/Cc2PQ4/tXDrtueA0hGcFfXhhhQcmq3EV9wJ1tZto25W9JdBf3LytBVCdTx7twU7idmvFLDL3FwM9pmwqZq9Mlmp4huVbe/eQY9Y4HT+pJEZ9XlaPfqwDjfatKH/9y7C56HteWKc8fJhxrz3Q9AMfF1gWUI=
Received: from AS9PR06CA0501.eurprd06.prod.outlook.com (2603:10a6:20b:49b::26)
 by GV2PR10MB6138.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Mon, 30 May
 2022 13:22:26 +0000
Received: from VE1EUR02FT057.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:49b:cafe::2a) by AS9PR06CA0501.outlook.office365.com
 (2603:10a6:20b:49b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Mon, 30 May 2022 13:22:25 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=dm.renesas.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 diasemi.com discourages use of 193.240.239.45 as permitted sender)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 VE1EUR02FT057.mail.protection.outlook.com (10.152.13.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Mon, 30 May 2022 13:22:24 +0000
Received: from nbsrvex-01v.diasemi.com (10.1.17.243) by
 nbsrvex-01v.diasemi.com (10.1.17.243) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 30 May 2022 15:22:24 +0200
Received: from slsrvapps-01.diasemi.com (10.24.28.40) by
 nbsrvex-01v.diasemi.com (10.1.17.243) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 30 May 2022 15:22:23 +0200
Received: by slsrvapps-01.diasemi.com (Postfix, from userid 22379)
 id D212680007F; Mon, 30 May 2022 13:22:23 +0000 (UTC)
Message-ID: <b3f9a679f1e27a9359dcecb496953c4af30acbaa.1653916368.git.DLG-Adam.Thomson.Opensource@dm.renesas.com>
In-Reply-To: <cover.1653916368.git.DLG-Adam.Thomson.Opensource@dm.renesas.com>
References: <cover.1653916368.git.DLG-Adam.Thomson.Opensource@dm.renesas.com>
From: Adam Thomson <DLG-Adam.Thomson.Opensource@dm.renesas.com>
Date: Mon, 30 May 2022 13:22:23 +0000
Subject: [PATCH 2/2] ASoC: da7219: cancel AAD related work earlier for jack
 removal
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed6af9dd-19d0-428c-aeeb-08da423f6f6e
X-MS-TrafficTypeDiagnostic: GV2PR10MB6138:EE_
X-Microsoft-Antispam-PRVS: <GV2PR10MB6138E49329B5449E602C31A0A7DD9@GV2PR10MB6138.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BA22a3jbdbTcxXN1gqVBbo4Ia8Cw6uiZO8RzPSjGjHYZ2Oxqcy2cSsR10G6/AzyglkT0lJjmvukUhRlFkckNKij8GkKBI7ZcU82UntZd1Eb3B0BnBzn9EnTWwqiRgFzjbxGjZ4coIeUsxe0UR954RxbFfJIIzS+Zpcrr0/uNR9Yf+mJhMvANKmUgI2fqzqNfC1QnBTCq6NvkFykO+WQUXYY7nnUYFQXeBrOboPO8K3+rfYheSa+6DDWPETCKAA7qhECfBgDaoqJ9ZPTuR0l9GQJKU3ONcbCngPG+YSz+USc0J8i87aIMII9pPx1jqWEuWLjUoxselLh+Tg9QgGiTJ32iBFUV++vBHmGdIfdEBGv4DjzEkNS+XI7sRY+1XPyJoWU36hJ4a09+UphaGeI95y3DTbpMufzWVoPXYPKhfEyftnjDH26CyG9HliQRW/z6Lfnfs0Olrc5V+Ax4oZ3kHRRrPEejiFJeBNM81rSkYVt9LZAK4s3bZ8ONCVVcgZgzV9ut4M6CC2Y0XJIZFTzCsBHWmfqpuVEBcY94npH55J1Yq9+EJk/BleFxZoQg5OeBpaIeqXkZySQ4XBhvqsq8XLVsi5a13YxxZfK/cO5SN6RAKL9njVKn6N3vADTea7nZN7jpAmbMTiCcJ7t33qQEsMvSKRlFJG483QbwX9bYO0FmNU6LlTNpgNIvVDgyvMzT48OZQW9Tr4SbrsFrniK3qOBpWT/J3wwdSqxFDoEM3Tzx28ihrZvbDCs2Jbsu+rgY
X-Forefront-Antispam-Report: CIP:193.240.239.45; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mailrelay1.diasemi.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230001)(4636009)(136003)(376002)(39860400002)(396003)(346002)(36840700001)(40470700004)(46966006)(6266002)(2906002)(26005)(83380400001)(82740400003)(40480700001)(81166007)(36860700001)(42882007)(186003)(83170400001)(2616005)(41300700001)(356005)(508600001)(42186006)(336012)(316002)(110136005)(8936002)(47076005)(54906003)(70206006)(4326008)(82310400005)(70586007)(8676002)(40460700003)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 13:22:24.5619 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed6af9dd-19d0-428c-aeeb-08da423f6f6e
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c; Ip=[193.240.239.45];
 Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR02FT057.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6138
Cc: alsa-devel@alsa-project.org,
 Support Opensource <DLG-Support.Opensource@lm.renesas.com>,
 linux-kernel@vger.kernel.org
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

To avoid the unlikely possibility of register misalignment for
headphones being ungrounded/driven after a jack has been removed,
move the cancel_work_sync() call to the start of the jack removal
handling in the IRQ thread.

Signed-off-by: Adam Thomson <DLG-Adam.Thomson.Opensource@dm.renesas.com>
---
 sound/soc/codecs/da7219-aad.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/da7219-aad.c b/sound/soc/codecs/da7219-aad.c
index e7d8c33e02cc..bba73c44c219 100644
--- a/sound/soc/codecs/da7219-aad.c
+++ b/sound/soc/codecs/da7219-aad.c
@@ -434,6 +434,10 @@ static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
 			mask |= DA7219_AAD_REPORT_ALL_MASK;
 			da7219_aad->jack_inserted = false;
 
+			/* Cancel any pending work */
+			cancel_work_sync(&da7219_aad->btn_det_work);
+			cancel_work_sync(&da7219_aad->hptest_work);
+
 			/* Un-drive headphones/lineout */
 			snd_soc_component_update_bits(component, DA7219_HP_R_CTRL,
 					    DA7219_HP_R_AMP_OE_MASK, 0);
@@ -452,10 +456,6 @@ static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
 
 			/* Enable ground switch */
 			snd_soc_component_update_bits(component, 0xFB, 0x01, 0x01);
-
-			/* Cancel any pending work */
-			cancel_work_sync(&da7219_aad->btn_det_work);
-			cancel_work_sync(&da7219_aad->hptest_work);
 		}
 	}
 
-- 
2.17.1

