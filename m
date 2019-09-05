Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 959A9AAA48
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2019 19:44:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C6A0167A;
	Thu,  5 Sep 2019 19:43:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C6A0167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567705453;
	bh=ztBYjDPlfHmo6BMDCJyX+O2UmOgIn1afGRp9wwm6ddQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=JNokHVdZWXHMcIbYWDRgJv2udWegha6g7MGFtarrKUOESC2L2s4Q7eL/umtfI/1/v
	 VFSXmwW+UwkbzMYr7rp0yEjlsmmCs3CHBKloL3LGCsFneCaY+ZfkGGvhQ8tF79pwTn
	 3nEyqHTTmOfEm93/0COiSR+MeiL4tTqfzs3o/Xw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE9E2F80637;
	Thu,  5 Sep 2019 19:39:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18BE8F8049B; Thu,  5 Sep 2019 19:39:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78B9BF804AA
 for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2019 19:38:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78B9BF804AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="bLL1SkEV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Xmc+MPzaRfPd7zHJuBoHtw7lAqQfS4jtIcu8iITVun4=; b=bLL1SkEVYkNf
 g9IIsJsaS/W2ZPo4PBPCIkvXyHsr39lh0mX9Pbh2cp9eC8wJOyQLh/I/vqackZC47EgsWMAmuM3C2
 K6VnICzJxIcr2xwrTJzgH/DfSgx8vJ4zHs+lrHvdXsdFy5XLMsxelmde4trw3yNvt6hjKSLhUjR69
 NDWgs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i5vig-0005HJ-TK; Thu, 05 Sep 2019 17:38:54 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 66E1C2742D07; Thu,  5 Sep 2019 18:38:54 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20190905120120.31752-4-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Message-Id: <20190905173854.66E1C2742D07@ypsilon.sirena.org.uk>
Date: Thu,  5 Sep 2019 18:38:54 +0100 (BST)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: meson: axg-frddr: expose all 8 outputs"
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

   ASoC: meson: axg-frddr: expose all 8 outputs

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 8fcd2d914e786033e589b4eb8cb62d37d0fa9701 Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 5 Sep 2019 14:01:15 +0200
Subject: [PATCH] ASoC: meson: axg-frddr: expose all 8 outputs

The FRDDR component, as it, has a maximum of 8 outputs. Depending on
the SoC, these may not all be connected.

