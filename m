Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C4557BE1D
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 20:53:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D50016A0;
	Wed, 20 Jul 2022 20:52:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D50016A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658343229;
	bh=GCDUfLB7H+z3SYkt1egzk1J5ZvWGPLsC7cxT/eSNkNk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Eb8EBPeNFjol+jBW8NepUWVOB2EkGCwPeEOq/erJPEceOkfb8ln7SEvOdieECM1LF
	 rrN31Ub8m/d3kKx28mExtxa2giSId85EOCmmP5gn2GixC1vxnkx0aX3wyk4w9C7K1q
	 4x8Dk5hWtL1hfsZcM4yBB8IKnNeQoXgqTno+Zquk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDCABF8025D;
	Wed, 20 Jul 2022 20:52:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B44DF80169; Wed, 20 Jul 2022 20:52:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6091F80125
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 20:52:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6091F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fYS0qQr8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 97B41B821C8;
 Wed, 20 Jul 2022 18:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E43C3411E;
 Wed, 20 Jul 2022 18:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658343160;
 bh=GCDUfLB7H+z3SYkt1egzk1J5ZvWGPLsC7cxT/eSNkNk=;
 h=From:To:Cc:Subject:Date:From;
 b=fYS0qQr8pQDEM7YmELk7Pwi49Oc5RmKt/wQVx4ema8Qh4kM19y5SV6b9rLDgTHB7e
 zz4ohCy8OGMDr1Z2PXyjzjXVV6pnggMtEM/D895O6IAqEPYaHFf+/0iMrJ0MkxqobI
 HpvCYb1kqEyce29M+KMk+9ugzfK96CgxTD27j0Nk8OHVJJTjlsKd36HYYl4DvbeG1f
 1sG+qvZsCRCHT8vSs/vsaWdELt0DuLr4SCwQ5Qr3XCCnQxUJ9uMnDRA3gcdQOr2NgX
 jlTqTHyw8BOQqNw84BwG4T5Xx78xKxS8fmkdMKiorZAS72McZeiY945myd/zfuVIGM
 Qg1sEfJGIh6Uw==
From: Nathan Chancellor <nathan@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: Intel: avs: Mark avs_path_module_type_create() as
 noinline
Date: Wed, 20 Jul 2022 11:52:28 -0700
Message-Id: <20220720185228.3182663-1-nathan@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev,
 Nathan Chancellor <nathan@kernel.org>
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

When building ARCH=arm64 allmodconfig with clang, there is a warning
about high stack usage in avs_path_create(), which breaks the build due
to CONFIG_WERROR=y:

  sound/soc/intel/avs/path.c:815:18: error: stack frame size (2176) exceeds limit (2048) in 'avs_path_create' [-Werror,-Wframe-larger-than]
  struct avs_path *avs_path_create(struct avs_dev *adev, u32 dma_id,
                   ^
  1 error generated.

This warning is also visible with allmodconfig on other architectures.
The minimum set of configs that triggers this on top of ARCH=arm64
allnoconfig:

  CONFIG_COMPILE_TEST=y
  CONFIG_FORTIFY_SOURCE=y
  CONFIG_KASAN=y
  CONFIG_PCI=y
  CONFIG_SOUND=y
  CONFIG_SND=y
  CONFIG_SND_SOC=y
  CONFIG_SND_SOC_INTEL_AVS=y

When CONFIG_FORTIFY_SOURCE is enabled, memcmp() (called from
guid_equal()) becomes a wrapper to do compile time checking, which
interacts poorly with inlining plus CONFIG_KASAN=y.

With ARCH=arm64 allmodconfig + CONFIG_KASAN=n + CONFIG_FRAME_WARN=128,
the stack usage is much better:

  sound/soc/intel/avs/path.c:815:18: warning: stack frame size (624) exceeds limit (128) in 'avs_path_create' [-Wframe-larger-than]
  struct avs_path *avs_path_create(struct avs_dev *adev, u32 dma_id,
                   ^
  sound/soc/intel/avs/path.c:873:5: warning: stack frame size (144) exceeds limit (128) in 'avs_path_bind' [-Wframe-larger-than]
  int avs_path_bind(struct avs_path *path)
      ^
  2 warnings generated.

To avoid this warning, mark avs_path_module_type_create() as
noinline_for_stack, which redistributes the stack usage across multiple
functions, regardless of CONFIG_KASAN.

With ARCH=arm64 allmodconfig + CONFIG_FRAME_WARN=128, the warnings show:

  avs_path_create():             192
  avs_path_bind():               272
  avs_path_module_type_create(): 416
  avs_mux_create():              160
  avs_updown_mix_create():       160
  avs_aec_create():              176
  avs_asrc_create():             144

With ARCH=arm64 allmodconfig + CONFIG_FRAME_WARN=128 + CONFIG_KASAN=n,
the warnings show:

  avs_path_create():             192
  avs_path_bind():               144
  avs_path_module_type_create(): 416
  avs_mux_create():              176
  avs_updown_mix_create():       176
  avs_src_create():              144
  avs_aec_create():              192
  avs_asrc_create():             144
  avs_wov_create():              144

Link: https://github.com/ClangBuiltLinux/linux/issues/1642
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 sound/soc/intel/avs/path.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 3d46dd5e5bc4..ec2aa0001f91 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -449,7 +449,8 @@ static int avs_modext_create(struct avs_dev *adev, struct avs_path_module *mod)
 	return ret;
 }
 
-static int avs_path_module_type_create(struct avs_dev *adev, struct avs_path_module *mod)
+static noinline_for_stack int avs_path_module_type_create(struct avs_dev *adev,
+							  struct avs_path_module *mod)
 {
 	const guid_t *type = &mod->template->cfg_ext->type;
 

base-commit: ff6992735ade75aae3e35d16b17da1008d753d28
-- 
2.37.1

