Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFFF69066C
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 12:17:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3E43A4F;
	Thu,  9 Feb 2023 12:16:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3E43A4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675941428;
	bh=hdPfRMb20l+xwrfZASQljOQ8K9xia2XjTXdmlaqGXKY=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qd8Aa5yeLghoz4SVIfFysO3FTP0o9cgEXeRXAg4cOPILHc9ISUCxMvuCRTNd6c6pe
	 +uPrxgvbHtj7f9GTJDHy2+rHduIRUya+v6cneDj/QI4vRTThymrhiL29XHiHGU27Hp
	 VveyycVG9Yhsvbngd3TzchOQkSGuiZA6p2eUANkA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86923F80525;
	Thu,  9 Feb 2023 12:15:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1C86F80269; Thu,  9 Feb 2023 12:15:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3506CF80094;
	Thu,  9 Feb 2023 12:15:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3506CF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AXFgF7ta
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 99427B820FC;
	Thu,  9 Feb 2023 11:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB667C433EF;
	Thu,  9 Feb 2023 11:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675941305;
	bh=hdPfRMb20l+xwrfZASQljOQ8K9xia2XjTXdmlaqGXKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AXFgF7taFILymsaOPA1b0K/ezDdfPtjCm3+DOmeJHllC6FWqY5714Api6taT+SbQY
	 NA1W41fmX4vlAR/QqIEei0A8oqH/dsBHmhcGB/ldr8sokVbxuhVUyllJ/i1FUU1C2c
	 jkCtpuBAFkM6nJWMn+V8ulxSKirBOYX6QInqdyrJAyKBXr39AFMOgHFChvcfi46lX8
	 eCpqwyD7MnyMbeqtg5VxwWyOkgjFdInwjhgDgF2i0i/Rm6F4/LlNuL89iWnN+tGk5n
	 d/3/GR/unKfyoAYJw6Vt1k5TuByDnNAYEqVzJz552P5qANkBjnKzzE9T3TVS40FdJo
	 Ff5enGcwp/z9g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 02/38] ASoC: SOF: sof-audio: start with the right
 widget type
Date: Thu,  9 Feb 2023 06:14:21 -0500
Message-Id: <20230209111459.1891941-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230209111459.1891941-1-sashal@kernel.org>
References: <20230209111459.1891941-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NIIZI7VKC3RXZ5A2GPHQN6S7SNSJNG7V
X-Message-ID-Hash: NIIZI7VKC3RXZ5A2GPHQN6S7SNSJNG7V
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Sasha Levin <sashal@kernel.org>,
 lgirdwood@gmail.com, daniel.baluta@nxp.com, tiwai@suse.com,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NIIZI7VKC3RXZ5A2GPHQN6S7SNSJNG7V/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

[ Upstream commit fcc4348adafe53928fda46d104c1798e5a4de4ff ]

If there is a connection between a playback stream and a capture stream,
all widgets that are connected to the playback stream and the capture
stream will be in the list.
So, we have to start with the exactly right widget type.
snd_soc_dapm_aif_out is for capture stream and a playback stream should
start with a snd_soc_dapm_aif_in widget.
Contrarily, snd_soc_dapm_dai_in is for playback stream, and a capture
stream should start with a snd_soc_dapm_dai_out widget.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Link: https://lore.kernel.org/r/20230117123534.2075-1-peter.ujfalusi@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/sof-audio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 62092e2d609c7..bb92d8c8fbce6 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -429,11 +429,11 @@ sof_walk_widgets_in_order(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget_l
 
 	for_each_dapm_widgets(list, i, widget) {
 		/* starting widget for playback is AIF type */
-		if (dir == SNDRV_PCM_STREAM_PLAYBACK && !WIDGET_IS_AIF(widget->id))
+		if (dir == SNDRV_PCM_STREAM_PLAYBACK && widget->id != snd_soc_dapm_aif_in)
 			continue;
 
 		/* starting widget for capture is DAI type */
-		if (dir == SNDRV_PCM_STREAM_CAPTURE && !WIDGET_IS_DAI(widget->id))
+		if (dir == SNDRV_PCM_STREAM_CAPTURE && widget->id != snd_soc_dapm_dai_out)
 			continue;
 
 		switch (op) {
-- 
2.39.0

