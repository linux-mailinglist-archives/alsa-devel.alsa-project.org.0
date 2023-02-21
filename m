Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0FF69E56F
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 18:02:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16C0DE9C;
	Tue, 21 Feb 2023 18:01:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16C0DE9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676998950;
	bh=WTbh+QTltW9ZxDQGN6CN4UCm0JeOXBIFh/h0RJ+P5Jc=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VixJaEnsAm6j0Z+cpVm2nEEwrBXTQf4yl7MkGO84pMl+5awj/90Iy1arKYfERflfF
	 ++molKCIhpkuWwNoC0LeRz0sPaievb2PaxTAcAFlVbK3i7eupA8rI72Yr14pNWVYck
	 7emJCGJycgT99q9Xqc71pYHVtFWPj6Sv+KnHUel4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01133F80579;
	Tue, 21 Feb 2023 17:59:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E473F80544; Tue, 21 Feb 2023 17:59:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1438F80496
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 17:58:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1438F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MD9No4Pb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676998739; x=1708534739;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WTbh+QTltW9ZxDQGN6CN4UCm0JeOXBIFh/h0RJ+P5Jc=;
  b=MD9No4PbCTReerVzDOLcx2nil6rPp9vEJlgo1Oped+bV2HfpPvlMePbA
   Y+qHSs75kP1n3GYurzvht7PDmLUEMehkiE0q+RYSDjX5xkY7ZYtCt2CQp
   glGeLfAyQ2vah/76ZGbdnwfddeSCAVOe9rRK4hVCtnpsdKvS6YrNIQDCt
   Qnlxk3QR71WEPd2MCUUd9OONpfigxrz8zyOSSNb8fo6nyRRXD+teT7JFT
   gKV0iWYQYf0m3YNJD78QPZvUkMvOE8hHaxE+YIyqtjA0cz6lYRqejOfMn
   t+XjO/G2NKyWgdtqkfI0P7jvcpsNKdbhyB1LghaFVfNuVpOPtmo+WGm44
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="334884723"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000";
   d="scan'208";a="334884723"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 08:58:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="814569137"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000";
   d="scan'208";a="814569137"
Received: from taevough-mobl.amr.corp.intel.com (HELO [10.209.174.213])
 ([10.209.174.213])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 08:58:45 -0800
Message-ID: <dfebabad-4777-b5e3-8f58-1301faf97f7e@linux.intel.com>
Date: Tue, 21 Feb 2023 11:49:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH 09/10] ASoC: Intel: sof_sdw: Add support for Cirrus Logic
 CS35L56
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org,
 cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, kai.vehmanen@linux.intel.com
References: <20230217161410.915202-1-rf@opensource.cirrus.com>
 <20230217161410.915202-10-rf@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230217161410.915202-10-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SA4B7HI3MKCQSBSBXM3L5MYWYYJ5ZDJP
X-Message-ID-Hash: SA4B7HI3MKCQSBSBXM3L5MYWYYJ5ZDJP
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SA4B7HI3MKCQSBSBXM3L5MYWYYJ5ZDJP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +static int cs35l56_init_multiple(struct snd_soc_pcm_runtime *rtd, int count)
> +{
> +	struct snd_soc_card *card = rtd->card;
> +	struct snd_soc_dai *codec_dai;
> +	int i, ret;
> +
> +	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
> +					  "%s hs:cs35l56",

the string is wrong here, this is an amplifier so it should be
amp:cs35l56 or spk:cs36l56 (not sure which of the two we ended-up using).

> +					  card->components);
> +	if (!card->components)
> +		return -ENOMEM;
> +
> +	ret = snd_soc_dapm_new_controls(&card->dapm,
> +					cs35l56_sof_widgets, ARRAY_SIZE(cs35l56_sof_widgets));
> +	if (ret) {
> +		dev_err(card->dev, "Widgets add failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = snd_soc_dapm_add_routes(&card->dapm, cs35l56_sof_map, count);
> +	if (ret) {
> +		dev_err(card->dev, "Map add %d failed: %d\n", count, ret);
> +		return ret;
> +	}
> +
> +	/* Enable one feedback TX per amp on different slots */
> +	for_each_rtd_codec_dais(rtd, i, codec_dai) {
> +		ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x3, 1 << i, 4, 16);

TDM slots? Not getting how this would work with SoundWire?

> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
