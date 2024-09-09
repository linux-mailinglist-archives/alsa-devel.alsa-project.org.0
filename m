Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3D5971EE0
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2024 18:14:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAD8C852;
	Mon,  9 Sep 2024 18:14:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAD8C852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725898488;
	bh=VrRAFzjcKwIsh88F/FkxrhW6vZ1qLxrEu/SiiVbuS5c=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dl1OkXqM5HRSpjm1dwbFPZqyzkWlJtTpjMwLpEZVoP+FxBTcAOWRIl5ubJmYZNWQz
	 ev8wVCE8omRBYukxbUpZ7l1Uwfu00k9xpmZFoVeAZgUOMiri9JudrKUp+7Cf7l5abC
	 mKGuSP5yAxp88lWNRNkd9Hr0+sC4cE9hGLytNy5E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B529F805BE; Mon,  9 Sep 2024 18:14:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EF8CF805AB;
	Mon,  9 Sep 2024 18:14:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB1B3F801F5; Mon,  9 Sep 2024 18:14:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC6F5F8010B
	for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2024 18:14:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC6F5F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=g1tD73zq
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4893U6wt017870;
	Mon, 9 Sep 2024 11:14:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=+TxF7gv/3QTNLJRsQ1
	boHrC4jtsRF3xAKieFb8tX/v0=; b=g1tD73zqDAW5UyYZ/r9/snrIbazZ2Vbe4x
	/Wz0Pg5oD4NSSqRsYqgbRiJs7wt2wkrnV4jycmFUJ7iO+vk/H1VBYkV5Ki1UAZQr
	aTxDef3kUaMrqijiizfyiEyCM7iBNlSnygReONW84pDu2VTyCtcI95O9cI41/1vr
	UK0imKc9A3DAbtdT1TL68bnVZ6PKRn2YuRlhIkoFYHd1Ptw9K0skxshQEWRzmcF+
	LnhB0YxkERMFwS0CEO6NSY0UsRkPw46WfsDK/Tah1LS4fXTFNLUB/jCVp6+bfl6Y
	Hp+Wk5IjqpkseDbB9phnAc0zOGObdRgP8T3VFeHWOLL8UVF6Waow==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 41gk8hsx2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 11:14:09 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Sep 2024
 17:14:07 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 9 Sep 2024 17:14:07 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 99CA7820249;
	Mon,  9 Sep 2024 16:14:07 +0000 (UTC)
Date: Mon, 9 Sep 2024 17:14:06 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "David
 Rhodes" <david.rhodes@cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood
	<liam.r.girdwood@linux.intel.com>,
        Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>,
        Kai Vehmanen
	<kai.vehmanen@linux.intel.com>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        "Jernej
 Skrabec" <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH 12/13] ASoC: cs35l34: drop useless rate contraint
Message-ID: <Zt8ezoQ+c7RQsVx+@opensource.cirrus.com>
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
 <20240905-alsa-12-24-128-v1-12-8371948d3921@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240905-alsa-12-24-128-v1-12-8371948d3921@baylibre.com>
X-Proofpoint-GUID: hCMVSLl-DL3z0Nijst2ymaLrBhwxD4k9
X-Proofpoint-ORIG-GUID: hCMVSLl-DL3z0Nijst2ymaLrBhwxD4k9
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: UEEBET6J7HGMMXGJMBI6YSDDMVTRLFAR
X-Message-ID-Hash: UEEBET6J7HGMMXGJMBI6YSDDMVTRLFAR
X-MailFrom: prvs=698262c8fd=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UEEBET6J7HGMMXGJMBI6YSDDMVTRLFAR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Sep 05, 2024 at 04:13:03PM +0200, Jerome Brunet wrote:
> The cs35l34 adds a useless rate constraint on startup.
> It does not set SNDRV_PCM_RATE_KNOT and the rates set are already a subset
> of the ones provided in the constraint list, so it is a no-op.
> 
> >From the rest of the code, it is likely HW supports more than the 32, 44.1
> and 48kHz listed in CS35L34_RATES but there is no way to know for sure
> without proper documentation.
> 
> Keep the driver as it is for now and just drop the useless constraint.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Yeah according to the datasheet it should support all the rates
listed in the cs35l34_src_rates list. But given the weird way
that CS35L34_RATES is implemented I think you are right best to
leave it as it is for now, incase there was a reason. Perhaps if
I find some time I might see if I have one in a draw somewhere in
the future.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
>  sound/soc/codecs/cs35l34.c | 21 ---------------------
>  1 file changed, 21 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs35l34.c b/sound/soc/codecs/cs35l34.c
> index e63a518e3b8e..287b27476a10 100644
> --- a/sound/soc/codecs/cs35l34.c
> +++ b/sound/soc/codecs/cs35l34.c
> @@ -562,26 +562,6 @@ static int cs35l34_pcm_hw_params(struct snd_pcm_substream *substream,
>  	return ret;
>  }
>  
> -static const unsigned int cs35l34_src_rates[] = {
> -	8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000
> -};
> -
> -
> -static const struct snd_pcm_hw_constraint_list cs35l34_constraints = {
> -	.count  = ARRAY_SIZE(cs35l34_src_rates),
> -	.list   = cs35l34_src_rates,
> -};
> -
> -static int cs35l34_pcm_startup(struct snd_pcm_substream *substream,
> -			       struct snd_soc_dai *dai)
> -{
> -
> -	snd_pcm_hw_constraint_list(substream->runtime, 0,
> -				SNDRV_PCM_HW_PARAM_RATE, &cs35l34_constraints);
> -	return 0;
> -}
> -
> -
>  static int cs35l34_set_tristate(struct snd_soc_dai *dai, int tristate)
>  {
>  
> @@ -639,7 +619,6 @@ static int cs35l34_dai_set_sysclk(struct snd_soc_dai *dai,
>  }
>  
>  static const struct snd_soc_dai_ops cs35l34_ops = {
> -	.startup = cs35l34_pcm_startup,
>  	.set_tristate = cs35l34_set_tristate,
>  	.set_fmt = cs35l34_set_dai_fmt,
>  	.hw_params = cs35l34_pcm_hw_params,
> 
> -- 
> 2.45.2
> 
