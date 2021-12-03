Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDEB4679CA
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 15:54:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 860562343;
	Fri,  3 Dec 2021 15:53:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 860562343
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638543252;
	bh=Pq+R+RNwtRxaZdWN9/RJmRU031y+p0ARO8D7myTYKhQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FCDwUbpoCsCR1Yy5I1LddbKtgPNX8hYYTYtMqAVPb/VU8+9FX58rUhqwjpAUtNZAX
	 k5Kou0cLtg71343H+2tb0bRjzXp8uTisccC+Aws+k49okC+6bdQLcqDucG4MSPp9pi
	 RbhwlGuK8LIFdz/KyfWwW5b78DBhqs261RqxtMIA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 094F3F80249;
	Fri,  3 Dec 2021 15:52:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89922F80246; Fri,  3 Dec 2021 15:52:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 891FFF800A7
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 15:52:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 891FFF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="gFEvJUI6"
Received: by mail-wm1-x329.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so2412804wmc.2
 for <alsa-devel@alsa-project.org>; Fri, 03 Dec 2021 06:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZzxNp6Li+FKh8VvPAtYb8iH3DgmCIwi+B4XCv18Ihrw=;
 b=gFEvJUI6PFMXsFJ7uLT5BVQJiOz8A7SS95aSDeq1SRZZYq38l5C3axsjPvjHdwZBZ8
 FYXMQ1MyTudZptCqXAl4/pwMiPFW9COIbQbyJs8/cRH+edwYdTl/9DWWZlDUgZEvpLEP
 2SrD2pHd0EEpE4n1sF+dpvAjSWzRwovTlhyCxIpqcKp3P/xQxS1LFZVQ1tsjSrTeItpj
 ym3w2UHxJys/mf/bHR3b84Wo+si0wGRHrOwqVstp6Maip0W8ZFSrRzkquhc8WwtOkM6O
 /nKOpbD5UcnIJtoCtrqoNp60Rmwi7b4QdK67Ay1atAHu9E5PkshCpWIDptT5uDdxTGE+
 +MoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZzxNp6Li+FKh8VvPAtYb8iH3DgmCIwi+B4XCv18Ihrw=;
 b=v2MTCp6shzHeCVGHcDrIb6+gOkF/AC6ETFjxTtZHqgrYHd3TWMBS9V/iTl8RBpAKTv
 nCwjoJQbiOGxtFr+LwqK+4BGTEMGAEi1+18hP0pCp/bkKK3fq3F/Zw3M7p1pnYUSXor8
 uhS7jEL9ALYuOgEf5YsIHdwewtxLMyGKL+jDkt6sTR2Yu4CZboctI6lLPZXrgJyWb6T0
 TEO+PBZSTsK2QLmVPuS4ooKzyvHYsJD0otp+YWhjBf/9jgsd2j2hlxexV5WnpvR8rI6O
 yyKLJeXvvNOKENowzSVBuUzePOi9417nD18XkXNpqhsT6uHAls/SrdXppZ9sOLb33mq7
 SCOg==
X-Gm-Message-State: AOAM53250PB7JTBpD0a68L5nIAkQPewYL3ivyMvQeSn79Jr7qWFyW2TQ
 aDOsrot2tCsM7OnZHUwZ3TTXCfi+sVqkdg==
X-Google-Smtp-Source: ABdhPJwu9Pnd/AqfRPNY1G/4y6KC9psu4pYQK112fEaGBoHDw26MLpCIvnoiT5+JvBoREHAI/jIyww==
X-Received: by 2002:a1c:9d03:: with SMTP id g3mr15052408wme.143.1638543165676; 
 Fri, 03 Dec 2021 06:52:45 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id m14sm4273040wrp.28.2021.12.03.06.52.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 06:52:44 -0800 (PST)
Subject: Re: [PATCH 5/5] ASoC: qcom: apq8016_sbc: Allow routing audio through
 QDSP6
To: Stephan Gerhold <stephan@gerhold.net>
References: <20211202145505.58852-1-stephan@gerhold.net>
 <20211202145505.58852-6-stephan@gerhold.net>
 <455604c2-9b73-4b9b-2ce7-890aafe41845@linaro.org>
 <YaorZnQTwvXo6vrO@gerhold.net>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <5c6607cc-ad2a-6f90-e087-78ef3bd39e80@linaro.org>
Date: Fri, 3 Dec 2021 14:52:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaorZnQTwvXo6vrO@gerhold.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht
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



On 03/12/2021 14:36, Stephan Gerhold wrote:
> Hi Srinivas,
> 
> Thanks for your review!
> 
> On Fri, Dec 03, 2021 at 10:35:08AM +0000, Srinivas Kandagatla wrote:
>> I have tested DB410c this use case in the past using similar patch [1].
>>
> 
> Did you use a different modem DSP firmware? (An older one maybe?)

It was very old which came with some Android release I guess.


