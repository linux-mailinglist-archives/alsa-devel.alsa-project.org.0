Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C624EC056
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 13:49:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4A9017B6;
	Wed, 30 Mar 2022 13:48:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4A9017B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648640956;
	bh=yGnjY+lYxJXOnr0rrff8LCirneIsgVl27V7mWnMwbyg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Il9SwS6HwfETMolWtnXQZkhSW/HvgQbt8/rKg13149Mja+vWDAPsZP8t6bjCN5MZN
	 BnNLQaB0r3bSnT0etWLtkGT8piqqKR3S4Us95TvE33JBtFnPlryIpgwSnm8a5R2Kur
	 Fdp2kNXXPRQxuBnGhzYOnhl2JyiaThdUXEZVgWfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E76CAF8051B;
	Wed, 30 Mar 2022 13:47:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9F83F8051A; Wed, 30 Mar 2022 13:47:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E7ACF804B4
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:47:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E7ACF804B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WYzWCO/W"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E3AFECE1C71;
 Wed, 30 Mar 2022 11:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01029C340F2;
 Wed, 30 Mar 2022 11:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640823;
 bh=yGnjY+lYxJXOnr0rrff8LCirneIsgVl27V7mWnMwbyg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WYzWCO/WG1VOPjlqOGm5yKm4odeq9kpmw5ThZEHbiSEq+qQANSk2r6kwGo7vmCJoN
 abeSWFphnQ552YGFmgLqJ45fGOHMAj8/dgwLSrSe7g2m3RtPlfMXzTzOm4AnLElG/D
 cY+r3UqVGsv4KUOztsSHNs2NlzDHIi/WQpyqodg1vaFuEnKvd3JDIbg3PYI8Ab7aNo
 rtd37bJmzuPHvn37nHRJv5ufQ3IrdSM1CpcEq9yJO2lsxerq+z2YC27d8IHhw4A1+u
 2eySsFpXHwQgNlOMResR8pdPsn2U8YpdaLhA+oFM/QyZ7XSMxRGipAwAUegPCpMf4o
 MvKB0TcB/e/Rg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 10/66] ASoC: SOF: Intel: hda: Remove link
 assignment limitation
Date: Wed, 30 Mar 2022 07:45:49 -0400
Message-Id: <20220330114646.1669334-10-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114646.1669334-1-sashal@kernel.org>
References: <20220330114646.1669334-1-sashal@kernel.org>
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
index cd12589355ef..28a54145c150 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -59,6 +59,8 @@ static struct hdac_ext_stream *
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct sof_intel_hda_stream *hda_stream;
+	const struct sof_intel_dsp_desc *chip;
+	struct snd_sof_dev *sdev;
 	struct hdac_ext_stream *res = NULL;
 	struct hdac_stream *stream = NULL;
 
@@ -77,9 +79,20 @@ static struct hdac_ext_stream *
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

