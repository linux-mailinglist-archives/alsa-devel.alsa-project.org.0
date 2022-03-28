Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 907394E8E02
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 08:18:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2440216B0;
	Mon, 28 Mar 2022 08:18:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2440216B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648448330;
	bh=YPU6xZrhS/X9SuvmRQyNuu0/i6sYdgY4IlVb+i1iCe4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V/k9WNwdp5kXAz9xb3iV2K1tBzOCMvCNHlmXjrNKfcdIFQva89GAuI2jaGoee/5sm
	 PbfzEQrh3ofQcNreny1zylx25w/3EHMeDVwh4Mc2onWU7FKG6eYtiozclG28nvQGiz
	 l//b4LeDreE0nG5Z5kv2rIQrQuv0gbpyPrn3M0Ek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 998FBF80536;
	Mon, 28 Mar 2022 08:16:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C100EF80539; Mon, 28 Mar 2022 08:16:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::624])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16244F80536
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 08:16:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16244F80536
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="dV9wJgdr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBL+E3FhpgepBlSjfL8Ve1SJ0cEL5Da59dP0vCCIJxEIAhmsVeGDWRObertidcr+wJOkSE1G5uHZFa3dxLQzN5Xi5XlLl/6SS5HsJkcTax5P8QkSogJdAzW2baxDtQxTK9Dba3GFW39oDVnz9HwggIFtIfyQXwGDn1KZIBn/GKbu3v88sEjj7FNsFEPKf4baneNnCPWCCpEMl5xx06hWgcPeuUxDFC8uMZ7u2mUHP8GR84izEE2Me4gf6fztzukk1LpGqURK1xm48XX/kDU9kas6hjQ4ptjDm+M8DkfgDQ3a0C+ZVgAGsyDbplzYkSCJJrfau2vex954R7P1YpvG8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVbAgiWj7uQBw+VCLMddmZGQpgzkOz+iiy3XW8lKpUY=;
 b=caM1H1mUhgRzerC2l/HdtDjagnERnzk2AnY0mqbJ6P+kn6dsU38aXLpEOda+oT6xeSrMwBpbsBrLvoGefbgSRgbpEXghkh3C9QcW5D6QQ3Tq6Vlhmfph2ye0tacf1oduPfVZoftPayL7isZcYjqnUrm02xZQd++xXGN6kwANKsFjDHyYSPIe8ZMQZaocGaD4mGK9q8MRCaQ7fNrh1QzQ/3F2wPOgaRwTjly/tGZm2Dtlw3YiQ9lKbpJOMsRuJlTp8EHeTzw/dY7xFJC+BsD6H+7Hj51RahglpYVl68J6eD4sI6/TRO5FkFrwjWptYJpJXrKNg//ELGAAIEFP34w8eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVbAgiWj7uQBw+VCLMddmZGQpgzkOz+iiy3XW8lKpUY=;
 b=dV9wJgdr8tfwdZNL6KIYBE5lWTpFnNoyEPC4aQ0qgufd769v5G5P0r8rjDxBXI6w5P8/z64o/yeNixatNXSaRHZpcOrxSXZCXV837X7K/jh34Yq2XdTPEsLEhJYje0HRRWu7lEwJ6p/ao0HIDVhoyJ7w/jsM9M+ANvnTOPZkYAeeZ1JBHlT7Fpxk7zjC+Qfe7RCsE8s58XJa/GhcS9hLFMh64VDMnzsnJOKfmrFFci7lXOv3YEbSgVfrk+YAaLD+gDqRD/66GQI6Jaz5a7hfAKGKdsYrWoEG6x/yl05kgY7avOjpmTj8jlzwNyvmpqSCNWSiE55bXVHoJu305Wazkw==
Received: from BN9P222CA0006.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::11)
 by PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Mon, 28 Mar
 2022 06:16:03 +0000
Received: from BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::f4) by BN9P222CA0006.outlook.office365.com
 (2603:10b6:408:10c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Mon, 28 Mar 2022 06:16:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 BN8NAM11FT060.mail.protection.outlook.com (10.13.177.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5102.17 via Frontend Transport; Mon, 28 Mar 2022 06:16:03 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Mon, 28 Mar 2022 06:16:02 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sun, 27 Mar
 2022 23:16:01 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport;
 Sun, 27 Mar 2022 23:15:57 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <peter.ujfalusi@linux.intel.com>, <pierre-louis.bossart@linux.intel.com>
Subject: [RFC PATCH v2 6/6] ASoC: tegra: Get clock rate in consumer mode
Date: Mon, 28 Mar 2022 11:44:10 +0530
Message-ID: <1648448050-15237-7-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1648448050-15237-1-git-send-email-spujar@nvidia.com>
References: <1648448050-15237-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a37d4cff-22ec-4b6c-ba8b-08da10826faf
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB5685EA177719B22750D930C4A71D9@PH7PR12MB5685.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aHdu+izTmoMjRSmgsmwZx8FWJqSeIkSQnp4yMYVx5YI2fNm5SgHf2KYPwL/gD2R6d0hYCjRrddRhVX3MNYyjDpv0Bg33fqCWOBLa6GskRftdKpJYjc2zxrpkecOkT5wfcc3TUUwphZhJd+vh3oMeFNUlA+R15xT39BBj+Rd8nPgaUDQbQnyBwUQsoiWRTVeYnGUrYTKypAvsRQ0SEPQ3pj6OoyV27ZV6NrzUSG4UDJVJZKjME8kPmn+gP5InL3Rz5lywH9JkBzXpBkGoSP4uWaZm81VP2/nRKLQXrxE8AbvsUqKywkWLl9m5eD4qjwGu7WrLjDhF3s4VCwB8UqgeeFvik198uGpl1/7iLfIOE0Vl2yKn5/ZlYNI8NcaDJa/1e/Z7OD7s5XjbWid5qnsqfZgh+fsgw/u4bQbfg3AMcQ6arXTWYFL+0mGtkFhciI8OFycfoyUtuL87Wo338Flia5rXcoOYbyLR+Gb+PWUIl1uMjgkH426Zf0AB5Quv5xzCLifPg+CEdkV8I9IUKjCoUI4JNH+j8yFcSD5ynn5SWeDi2qrvzLOLSAtMadImz79JWfZDlqIc70/RkL8AImSmYityL+ZbGAWsdYRJkmpVvi5EnCLuT5ZVj+j9iq1RXS3oeHQXzi1FRGIVSnbQDbjCX7F9+3YXAqIddn0HVhCW6H37AcdVlnDpigXWPYQK87DuekNbAbC6IFrTm6Bf/PK32w==
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(70206006)(7416002)(336012)(26005)(86362001)(40460700003)(316002)(426003)(70586007)(81166007)(356005)(47076005)(6666004)(107886003)(508600001)(8936002)(186003)(82310400004)(7696005)(110136005)(8676002)(2906002)(36860700001)(83380400001)(2616005)(4326008)(5660300002)(54906003)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 06:16:03.0208 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a37d4cff-22ec-4b6c-ba8b-08da10826faf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5685
Cc: oder_chiou@realtek.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>,
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
index 9552bbb..53e5307 100644
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

