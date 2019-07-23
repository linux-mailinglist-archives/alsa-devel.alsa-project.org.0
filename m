Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3006871756
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 13:46:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C11C018BB;
	Tue, 23 Jul 2019 13:45:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C11C018BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563882376;
	bh=mkmofuWgXqpCb41WDEAQp/37IJrQqKEx2M1SoCQqnY4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=TJgn3B5E7vlnjfUoj+1YBmotMr3MSdC1dITWKvVnPjQsqsugFIloDiV9H8F9zi8Fs
	 4gWcItsIJsTQrjmwvrb3JxIFX4vvjXuKvo5MnRf1HUAN9OPqWH0Z6iq/xwMPMFUTS2
	 EM1QAjjS2auB4U7qzzGPp1HJ2OFxhRhi924KePIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03A86F80714;
	Tue, 23 Jul 2019 13:30:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB305F80507; Tue, 23 Jul 2019 13:29:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB603F804FE
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 13:29:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB603F804FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="jcnu4Quo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=FCGoBKi/PqB3yw4pwzhgLxHQkUSvgCQYXglvLUNxi5c=; b=jcnu4Quojxqv
 lwyq5xSYzW1hNf7jpAjLkulSfRh1nWDqxNTbiRMNSy/lYUbBSIBGXfwD/4p5z+p3LDi0VYeva2ac+
 pVmjVLnodZ+gZEVKotZbEffaeE8tqTeeBz6bP11muG4mke4ImarFb+t5EnP/QINMHOnaN3jvF7A8z
 +j3Qs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpsyq-0003Kv-Ja; Tue, 23 Jul 2019 11:29:16 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 14A762742BAC; Tue, 23 Jul 2019 12:29:16 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20190722135209.30302-1-ckeepax@opensource.cirrus.com>
X-Patchwork-Hint: ignore
Message-Id: <20190723112916.14A762742BAC@ypsilon.sirena.org.uk>
Date: Tue, 23 Jul 2019 12:29:16 +0100 (BST)
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com
Subject: [alsa-devel] Applied "ASoC: madera: Read device tree configuration"
	to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: madera: Read device tree configuration

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 748fd07e2b9ca4132e3d2aae25395aedc4d1aee8 Mon Sep 17 00:00:00 2001
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Mon, 22 Jul 2019 14:52:09 +0100
Subject: [PATCH] ASoC: madera: Read device tree configuration

Read the configuration of the Madera ASoC driver from device tree.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20190722135209.30302-1-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/madera.c | 97 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index 1b1be19a2f99..5f1e32a5a855 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -300,6 +300,100 @@ int madera_free_overheat(struct madera_priv *priv)
 }
 EXPORT_SYMBOL_GPL(madera_free_overheat);
 
+static int madera_get_variable_u32_array(struct device *dev,
+					 const char *propname,
+					 u32 *dest, int n_max,
+					 int multiple)
+{
+	int n, ret;
+
+	n = device_property_count_u32(dev, propname);
+	if (n < 0) {
+		if (n == -EINVAL)
+			return 0;	/* missing, ignore */
+
+		dev_warn(dev, "%s malformed (%d)\n", propname, n);
+
+		return n;
+	} else if ((n % multiple) != 0) {
+		dev_warn(dev, "%s not a multiple of %d entries\n",
+			 propname, multiple);
+
+		return -EINVAL;
+	}
+
+	if (n > n_max)
+		n = n_max;
+
+	ret = device_property_read_u32_array(dev, propname, dest, n);
+	if (ret < 0)
+		return ret;
+
+	return n;
+}
+
+static void madera_prop_get_inmode(struct madera_priv *priv)
+{
+	struct madera *madera = priv->madera;
+	struct madera_codec_pdata *pdata = &madera->pdata.codec;
+	u32 tmp[MADERA_MAX_INPUT * MADERA_MAX_MUXED_CHANNELS];
+	int n, i, in_idx, ch_idx;
+
+	BUILD_BUG_ON(ARRAY_SIZE(pdata->inmode) != MADERA_MAX_INPUT);
+	BUILD_BUG_ON(ARRAY_SIZE(pdata->inmode[0]) != MADERA_MAX_MUXED_CHANNELS);
+
+	n = madera_get_variable_u32_array(madera->dev, "cirrus,inmode",
+					  tmp, ARRAY_SIZE(tmp),
+					  MADERA_MAX_MUXED_CHANNELS);
+	if (n < 0)
+		return;
+
+	in_idx = 0;
+	ch_idx = 0;
+	for (i = 0; i < n; ++i) {
+		pdata->inmode[in_idx][ch_idx] = tmp[i];
+
+		if (++ch_idx == MADERA_MAX_MUXED_CHANNELS) {
+			ch_idx = 0;
+			++in_idx;
+		}
+	}
+}
+
+static void madera_prop_get_pdata(struct madera_priv *priv)
+{
+	struct madera *madera = priv->madera;
+	struct madera_codec_pdata *pdata = &madera->pdata.codec;
+	u32 out_mono[ARRAY_SIZE(pdata->out_mono)];
+	int i, n;
+
+	madera_prop_get_inmode(priv);
+
+	n = madera_get_variable_u32_array(madera->dev, "cirrus,out-mono",
+					  out_mono, ARRAY_SIZE(out_mono), 1);
+	if (n > 0)
+		for (i = 0; i < n; ++i)
+			pdata->out_mono[i] = !!out_mono[i];
+
+	madera_get_variable_u32_array(madera->dev,
+				      "cirrus,max-channels-clocked",
+				      pdata->max_channels_clocked,
+				      ARRAY_SIZE(pdata->max_channels_clocked),
+				      1);
+
+	madera_get_variable_u32_array(madera->dev, "cirrus,pdm-fmt",
+				      pdata->pdm_fmt,
+				      ARRAY_SIZE(pdata->pdm_fmt), 1);
+
+	madera_get_variable_u32_array(madera->dev, "cirrus,pdm-mute",
+				      pdata->pdm_mute,
+				      ARRAY_SIZE(pdata->pdm_mute), 1);
+
+	madera_get_variable_u32_array(madera->dev, "cirrus,dmic-ref",
+				      pdata->dmic_ref,
+				      ARRAY_SIZE(pdata->dmic_ref), 1);
+}
+
 int madera_core_init(struct madera_priv *priv)
 {
 	int i;
@@ -308,6 +402,9 @@ int madera_core_init(struct madera_priv *priv)
 	BUILD_BUG_ON(!madera_mixer_texts[MADERA_NUM_MIXER_INPUTS - 1]);
 	BUILD_BUG_ON(!madera_mixer_values[MADERA_NUM_MIXER_INPUTS - 1]);
 
+	if (!dev_get_platdata(priv->madera->dev))
+		madera_prop_get_pdata(priv);
+
 	mutex_init(&priv->rate_lock);
 
 	for (i = 0; i < MADERA_MAX_HP_OUTPUT; i++)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
