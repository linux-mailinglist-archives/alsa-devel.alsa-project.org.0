Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F27AD4D461E
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 12:44:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90BD118E2;
	Thu, 10 Mar 2022 12:43:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90BD118E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646912685;
	bh=N1zDPVUZQcyTk/+aW4LuqQ0j9MVldmOlF/5V/QJPyac=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r/H5TT30Umc0d23AbjjvDd5Ga/1cDQwVzLo0yQTBoeL28gvXYSYfsuS2wJYWx7YjC
	 4O09ofhbNSorU+jygAQF33UWkWcVmZyOgs58QZSS3k7FM0Pp2AN+ML/Yu+SFBwJ/yN
	 csMVWoXP/YQUmiBw99bG/3prDia6I6/PKf6tntKQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86F3DF80520;
	Thu, 10 Mar 2022 12:42:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25085F8015B; Thu, 10 Mar 2022 12:42:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::619])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8293AF8015B
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 12:42:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8293AF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="XKclA3Nr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4eAAxhVrCoaLp3vGApvwX6WdoOr1+Jft1fy3qvPsDbhElB2ePnPjwyfuPzbpBahvD4PgseCI7p9H05n4lKnCEIkdEbZwkv1+sIW5JCRIZPJof8SposBuUwFQwi9eQJvxdHUKCG2g5IUslaJ3QhaIer9T/27TYik3mk6+AOvWAeGCgXsXqHVKdkBtM/PVUvO7ndDM1XXqJz5Jgyk4nsnUAECLnaP7WbQKXX7jWWkQ7BLmfBzL/CX8Hg2RCM5+0iKjxTlmgBhogGDSgfB0L7ZP9M9ee4YOzveJBx7AMtd+8o/2bnqTju15MHXElzthZ0+Hkxwp9K+1Lt4GtFf98N3uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1puj/fXFRo0cMKqEDoys9zxAmynyKn93oWJh76oYvNc=;
 b=eCsve2QEJsGKv0XpbAjw4uXVVN7FZpT9Yg75TblIWkEOxViIIxaNZ+fWQKUzu4BfTjkeQt3sBajMmuLHkBqQjgKg6bQF7pGUhu4XB0lh9tEyRFYk/EqsyXYuYyew3u2Hp1syGztnFZP3nnM1NaA6laMIGJW9dOMIZ5IjtKZlau8iNiAW1hQY30rQw4SfNMKiampGZcjr+4Z2kfrxS5B9C471KQNaT1hDVjadXn9DcMbfF/qCA7jXJo6IK/T7fSQF6pXaG75rT2fhWFRGJKy4+ieQ0GmITs5aNP87XJfmNkpt/AhrbUoy8G0C6HeG8l9iPOCrYuMQ7mqEpgmcFVldTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1puj/fXFRo0cMKqEDoys9zxAmynyKn93oWJh76oYvNc=;
 b=XKclA3Nrs8FfdlVF0JSnNxcoMl2r3e5xPgVE8gqmABThW6vtRhMCGUpvCR4s6kqt8w3RYND3E5sX8Or6Bsr4R0g9JJkehmn+pxBfUyAhqGbzHsMVH8ghtTsB4r2J8CPfkHdzxxJGBwANC3riC6Jw9zszFUozUQvp4GSQ6aZAgHGEwuBEnQng2VgWql4f51EBWVN60oS4UdQwccD/byERom7P1u18hg6VSwV22V0dlPnFPQRKr6i3RI7AuY1DA6EsN+tK8DBLsR+I3qBYS93K4eK8awEuQDR5XnE+jtJDiyiJbVojgPC8Kc2HWXilwGmshy/qKTKto5fXrWt0n0q2LA==
