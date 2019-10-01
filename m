Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD70C3208
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 13:12:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4785E1672;
	Tue,  1 Oct 2019 13:11:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4785E1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569928334;
	bh=6RhDeG1qB+sR7O5Xl3Oys/NPKNYMiieuUNcdfr/8eqo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OX+PlUykr+piFA2/sdKo/86LRCEaNcxPJ26NjJupmTbVDqvUKkbYDulFG8G6P1xWj
	 gHj7z/8YadJJ1tVmhkKelSFqU3TQuX0CzlDG4VK4jY6RZeAuTtihs04ZNqAywdsyp0
	 O91oQuj4FBT09kIaRSVrxKZeiqB/yuORzXMIL13o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CC73F80519;
	Tue,  1 Oct 2019 13:10:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A89CF80506; Tue,  1 Oct 2019 13:10:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1ED24F800D0
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 13:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ED24F800D0
Received: from [167.98.27.226] (helo=[10.35.6.110])
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iFG2S-0007Mo-R5; Tue, 01 Oct 2019 12:09:52 +0100
To: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
References: <20190930165130.10642-1-ben.dooks@codethink.co.uk>
 <20190930165130.10642-6-ben.dooks@codethink.co.uk>
 <6d6ae684-dd5f-b180-9114-dafe12886d4f@nvidia.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <54bde532-2276-aa4e-6206-7757b482c6fa@codethink.co.uk>
Date: Tue, 1 Oct 2019 12:09:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6d6ae684-dd5f-b180-9114-dafe12886d4f@nvidia.com>
Content-Language: en-GB
Cc: linux-kernel@lists.codethink.co.uk
Subject: Re: [alsa-devel] [PATCH v3 5/7] ASoC: tegra: set i2s_offset to 0
	for tdm
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

On 30/09/2019 21:52, Jon Hunter wrote:
> 
> 
> On 30/09/2019 17:51, Ben Dooks wrote:
>> Set the offset to 0 for TDM mode, as per the current setup. Note we also
>> move the data offset programming to the i2s hw_parameters call as per
>> the suggestion from Jon Hunter.
>>
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>> v2:
>>   - fix the review comments and move the i2s offset setting
>> ---
>>   sound/soc/tegra/tegra30_i2s.c | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
>> index c573151da341..a03692b0afc3 100644
>> --- a/sound/soc/tegra/tegra30_i2s.c
>> +++ b/sound/soc/tegra/tegra30_i2s.c
>> @@ -66,7 +66,7 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
>>   				unsigned int fmt)
>>   {
>>   	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
>> -	unsigned int mask = 0, val = 0;
>> +	unsigned int mask = 0, val = 0, data_offset = 1;
>>   	unsigned int ch_mask, ch_val = 0;
>>   
>>   	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
>> @@ -95,11 +95,13 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
>>   		ch_val = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE;
>>   		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
>>   		val |= TEGRA30_I2S_CTRL_LRCK_L_LOW;
>> +		data_offset = 0;
>>   		break;
>>   	case SND_SOC_DAIFMT_DSP_B:
>>   		ch_val = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE;
>>   		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
>>   		val |= TEGRA30_I2S_CTRL_LRCK_R_LOW;
>> +		data_offset = 0;
> 
> My understanding is that the difference between dsp-a and dsp-b is that
> dsp-a has an offset of 1 and dsp-b has an offset of 0.

Ok, can anyone else check this before I make the change for DSP_B ?


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
