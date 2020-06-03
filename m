Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8FA1ECE2B
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jun 2020 13:21:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFC8D1665;
	Wed,  3 Jun 2020 13:21:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFC8D1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591183316;
	bh=Sm2W0VdbF+Vx16E4kE7aweB48WQWJM6aPqElB5ow6LA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PxTw7CqRDwvqqGbUbh/lMECMqdm43pjdz3a0XVOoZj8/di1Lw9bqL5g/keuJbLEX7
	 CKHecNwYms6zySjauyhrBmrn/rOX09xq+b71jPe9y2MPnXV+5JbNhtN57uOQ2ydxkR
	 zOAAWWm/M1pWZ29k4djMbbngJjH13R0LL7blEYig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9D71F800D0;
	Wed,  3 Jun 2020 13:20:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45737F800D0; Wed,  3 Jun 2020 13:20:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2117.outbound.protection.outlook.com [40.107.236.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51B25F800D0
 for <alsa-devel@alsa-project.org>; Wed,  3 Jun 2020 13:20:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51B25F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="Mk4s1Wyj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9WFNOFGIkzH2XKW01JJNjhMi42p9x9TCuCMTigsfOuNYPeUHA2bcEBAaez3ZrgHwnsKPAsNFs/+wetdRr5t+vEEE68RMeYhCiBZElqFoqAfFqdCr1virVzHaDnroxBtIWdSKs1WY5QcopKzxzYKfM+IApDJswrapAiWtLc49kIMAIrI0M5pWUcA15WQ6s9k6rBDgI0rKRP3n8nTY+IGz0s8+y/I5/ijHI5m1gjCIdJhcKwGIXHzej099BiLAza5o2KcCuXMMCfALsOLc2bHcWqS2hNGjLMAiLj0qNmHCefKysUPSxiwvDC3KCeqYdJPifRxCiCVaU2M3L3ROw8clQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjX8VQD+jctlrG8l7aqjtLnxT6soI54fC8+//7+YG48=;
 b=c6SfLKf68bGRO1QTjbJ9A5pOYTHqDb+CXdlKonZC1G7x4YU8j6S/O3CKxSL4fNeazsMgmp1wb6AStfNfr8IutJutUxoSOjrhmKKMhYw5owArB9QHLlDHSENR/qUizkbLj1ctsgOYHM5GkSHojZwJc74oJWMsrcgLnZVLFrm7WfqqskVAkkNExsdzFRB1uDsh/aLwScVEcMJzewm5yMaF+6RMlkI5+6t99NKBUTHSjh5hkp1rPJSxqUWEVwwLmvEeU/AgJxo77xktYKHNm+Eo8lAmnyRujZWCGfqaPMo+7OUxUyB0jD6vLPeEThwlVNKNfjwfFpOPVXPFC6Ehof9uAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjX8VQD+jctlrG8l7aqjtLnxT6soI54fC8+//7+YG48=;
 b=Mk4s1WyjR2jdCQ/NcduMan2pqtaftxTZ515gnf7ACDfb9OFAxSjoCTuomZOON4wXMow9v+tI9SGEamvfAe6dPbHaCnbpi8tnOnBZaYkJkuXU/HBEfq/VXPRJFpHwOl9N6gRt9hnln0XybIQR+KcGssiWQCjY5FgzJWLZQB71ujE=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=maximintegrated.com;
Received: from MWHPR11MB2047.namprd11.prod.outlook.com (2603:10b6:300:2a::12)
 by MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Wed, 3 Jun
 2020 11:19:56 +0000
Received: from MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::994e:6a48:f660:f363]) by MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::994e:6a48:f660:f363%5]) with mapi id 15.20.3066.018; Wed, 3 Jun 2020
 11:19:55 +0000
From: Steve Lee <steves.lee@maximintegrated.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, geert@linux-m68k.org,
 rf@opensource.wolfsonmicro.com, shumingf@realtek.com,
 srinivas.kandagatla@linaro.org, krzk@kernel.org, dmurphy@ti.com,
 jack.yu@realtek.com, nuno.sa@analog.com, steves.lee@maximintegrated.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: max98390: Fix potential crash during param fw loading