Received: from BN6PR19CA0109.namprd19.prod.outlook.com (2603:10b6:404:a0::23)
 by BN6PR1201MB2513.namprd12.prod.outlook.com (2603:10b6:404:ae::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.26; Thu, 10 Mar
 2022 11:42:38 +0000
Received: from BN8NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:a0:cafe::81) by BN6PR19CA0109.outlook.office365.com
 (2603:10b6:404:a0::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.23 via Frontend
 Transport; Thu, 10 Mar 2022 11:42:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 BN8NAM11FT033.mail.protection.outlook.com (10.13.177.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5061.22 via Frontend Transport; Thu, 10 Mar 2022 11:42:37 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Thu, 10 Mar 2022 11:42:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 10 Mar
 2022 03:42:35 -0800
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport;
 Thu, 10 Mar 2022 03:42:32 -0800
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>, <oder_chiou@realtek.com>, <robh@kernel.org>
Subject: [RFC PATCH 3/3] ASoC: tegra: Get clock rate in consumer mode
Date: Thu, 10 Mar 2022 17:11:17 +0530
Message-ID: <1646912477-3160-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646912477-3160-1-git-send-email-spujar@nvidia.com>
References: <1646912477-3160-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3893c7ce-3bb9-4c69-8140-08da028b13c1
X-MS-TrafficTypeDiagnostic: BN6PR1201MB2513:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB25136E550C8527A20F3E12BAA70B9@BN6PR1201MB2513.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IgQXAFOd2THqnzgRvxY1elb4hwVPDuEX5IlNtXQQFk5YLdjqT+5gQO20PHd40wG1/st2k6BpAcjzJJ8QiMmVySaIBEI+qOzg1sFdjkB1ACpS52Ht0OaUYOc/jYs+kAMJHQ6TWIb0uMZdTqH3Y8zOILRdpvF5YRuTP9xUWQHM1pxaYjowWBGe7a2OCsnvn0EbGeWOEN6gPvsgJY9OCtUytTF8sA8bd7+ai3Ap86Rys8HfLG1cJTnn9tPXK/EXLlgNQh1a34dSopwTSCq5sshASAditQ8m/7J49ls3dWuDdBoHUInEJECZ77FdnZ6w3w+9RnDqk0LVHNly7E1Otyl8Cbl3pjKNTKM7DKuG50EFHSL0hq475RoNsLbIi+rbU2LNWe5gbxTKIidEvVJIhuf1KJAvRTap/Uqq9qAdfxjcueMc8PDyogwY8Hlq78Ov2WBPcIG1OX3ibDIfuiVHGFSzvy8I9VVNza5st8OIkd2K5yQsiAjjpzlhM7fhhz7+XHU/G6e8P9uHMOeZi/+64HTZ3KWqSKQLzPdv7xnStXeJ8HKI+YcDp70LaI7rYxuQK6FcxQ4qol/3DrESDPpF/QKJt+oGtyUHN9pCe3K8/Ke0OzArXAF+n/C6tbzioUxplunKLwbIWwtXN/f1pv2O/pVF+T+DP3MU7e/kLm3BJh0jZ3/ZdQ9JjM/0ntYhktiMhBMO5g7nLL8HRcm3X1qvFdpUGA==
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(7416002)(8936002)(40460700003)(36756003)(508600001)(81166007)(83380400001)(107886003)(8676002)(36860700001)(336012)(356005)(5660300002)(426003)(2616005)(186003)(26005)(6666004)(70206006)(86362001)(2906002)(70586007)(54906003)(110136005)(7696005)(316002)(82310400004)(4326008)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 11:42:37.9786 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3893c7ce-3bb9-4c69-8140-08da028b13c1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB2513
Cc: alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org
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

When Tegra I2S is consumer the clock is driven by the external codec.
In such cases, ideally the bit clock (BCLK) rate needs to be updated by
provider. Consumer can use standard clock function to get the rate.

On Tegra HW it is possible to use I2S BCLK clock as reference to the
I/O (other I2S or DMIC or DSPK) interfaces. This input clock is called
as SYNC input clock and it can act as a parent clock to any of the
remaining I/O interfaces. Thus it is important to set the clock rate
in Tegra I2S consumer mode as well.

With this patch SYNC input clock rate is updated and any I/O interface
relying on this can derive required rate.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 Following are the DT binding cases I tried on Jetson AGX Xavier platform.

   1. Sysclk derived from MCLK : This is currently being used. No DT
      binding change would be necessary.

      Clock tree dump snippet in this case with proposed series:

          ...

          pll_a
            |
            |-- plla_out0
                    |
                    |-- ahub
                    |
                    |-- aud_mclk
                    |      |
                    |      |-- rt5659_sysclk
                    |
                    |-- i2s1

          ...
      

   2. Sysclk is derived from codec internal PLL and this PLL uses I2S
      bit clock (BCLK) as reference.

      rt5658: audio-codec@1a {
         ...

         clocks = <&bpmp TEGRA194_CLK_AUD_MCLK>,
		  <&bpmp TEGRA194_CLK_I2S1>,
		  <&bpmp TEGRA194_CLK_I2S1>,
                  <&rt5658 0>;
         clock-names = "mclk", "bclk1", "pll_ref", "sysclk";

         #clock-cells = <1>;
         clock-output-names = "rt5659_pll_out";

         ...
      };

      Clock tree dump snippet in this case with proposed series:

          ...

          pll_a
            |
            |-- plla_out0
                    |
                    |-- ahub
                    |
                    |-- aud_mclk
                    |
                    |-- i2s1
                         |
                         |-- rt5659_pll_ref
                                   |
                                   |-- rt5659_pll_out
                                             |
                                             |-- rt5659_sysclk

          ...



 sound/soc/tegra/tegra210_i2s.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index 43fa106..91819db 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -53,17 +53,24 @@ static int tegra210_i2s_set_clock_rate(struct device *dev,
 
 	regmap_read(i2s->regmap, TEGRA210_I2S_CTRL, &val);
 
-	/* No need to set rates if I2S is being operated in slave */
-	if (!(val & I2S_CTRL_MASTER_EN))
-		return 0;
-
-	err = clk_set_rate(i2s->clk_i2s, clock_rate);
-	if (err) {
-		dev_err(dev, "can't set I2S bit clock rate %u, err: %d\n",
-			clock_rate, err);
-		return err;
+	/*
+	 * If I2S is consumer, then the clock rate is expected to be
+	 * set by the respective provider and thus just read the rate
+	 * in such case. If I2S is provider, then set the clock rate.
+	 */
+	if (!(val & I2S_CTRL_MASTER_EN)) {
+		clock_rate = clk_get_rate(i2s->clk_i2s);
+	} else {
+		err = clk_set_rate(i2s->clk_i2s, clock_rate);
+		if (err) {
+			dev_err(dev, "can't set I2S bit clock rate %u, err: %d\n",
+				clock_rate, err);
+			return err;
+		}
 	}
 
+	dev_dbg(dev, "bit clock (BCLK) rate is %u\n", clock_rate);
+
 	if (!IS_ERR(i2s->clk_sync_input)) {
 		/*
 		 * Other I/O modules in AHUB can use i2s bclk as reference
-- 
2.7.4

