Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BECF65923A5
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Aug 2022 18:23:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CCC415C1;
	Sun, 14 Aug 2022 18:22:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CCC415C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660494221;
	bh=Fat0dS/wzHEZg77Gcl07bd1wi0oqLAV1a1+v81FwFrY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j2/iMm9Q9sGIVajOSnimCmsuREslrTYKDzlHEhHjAVY2B4+S5LByGUYXXilGiPsAs
	 78aStzc17JinlJPKN8BgTEX931CuGPpYF2Jjvl9Xz7TOtW37K86isAYnNSKpb2HLSx
	 30IwmpuV2mi1y30z3OiplKjBrS5tOUwhej68X/uU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EC7CF805A0;
	Sun, 14 Aug 2022 18:21:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14156F8059F; Sun, 14 Aug 2022 18:21:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB7A1F80245
 for <alsa-devel@alsa-project.org>; Sun, 14 Aug 2022 18:21:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB7A1F80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="i5D9TTu7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 76A9F60F6A;
 Sun, 14 Aug 2022 16:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD0D4C433D6;
 Sun, 14 Aug 2022 16:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660494067;
 bh=Fat0dS/wzHEZg77Gcl07bd1wi0oqLAV1a1+v81FwFrY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i5D9TTu7mQ0drn62h/soUca+n27r2asxl/v5UCElte58ri7FmHytQwD6oVhoaJm7s
 LRsOv4Tnk+avyBBmZs1SVfs6Y8FMRoOQ3HbgMzAXYZ7HhpJk1SeEpal+KWi92sfnsQ
 81+rqW/kUx8leXRqFnVRJSmNDX9nBOCiJQjzNsHsaxBHtLV0z86+eq4AdExG+GTTvd
 SCCboFz0hdLCKppV0iOoObeaDZgdbt+olQ/Ig6TmQAZ164dJRiwaxfc16fIsu0N3d0
 JrIVR7WxUUiICvPhS75KrSsGFb3F3FLct2l6VoeDcCcg6l++hw5DMZVMjLMALdq/cl
 2LTTASbyNTL4w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 22/48] ASoC: Intel: avs: Use lookup table to
 create modules
Date: Sun, 14 Aug 2022 12:19:15 -0400
Message-Id: <20220814161943.2394452-22-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814161943.2394452-1-sashal@kernel.org>
References: <20220814161943.2394452-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, liam.r.girdwood@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, llvm@lists.linux.dev,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com, tiwai@suse.com,
 ndesaulniers@google.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, Nathan Chancellor <nathan@kernel.org>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, peter.ujfalusi@linux.intel.com
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

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

[ Upstream commit 1e744351bcb9c4cee81300de5a6097100d835386 ]

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
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Link: https://lore.kernel.org/r/20220722111959.2588597-1-amadeuszx.slawinski@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
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
2.35.1