Date: Wed,  3 Jun 2020 20:18:19 +0900
Message-Id: <20200603111819.5824-1-steves.lee@maximintegrated.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SLXP216CA0003.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:6::13) To MWHPR11MB2047.namprd11.prod.outlook.com
 (2603:10b6:300:2a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2001:2d8:959:1878:d447:7247:839:5c8e) by
 SLXP216CA0003.KORP216.PROD.OUTLOOK.COM (2603:1096:100:6::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18 via Frontend Transport; Wed, 3 Jun 2020 11:19:50 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2001:2d8:959:1878:d447:7247:839:5c8e]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c1ecc515-676d-467a-9ea9-08d807b00b02
X-MS-TrafficTypeDiagnostic: MWHPR11MB1358:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR11MB1358C076C158F9EEEC86F60792880@MWHPR11MB1358.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:530;
X-Forefront-PRVS: 04238CD941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0CLVN+va7wh1wtqAMXZl6fS7ZvQxvJmSZQzrdHQNjxmWuo/W7HWDSQvw2ADoZqYgS8wQvML78W/EP5I335/ZYXMSLqzdLeoRVKkkQ31cfWYbC4ayTbUbudPxkRAde61vTBPo3fKxihyEXKmOJA2v6brPNltgltIOVqViK5SPnI49T3SPXaqZdjO0v54zCA7Usze5MVvsUorh0Pml6fNMb8qladcYaHjE6lyl67ZCMuUSggcrdclvB6pzuRNEMaaE/qLY+3qDZlkxnTw+B+wP9zIauqe6XINpVXXzpZBQ/y+bdqO+flC1VFe/hw2R4OJ1/KXg8APR6Bx26Fbx20nAnOV5xdTh8GA9cNiCmm3EqOi0y+gFkILXJcn2bE0RdPzF0vJ6CXw0uRroKpbyYFwpSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB2047.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(1076003)(6486002)(478600001)(2906002)(52116002)(5660300002)(86362001)(66556008)(36756003)(66476007)(66946007)(6506007)(4326008)(186003)(16526019)(8936002)(8676002)(316002)(2616005)(6512007)(69590400007)(83380400001)(7416002)(6666004)(921003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: Lxyz6lvW6eEI4CWWQ5W2UWMopIWJ6WlPwR4/004n0K+Mo7bmvYjtrZu4OuMBgtkpZ4+VC4abA+NgWum5QkG2F2IJJyJmH9yVDlNy0mr4bjfEzVypQXolctncr8zLWBhOTdHBv/WyS7D+DzdLSEzPXp2zOHHE8FppRXE4FYSLRcjj18oPEJEAhptwS5H3lQi9OZGA/+ewLJuWuaYti+WLUppdCrvJhGdZDCyhsxDzO1n5XgCk2N9kX2I+/EDCeE5EYl6vTFjYh5VLpyOO3r9Ep8O3CjVFuXGGfbMRIAETB1U6JEidfToFSXMPwyVNy1U8T9G/FdSMwpiKGDuBMA7ZUlZ6grJLNG4MmxmetovDO2YL4VEG5Cv6Rsj3Yqu51v/QvFJemVM+DoP2N39iFQ4f+aj5iHhf0G49eBSVwhNBUEk1zlYp6nyjvFmfiOCUZtzmelb90C6TIM4QQNyZZK2Wess5fdsirRw77zHUjB7eI0jli9a0wkiil5l5lp8iT/nII3S95yTJ6UKRf4V3Ea0eRiJ8D8L1r4vFNzguuoDr3Kc=
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ecc515-676d-467a-9ea9-08d807b00b02
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2020 11:19:55.7652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zeQ5Etwq5qNringcihOYET0rxymsWuGinl0uisJZOUrPuY4fol+JUJhRRtlB6zKcqkds6mCAxA3wsQo+bvbLBD0sbCmUCTTSV80JVkYRj8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1358
Cc: ryan.lee.maxim@gmail.com, ryans.lee@maximintegrated.com,
 steves.lee.maxim@gmail.com
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

 malformed firmware file can cause out-of-bound access and crash
 during dsm_param bin loading.
  - add MIN/MAX param size to avoid out-of-bound access.
  - read start addr and size of param and check bound.

Signed-off-by: Steve Lee <steves.lee@maximintegrated.com>
---
 sound/soc/codecs/max98390.c | 23 ++++++++++++++++++-----
 sound/soc/codecs/max98390.h |  3 ++-
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index be7cd0aeb6a6..8c7db568fe64 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -754,6 +754,7 @@ static struct snd_soc_dai_driver max98390_dai[] = {
 static int max98390_dsm_init(struct snd_soc_component *component)
 {
 	int ret;
+	int param_size, param_start_addr;
 	char filename[128];
 	const char *vendor, *product;
 	struct max98390_priv *max98390 =
@@ -780,14 +781,27 @@ static int max98390_dsm_init(struct snd_soc_component *component)
 	dev_dbg(component->dev,
 		"max98390: param fw size %zd\n",
 		fw->size);
+	if (fw->size < MAX98390_DSM_PARAM_MIN_SIZE) {
+		dev_err(component->dev,
+			"param fw is invalid.\n");
+		goto err_alloc;
+	}
 	dsm_param = (char *)fw->data;
+	param_start_addr = (dsm_param[0] & 0xff) | (dsm_param[1] & 0xff) << 8;
+	param_size = (dsm_param[2] & 0xff) | (dsm_param[3] & 0xff) << 8;
+	if (param_size > MAX98390_DSM_PARAM_MAX_SIZE ||
+		param_start_addr < DSM_STBASS_HPF_B0_BYTE0) {
+		dev_err(component->dev,
+			"param fw is invalid.\n");
+		goto err_alloc;
+	}
 	dsm_param += MAX98390_DSM_PAYLOAD_OFFSET;
-	regmap_bulk_write(max98390->regmap, DSM_EQ_BQ1_B0_BYTE0,
-		dsm_param,
-		fw->size - MAX98390_DSM_PAYLOAD_OFFSET);
-	release_firmware(fw);
+	regmap_bulk_write(max98390->regmap, param_start_addr,
+		dsm_param, param_size);
 	regmap_write(max98390->regmap, MAX98390_R23E1_DSP_GLOBAL_EN, 0x01);
 
+err_alloc:
+	release_firmware(fw);
 err:
 	return ret;
 }
@@ -847,7 +861,6 @@ static int max98390_probe(struct snd_soc_component *component)
 
 	/* Dsm Setting */
 	regmap_write(max98390->regmap, DSM_VOL_CTRL, 0x94);
-	regmap_write(max98390->regmap, DSMIG_EN, 0x19);
 	regmap_write(max98390->regmap, MAX98390_R203A_AMP_EN, 0x80);
 	if (max98390->ref_rdc_value) {
 		regmap_write(max98390->regmap, DSM_TPROT_RECIP_RDC_ROOM_BYTE0,
diff --git a/sound/soc/codecs/max98390.h b/sound/soc/codecs/max98390.h
index f59cb114d957..5f444e7779b0 100644
--- a/sound/soc/codecs/max98390.h
+++ b/sound/soc/codecs/max98390.h
@@ -650,7 +650,8 @@
 
 /* DSM register offset */
 #define MAX98390_DSM_PAYLOAD_OFFSET 16
-#define MAX98390_DSM_PAYLOAD_OFFSET_2 495
+#define MAX98390_DSM_PARAM_MAX_SIZE 770
+#define MAX98390_DSM_PARAM_MIN_SIZE 670
 
 struct max98390_priv {
 	struct regmap *regmap;
-- 
2.17.1

