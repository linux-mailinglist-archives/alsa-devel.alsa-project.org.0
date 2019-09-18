Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7355B6260
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 13:43:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F6D41672;
	Wed, 18 Sep 2019 13:42:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F6D41672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568807017;
	bh=6kfzJ5R2EmYrNxWZcRyM/XC4/8vFHRIR3x8TRj99NNU=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KAV69QHze+rSdg6qaJqY4lwHHASaG9GuV0wSig67HicrXQb1CWw5v5gKCOk7Sj2Zz
	 LLpK73D+GFydoa+EpWmuiD/7090po0UmVrXA6ePl/Un7OtymagXy6XoV/oyqX0DYpt
	 j3IfKHbIPNS14W+O6bAYqsZVzoQn/p2cyBJrBVPw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A34BF80527;
	Wed, 18 Sep 2019 13:41:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87DDAF80506; Wed, 18 Sep 2019 13:41:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B68D6F80146
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 13:41:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B68D6F80146
Received: from [78.40.148.177] (helo=localhost)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iAYLA-0000uG-Pp; Wed, 18 Sep 2019 12:41:44 +0100
MIME-Version: 1.0
Date: Wed, 18 Sep 2019 12:41:44 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <1956fa67-c654-f719-5c7c-5e4b40d01e3a@nvidia.com>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-8-ben.dooks@codethink.co.uk>
 <1956fa67-c654-f719-5c7c-5e4b40d01e3a@nvidia.com>
Message-ID: <34bd42ccaf388c196d9b7e188c218dae@codethink.co.uk>
X-Sender: ben.dooks@codethink.co.uk
User-Agent: Roundcube Webmail/1.3.10
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 7/8] ASoC: tegra: config fifos on hw_param
	changes
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 2019-09-18 10:14, Jon Hunter wrote:
> On 17/09/2019 19:12, Ben Dooks wrote:
>> If the hw_params uses a different bit or channel count, then we
>> need to change both the I2S unit's CIF configuration as well as
>> the APBIF one.
>> 
>> To allow changing the APBIF, add a call to reconfigure the RX or
>> TX FIFO without changing the DMA or allocation, and get the I2S
>> driver to call it once the hw params have been calculate.
>> 
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>  sound/soc/tegra/tegra30_ahub.c | 114 
>> ++++++++++++++++++---------------
>>  sound/soc/tegra/tegra30_ahub.h |   5 ++
>>  sound/soc/tegra/tegra30_i2s.c  |   2 +
>>  3 files changed, 69 insertions(+), 52 deletions(-)
>> 
>> diff --git a/sound/soc/tegra/tegra30_ahub.c 
>> b/sound/soc/tegra/tegra30_ahub.c
>> index 952381260dc3..58e05ceb86da 100644
>> --- a/sound/soc/tegra/tegra30_ahub.c
>> +++ b/sound/soc/tegra/tegra30_ahub.c
>> @@ -84,12 +84,40 @@ static int tegra30_ahub_runtime_resume(struct 
>> device *dev)
>>  	return 0;
>>  }
>> 
>> +int tegra30_ahub_setup_rx_fifo(enum tegra30_ahub_rxcif rxcif,
>> +			       struct tegra30_ahub_cif_conf *cif_conf)
>> +{
>> +	int channel = rxcif - TEGRA30_AHUB_RXCIF_APBIF_RX0;
>> +	u32 reg, val;
>> +
>> +	pm_runtime_get_sync(ahub->dev);
>> +
>> +	reg = TEGRA30_AHUB_CHANNEL_CTRL +
>> +	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
>> +	val = tegra30_apbif_read(reg);
>> +	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_MASK |
>> +		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_MASK);
>> +	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_SHIFT) |
>> +	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN |
>> +	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_16;
>> +	tegra30_apbif_write(reg, val);
> 
> Aren't you just programming the same value to the APBIF here that was
> previously programmed by the allocate function? I don't see the point 
> in
> moving this? What am I missing here?

IIRC, this was due to trying different types of playback with a 4ch 
32bit
sound output. The ahub and the i2s unit don't have to agreet.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
