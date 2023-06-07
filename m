Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F520725A71
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 11:31:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D504843;
	Wed,  7 Jun 2023 11:30:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D504843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686130265;
	bh=z/PW6iI35bkUwZGMG713VdVjC7l3+b1oX4KvQE0fKQM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DT9nzKRiDngk2wR1lFI4JJ9Wymv/Ig/PkP5UzyoUF3BY7FksfrgQthrLuX6C4mvPP
	 SFi4zwEVYp/Jn5Qn8rjoUHp01/atg30E3pxQ1jjkVfdLX7FIxecA1MqsN0Fd/vuYFR
	 Hasigoi2I7roaa+ZNSoxS7YHLygoa/k167Iu1/DQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6228F8016C; Wed,  7 Jun 2023 11:30:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48056F8016C;
	Wed,  7 Jun 2023 11:30:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFDC6F80199; Wed,  7 Jun 2023 11:30:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34122F800C8
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 11:29:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34122F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=bMfpFHxu
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3578pNf9001679;
	Wed, 7 Jun 2023 04:29:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=2FilRRws/rkRv7oinc5Lp1HLSfjSLS5jFCtY3ZdCaao=;
 b=bMfpFHxuNYBiLDtGjB2uM02FibVHYo55+DJq0BhOT14DPmb7SQGeQRuQsLPiEE5f38zc
 shbe2COhEZdrVK2ayxl+gWodoF/D47ojTV3ObJGnX02QQKzbXquNr0qrbeenM4akcqj+
 eQmC8pKPsE193emZrboaryj+i150Owey6Sm808qnRnM5CpSh1Zo6ha4Hoqq/qxPNWK0Q
 +lOIZE4CxgXutZD/pjzFSdK/LwPWlOoScPEL9WiUX64eCbrgjx/jdvwR2Y7uABAY6GcV
 WVjrAe9XjHwBgNjxrLiHe+b9I065TBWTY/6mnIXYJvhCGE5HLK5KjgckN9/wauukmRQG 2w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3r2a7agntt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jun 2023 04:29:51 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Wed, 7 Jun
 2023 10:29:50 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 7 Jun 2023 10:29:50 +0100
Received: from [198.90.251.127] (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2EA5311C6;
	Wed,  7 Jun 2023 09:29:49 +0000 (UTC)
Message-ID: <8411fd34-0326-ae92-1d1e-ff171318ebf2@opensource.cirrus.com>
Date: Wed, 7 Jun 2023 10:29:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/2] ASoC: add N cpus to M codecs dai link support
Content-Language: en-US
To: Bard Liao <yung-chuan.liao@linux.intel.com>, <broonie@kernel.org>,
        <tiwai@suse.de>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.intel.com>,
        <bard.liao@intel.com>, - <patches@opensource.cirrus.com>
References: <20230607031242.1032060-1-yung-chuan.liao@linux.intel.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20230607031242.1032060-1-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Fw-Fb9i_1JhvQUxriPxsoilexUdY8XpA
X-Proofpoint-ORIG-GUID: Fw-Fb9i_1JhvQUxriPxsoilexUdY8XpA
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: RDU37CUW3PYPD5QLJTII3H5PZUU4F3AM
X-Message-ID-Hash: RDU37CUW3PYPD5QLJTII3H5PZUU4F3AM
X-MailFrom: prvs=152265b6ca=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RDU37CUW3PYPD5QLJTII3H5PZUU4F3AM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 07/06/2023 04:12, Bard Liao wrote:
> Currently, ASoC supports dailinks with the following mappings: 1 cpu
> DAI to N codec DAIs N cpu DAIs to N codec DAIs But the mapping
> between N cpu DAIs and M codec DAIs is not supported. The reason is
> that we didn't have a mechanism to map cpu and codec DAIs
> 
> This series suggests a new snd_soc_dai_link_codec_ch_map struct in 
> struct snd_soc_dai_link{} which provides codec DAI to cpu DAI
> mapping information used to implement N cpu DAIs to M codec DAIs
> support.
> 
> And add the codec_ch_maps to SOF SoundWire machine driver.
> 

