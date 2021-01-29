Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CFA3089FB
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 16:39:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E84D169B;
	Fri, 29 Jan 2021 16:38:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E84D169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611934750;
	bh=jACWJz6Nk2u/sLRMTN/5d6vcBj/D6MhMkOCpoCc3DIo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c9ullYb+AiA4Yha0iZHAAO0ykY4Oq/EpZN/klXpqLrKsxD5w7Qb6hS2cbDBXRYp5x
	 PSLhQ7arPS7ukxx9vjVohFNNScNzI+bEDUW0AwoMJifE1Tn0zSNyh0A4xR+OvNeVjX
	 koOZCLJK00AqNd41LWIfUAfKWd0J7QiAY3Al4Fjg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC42FF8025F;
	Fri, 29 Jan 2021 16:37:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2475AF8025F; Fri, 29 Jan 2021 16:37:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1533FF80130
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 16:37:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1533FF80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lzYN/YF8"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55DD764E0F;
 Fri, 29 Jan 2021 15:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611934649;
 bh=jACWJz6Nk2u/sLRMTN/5d6vcBj/D6MhMkOCpoCc3DIo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lzYN/YF8BxVLyfYQbTXEESUbjmzyzbs5sn3ITHSU3NXN/dCP/raW7aoP3zsQK/ZcU
 PIDwDtO9C/qs0lyV5Y8jU7voeUmjWebH8ybjZrU5uwHRm2+9XKgLPmc8X88RNOf27L
 yJNUH3rL32oJJYh5pS+vEg6DafjO/hYDPZ0A+GuogH010isozxMctDTQpOFTqKcdFE
 rtFS6J0zaQgwHOgg+qzt0ntfdDcXP3z+O+cpAuzMy1Db+qsc6PEDXq8e/Fjirhp6zW
 XquGcdO35Z/90NVW33Nv1Zq3vR/3lnpOvLYLWdwY2yo99aMLMSvp9j3GpyGCXQ7LXx
 mWYasBlVZTXvw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 13/41] ALSA: hda: Add AlderLake-P PCI ID and HDMI
 codec vid
Date: Fri, 29 Jan 2021 10:36:44 -0500
Message-Id: <20210129153713.1592185-13-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210129153713.1592185-1-sashal@kernel.org>
References: <20210129153713.1592185-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

[ Upstream commit 5e941fc033e411118fb3a7d9e0b97f8cf702cd39 ]

Add HD Audio PCI ID and HDMI codec vendor ID for Intel AlderLake-P.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Link: https://lore.kernel.org/r/20210113155629.4097057-1-kai.vehmanen@linux.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/hda_intel.c  | 3 +++
 sound/pci/hda/patch_hdmi.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 770ad25f1907c..246d660164691 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2507,6 +2507,9 @@ static const struct pci_device_id azx_ids[] = {
 	/* Alderlake-S */
 	{ PCI_DEVICE(0x8086, 0x7ad0),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
+	/* Alderlake-P */
+	{ PCI_DEVICE(0x8086, 0x51c8),
+	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* Elkhart Lake */
 	{ PCI_DEVICE(0x8086, 0x4b55),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index d12b4799c3cb7..dc1ab4fc93a5b 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -4349,6 +4349,7 @@ HDA_CODEC_ENTRY(0x8086280f, "Icelake HDMI",	patch_i915_icl_hdmi),
 HDA_CODEC_ENTRY(0x80862812, "Tigerlake HDMI",	patch_i915_tgl_hdmi),
 HDA_CODEC_ENTRY(0x80862814, "DG1 HDMI",	patch_i915_tgl_hdmi),
 HDA_CODEC_ENTRY(0x80862815, "Alderlake HDMI",	patch_i915_tgl_hdmi),
+HDA_CODEC_ENTRY(0x8086281c, "Alderlake-P HDMI", patch_i915_tgl_hdmi),
 HDA_CODEC_ENTRY(0x80862816, "Rocketlake HDMI",	patch_i915_tgl_hdmi),
 HDA_CODEC_ENTRY(0x8086281a, "Jasperlake HDMI",	patch_i915_icl_hdmi),
 HDA_CODEC_ENTRY(0x8086281b, "Elkhartlake HDMI",	patch_i915_icl_hdmi),
-- 
2.27.0

