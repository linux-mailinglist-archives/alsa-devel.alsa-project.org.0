Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2070773A4F1
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jun 2023 17:29:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CD85950;
	Thu, 22 Jun 2023 17:28:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CD85950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687447745;
	bh=MRP0InxQls3A/qD8smrKvjN3jzJCbSuM0cMRRpKT1Rc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PyapEV5GCrjeJOLzvSL+mRYb12ESpwdmc+8cLiBFYPCTx9pBezt4MxupF1D0QsiBM
	 VkXj41rTA4J1KL2NjeBjfT5idWkrDj6yEDAmtHaLBnM1n0n2PgNDgdvDISjHLKmep0
	 3OAiXSA83Ya0aQjHCUAd8v+UKrFEu6G+qyWKtS7c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E75ADF805C2; Thu, 22 Jun 2023 17:27:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21560F8056F;
	Thu, 22 Jun 2023 17:27:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C197F80551; Thu, 22 Jun 2023 17:26:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD24DF805A1
	for <alsa-devel@alsa-project.org>; Thu, 22 Jun 2023 17:26:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD24DF805A1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=pCgUZlUp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLHKAM92mGBUdqglIQZRk+if+YlvbFTl0CTPrF8KLtw0zJXtRl5+wx33aY/eIGNLvvgFwo52Og7vQi0kOzF0Y59iU45jsxf9TDMmM5uZa7ez9bmIgRUZ8s41xzW/UlKUbu7EnqyqBlP++2bHC2lfWEQ1HY4y2WuYOdXV8UGETD7nnEx/5QZ9XBKbB3dtzQCXsRVgGh5TSg/ePe8M2UePEJ+zdkWS9CZD9RWOAexRMrsswlh6fUnIA/f+A/0/iCVeB5+kBHU0cir/kwef36IiiuMDWtKtV+IzKcAylBPeaS/W2/2Ei/PMahwLxa9bBwU5KDHmKol50KZI72NfL+R5zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1gJUJChraGI/0cF68p/+kGmZoqkKWvMw/xcvMoaTYc=;
 b=WRcdfzvy//g/bj6qnvmLTbTPS+GTEfZqjLBUAgZ75oX9+2mZLh1on97aEFCoqE7NfvUIrE6PUS2De/ecYpp0BUAI0kh9kWAUANODhYNAugQH71ww0lN2sQrMod+vzLL2cS6bzee4IpD1+r2Ali2vzDNd1b0O7KRlvjKVmLSwDL6m9hbqrogzlsb/5zAeAjH/zSHB+vpfQ76m2/N3n5zdqkpHus8dp00lkNPNYYTIQQcbsvnRINHBdbyOx5kQFYXx+m+sRWiSTT0Z2wMwelHczQkcVPNQktwLQvZJKYwzQHZYtVWJiXGDfqaNHynpijoWAVnQJqTn2uY8U2K051n7sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1gJUJChraGI/0cF68p/+kGmZoqkKWvMw/xcvMoaTYc=;
 b=pCgUZlUpPwXjbwbtlPL+tEHh89paYrr3leimp71BTqgFGcc5XILqVtRsNbiGsatx9lidr82toYdlLfAgDbv/dF4uWRtj/VC6ytYo7fLQtUfcu+6tfn5k/wpPTKqJ/7eIuyEG6rluVWyNqV50wf51t5LWLqPfYCMxaGAiaMpn1Nk=
Received: from SN7PR04CA0221.namprd04.prod.outlook.com (2603:10b6:806:127::16)
 by MN0PR12MB5906.namprd12.prod.outlook.com (2603:10b6:208:37a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 15:26:40 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:127:cafe::f8) by SN7PR04CA0221.outlook.office365.com
 (2603:10b6:806:127::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24 via Frontend
 Transport; Thu, 22 Jun 2023 15:26:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.17 via Frontend Transport; Thu, 22 Jun 2023 15:26:40 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 22 Jun
 2023 10:26:39 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 22 Jun
 2023 10:26:39 -0500
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Thu, 22 Jun 2023 10:26:35 -0500
From: Syed Saba Kareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, V sujith kumar Reddy
	<Vsujithkumar.Reddy@amd.com>, Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 08/12] ASoC: amd: acp: store xfer_resolution of the stream
