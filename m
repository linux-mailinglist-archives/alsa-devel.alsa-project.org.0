Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4B566A2F0
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 20:29:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EFC1AF96;
	Fri, 13 Jan 2023 20:28:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EFC1AF96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673638163;
	bh=z3ekLWY5ObJLmIVZrmrckQLOgVzWCWpMqm4KtCSrWtI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dasqVU7Cz2ZDO7xigd7gf2ckWS0QJfi35Li9WSET6zsFtFk1FBkfR7XzkItlBia37
	 bpLuiTdfOYraEy6MHB9+djnTLXwr79ugHEAp8i1HiFRMfumk50qgxN66XTLb/Tp6b3
	 i00aj6/aQ1Hw/O3OqrcTB1/emsvznVk8Ckzn2mtI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50C38F804A9;
	Fri, 13 Jan 2023 20:27:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30790F804A9; Fri, 13 Jan 2023 20:27:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0286F8030F
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 20:27:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0286F8030F
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JHWaXsvi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673638074; x=1705174074;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=z3ekLWY5ObJLmIVZrmrckQLOgVzWCWpMqm4KtCSrWtI=;
 b=JHWaXsvic+wzkeAcIkovVDUWX3N4VCTFiG1CJVJ4ZYuCyFiq7Yw3Kp1Q
 GmsyMvv/Uuz70BUgdxaH9EGdJFEr2BHnC7xzNo9Q+mwlNAHNQv/0+IrfY
 E5HRYYJ5WoMZw79g0fnUCXczUFQVLd5InQc+NXYSYRTorhwc/aaRtQ+tb
 uGQX4+DK5LyXg32TV2SitYTwK/Dv2YVu4xVQIqUYsmOhSdwxHiBQRa3HD
 0UmHMwzD+ZzvaZepU0CYdeMcp2rSgJ872y11IUqCObi/cOgRR90MtOTur
 MqI6gmPQIxvtgcPX+BTInD2JZFv9A79h/Tt8dozFf3RU3MPr65rXab2Ll w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="322777236"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="322777236"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 11:27:50 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="608257464"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="608257464"
Received: from rerayess-mobl.amr.corp.intel.com (HELO [10.212.13.223])
 ([10.212.13.223])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 11:27:49 -0800
Message-ID: <68b22ad4-1da0-48e4-a3aa-2b55e5553c01@linux.intel.com>
Date: Fri, 13 Jan 2023 11:13:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 03/19] soundwire: amd: register sdw controller dai ops
Content-Language: en-US
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, broonie@kernel.org,
 vkoul@kernel.org, alsa-devel@alsa-project.org
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
 <20230111090222.2016499-4-Vijendar.Mukunda@amd.com>
 <ad052efb-286e-4716-7608-d284782011cd@linux.intel.com>
 <abf07f9a-d34e-850f-1ed1-54b373960ce2@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <abf07f9a-d34e-850f-1ed1-54b373960ce2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Mastan.Katragadda@amd.com, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, open list <linux-kernel@vger.kernel.org>,
 Mario.Limonciello@amd.com, arungopal.kondaveeti@amd.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



>>> +static int amd_sdwc_hw_params(struct snd_pcm_substream *substream,
>>> +			      struct snd_pcm_hw_params *params,
>>> +			      struct snd_soc_dai *dai)
>>> +{
>>> +	struct amd_sdwc_ctrl *ctrl = snd_soc_dai_get_drvdata(dai);
>>> +	struct sdw_amd_dma_data *dma;
>>> +	struct sdw_stream_config sconfig;
>>> +	struct sdw_port_config *pconfig;
>>> +	int ch, dir;
>>> +	int ret;
>>> +
>>> +	dma = snd_soc_dai_get_dma_data(dai, substream);
>>> +	if (!dma)
>>> +		return -EIO;
>>> +
>>> +	ch = params_channels(params);
>>> +	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
>>> +		dir = SDW_DATA_DIR_RX;
>>> +	else
>>> +		dir = SDW_DATA_DIR_TX;
>>> +	dev_dbg(ctrl->dev, "%s: dir:%d dai->id:0x%x\n", __func__, dir, dai->id);
>>> +	dma->hw_params = params;
>>> +
>>> +	sconfig.direction = dir;
>>> +	sconfig.ch_count = ch;
>>> +	sconfig.frame_rate = params_rate(params);
>>> +	sconfig.type = dma->stream_type;
>>> +
>>> +	sconfig.bps = snd_pcm_format_width(params_format(params));
>>> +
>>> +	/* Port configuration */
>>> +	pconfig = kzalloc(sizeof(*pconfig), GFP_KERNEL);
>>> +	if (!pconfig) {
>>> +		ret =  -ENOMEM;
>>> +		goto error;
>>> +	}
>>> +
>>> +	pconfig->num = dai->id;
>>> +	pconfig->ch_mask = (1 << ch) - 1;
>>> +	ret = sdw_stream_add_master(&ctrl->bus, &sconfig,
>>> +				    pconfig, 1, dma->stream);
>>> +	if (ret)
>>> +		dev_err(ctrl->dev, "add master to stream failed:%d\n", ret);
>>> +
>>> +	kfree(pconfig);
>>> +error:
>>> +	return ret;
>>> +}
>> This looks inspired from intel.c, but you are not programming ANY
>> registers here. is this intentional?
> We don't have any additional registers to be programmed like intel.

ok, this is worthy of a comment.


>>> +static const struct snd_soc_dai_ops amd_sdwc_dai_ops = {
>>> +	.hw_params = amd_sdwc_hw_params,
>>> +	.hw_free = amd_sdwc_hw_free,
>>> +	.set_stream = amd_pcm_set_sdw_stream,
>> In the first patch there was support for PDM exposed, but here it's PDM
>> only?
> Didn't get your question.
> First patch talks about creating dev nodes for Soundwire managers and
> ACP PDM controller based on ACP pin config.

Sorry, my comment has a typo.

I meant that the first patch exposed PDM support but here you only have PCM?
