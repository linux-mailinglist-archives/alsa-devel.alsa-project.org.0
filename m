Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD9646A9D3
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 22:17:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50C40232E;
	Mon,  6 Dec 2021 22:16:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50C40232E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638825461;
	bh=0gv2sLSslX98X/4SZB+5tTFVgXgHd1/5d63Lh6cc4FE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P3EY/0OZ83ly/kVFBmLDenUe4WBO2AEekulJyeO4lALXkvaT/c4BSJPYuHL0OTr/X
	 +2F22+U1kO/x9yQoUVlSmJEN9KgD75NK9egJtmjy/I8TdqicJNssRpZ6K9OVF2zjJx
	 ngsumvUt6UX5dgKRgfqgt7ikL+35IJjBQX65xFQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC615F804F1;
	Mon,  6 Dec 2021 22:16:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94F21F804ED; Mon,  6 Dec 2021 22:16:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78AEFF804AE
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 22:16:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78AEFF804AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="X6eaRhx6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id BE9D0CE17E3;
 Mon,  6 Dec 2021 21:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48501C341C1;
 Mon,  6 Dec 2021 21:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638825370;
 bh=0gv2sLSslX98X/4SZB+5tTFVgXgHd1/5d63Lh6cc4FE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X6eaRhx6nP58nd0WdKQvxTPr0ajAA8S0xRt1lDkpvkAwDsSoANxnABOehMDi54REE
 dcQWw2rH7nm4fTA5vtfXMwcvZWowiPDJBTzx/ZVnJ8EPh7JTvMIrTSwqHK50x5IeXa
 NXIIdPbwBBUf7ZFEMwhE102Jqhy6Sj2CygNAv1OMgcbpYBoDT6Ghc2AIDmZritsego
 364NZjCXYgS+emKtBcL19rS7KQyHj4NrGo1yFZ5Aev1WN5zdhljjzfUCG+qsFuDY5m
 NT/8l5Ym05uNpRtjiUyq5eGwz4MdANaEGf07ePIrPOISoFnNb/5lvjy+m2IdluEgS6
 uv+rg06DBsZpg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 07/15] ALSA: hda: Add Intel DG2 PCI ID and HDMI
 codec vid
Date: Mon,  6 Dec 2021 16:15:07 -0500
Message-Id: <20211206211520.1660478-7-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211206211520.1660478-1-sashal@kernel.org>
References: <20211206211520.1660478-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, leon@kernel.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 guennadi.liakhovetski@linux.intel.com, Takashi Iwai <tiwai@suse.de>,
 broonie@kernel.org, tiwai@suse.com, hui.wang@canonical.com,
 Uma Shankar <uma.shankar@intel.com>, ranjani.sridharan@linux.intel.com,
 imre.deak@intel.com
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

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

[ Upstream commit d85ffff5302b1509efc482e8877c253b0a668b33 ]

Add HD Audio PCI ID and HDMI codec vendor ID for Intel DG2.

Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://lore.kernel.org/r/20211130124732.696896-1-kai.vehmanen@linux.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/hda_intel.c  | 12 +++++++++++-
 sound/pci/hda/patch_hdmi.c |  1 +
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 64115a796af06..3cc936f2cbf8d 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -369,7 +369,10 @@ enum {
 					((pci)->device == 0x0c0c) || \
 					((pci)->device == 0x0d0c) || \
 					((pci)->device == 0x160c) || \
-					((pci)->device == 0x490d))
+					((pci)->device == 0x490d) || \
+					((pci)->device == 0x4f90) || \
+					((pci)->device == 0x4f91) || \
+					((pci)->device == 0x4f92))
 
 #define IS_BXT(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0x5a98)
 
@@ -2540,6 +2543,13 @@ static const struct pci_device_id azx_ids[] = {
 	/* DG1 */
 	{ PCI_DEVICE(0x8086, 0x490d),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
+	/* DG2 */
+	{ PCI_DEVICE(0x8086, 0x4f90),
+	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
+	{ PCI_DEVICE(0x8086, 0x4f91),
+	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
+	{ PCI_DEVICE(0x8086, 0x4f92),
+	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* Alderlake-S */
 	{ PCI_DEVICE(0x8086, 0x7ad0),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index c65144715af78..7b91615bcac32 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -4364,6 +4364,7 @@ HDA_CODEC_ENTRY(0x80862814, "DG1 HDMI",	patch_i915_tgl_hdmi),
 HDA_CODEC_ENTRY(0x80862815, "Alderlake HDMI",	patch_i915_tgl_hdmi),
 HDA_CODEC_ENTRY(0x8086281c, "Alderlake-P HDMI", patch_i915_tgl_hdmi),
 HDA_CODEC_ENTRY(0x80862816, "Rocketlake HDMI",	patch_i915_tgl_hdmi),
+HDA_CODEC_ENTRY(0x80862819, "DG2 HDMI",	patch_i915_tgl_hdmi),
 HDA_CODEC_ENTRY(0x8086281a, "Jasperlake HDMI",	patch_i915_icl_hdmi),
 HDA_CODEC_ENTRY(0x8086281b, "Elkhartlake HDMI",	patch_i915_icl_hdmi),
 HDA_CODEC_ENTRY(0x80862880, "CedarTrail HDMI",	patch_generic_hdmi),
-- 
2.33.0

