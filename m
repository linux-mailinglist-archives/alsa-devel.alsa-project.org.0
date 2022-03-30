Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC684EC108
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 13:56:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E13918D8;
	Wed, 30 Mar 2022 13:55:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E13918D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648641364;
	bh=hM7XmzpCz1LY2zUE0Z1Ob1vRypXKE20pNn9jFFw1gE0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TS0wtua0G9RGfPuw3j5Znc+uvkX5AERIbqenUCfci5BwiuLc01UWSACyLJ8IaVXLs
	 9EWBD2TzW1oGuRxBU6gAunwt1kIS3/D3OVnYou0sJ/Gb37eamyXGWI/8H4J0ZpSfbe
	 aclGa5kWNDXF1UjWd70fnf7QiDxqgCXwqtPIbMxo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E7E4F80526;
	Wed, 30 Mar 2022 13:48:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53124F805D9; Wed, 30 Mar 2022 13:48:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7D84F805D8
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:48:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7D84F805D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="C4Pfoj3r"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 913A161602;
 Wed, 30 Mar 2022 11:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1416EC36AF8;
 Wed, 30 Mar 2022 11:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640928;
 bh=hM7XmzpCz1LY2zUE0Z1Ob1vRypXKE20pNn9jFFw1gE0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C4Pfoj3r5zBHz7SEfLir8om9RKYAAK0JkR2/bz8Y/27ye7KGESqq4UsahJkhWdGYh
 mLGDoEoaCfds7CudHszwmhpI0sDqMEq146Pi1g79LTRrxRBM2BG9YgkdcMMkx9iU30
 qRWfPjn+IfGN0D8bUc8gmpPBoAuxOzDNW3pDtOYWqmlQqdedGLCgu2LpwU+T+oQpj9
 MN2cS2qP7e8QHTbmrtZXdUXAvyMvU7qlwVP/GnEA6oA+7GlVPrC4U3Z5TekO8Fif9x
 eCJ1hMBs9QrCKfdJr+RN1Qqr5S+XAKtElWjfA66T2SABkzVKxS6Dtj3kAkUN+Pz3d3
 nItJfgYO3ao2g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 10/59] ASoC: SOF: Intel: hda: Remove link
 assignment limitation
Date: Wed, 30 Mar 2022 07:47:42 -0400
Message-Id: <20220330114831.1670235-10-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114831.1670235-1-sashal@kernel.org>
References: <20220330114831.1670235-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 lgirdwood@gmail.com, tiwai@suse.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

[ Upstream commit 2ce0d008dcc59f9c01f43277b9f9743af7b01dad ]

The limitation to assign a link DMA channel for a BE iff the
corresponding host DMA channel is assigned to a connected FE is only
applicable if the PROCEN_FMT_QUIRK is set. So, remove it for platforms
that do not enable the quirk.

Complements: a792bfc1c2bc ("ASoC: SOF: Intel: hda-stream: limit PROCEN workaround")
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Link: https://lore.kernel.org/r/20220128130017.28508-1-peter.ujfalusi@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/intel/hda-dai.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 76579383d290..1b7ba7f3e99b 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -62,6 +62,8 @@ static struct hdac_ext_stream *
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct sof_intel_hda_stream *hda_stream;
+	const struct sof_intel_dsp_desc *chip;
+	struct snd_sof_dev *sdev;
 	struct hdac_ext_stream *res = NULL;
 	struct hdac_stream *stream = NULL;
 
@@ -80,9 +82,20 @@ static struct hdac_ext_stream *
 			continue;
 
 		hda_stream = hstream_to_sof_hda_stream(hstream);
+		sdev = hda_stream->sdev;
+		chip = get_chip_info(sdev->pdata);
 
 		/* check if link is available */
 		if (!hstream->link_locked) {
+			/*
+			 * choose the first available link for platforms that do not have the
+			 * PROCEN_FMT_QUIRK set.
+			 */
+			if (!(chip->quirks & SOF_INTEL_PROCEN_FMT_QUIRK)) {
+				res = hstream;
+				break;
+			}
+
 			if (stream->opened) {
 				/*
 				 * check if the stream tag matches the stream
-- 
2.34.1