> In my tests the newer ones seem to have QDSP6 audio completely broken,
> my DB410c simply rebooted when I tried it.
> 
>> On 02/12/2021 14:55, Stephan Gerhold wrote:
>>> The apq8016-sbc-sndcard is designed to be used with the LPASS drivers
>>> (bypassing the combined audio/modem DSP in MSM8916/APQ8016).
>>> Make it possible to use QDSP6 audio instead for the msm8916-qdsp6-sndcard.
>>>
>>> This only requires adding some additional hooks that set up the DPCM
>>> backends correctly. Similar code is already used in drivers for newer
>>> SoCs such as apq8096.c, sdm845.c and sm8250.c.
>>>
>>> A slightly different initialization sequence is used for the apq8016-sbc
>>> and msm8916-qdsp6 sound card by defining the apq8016_sbc_add_ops()
>>> function as device match data.
>>
>> Other alternative is to reuse card->name populated from "qcom,model"
>> property to differentiate between both of these.
>>
>> This should also help in differentiating UCM configs.
>>
> 
> I have "qdsp6" in card->components to differentiate the setups in UCM
> configs. I think this is a more flexible approach than adding it to the
> card model. It can be checked in UCM using ${CardComponents}.
> 
> In my setup the card "model" identifies the device in use (e.g.
> smartphone X with a stereo speaker setup). This device might use the
> DSP bypass (apq8016-sbc-sndcard) or QDSP6 (msm8916-qdsp6-sndcard),
> depending on user preference. In UCM this is detected by checking
> if ${CardComponents} contains "qdsp6" or not.

That is other way to do it too.


> 
> The reason for supporting both setups is that they both have their
> advantages and disadvantages. The DSP must be used when the modem is
> needed, but otherwise the LPASS driver tends to give more easy control
> about sample rate, latency etc.
> 
>>
>>>
>>> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
>>
>> Few minor nits, other than that it LGTM,
>>
>> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>>> ---
>>>    sound/soc/qcom/apq8016_sbc.c | 134 +++++++++++++++++++++++++++++++++--
>>>    1 file changed, 129 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
>>> index ba2a98268ee4..f9d69375320e 100644
>>> --- a/sound/soc/qcom/apq8016_sbc.c
>>> +++ b/sound/soc/qcom/apq8016_sbc.c
>>> [...]
>>> +static int msm8916_qdsp6_startup(struct snd_pcm_substream *substream)
>>> +{
>>> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>>> +	struct snd_soc_card *card = rtd->card;
>>> +	struct apq8016_sbc_data *data = snd_soc_card_get_drvdata(card);
>>> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
>>> +	int mi2s, ret;
>>> +
>>> +	mi2s = qdsp6_dai_get_lpass_id(cpu_dai);
>>> +	if (mi2s < 0)
>>> +		return mi2s;
>>> +
>>> +	if (++data->mi2s_clk_count[mi2s] > 1)
>>> +		return 0;
>>> +
>>
>> Am assuming that as you are not setting any DIGITAL CDC clock here you might
>> be using an external codec.
>>
> 
> For apq8016-sbc the digital clock is controlled by msm8916-wcd-digital
> through the reference in the device tree (<&gcc GCC_CODEC_DIGCODEC_CLK>).
> It must be carefully managed, because it is needed for register access
> in that driver.
> 
> Since QDSP6 also allows controlling this clock though LPAIF_DIG_CLK
> it is a bit of a hack to bypass it using the GCC driver. However, I kept
> the same setup for simplicity and it has been working just fine so far.

Nice!

> 
> AFAICT in your commit you simply turn on the clock twice, once directly
> using GCC and once indirectly via LPAIF_DIG_CLK in QDSP6. :-)

Yes, that was bit of test code TBH.

> 
>>> +	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, MI2S_BCLK_RATE, 0);
>>> +	if (ret)
>>> +		dev_err(card->dev, "Failed to enable LPAIF bit clk: %d\n", ret);
>>> +	return ret;
>>> +}
>>> +
>>> [...]
>>> @@ -148,11 +266,16 @@ static const struct snd_soc_dapm_widget apq8016_sbc_dapm_widgets[] = {
>>>    static int apq8016_sbc_platform_probe(struct platform_device *pdev)
>>>    {
>>> +	void (*add_ops)(struct snd_soc_card *card);
>>>    	struct device *dev = &pdev->dev;
>>>    	struct snd_soc_card *card;
>>>    	struct apq8016_sbc_data *data;
>>>    	int ret;
>>> +	add_ops = device_get_match_data(&pdev->dev);
>>> +	if (!add_ops)
>>> +		return -EINVAL;
>>
>> We will never hit the error case here because without a match we can not
>> even enter the probe function.
>>
> 
> Theoretically it's possible to create platform devices through other
> ways than the device tree (think of old board C files for example).
> I agree that nobody should do that, but having this check here
> at least avoids a NULL pointer dereference in this unlikely scenario.
> 
> Please let me know if I should remove it anyway, that's fine for me!

TBH, I don't have very strong opinion on this.


--srini
> 
> Thanks,
> Stephan
> 
