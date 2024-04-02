Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8928989581B
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 17:24:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14C672C69;
	Tue,  2 Apr 2024 17:23:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14C672C69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712071443;
	bh=jCzzKujhK1qshxtOjWE+ARr12YlgAXeiXGDWIOps8sY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HslnQg5Rr4wWCAOb4maASU9nZUbdpeAEZ1JdUWUjAMjZoru2A9wwbbfuxlIpeoRDm
	 OamOXUlw8a8NwB7tnIBrwnMFJ4lOPPeT2fRFZS0UDQqaUMw9Kx8OJgBxZhRe222X4v
	 YZpa8BcPYYKS6cL9uzVR3KnzVHFGXAZNu320mrR8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2505DF80C95; Tue,  2 Apr 2024 17:19:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D761F80C87;
	Tue,  2 Apr 2024 17:19:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97825F8068E; Tue,  2 Apr 2024 17:19:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E88D6F805E8
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 17:18:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E88D6F805E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=J37mDZMN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071136; x=1743607136;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jCzzKujhK1qshxtOjWE+ARr12YlgAXeiXGDWIOps8sY=;
  b=J37mDZMN6gG4OmERdeeIxbdS5CcUHIBnj4BlWYwHfYwDBrkfsp81wXKR
   c9VB0fMefeZuw37cPhfz1XIg2ukIUlssNrgEeYunyLTWSoqYFV+VGeG4d
   jEQmC8RooBs5+0ouhh0k6bSc/EfsdX3WlEolJ8Lx29nnvOkEPCDUAnvHh
   3tIawl74kpfNeHDUjJkcfrWaZsYUx+WY/8WwiUnYDuSnfeW0/FqNg/KRt
   dE0xlIqbh2dDipU6zklj29NX0LkvtDRu4ClDoxBPfnKDlKPCSl1/9RXL9
   BVNIacBU0ZuMzVLiUrWxH1fxK5hxowgbeDYiU8Nxo615YJKKs5GhEUlV6
   w==;
X-CSE-ConnectionGUID: E3DY0zTESM2i81vkYYpqZw==
X-CSE-MsgGUID: 4nKbGXMoQkSTgN1yfXdLeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29730218"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="29730218"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:48 -0700
X-CSE-ConnectionGUID: b891x3ceTdW75q+j7m+okQ==
X-CSE-MsgGUID: N6kUwAahT/ujSvFB8Fy4+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="22796549"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com)
 ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:47 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 16/17] ASoC: SOF: pcm: reset all PCM sources in case of xruns
Date: Tue,  2 Apr 2024 10:18:27 -0500
Message-Id: <20240402151828.175002-17-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
References: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7YDWAWSKC5V7UX7W43BTPQOKYXHMIEDR
X-Message-ID-Hash: 7YDWAWSKC5V7UX7W43BTPQOKYXHMIEDR
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7YDWAWSKC5V7UX7W43BTPQOKYXHMIEDR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

With the delayed stops, the xrun handling is problematic: the
applications expects everything to be reset but the firmware and DMA
are still in a PAUSED state.

This patch makes sure the prepare while pending_stop is set is
special-cased.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Co-developed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/pcm.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index fbd7e045bcfb..4e11df6b4823 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -221,6 +221,7 @@ static int sof_pcm_prepare(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_sof_pcm *spcm;
 	int ret;
 
@@ -232,8 +233,18 @@ static int sof_pcm_prepare(struct snd_soc_component *component,
 	if (!spcm)
 		return -EINVAL;
 
-	if (spcm->prepared[substream->stream])
-		return 0;
+	if (spcm->prepared[substream->stream]) {
+		if (!spcm->pending_stop[substream->stream])
+			return 0;
+
+		/*
+		 * this case should be reached in case of xruns where we absolutely
+		 * want to free-up and reset all PCM/DMA resources
+		 */
+		ret = sof_pcm_stream_free(sdev, substream, spcm, substream->stream, true);
+		if (ret < 0)
+			return ret;
+	}
 
 	dev_dbg(component->dev, "pcm: prepare stream %d dir %d\n",
 		spcm->pcm.pcm_id, substream->stream);
-- 
2.40.1

