Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 045CB57E0BA
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jul 2022 13:20:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53DAC18A7;
	Fri, 22 Jul 2022 13:20:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53DAC18A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658488850;
	bh=tT9ALYJSV5LaLx0ox9r9S2itnE9o1KOtWzOII8e5iPk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K1bumdib3ZAuYMo+lkWTPbBO9ponCFVziyE8w0PlSQdfx1jTXwHZ16cTR9nr/xb+5
	 3dUzLnvrF2Az2fZOg2hCFsaLw2cdLYBGAwWm8C73ltheUlaBNghJE7Mptii5yDFBvi
	 8RPdtB1+xSAYc+2YY+tutNwBKtHww7eTkFN//z3Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82222F802DB;
	Fri, 22 Jul 2022 13:19:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F6B9F8023B; Fri, 22 Jul 2022 13:19:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2844F8023B
 for <alsa-devel@alsa-project.org>; Fri, 22 Jul 2022 13:19:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2844F8023B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CHWg67CB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658488781; x=1690024781;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tT9ALYJSV5LaLx0ox9r9S2itnE9o1KOtWzOII8e5iPk=;
 b=CHWg67CB4lg8EEByT5De05vkqRaqLbCWeg401wC4MCvwHIVAoqWN4mrO
 C/UT5o9pZNLaXCXeneWBA9ndckdthgJpx/hxtJmh9kg1rpZGMBrXH08Dy
 7d7ZtFGyhQY3vCs2ddFIxFc/wdfgWBjlBXNskdDAoMVmCk3zgPbkPcNRC
 v0oYzUKkdHctqsyw+CNsp7xcE122DAujzgt3vDnwDhiMtyeUeyEU/4gaV
 c1rudo75TfMLq6WVrvEMrATGdIZdGfUfZ8wFUZByjelUlljLFRWFMI9Uu
 i9LwMfRqzj9WIS/HXHIUdC9MWcsIM6STtJhgfGb2j6y1U7GS45d6cc0UC g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10415"; a="270327068"
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; d="scan'208";a="270327068"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 04:19:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; d="scan'208";a="657179045"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga008.fm.intel.com with ESMTP; 22 Jul 2022 04:19:30 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: Intel: avs: Use lookup table to create modules
Date: Fri, 22 Jul 2022 13:19:59 +0200
Message-Id: <20220722111959.2588597-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Nathan Chancellor <nathan@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, Tom Rix <trix@redhat.com>,
 patches@lists.linux.dev, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

As reported by Nathan, when building avs driver using clang with:
  CONFIG_COMPILE_TEST=y
  CONFIG_FORTIFY_SOURCE=y
  CONFIG_KASAN=y
  CONFIG_PCI=y
  CONFIG_SOUND=y
  CONFIG_SND=y
  CONFIG_SND_SOC=y
  CONFIG_SND_SOC_INTEL_AVS=y

there are reports of too big stack use, like:
  sound/soc/intel/avs/path.c:815:18: error: stack frame size (2176) exceeds limit (2048) in 'avs_path_create' [-Werror,-Wframe-larger-than]
  struct avs_path *avs_path_create(struct avs_dev *adev, u32 dma_id,
                   ^
  1 error generated.

This is apparently caused by inlining many calls to guid_equal which
inlines fortified memcpy, using 2 size_t variables.

Instead of hardcoding many calls to guid_equal, use lookup table with
one call, this improves stack usage.

Link: https://lore.kernel.org/alsa-devel/YtlzY9aYdbS4Y3+l@dev-arch.thelio-3990X/T/
Link: https://github.com/ClangBuiltLinux/linux/issues/1642
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reported-by: Nathan Chancellor <nathan@kernel.org>
Build-tested-by: Nathan Chancellor <nathan@kernel.org>
---
 sound/soc/intel/avs/path.c | 54 ++++++++++++++++++++------------------
 1 file changed, 29 insertions(+), 25 deletions(-)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 3d46dd5e5bc4..ce157a8d6552 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -449,35 +449,39 @@ static int avs_modext_create(struct avs_dev *adev, struct avs_path_module *mod)
 	return ret;
 }
 
+static int avs_probe_create(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	dev_err(adev->dev, "Probe module can't be instantiated by topology");
+	return -EINVAL;
+}
+
+struct avs_module_create {
+	guid_t *guid;
+	int (*create)(struct avs_dev *adev, struct avs_path_module *mod);
+};
+
+static struct avs_module_create avs_module_create[] = {
+	{ &AVS_MIXIN_MOD_UUID, avs_modbase_create },
+	{ &AVS_MIXOUT_MOD_UUID, avs_modbase_create },
+	{ &AVS_KPBUFF_MOD_UUID, avs_modbase_create },
+	{ &AVS_COPIER_MOD_UUID, avs_copier_create },
+	{ &AVS_MICSEL_MOD_UUID, avs_micsel_create },
+	{ &AVS_MUX_MOD_UUID, avs_mux_create },
+	{ &AVS_UPDWMIX_MOD_UUID, avs_updown_mix_create },
+	{ &AVS_SRCINTC_MOD_UUID, avs_src_create },
+	{ &AVS_AEC_MOD_UUID, avs_aec_create },
+	{ &AVS_ASRC_MOD_UUID, avs_asrc_create },
+	{ &AVS_INTELWOV_MOD_UUID, avs_wov_create },
+	{ &AVS_PROBE_MOD_UUID, avs_probe_create },
+};
+
 static int avs_path_module_type_create(struct avs_dev *adev, struct avs_path_module *mod)
 {
 	const guid_t *type = &mod->template->cfg_ext->type;
 
-	if (guid_equal(type, &AVS_MIXIN_MOD_UUID) ||
-	    guid_equal(type, &AVS_MIXOUT_MOD_UUID) ||
-	    guid_equal(type, &AVS_KPBUFF_MOD_UUID))
-		return avs_modbase_create(adev, mod);
-	if (guid_equal(type, &AVS_COPIER_MOD_UUID))
-		return avs_copier_create(adev, mod);
-	if (guid_equal(type, &AVS_MICSEL_MOD_UUID))
-		return avs_micsel_create(adev, mod);
-	if (guid_equal(type, &AVS_MUX_MOD_UUID))
-		return avs_mux_create(adev, mod);
-	if (guid_equal(type, &AVS_UPDWMIX_MOD_UUID))
-		return avs_updown_mix_create(adev, mod);
-	if (guid_equal(type, &AVS_SRCINTC_MOD_UUID))
-		return avs_src_create(adev, mod);
-	if (guid_equal(type, &AVS_AEC_MOD_UUID))
-		return avs_aec_create(adev, mod);
-	if (guid_equal(type, &AVS_ASRC_MOD_UUID))
-		return avs_asrc_create(adev, mod);
-	if (guid_equal(type, &AVS_INTELWOV_MOD_UUID))
-		return avs_wov_create(adev, mod);
-
-	if (guid_equal(type, &AVS_PROBE_MOD_UUID)) {
-		dev_err(adev->dev, "Probe module can't be instantiated by topology");
-		return -EINVAL;
-	}
+	for (int i = 0; i < ARRAY_SIZE(avs_module_create); i++)
+		if (guid_equal(type, avs_module_create[i].guid))
+			return avs_module_create[i].create(adev, mod);
 
 	return avs_modext_create(adev, mod);
 }
-- 
2.25.1

