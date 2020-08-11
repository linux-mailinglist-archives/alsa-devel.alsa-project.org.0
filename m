Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0594241ECE
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 19:00:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77CEB1664;
	Tue, 11 Aug 2020 19:00:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77CEB1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597165252;
	bh=bBmVygDPh5+Y32SrUAYHj9GuGX+GWoLw9qTxunt74Ew=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H1Ozmay8Quiof8BCVMApeDSJPEg8mEhF01Rt8FH5bRVgcIixHb3dItdhoSEcxA7Vn
	 75vMbUswiQYRQ20lB7nGp87nsDRFZaxwntsHElmxpuIJNfhYowU0vrBEgH7TE3vLFn
	 Vb3zmpcr9aHztFB0gMDCrrBwwO8JERidIhw95ucI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 164E7F802DD;
	Tue, 11 Aug 2020 18:57:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65373F802DF; Tue, 11 Aug 2020 18:57:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,FROM_WORDY,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10066.outbound.protection.outlook.com [40.107.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FD51F80161
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 18:57:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FD51F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="FYng3RiA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EHnhkp18mheE9ujKJdTlFBZ3ylNuh4J088q2i42bLLliW4gKttfUlxwmHdsSEDbUNC99IpxyGXiLSFGUeLp0recx8y7W6tdd2iXIjXeDmK3po2BNNwqlB8q3csnzocWa6bDcsyncETYo7VGtaYJasdDyOavJCue0sq9rDaRS64QK1adH3Eb7GO3SB6ADZ7oiyiD7otNozHqWtue8P/4Ig4UXCbnkf8dKndEobR8/U7u4CqTEkHvw0/x+zzCz0SSEGPlLrM/kxkOJj7+Uj5brqmVYlrVPylLy3fH4paJ2m9+eFaX+szV6cFeoGbJ+iEqINSD0dkJMj0pQD7/Q/RbMeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3H2bfkd2YAPPWt9mJxh9/GUsLJTm4m7Y13uacQdqrXs=;
 b=ZN4+pqVk9APxX6S11AvwhBU+Vny3sCy+QYKaITLMLnpS4ZdNR7p2PIdZn24biGsTQTj9MLCbj+rKpFrLLvWS6eeOwF0CaP0FD+VopDR/y+p+X38eV752psUKnL/guJfd5KTmduS7LVBVTilqKyqxTpSz0x8CgJ8ScClWZ7iJxvqASVyYvN6e0HdEh4rFRvYHL+JFZFoyAzooU2Z32IazIdWilgbA1FhrHX+sAQgqMep+Y5/MEvYbIvsLAGeUhyz3XU81n357N3GyX6VcHns3LpNkkPWXRFfqctjd/bkX7I0K/oY2x7X0KNGyJYqFyyN+A5kuoaFKCWouqCu/PRbsTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 193.240.239.45) smtp.rcpttodomain=perex.cz smtp.mailfrom=diasemi.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=diasemi.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3H2bfkd2YAPPWt9mJxh9/GUsLJTm4m7Y13uacQdqrXs=;
 b=FYng3RiAv1lIe0eK1/5YdD1akD0CDzvJusexhx8Jw+z6qjO6ZZytqowOPvu0oncUL7wxvBqFXo/rHTV+dC3r6saSUyJ8He4PJ5KeYGiiMhZZqn5sFcKO+59J2e13hpuxVqn1Cd25v7wymjY3m7ZnfZ4ixuXsGz507sud9hBlykE=
Received: from AM6PR02CA0008.eurprd02.prod.outlook.com (2603:10a6:20b:6e::21)
 by AM6PR10MB2086.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:2d::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Tue, 11 Aug
 2020 16:57:30 +0000
