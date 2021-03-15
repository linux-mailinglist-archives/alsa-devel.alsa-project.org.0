Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CE233C0DA
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 17:02:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4BFB179A;
	Mon, 15 Mar 2021 17:01:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4BFB179A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615824169;
	bh=iDlnGQtl42VH+erAel/vOXKTFJrT7g0qnXOuVKLf3bY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JwmGos0TkkFt+RULRVHSv0NyqjQYintW9FatiWMoYTGvsVdA+SGpsSRSp9IpIkIEv
	 /7/HJZhiC4mWe/zbdGCmwb3f1clbqK2tW/3ZzVki33VLfLJEAVpsUcGPaKTyOrNGwM
	 bSXgriA8woyruPimw11YgoTgwz9/YFuENHiTHexU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05CB0F801F7;
	Mon, 15 Mar 2021 17:01:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FD45F80171; Mon, 15 Mar 2021 17:01:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00499F80100
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 17:01:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00499F80100
IronPort-SDR: HfFESTIPwTiEeDoAPpyTdKqsK2FFJz9F9SR5opTKFCBuvTCnO2lRFNeh8b4TUKvnDcmzRxfeY2
 HdVAYQsIBGMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="176706420"
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; d="scan'208";a="176706420"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2021 09:01:02 -0700
IronPort-SDR: m9ETXf/nEQZHp8nYkD9kuWRV0/8Z8hI++ehov3DbAvfsv3E+44H7W9hzDC/gyNM34GWsbdiuZE
 U9Mqbij/d5XQ==
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; d="scan'208";a="432704589"
Received: from kdaxer-mobl1.amr.corp.intel.com (HELO [10.212.25.124])
 ([10.212.25.124])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2021 09:00:58 -0700
Subject: Re: [PATCH v3] ASoC: amd: add support for rt5682 codec in machine
 driver
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <1615824133-21553-1-git-send-email-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <efa02319-2abf-4fb9-efec-13b6279f3d78@linux.intel.com>
Date: Mon, 15 Mar 2021 11:00:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1615824133-21553-1-git-send-email-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Chuhong Yuan <hslester96@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Alexander.Deucher@amd.com, Virendra-Pratap.Arya@amd.com,
 Murali-krishna.Vemuri@amd.com
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


> +static int rt5682_clk_enable(struct snd_pcm_substream *substream)
> +{
> +	int ret;
> +	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> +
> +	/*
> +	 * Set wclk to 48000 because the rate constraint of this driver is
> +	 * 48000. ADAU7002 spec: "The ADAU7002 requires a BCLK rate that is
> +	 * minimum of 64x the LRCLK sample rate." RT5682 is the only clk
> +	 * source so for all codecs we have to limit bclk to 64X lrclk.
> +	 */
> +	clk_set_rate(rt5682_dai_wclk, 48000);
> +	clk_set_rate(rt5682_dai_bclk, 48000 * 64);
> +	ret = clk_prepare_enable(rt5682_dai_bclk);
> +	if (ret < 0) {
> +		dev_err(rtd->dev, "can't enable master clock %d\n", ret);
> +		return ret;
> +	}
> +	return ret;
> +}

Out of curiosity, is there a reason why you use clk_prepare_enable() for 
the bclk but not for the wclk?
