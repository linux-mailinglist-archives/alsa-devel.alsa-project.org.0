Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A76B6109
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 12:04:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14FBD167D;
	Wed, 18 Sep 2019 12:03:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14FBD167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568801075;
	bh=ZxBjvSediKQr/lURJ2B1pEtbu64sQ++bl0E18O1MUgM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YQQYxl1n1vgoq372dIRB+c6UtoNm3me41bQZoN9up7LtX9VZroYc8J/L7UOrgOA7B
	 hCWI56vMNFmN/JnycgYKxXcKSengNfdhNCD31AC1/0qNBS9TF1MOoU3OEnCwxtgEJl
	 ABSHrBR2vXnjKHBph5wPrKzWQlJYta/cjtLWahtw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F4A7F80292;
	Wed, 18 Sep 2019 12:02:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3167BF804FF; Wed, 18 Sep 2019 12:02:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DF66F80146
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 12:02:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DF66F80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="UEvgYyh2"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d8200c30002>; Wed, 18 Sep 2019 03:02:43 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 18 Sep 2019 03:02:38 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 18 Sep 2019 03:02:38 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Sep
 2019 10:02:38 +0000
Received: from [10.24.44.112] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Sep
 2019 10:02:35 +0000
To: Jon Hunter <jonathanh@nvidia.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
 <linux-tegra@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-9-ben.dooks@codethink.co.uk>
 <09346757-7643-f014-f054-35d981daad63@nvidia.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <80ddb066-50c8-6da3-d3a5-9aaf377d65e8@nvidia.com>
Date: Wed, 18 Sep 2019 15:32:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <09346757-7643-f014-f054-35d981daad63@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1568800963; bh=hhPp1t71qGHwzASu22KBL1+OtC2eJZ81C1fIUxA6S9s=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=UEvgYyh2bTOl5YWG+mkkTE/ZA7i7yKNID/UG2nj+sLkYYxIF2uIGtahbMb3lb/cjt
 JpcPLL1UISeGq0QfErwTtGMdcEFPZGJkwdKYPMn/6Dj8zcXRMAnpMR6uME0AG5rb/H
 75EDmtV2Zg+3W9BTJZmgOCvN5k4vgCbJOLhNrdgPWTpEtFeJ2our1Plf7yLXaFFSLf
 Lcm13QFPU+Q7AKKIhjohc4tD4iJUr6RR7ylgwZCU7XT/QUCXAx3++RKKr9ZRlKbp/t
 avd7IweJvffTRAt1pXWFTEA7Vz5G7cNnSUbdONp3nDqx0xZ4wnHtfycNV09W5QT0+U
 /hA2HWcPyd0+g==
Cc: linux-kernel@lists.codethink.co.uk
Subject: Re: [alsa-devel] [PATCH 8/8] ASoC: tegra: take packing settings
 from the audio cif_config
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


On 9/18/2019 2:46 PM, Jon Hunter wrote:
> On 17/09/2019 19:12, Ben Dooks wrote:
>> If the CIF is not configured as 16 or 8 bit, then the
>> packing for 8/16 bits should not be enabled as the
>> hardware only supports 8 or 16 bit packing.
>>
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>   sound/soc/tegra/tegra30_ahub.c | 29 +++++++++++++++++++++--------
>>   1 file changed, 21 insertions(+), 8 deletions(-)
>>
>> diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
>> index 58e05ceb86da..c2f2e29dd32e 100644
>> --- a/sound/soc/tegra/tegra30_ahub.c
>> +++ b/sound/soc/tegra/tegra30_ahub.c
>> @@ -96,10 +96,17 @@ int tegra30_ahub_setup_rx_fifo(enum tegra30_ahub_rxcif rxcif,
>>   	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
>>   	val = tegra30_apbif_read(reg);
>>   	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_MASK |
>> -		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_MASK);
>> -	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_SHIFT) |
>> -	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN |
>> -	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_16;
>> +		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_MASK |
>> +		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN);
>> +	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_SHIFT);
>> +	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_16 ||
>> +	    cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_8)
>> +		val |= TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN;
>> +	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_16)
>> +		val |= TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_16;
>> +	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_8)
>> +		val |= TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_8_4;
>> +
> Ah maybe this is what I am missing from the previous patch. So the last
> patch was a preparatory patch for this one.
>
> Sameer, how is this handled in the case of Tegra210?
For Tegra210 we have a separate driver for ADMAIF. Packing and CIF 
configuration
is programmed in its hw_param() callback.
> Cheers
> Jon
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