Received: from HE1EUR02FT053.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::c6) by AM6PR02CA0008.outlook.office365.com
 (2603:10a6:20b:6e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend
 Transport; Tue, 11 Aug 2020 16:57:30 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; perex.cz; dkim=none (message not
 signed) header.d=none;perex.cz; dmarc=fail action=none
 header.from=diasemi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 diasemi.com discourages use of 193.240.239.45 as permitted sender)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 HE1EUR02FT053.mail.protection.outlook.com (10.152.11.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3261.16 via Frontend Transport; Tue, 11 Aug 2020 16:57:29 +0000
Received: from swsrvapps-01.diasemi.com (10.20.28.141) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Tue, 11 Aug 2020 18:57:25 +0200
Received: by swsrvapps-01.diasemi.com (Postfix, from userid 22379)	id
 CB8003FBE7; Tue, 11 Aug 2020 17:57:25 +0100 (BST)
Message-ID: <b92c461baeed27a6cd92e59e36a55c2547218683.1597164865.git.Adam.Thomson.Opensource@diasemi.com>
In-Reply-To: <cover.1597164865.git.Adam.Thomson.Opensource@diasemi.com>
References: <cover.1597164865.git.Adam.Thomson.Opensource@diasemi.com>
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Date: Tue, 11 Aug 2020 17:57:25 +0100
Subject: [PATCH 3/3] ASoC: da7219: Fix clock handling around codec level probe
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1ae614d-3f94-473c-28a8-08d83e17a22d
X-MS-TrafficTypeDiagnostic: AM6PR10MB2086:
X-Microsoft-Antispam-PRVS: <AM6PR10MB208604F664150983E81D0E47A7450@AM6PR10MB2086.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:328;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vUk9FJI+bUhCF79wWKqJgTFM/SIgOAD0pbxM8DdxrONmcoqg6tyOX0a2nSu/QmN5AzdcyEJE3zmpTNq6NPKBinW4BKAGbc07LbHyeycrxWRq4gvc3pAFiiTlZuLFfQdy7RZHdwWFIk/TFZ7e+gjK7wK8gCqSQJTbpzKwqodcOghZbioXv0KofiBWJjckAsZedBGA+yigwTyS5rnsswSBYhjRlnHJCrTaoq/MEZPcSxvSYIrK/WPy+0PnJcosPN6hs0BxgGWNtKpURZKdINk9yC6Hc6zSGNG+R0zB1AhJMvpz+ZugUY7pn5zccFHVjVQLlxNz8ev51Sx0P32ZBpkCvo3YYpozlAe40LWuQ5rpHKvtEd4wFkEUps475zyxZiX5TX1m51812ZQWbD3Qudvtf9fonS4QrD/BQ+lVQPlUkUKI/A32VM/KDCskTvXWawZeZo6sV2iCwNQDS3D8XeZppA==
X-Forefront-Antispam-Report: CIP:193.240.239.45; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mailrelay1.diasemi.com; PTR:InfoDomainNonexistent;
 CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(376002)(39850400004)(346002)(396003)(46966005)(70206006)(83380400001)(186003)(70586007)(86362001)(8676002)(82310400002)(33310700002)(4326008)(356005)(478600001)(8936002)(26005)(6266002)(2616005)(36756003)(2906002)(5660300002)(47076004)(42186006)(426003)(54906003)(336012)(81166007)(107886003)(110136005)(36906005)(316002)(82740400003)(136400200001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2020 16:57:29.6145 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1ae614d-3f94-473c-28a8-08d83e17a22d
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c; Ip=[193.240.239.45];
 Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR02FT053.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2086
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Yong Zhi <yong.zhi@intel.com>
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

Previously the driver would use devm_* related functions at
the codec level probe() to allocate clock resources for MCLK
and the DAI clocks exposed by the device. This caused issues
when registering clocks on a re-probe (no device level
remove/prove involved) as the devm_* resources were never
freed up so the clocks were still registered from the previous
codec level probe().

This commit updates the clock handling for MCLK usage and DAI
clock provision to fix this discrepancy and allow the codec level
probe/remove functionality to operate as intended.

Signed-off-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
---
 sound/soc/codecs/da7219.c | 96 +++++++++++++++++++++++++++++++++++------------
 sound/soc/codecs/da7219.h |  1 +
 2 files changed, 72 insertions(+), 25 deletions(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index 0d1c70f8..ddd422c 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -2115,14 +2115,26 @@ static int da7219_bclk_set_rate(struct clk_hw *hw, unsigned long rate,
 static int da7219_register_dai_clks(struct snd_soc_component *component)
 {
 	struct device *dev = component->dev;
+	struct device_node *np = dev->of_node;
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	struct da7219_pdata *pdata = da7219->pdata;
 	const char *parent_name;
+	struct clk_hw_onecell_data *clk_data;
 	int i, ret;
 
+	/* For DT platforms allocate onecell data for clock registration */
+	if (np) {
+		clk_data = kzalloc(struct_size(clk_data, hws, DA7219_DAI_NUM_CLKS),
+				   GFP_KERNEL);
+		if (!clk_data)
+			return -ENOMEM;
+
+		clk_data->num = DA7219_DAI_NUM_CLKS;
+		da7219->clk_hw_data = clk_data;
+	}
+
 	for (i = 0; i < DA7219_DAI_NUM_CLKS; ++i) {
 		struct clk_init_data init = {};
-		struct clk *dai_clk;
 		struct clk_lookup *dai_clk_lookup;
 		struct clk_hw *dai_clk_hw = &da7219->dai_clks_hw[i];
 
@@ -2158,22 +2170,20 @@ static int da7219_register_dai_clks(struct snd_soc_component *component)
 		init.flags = CLK_GET_RATE_NOCACHE | CLK_SET_RATE_GATE;
 		dai_clk_hw->init = &init;
 
-		dai_clk = devm_clk_register(dev, dai_clk_hw);
-		if (IS_ERR(dai_clk)) {
-			dev_warn(dev, "Failed to register %s: %ld\n",
-				 init.name, PTR_ERR(dai_clk));
-			ret = PTR_ERR(dai_clk);
+		ret = clk_hw_register(dev, dai_clk_hw);
+		if (ret) {
+			dev_warn(dev, "Failed to register %s: %d\n", init.name,
+				 ret);
 			goto err;
 		}
-		da7219->dai_clks[i] = dai_clk;
+		da7219->dai_clks[i] = dai_clk_hw->clk;
 
-		/* If we're using DT, then register as provider accordingly */
-		if (dev->of_node) {
-			devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
-						    dai_clk_hw);
+		/* For DT setup onecell data, otherwise create lookup */
+		if (np) {
+			da7219->clk_hw_data->hws[i] = dai_clk_hw;
 		} else {
-			dai_clk_lookup = clkdev_create(dai_clk, init.name,
-						       "%s", dev_name(dev));
+			dai_clk_lookup = clkdev_hw_create(dai_clk_hw, init.name,
+							  "%s", dev_name(dev));
 			if (!dai_clk_lookup) {
 				ret = -ENOMEM;
 				goto err;
@@ -2183,21 +2193,58 @@ static int da7219_register_dai_clks(struct snd_soc_component *component)
 		}
 	}
 
+	/* If we're using DT, then register as provider accordingly */
+	if (np) {
+		ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
+					     da7219->clk_hw_data);
+		if (ret) {
+			dev_err(dev, "Failed to register clock provider\n");
+			goto err;
+		}
+	}
+
 	return 0;
 
 err:
 	do {
 		if (da7219->dai_clks_lookup[i])
 			clkdev_drop(da7219->dai_clks_lookup[i]);
+
+		clk_hw_unregister(&da7219->dai_clks_hw[i]);
 	} while (i-- > 0);
 
+	if (np)
+		kfree(da7219->clk_hw_data);
+
 	return ret;
 }
+
+static void da7219_free_dai_clks(struct snd_soc_component *component)
+{
+	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
+	struct device_node *np = component->dev->of_node;
+	int i;
+
+	if (np)
+		of_clk_del_provider(np);
+
+	for (i = DA7219_DAI_NUM_CLKS - 1; i >= 0; --i) {
+		if (da7219->dai_clks_lookup[i])
+			clkdev_drop(da7219->dai_clks_lookup[i]);
+
+		clk_hw_unregister(&da7219->dai_clks_hw[i]);
+	}
+
+	if (np)
+		kfree(da7219->clk_hw_data);
+}
 #else
 static inline int da7219_register_dai_clks(struct snd_soc_component *component)
 {
 	return 0;
 }
+
+static void da7219_free_dai_clks(struct snd_soc_component *component) {}
 #endif /* CONFIG_COMMON_CLK */
 
 static void da7219_handle_pdata(struct snd_soc_component *component)
@@ -2462,7 +2509,7 @@ static int da7219_probe(struct snd_soc_component *component)
 	da7219_handle_pdata(component);
 
 	/* Check if MCLK provided */
-	da7219->mclk = devm_clk_get(component->dev, "mclk");
+	da7219->mclk = clk_get(component->dev, "mclk");
 	if (IS_ERR(da7219->mclk)) {
 		if (PTR_ERR(da7219->mclk) != -ENOENT) {
 			ret = PTR_ERR(da7219->mclk);
@@ -2475,7 +2522,7 @@ static int da7219_probe(struct snd_soc_component *component)
 	/* Register CCF DAI clock control */
 	ret = da7219_register_dai_clks(component);
 	if (ret)
-		return ret;
+		goto err_put_clk;
 
 	/* Default PC counter to free-running */
 	snd_soc_component_update_bits(component, DA7219_PC_COUNT, DA7219_PC_FREERUN_MASK,
@@ -2512,10 +2559,16 @@ static int da7219_probe(struct snd_soc_component *component)
 	/* Initialise AAD block */
 	ret = da7219_aad_init(component);
 	if (ret)
-		goto err_disable_reg;
+		goto err_free_dai_clks;
 
 	return 0;
 
+err_free_dai_clks:
+	da7219_free_dai_clks(component);
+
+err_put_clk:
+	clk_put(da7219->mclk);
+
 err_disable_reg:
 	regulator_bulk_disable(DA7219_NUM_SUPPLIES, da7219->supplies);
 	regulator_bulk_free(DA7219_NUM_SUPPLIES, da7219->supplies);
@@ -2526,18 +2579,11 @@ static int da7219_probe(struct snd_soc_component *component)
 static void da7219_remove(struct snd_soc_component *component)
 {
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-#ifdef CONFIG_COMMON_CLK
-	int i;
-#endif
 
 	da7219_aad_exit(component);
 
-#ifdef CONFIG_COMMON_CLK
-	for (i = DA7219_DAI_NUM_CLKS - 1; i >= 0; --i) {
-		if (da7219->dai_clks_lookup[i])
-			clkdev_drop(da7219->dai_clks_lookup[i]);
-	}
-#endif
+	da7219_free_dai_clks(component);
+	clk_put(da7219->mclk);
 
 	/* Supplies */
 	regulator_bulk_disable(DA7219_NUM_SUPPLIES, da7219->supplies);
diff --git a/sound/soc/codecs/da7219.h b/sound/soc/codecs/da7219.h
index 88b67fe..94af88f 100644
--- a/sound/soc/codecs/da7219.h
+++ b/sound/soc/codecs/da7219.h
@@ -817,6 +817,7 @@ struct da7219_priv {
 
 #ifdef CONFIG_COMMON_CLK
 	struct clk_hw dai_clks_hw[DA7219_DAI_NUM_CLKS];
+	struct clk_hw_onecell_data *clk_hw_data;
 #endif
 	struct clk_lookup *dai_clks_lookup[DA7219_DAI_NUM_CLKS];
 	struct clk *dai_clks[DA7219_DAI_NUM_CLKS];
-- 
1.9.1

