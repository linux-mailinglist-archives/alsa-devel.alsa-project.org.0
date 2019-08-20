Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A45F29680E
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 19:53:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CC401668;
	Tue, 20 Aug 2019 19:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CC401668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566323582;
	bh=Wn73FCXvNgtXt9cnugognUVsYJ5l+dn27jhzyNPpi88=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Fmz2MIcoHdzZZnyLefE/I5WMuFS4VxxTx1wqgk6uRCicOqJpKxMYtAIvpqAjKpLsq
	 NfGNQCCKtlZVLexMLFBiSGc2jH23gVWZQaixCBwYfhqzpBPAQ4H4pjDKZQ0uMb/yQ9
	 lto7AjX0cXEudcmc97kspREKjHRp3kqTpjLOuPPw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6EF6F80735;
	Tue, 20 Aug 2019 19:41:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF54FF8063C; Tue, 20 Aug 2019 19:41:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-f99.google.com (mail-wm1-f99.google.com
 [209.85.128.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2318AF802E0
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 19:41:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2318AF802E0
Received: by mail-wm1-f99.google.com with SMTP id p74so3351482wme.4
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 10:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=0q9woCZX0qm6N50DaIA6FNjfD3FFPCgnyT4lcLDQcyk=;
 b=axjPnREMDIFbhXK61cI3VuJl2acrFY4lBSYXevuh9G2Vips47rX5q3bq8XA73Q5X+y
 j3jeFEt3rG4LUWEINsrv4Lyz+rywsDf6lzfa8AR29iqXz8B1oyi8QG6e9UEfkgaz8i8O
 LyWtuZpKOMi7SoqAR/5wSMRgv1uOr1QNCYB8CtGv74H+MB9LbnuaOz4TkN6L81lgkDtf
 MF2Cu70qxSsSSnhX6QFGqU/XPafH9TO4K3hZlKvIKqTJmciIYV5aW+TliqDNJIKB1ZXY
 7uuxSxIq0Bb+rUcGdbFN/QfqEGc08Z+LuUaWlWMsElD2LMvSDvDph9OvOoFAvnWW8Urb
 84Nw==
X-Gm-Message-State: APjAAAVDmfdjUOFvN1JaSomnY2ujfyyNJKcx2EZtl/1Pr4c1Qppx9fOH
 EWHbICx2WZyJSBtH4yELg4GT5jorrsK4YKV/t46JX419sxIOlz/Ov3GDQjj5ylNuRg==
X-Google-Smtp-Source: APXvYqw2Pt0zdcbAIggLBL+mSoi9Dm/t2bw7A/B5DHIIiy5JPlqKPp8E+ua/QyMvktd5SB6SB2utwpyTPYM3
X-Received: by 2002:a1c:c018:: with SMTP id q24mr1232027wmf.162.1566322867345; 
 Tue, 20 Aug 2019 10:41:07 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id v14sm2100wmc.18.2019.08.20.10.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 10:41:07 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i0883-000335-25; Tue, 20 Aug 2019 17:41:07 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 6E99D274314F; Tue, 20 Aug 2019 18:41:06 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Daniel Stuart <daniel.stuart14@gmail.com>
In-Reply-To: <20190815171300.30126-1-daniel.stuart14@gmail.com>
X-Patchwork-Hint: ignore
Message-Id: <20190820174106.6E99D274314F@ypsilon.sirena.org.uk>
Date: Tue, 20 Aug 2019 18:41:06 +0100 (BST)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Daniel Stuart <daniel.stuart@pucpr.edu.br>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 cezary.rojewski@intel.com, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, "Cc:"@sirena.co.uk
Subject: [alsa-devel] Applied "ASoC: intel: cht_bsw_max98090_ti: Add all
	Chromebooks that need pmc_plt_clk_0 quirk" to the asoc tree
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

   ASoC: intel: cht_bsw_max98090_ti: Add all Chromebooks that need pmc_plt_clk_0 quirk

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

From d5e120422db8808e1c8b1507900ca393a877c58f Mon Sep 17 00:00:00 2001
From: Daniel Stuart <daniel.stuart14@gmail.com>
Date: Thu, 15 Aug 2019 14:12:55 -0300
Subject: [PATCH] ASoC: intel: cht_bsw_max98090_ti: Add all Chromebooks that
 need pmc_plt_clk_0 quirk

Every single baytrail chromebook sets PMC to 0, as can be seeing
below by searching through coreboot source code:
	$ grep -rl "PMC_PLT_CLK\[0\]" .
	./rambi/variants/glimmer/devicetree.cb
	./rambi/variants/clapper/devicetree.cb
	./rambi/variants/swanky/devicetree.cb
	./rambi/variants/enguarde/devicetree.cb
	./rambi/variants/winky/devicetree.cb
	./rambi/variants/kip/devicetree.cb
	./rambi/variants/squawks/devicetree.cb
	./rambi/variants/orco/devicetree.cb
	./rambi/variants/ninja/devicetree.cb
	./rambi/variants/heli/devicetree.cb
	./rambi/variants/sumo/devicetree.cb
	./rambi/variants/banjo/devicetree.cb
	./rambi/variants/candy/devicetree.cb
	./rambi/variants/gnawty/devicetree.cb
	./rambi/variants/rambi/devicetree.cb
	./rambi/variants/quawks/devicetree.cb

Plus, Cyan (only non-baytrail chromebook with max98090) also needs
this patch for audio to work.

Thus, this commit adds all the missing devices to bsw_max98090 quirk
table, implemented by commit a182ecd3809c ("ASoC: intel:
cht_bsw_max98090_ti: Add quirk for boards using pmc_plt_clk_0").

Signed-off-by: Daniel Stuart <daniel.stuart14@gmail.com>
Link: https://lore.kernel.org/r/20190815171300.30126-1-daniel.stuart14@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/cht_bsw_max98090_ti.c | 98 ++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/sound/soc/intel/boards/cht_bsw_max98090_ti.c b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
index 1db9a95e6a79..eaf3e2208a06 100644
--- a/sound/soc/intel/boards/cht_bsw_max98090_ti.c
+++ b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
@@ -398,6 +398,20 @@ static struct snd_soc_card snd_soc_card_cht = {
 };
 
 static const struct dmi_system_id cht_max98090_quirk_table[] = {
+	{
+		/* Banjo model Chromebook */
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "Banjo"),
+		},
+		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
+	},
+	{
+		/* Candy model Chromebook */
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "Candy"),
+		},
+		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
+	},
 	{
 		/* Clapper model Chromebook */
 		.matches = {
@@ -405,6 +419,27 @@ static const struct dmi_system_id cht_max98090_quirk_table[] = {
 		},
 		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
 	},
+	{
+		/* Cyan model Chromebook */
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "Cyan"),
+		},
+		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
+	},
+	{
+		/* Enguarde model Chromebook */
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "Enguarde"),
+		},
+		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
+	},
+	{
+		/* Glimmer model Chromebook */
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "Glimmer"),
+		},
+		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
+	},
 	{
 		/* Gnawty model Chromebook (Acer Chromebook CB3-111) */
 		.matches = {
@@ -412,6 +447,62 @@ static const struct dmi_system_id cht_max98090_quirk_table[] = {
 		},
 		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
 	},
+	{
+		/* Heli model Chromebook */
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "Heli"),
+		},
+		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
+	},
+	{
+		/* Kip model Chromebook */
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "Kip"),
+		},
+		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
+	},
+	{
+		/* Ninja model Chromebook */
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "Ninja"),
+		},
+		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
+	},
+	{
+		/* Orco model Chromebook */
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "Orco"),
+		},
+		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
+	},
+	{
+		/* Quawks model Chromebook */
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "Quawks"),
+		},
+		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
+	},
+	{
+		/* Rambi model Chromebook */
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "Rambi"),
+		},
+		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
+	},
+	{
+		/* Squawks model Chromebook */
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "Squawks"),
+		},
+		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
+	},
+	{
+		/* Sumo model Chromebook */
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "Sumo"),
+		},
+		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
+	},
 	{
 		/* Swanky model Chromebook (Toshiba Chromebook 2) */
 		.matches = {
@@ -419,6 +510,13 @@ static const struct dmi_system_id cht_max98090_quirk_table[] = {
 		},
 		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
 	},
+	{
+		/* Winky model Chromebook */
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "Winky"),
+		},
+		.driver_data = (void *)QUIRK_PMC_PLT_CLK_0,
+	},
 	{}
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