Instead of decribing only the connected outputs of each SoC, describe
them all and let ASoC routing do the rest.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20190905120120.31752-4-jbrunet@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/axg-frddr.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/sound/soc/meson/axg-frddr.c b/sound/soc/meson/axg-frddr.c
index 2b8807737b2b..0968e8375000 100644
--- a/sound/soc/meson/axg-frddr.c
+++ b/sound/soc/meson/axg-frddr.c
@@ -104,7 +104,7 @@ static struct snd_soc_dai_driver axg_frddr_dai_drv = {
 };
 
 static const char * const axg_frddr_sel_texts[] = {
-	"OUT 0", "OUT 1", "OUT 2", "OUT 3"
+	"OUT 0", "OUT 1", "OUT 2", "OUT 3", "OUT 4", "OUT 5", "OUT 6", "OUT 7",
 };
 
 static SOC_ENUM_SINGLE_DECL(axg_frddr_sel_enum, FIFO_CTRL0, CTRL0_SEL_SHIFT,
@@ -120,6 +120,10 @@ static const struct snd_soc_dapm_widget axg_frddr_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_OUT("OUT 1", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("OUT 2", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("OUT 3", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 4", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 5", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 6", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 7", NULL, 0, SND_SOC_NOPM, 0, 0),
 };
 
 static const struct snd_soc_dapm_route axg_frddr_dapm_routes[] = {
@@ -128,6 +132,10 @@ static const struct snd_soc_dapm_route axg_frddr_dapm_routes[] = {
 	{ "OUT 1", "OUT 1",  "SINK SEL" },
 	{ "OUT 2", "OUT 2",  "SINK SEL" },
 	{ "OUT 3", "OUT 3",  "SINK SEL" },
+	{ "OUT 4", "OUT 4",  "SINK SEL" },
+	{ "OUT 5", "OUT 5",  "SINK SEL" },
+	{ "OUT 6", "OUT 6",  "SINK SEL" },
+	{ "OUT 7", "OUT 7",  "SINK SEL" },
 };
 
 static const struct snd_soc_component_driver axg_frddr_component_drv = {
@@ -162,16 +170,12 @@ static struct snd_soc_dai_driver g12a_frddr_dai_drv = {
 	.pcm_new	= axg_frddr_pcm_new,
 };
 
-static const char * const g12a_frddr_sel_texts[] = {
-	"OUT 0", "OUT 1", "OUT 2", "OUT 3", "OUT 4",
-};
-
 static SOC_ENUM_SINGLE_DECL(g12a_frddr_sel1_enum, FIFO_CTRL0, CTRL0_SEL_SHIFT,
-			    g12a_frddr_sel_texts);
+			    axg_frddr_sel_texts);
 static SOC_ENUM_SINGLE_DECL(g12a_frddr_sel2_enum, FIFO_CTRL0, CTRL0_SEL2_SHIFT,
-			    g12a_frddr_sel_texts);
+			    axg_frddr_sel_texts);
 static SOC_ENUM_SINGLE_DECL(g12a_frddr_sel3_enum, FIFO_CTRL0, CTRL0_SEL3_SHIFT,
-			    g12a_frddr_sel_texts);
+			    axg_frddr_sel_texts);
 
 static const struct snd_kcontrol_new g12a_frddr_out1_demux =
 	SOC_DAPM_ENUM("Output Src 1", g12a_frddr_sel1_enum);
@@ -211,6 +215,9 @@ static const struct snd_soc_dapm_widget g12a_frddr_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_OUT("OUT 2", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("OUT 3", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("OUT 4", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 5", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 6", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 7", NULL, 0, SND_SOC_NOPM, 0, 0),
 };
 
 static const struct snd_soc_dapm_route g12a_frddr_dapm_routes[] = {
@@ -228,16 +235,25 @@ static const struct snd_soc_dapm_route g12a_frddr_dapm_routes[] = {
 	{ "OUT 2", "OUT 2", "SINK 1 SEL" },
 	{ "OUT 3", "OUT 3", "SINK 1 SEL" },
 	{ "OUT 4", "OUT 4", "SINK 1 SEL" },
+	{ "OUT 5", "OUT 5", "SINK 1 SEL" },
+	{ "OUT 6", "OUT 6", "SINK 1 SEL" },
+	{ "OUT 7", "OUT 7", "SINK 1 SEL" },
 	{ "OUT 0", "OUT 0", "SINK 2 SEL" },
 	{ "OUT 1", "OUT 1", "SINK 2 SEL" },
 	{ "OUT 2", "OUT 2", "SINK 2 SEL" },
 	{ "OUT 3", "OUT 3", "SINK 2 SEL" },
 	{ "OUT 4", "OUT 4", "SINK 2 SEL" },
+	{ "OUT 5", "OUT 5", "SINK 2 SEL" },
+	{ "OUT 6", "OUT 6", "SINK 2 SEL" },
+	{ "OUT 7", "OUT 7", "SINK 2 SEL" },
 	{ "OUT 0", "OUT 0", "SINK 3 SEL" },
 	{ "OUT 1", "OUT 1", "SINK 3 SEL" },
 	{ "OUT 2", "OUT 2", "SINK 3 SEL" },
 	{ "OUT 3", "OUT 3", "SINK 3 SEL" },
 	{ "OUT 4", "OUT 4", "SINK 3 SEL" },
+	{ "OUT 5", "OUT 5", "SINK 3 SEL" },
+	{ "OUT 6", "OUT 6", "SINK 3 SEL" },
+	{ "OUT 7", "OUT 7", "SINK 3 SEL" },
 };
 
 static const struct snd_soc_component_driver g12a_frddr_component_drv = {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