I think there is a much simpler way to handle this. The existing ASoC
code is trying to map CPU to CODEC to match the physical connection. But
the physical connection is not important. The dailink represents the
_logical_ link.

You are declaring that all the CPU and CODEC in the dailink behave as a
single logical link. So you can just connect all CPUs to all CODECS.

That also fixes a problem with the existing N CPU to N CODEC mapping. It
assumes that means CPU0 is connected to CODEC0, CPU1 is connected to
CODEC1, ... But that isn't necessarily true. You could have an N:N
mapping where multiple CPUs have been combined to create a multi-channel
stream that is sent to all CODECs. But the existing N:N code won't hook
that up correctly.

I suggest that the simple fix is this:

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 5d9a671e50f1..f4f955a991d5 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4423,8 +4423,8 @@ static void soc_dapm_dai_stream_event(struct
snd_soc_dai *dai, int stream,
  void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card)
  {
  	struct snd_soc_pcm_runtime *rtd;
-	struct snd_soc_dai *codec_dai;
-	int i;
+	struct snd_soc_dai *codec_dai, *cpu_dai;
+	int i, j;

  	/* for each BE DAI link... */
  	for_each_card_rtds(card, rtd)  {
@@ -4435,17 +4435,9 @@ void snd_soc_dapm_connect_dai_link_widgets(struct
snd_soc_card *card)
  		if (rtd->dai_link->dynamic)
  			continue;

-		if (rtd->dai_link->num_cpus == 1) {
-			for_each_rtd_codec_dais(rtd, i, codec_dai)
-				dapm_connect_dai_pair(card, rtd, codec_dai,
-						      asoc_rtd_to_cpu(rtd, 0));
-		} else if (rtd->dai_link->num_codecs == rtd->dai_link->num_cpus) {
-			for_each_rtd_codec_dais(rtd, i, codec_dai)
-				dapm_connect_dai_pair(card, rtd, codec_dai,
-						      asoc_rtd_to_cpu(rtd, i));
-		} else {
-			dev_err(card->dev,
-				"N cpus to M codecs link is not supported yet\n");
+		for_each_rtd_codec_dais(rtd, i, codec_dai) {
+			for_each_rtd_cpu_dais(rtd, j, cpu_dai)
+				dapm_connect_dai_pair(card, rtd, codec_dai, cpu_dai);
  		}
  	}
  }
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 7958c9defd49..43b1166eb333 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2747,7 +2747,7 @@ static int soc_get_playback_capture(struct
snd_soc_pcm_runtime *rtd,
  				    int *playback, int *capture)
  {
  	struct snd_soc_dai *cpu_dai;
-	int i;
+	int i, j;

  	if (rtd->dai_link->dynamic && rtd->dai_link->num_cpus > 1) {
  		dev_err(rtd->dev,
@@ -2801,22 +2801,14 @@ static int soc_get_playback_capture(struct
snd_soc_pcm_runtime *rtd,
  			SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;

  		for_each_rtd_codec_dais(rtd, i, codec_dai) {
-			if (rtd->dai_link->num_cpus == 1) {
-				cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-			} else if (rtd->dai_link->num_cpus == rtd->dai_link->num_codecs) {
-				cpu_dai = asoc_rtd_to_cpu(rtd, i);
-			} else {
-				dev_err(rtd->card->dev,
-					"N cpus to M codecs link is not supported yet\n");
-				return -EINVAL;
+			for_each_rtd_cpu_dais(rtd, j, cpu_dai) {
+				if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
+				    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
+					*playback = 1;
+				if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
+				    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
+					*capture = 1;
  			}
-
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
-				*playback = 1;
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
-				*capture = 1;
  		}
  	}

