Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A57548B34C8
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 12:01:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A045827;
	Fri, 26 Apr 2024 12:01:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A045827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714125712;
	bh=/OpGaXKLK/xKmfeJNxX3PuUmLBLHR9is3aONCN7HtOU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ux5qdvTZPLcuXXvuxR1F2roXWVpSR62ai8p3KMLN+FiOValCS3cR33ztcgF5greuA
	 0crQbf9/LH1+V2X6b7q2i4pEqJUYLkUO5B02DUACFaAfoOoJ7IqG0Vh6HsVWffXdRN
	 5ZRjvNmpymT3XgGke1ymlm5tVa+AQ53gpSLVdm9M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78BF6F80671; Fri, 26 Apr 2024 11:59:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BEDE9F8067D;
	Fri, 26 Apr 2024 11:59:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3BD9F802E8; Fri, 26 Apr 2024 11:57:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	SPF_PASS,T_SPF_HELO_TEMPERROR,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DDE30F80548
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 11:56:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDE30F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lv4UUZDv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714125421; x=1745661421;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/OpGaXKLK/xKmfeJNxX3PuUmLBLHR9is3aONCN7HtOU=;
  b=lv4UUZDvH82a3DjzI8t+fE6wki6dMc32QiTh7PWw+DZX0pIarnLoB8px
   JIcJmsReWvNMUzJ3lgN+LjKEONsWBnw/EFY72Otdg1AagFypBN+f+gri5
   9xViPxLjnWvghS1a/9RqsU4D2qP/bMKFAEn9DCj1YX37ldiCkPlxroIMU
   RJgP6i7fX9kn6/rZiW0UcQelp3rOXz1DkR9tb37kOns0pzbgS7GvKDkMX
   QLLUNv9O8C6d5h2vZBi3qAsHuxXraTtO1qC2fHzb13lV3tAEAgw+rrjMp
   yUvwVddecVgxEgIQkq5ZvyJ4HkNA3yAH2MwevI6Plam9tCCmDuwcRNcH1
   g==;
X-CSE-ConnectionGUID: RJDWW5KFQmmok7qOyG9TEA==
X-CSE-MsgGUID: iLAmkRHvQzerQqNu7P5iZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20409199"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="20409199"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:56:55 -0700
X-CSE-ConnectionGUID: Ie1GZPzITB+CkM5Yut6EyA==
X-CSE-MsgGUID: l5cldLv6RrCbbDwW43KaZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="25460573"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 26 Apr 2024 02:56:53 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 3/8] ASoC: Intel: avs: Remove redundancy around DAI shutdown
Date: Fri, 26 Apr 2024 11:57:28 +0200
Message-Id: <20240426095733.3946951-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240426095733.3946951-1-cezary.rojewski@intel.com>
References: <20240426095733.3946951-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PZE65RJWILRZ5KC5CON7AV7MOJTL2QOF
X-Message-ID-Hash: PZE65RJWILRZ5KC5CON7AV7MOJTL2QOF
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PZE65RJWILRZ5KC5CON7AV7MOJTL2QOF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move avs_dai_nonhda_be_shutdown() to avs_dai_shutdown() as the function
is common for all transfer types, not just non-HDAudio ones. Use it
to simplify avs_dai_fe_shutdown().

While at it, fix explicit kfree(data) and use the destructor instead.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 44 +++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index f3cd54f355ef..23f7e0fae817 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -85,6 +85,21 @@ static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 	return 0;
 }
 
+static void avs_dai_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct avs_dev *adev = to_avs_dev(dai->dev);
+	struct avs_dma_data *data;
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+
+	if (rtd->dai_link->ignore_suspend)
+		adev->num_lp_paths--;
+
+	snd_soc_dai_set_dma_data(dai, substream, NULL);
+	kfree(data);
+}
+
 static int avs_dai_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *fe_hw_params,
 			     struct snd_pcm_hw_params *be_hw_params, struct snd_soc_dai *dai,
@@ -166,21 +181,6 @@ static int avs_dai_nonhda_be_startup(struct snd_pcm_substream *substream, struct
 	return avs_dai_startup(substream, dai, false, &avs_dai_nonhda_be_ops);
 }
 
-static void avs_dai_nonhda_be_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct avs_dev *adev = to_avs_dev(dai->dev);
-	struct avs_dma_data *data;
-
-	if (rtd->dai_link->ignore_suspend)
-		adev->num_lp_paths--;
-
-	data = snd_soc_dai_get_dma_data(dai, substream);
-
-	snd_soc_dai_set_dma_data(dai, substream, NULL);
-	kfree(data);
-}
-
 static int avs_dai_nonhda_be_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *hw_params, struct snd_soc_dai *dai)
 {
@@ -266,7 +266,7 @@ static int avs_dai_nonhda_be_trigger(struct snd_pcm_substream *substream, int cm
 
 static const struct snd_soc_dai_ops avs_dai_nonhda_be_ops = {
 	.startup = avs_dai_nonhda_be_startup,
-	.shutdown = avs_dai_nonhda_be_shutdown,
+	.shutdown = avs_dai_shutdown,
 	.hw_params = avs_dai_nonhda_be_hw_params,
 	.hw_free = avs_dai_nonhda_be_hw_free,
 	.prepare = avs_dai_nonhda_be_prepare,
@@ -290,7 +290,7 @@ static int avs_dai_hda_be_startup(struct snd_pcm_substream *substream, struct sn
 	link_stream = snd_hdac_ext_stream_assign(&codec->bus->core, substream,
 						 HDAC_EXT_STREAM_TYPE_LINK);
 	if (!link_stream) {
-		avs_dai_nonhda_be_shutdown(substream, dai);
+		avs_dai_shutdown(substream, dai);
 		return -EBUSY;
 	}
 
@@ -306,7 +306,7 @@ static void avs_dai_hda_be_shutdown(struct snd_pcm_substream *substream, struct
 	snd_hdac_ext_stream_release(link_stream, HDAC_EXT_STREAM_TYPE_LINK);
 	substream->runtime->private_data = NULL;
 
-	avs_dai_nonhda_be_shutdown(substream, dai);
+	avs_dai_shutdown(substream, dai);
 }
 
 static int avs_dai_hda_be_hw_params(struct snd_pcm_substream *substream,
@@ -558,18 +558,12 @@ static int avs_dai_fe_startup(struct snd_pcm_substream *substream, struct snd_so
 
 static void avs_dai_fe_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct avs_dev *adev = to_avs_dev(dai->dev);
 	struct avs_dma_data *data;
 
-	if (rtd->dai_link->ignore_suspend)
-		adev->num_lp_paths--;
-
 	data = snd_soc_dai_get_dma_data(dai, substream);
 
-	snd_soc_dai_set_dma_data(dai, substream, NULL);
 	snd_hdac_ext_stream_release(data->host_stream, HDAC_EXT_STREAM_TYPE_HOST);
-	kfree(data);
+	avs_dai_shutdown(substream, dai);
 }
 
 static int avs_dai_fe_hw_params(struct snd_pcm_substream *substream,
-- 
2.25.1