Date: Thu, 22 Jun 2023 20:53:53 +0530
Message-ID: <20230622152406.3709231-16-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230622152406.3709231-1-Syed.SabaKareem@amd.com>
References: <20230622152406.3709231-1-Syed.SabaKareem@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|MN0PR12MB5906:EE_
X-MS-Office365-Filtering-Correlation-Id: 21743cbd-a690-4ae7-6519-08db73351390
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Pxqpl/k18Rdn9ObUyxAPN7dHfsL1sLbgWznVX1tMZZgLG0odTrQrIOpld+J4q04PKxidKVHczAKANRMXEuFZLZ53spybRLcRzvnhsFIkOrnCtCEkoHLv8foz64BX3abQk218Ti9mpR30frk+4ZMZCgKqMz8ly5vkzN5dyUvTWP2SMf3ve7RNP8IZRRUSjlPHBbKScn9jiw8JZePnb/yASmEt6mw2HVIC4mUCQC7H9KWNESaEguaV6BkilfbjSYeTJ7GnE/PW6inGa4uzRu7XS7XsH93+Q1hLzqzfbUpPf3zKttqJcJG7saQqFM1bu3DMo45v3a/emKf7svdXvF1wEV82zsMAc0ws9dGtQxTUrFKEOysTl1L4o9WAUHDEZ2tijzNqLSBCK+5SxLUyQ0xTlr8Wr5Qwp2EzDJO8Pj3q9Eb9SCRDwBodP4hQL6+tbPW0vqyx4BcGeoc2pJs2t5HbM6VpruowesCR3ivjx1m9BToliyzgEf/Ed7sglyN1kWZ/ogSG04QZRABLxqOyfcjjg82nJ2B/P/d7v6sZnD9kPF/Tg16zvUsaYRAwFF9X4bm52uIzbzkhsyfeDVFr7KVBb/VfJRMYu3NlHCZwSxr4BgQVvX56qctpl9bntB4LU77P18/BADUIL+jx755ooh7P7GsUqnEHBxgfGnDDPg9aPiipmK5BGPM59u2RSFM4sTO9ZMvJnSN8t+tvsmN/Ve0XcLgH3NjRGMYmOXtcDArPTRyikBwM0bNKkTi4by687gsBmKrraHqg2ynMnHId9EI/Sg==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(39860400002)(346002)(396003)(451199021)(36840700001)(40470700004)(46966006)(6666004)(26005)(5660300002)(82740400003)(186003)(356005)(81166007)(1076003)(7696005)(82310400005)(478600001)(40480700001)(2616005)(8936002)(2906002)(8676002)(41300700001)(40460700003)(70206006)(54906003)(110136005)(36756003)(426003)(316002)(70586007)(47076005)(86362001)(36860700001)(336012)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 15:26:40.1123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 21743cbd-a690-4ae7-6519-08db73351390
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5906
Message-ID-Hash: 6YQMUHTCNEGPXRTKIWAZSNQ4SSWEZSYC
X-Message-ID-Hash: 6YQMUHTCNEGPXRTKIWAZSNQ4SSWEZSYC
X-MailFrom: Syed.SabaKareem@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6YQMUHTCNEGPXRTKIWAZSNQ4SSWEZSYC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Store the 'xfer_resolution' of the stream in private data structure,
it will be used to reprogram the xfer_resolution for the active stream
during system level resume.

Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
---
 sound/soc/amd/acp/acp-i2s.c | 2 ++
 sound/soc/amd/acp/amd.h     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
index 09b6511c0a26..09dc5f2c0bfc 100644
--- a/sound/soc/amd/acp/acp-i2s.c
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -149,6 +149,7 @@ static int acp_i2s_hwparams(struct snd_pcm_substream *substream, struct snd_pcm_
 			dev_err(dev, "Invalid dai id %x\n", dai->driver->id);
 			return -EINVAL;
 		}
+		adata->xfer_tx_resolution[dai->driver->id - 1] = xfer_resolution;
 	} else {
 		switch (dai->driver->id) {
 		case I2S_BT_INSTANCE:
@@ -167,6 +168,7 @@ static int acp_i2s_hwparams(struct snd_pcm_substream *substream, struct snd_pcm_
 			dev_err(dev, "Invalid dai id %x\n", dai->driver->id);
 			return -EINVAL;
 		}
+		adata->xfer_rx_resolution[dai->driver->id - 1] = xfer_resolution;
 	}
 
 	val = readl(adata->acp_base + reg_val);
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index f53613216397..38c152c6c8c6 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -166,6 +166,8 @@ struct acp_dev_data {
 	struct acp_resource *rsrc;
 	u32 tdm_tx_fmt[3];
 	u32 tdm_rx_fmt[3];
+	u32 xfer_tx_resolution[3];
+	u32 xfer_rx_resolution[3];
 };
 
 union acp_i2stdm_mstrclkgen {
-- 
2.25.1

