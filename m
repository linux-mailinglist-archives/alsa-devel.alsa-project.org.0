Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD40E44DB
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 09:50:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9EAD1779;
	Fri, 25 Oct 2019 09:49:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9EAD1779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571989811;
	bh=VWPee6Il4Yl3rMfISLEX5knxRmnogyf1hgCGSfvmol4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KjRo51UJ1VY8wARZKotzyy/KyyIUn3hnwoWqgJj1IL7KpdIx6ZC+EvxzWygDGsaCW
	 fTfH+HtHftt1jrCHMqHURtD18OwqPixqSlQ6CHygAAa9N9yb6Ec7YsQ+9tkd++DzA8
	 wHCbEyY0qtojMq2SZWGj1PYktBb3Q1USXTxlRgmA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60B4EF80368;
	Fri, 25 Oct 2019 09:48:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 477C9F8036F; Fri, 25 Oct 2019 09:48:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3232DF80112
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 09:48:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3232DF80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="lAP1Sj08"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5db2a8ca0000>; Fri, 25 Oct 2019 00:48:26 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 25 Oct 2019 00:48:17 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 25 Oct 2019 00:48:17 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 25 Oct
 2019 07:48:17 +0000
Received: from [10.21.133.51] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 25 Oct
 2019 07:48:15 +0000
To: Mark Brown <broonie@kernel.org>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-4-ben.dooks@codethink.co.uk>
 <2eef499e-d9d4-732a-ddd6-8d307d8cb08d@nvidia.com>
 <20191024191846.GJ46373@sirena.co.uk>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <549a97c6-ff73-abe0-7c2b-7f29f975e259@nvidia.com>
Date: Fri, 25 Oct 2019 08:48:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191024191846.GJ46373@sirena.co.uk>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1571989706; bh=woREg5ZGPYnyjcnXQe0LrTdl/bxEh/wloZDheV0D1f0=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=lAP1Sj08gBAXtiugJ6WTIE8CLP4n9lYXObLhwkh/u+CjgIrSBYhHBKRuNSNHk7I0d
 hyVYa8Vs26OvXdEpn9lVMA7ywtL0EFGnsn8K7LxrmUr50YpVfbhbzTZbg3VcS5Oj8z
 ubr/WnheSJ0i8UPEU75nrsnBdlVCXss827oaornGWrgwpdo/egbyv7aF2FNS8s6URF
 voGrdxAS1kRj1h+suyrRhlIDkOBz/YLSD4JfPdl28NpD9Rj/bE3PYJ3gt2CF77D8ZG
 7FOkKalxBTqfKmV7OsyjoruqEckbo6/iPQApRQsOjd0/5FHGrBYxT1ptD2jufF99/h
 HtEF7LGoCxSEQ==
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Thierry Reding <thierry.reding@gmail.com>, Edward
 Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v5 3/7] ASoC: tegra: i2s: Add support for
 more than 2 channels
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On 24/10/2019 20:18, Mark Brown wrote:
> On Thu, Oct 24, 2019 at 05:12:21PM +0100, Jon Hunter wrote:
>> On 18/10/2019 16:48, Ben Dooks wrote:
> 
>>> @@ -90,10 +92,12 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
>>>  		TEGRA30_I2S_CTRL_LRCK_MASK;
>>>  	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
>>>  	case SND_SOC_DAIFMT_DSP_A:
>>> +		ch_val = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE;
> 
>> Sorry, I just saw the feedback on the previous iteration. I don't think
>> we want to set the polarity but based upon the format that is passed ...
> 
> The polarity should be set based on the the inversion flags in the
> format, normally both DSP modes trigger on the rising edge of the LRCLK.
> The difference is if there's a delay before the first data bit or not.

Yes. Sorry I realise my email was not clear and when I meant format, I
was referring to the bits in the format mask part of the format. In the
example, I shared we use the inversion bits for the determining the
polarity. There was an old version of one of our drivers where we had
done this incorrectly.

Cheers
Jon

-- 
nvpublic
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
