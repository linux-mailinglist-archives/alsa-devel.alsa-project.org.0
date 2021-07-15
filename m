Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D633C9CCF
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 12:36:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F99716B4;
	Thu, 15 Jul 2021 12:35:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F99716B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626345364;
	bh=YS7m8sciDVENWB6bjr30ax520tGCWlZq8Tm/sPJdHPw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jNCHkG/ASOpqcA8pjEnXW4tUP9qo5Kp00TAnm9PAgmo8dNYzODSjRpztLQbLRovtf
	 33ngfdOTBBHaN7GAz3MyPigV1C3Eh9XQdb7I/Fn6E2OgrbYPMH2Zi5CDXCQEcj3viQ
	 n2l077vZZVATIxt3nhgLMsj88S3a7uPcO6vyU0Ao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42199F8050F;
	Thu, 15 Jul 2021 12:32:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBB7AF80508; Thu, 15 Jul 2021 12:32:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E06BCF804FD
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 12:32:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E06BCF804FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="KO6OljGJ"
Received: by mail-wr1-x430.google.com with SMTP id f9so7067570wrq.11
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 03:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qA1/q5Zr4hUtJmNF+gYQCfrTeWjDRngb7/Yhj2nfnyo=;
 b=KO6OljGJlpl4nNhBS0fQmvDNvC/j5mD7tngLF/0d4cvCUbXJ63CKwGK3jzInvvSv1s
 2/nPmxn+E/eBcE7joNlnDgFLrWDVPUfo+BDMjKW3XrH5zSvlCnVgDMwjEIKLYRmf9e2m
 kLeoI6BKZH+/osPB30NiV5bTI9Bz5NEImZDb4uTPA6fPTR5FHzXrSi35UyRb6SiUpgjk
 pyuyFeu7EGG5XwplydxKZYd+c+hNUZzJ+kvWhatQ/wU5WQ/sIWPXhrNVSyHGn9MJH7cR
 pVakTgBkcC6cY4xXdyUJqLa48svN/IfYX7f4ScmRMNm6bqb7oyHrN2nKF1t5wNcTPOLx
 cM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qA1/q5Zr4hUtJmNF+gYQCfrTeWjDRngb7/Yhj2nfnyo=;
 b=f5uYZS+mAFewC8BUV4HLSl1xCZI5mc23rEc98vyloXnWeB8m2nAXFavRkdY9FknS/a
 RxjRTx+aR/CKDFGEfITslOJ662cauhqr7ZSLuPY5Vi2Pl9IcpMPp3bpw5OXIPUxIyt56
 d+Svh8lL0kiDtfRhH2XBfP+f7jqlP1SEr2plnfZVZqwAhXsuSxefvQfbX1m04zDCZiCU
 YGjus2gK0zMU0b889cZb7NhACWoRSlc3Wwa+vldeCaD1zFomsxI+dvwuBv/stuNZ2fxe
 PwK7Mz1X95Ubp2stlYYjfHwMvjaAV0iTVEFPPGxrMvp2x/lgRE0xfz+hYbWDSdpsfUgr
 KA5g==
X-Gm-Message-State: AOAM5334yaJny/U4p3phd0wkV2TBMtsExSHhgCuzFerGUQ+rroDLyY/w
 sNDUjwdud3QjPpA/qGGtSxANgw==
X-Google-Smtp-Source: ABdhPJxPmIsysd/vI8SIetDxDUYCODAuTeVAP56APS2BEzM+SDrB6hKud5ZGgagi4ei68AJ9vryzMA==
X-Received: by 2002:adf:ba07:: with SMTP id o7mr4554441wrg.160.1626345166461; 
 Thu, 15 Jul 2021 03:32:46 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id s24sm6683034wra.33.2021.07.15.03.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 03:32:46 -0700 (PDT)
Subject: Re: [PATCH v2 16/16] ASoC: qcom: sm8250: Add audioreach support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210714153039.28373-1-srinivas.kandagatla@linaro.org>
 <20210714153039.28373-17-srinivas.kandagatla@linaro.org>
 <67e19b85-7f97-c965-04ea-6a46eaf19f3f@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <1bbdae54-7524-8047-f0de-061df3288bc6@linaro.org>
Date: Thu, 15 Jul 2021 11:32:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <67e19b85-7f97-c965-04ea-6a46eaf19f3f@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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



On 14/07/2021 18:12, Pierre-Louis Bossart wrote:
> 
> 
> On 7/14/21 10:30 AM, Srinivas Kandagatla wrote:
>> This patch adds support for parsing dt for AudioReach based soundcards
>> which only have backend DAI links in DT.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   sound/soc/qcom/sm8250.c | 144 +++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 143 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
>> index fe8fd7367e21..421f9d1d2bed 100644
>> --- a/sound/soc/qcom/sm8250.c
>> +++ b/sound/soc/qcom/sm8250.c
>> @@ -20,6 +20,141 @@ struct sm8250_snd_data {
>>   	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
>>   };
>>   
>> +static int qcom_audioreach_snd_parse_of(struct snd_soc_card *card)
>> +{
>> +	struct device_node *np;
>> +	struct device_node *codec = NULL;
>> +	struct device_node *platform = NULL;
>> +	struct device_node *cpu = NULL;
>> +	struct device *dev = card->dev;
>> +	struct snd_soc_dai_link *link;
>> +	struct of_phandle_args args;
>> +	struct snd_soc_dai_link_component *dlc;
>> +	int ret, num_links;
>> +
>> +	ret = snd_soc_of_parse_card_name(card, "model");
>> +	if (ret) {
>> +		dev_err(dev, "Error parsing card name: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	/* DAPM routes */
>> +	if (of_property_read_bool(dev->of_node, "audio-routing")) {
>> +		ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	/* Populate links */
>> +	num_links = of_get_child_count(dev->of_node);
>> +
>> +	/* Allocate the DAI link array */
>> +	card->dai_link = devm_kcalloc(dev, num_links, sizeof(*link), GFP_KERNEL);
>> +	if (!card->dai_link)
>> +		return -ENOMEM;
>> +
>> +	card->num_links = num_links;
>> +	link = card->dai_link;
>> +
>> +	for_each_child_of_node(dev->of_node, np) {
>> +
>> +		dlc = devm_kzalloc(dev, 2 * sizeof(*dlc), GFP_KERNEL);
>> +		if (!dlc) {
>> +			ret = -ENOMEM;
>> +			goto err_put_np;
>> +		}
>> +
>> +		link->cpus	= &dlc[0];
>> +		link->platforms	= &dlc[1];
>> +
>> +		link->num_cpus		= 1;
>> +		link->num_platforms	= 1;
>> +
>> +
>> +		ret = of_property_read_string(np, "link-name", &link->name);
>> +		if (ret) {
>> +			dev_err(card->dev, "error getting codec dai_link name\n");
>> +			goto err_put_np;
>> +		}
>> +
>> +		cpu = of_get_child_by_name(np, "cpu");
>> +		platform = of_get_child_by_name(np, "platform");
>> +		codec = of_get_child_by_name(np, "codec");
>> +		if (!cpu) {
>> +			dev_err(dev, "%s: Can't find cpu DT node\n", link->name);
>> +			ret = -EINVAL;
>> +			goto err;
>> +		}
>> +
>> +		if (!platform) {
>> +			dev_err(dev, "%s: Can't find platform DT node\n", link->name);
>> +			ret = -EINVAL;
>> +			goto err;
>> +		}
>> +
>> +		if (!codec) {
>> +			dev_err(dev, "%s: Can't find codec DT node\n", link->name);
>> +			ret = -EINVAL;
>> +			goto err;
>> +		}
>> +
>> +		ret = of_parse_phandle_with_args(cpu, "sound-dai", "#sound-dai-cells", 0, &args);
>> +		if (ret) {
>> +			dev_err(card->dev, "%s: error getting cpu phandle\n", link->name);
>> +			goto err;
>> +		}
>> +
>> +		link->cpus->of_node = args.np;
>> +		link->id = args.args[0];
>> +
>> +		ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name);
>> +		if (ret) {
>> +			if (ret != -EPROBE_DEFER)
>> +				dev_err(card->dev, "%s: error getting cpu dai name: %d\n",
>> +					link->name, ret);
>> +			goto err;
>> +		}
>> +
>> +		link->platforms->of_node = of_parse_phandle(platform, "sound-dai", 0);
>> +		if (!link->platforms->of_node) {
>> +			dev_err(card->dev, "%s: platform dai not found\n", link->name);
>> +			ret = -EINVAL;
>> +			goto err;
>> +		}
>> +
>> +		ret = snd_soc_of_get_dai_link_codecs(dev, codec, link);
>> +		if (ret < 0) {
>> +			if (ret != -EPROBE_DEFER)
>> +				dev_err(card->dev, "%s: codec dai not found: %d\n",
>> +					link->name, ret);
>> +			goto err;
>> +		}
>> +
>> +		/* DPCM backend */
>> +		link->no_pcm = 1;

Currently we only allow backend dailinks from DT, as the rest of pcm dai 
links come from topology.

>> +		link->ignore_pmdown_time = 1;
>> +		link->ignore_suspend = 1;
> 
> why are those two fields set unconditionally?

These two flags have been inherited from ./sound/soc/qcom/common.c

> 
> If you parse information from DT shouldn't those links be explicitly tagged as requiring those fields to be set?

Currently we do not have any DT bindings for these generic flags. May be 
I/we should think about adding binding for this soon.

> 
> It's a recurring battle for me to ask why people set them in Intel machine drivers, I find it really odd that you would set them since they aren't without side effect on clocks and suspend.

Noted, Thanks for hints, I think we are yet to hit these issues for 
wrong reasons, As most of the qcom audio drivers are not tested with PM. 
Some of the Google hw did test full PM though.
Currently am working on getting PM support for various qcom codecs, and 
soundwire controller.

--srini

> 
>> +
>> +		link->stream_name = link->name;
>> +		snd_soc_dai_link_set_capabilities(link);
>> +		link++;
>> +
>> +		of_node_put(cpu);
>> +		of_node_put(codec);
>> +		of_node_put(platform);
>> +
>> +	}
>> +
>> +	return 0;
>> +err:
>> +	of_node_put(cpu);
>> +	of_node_put(codec);
>> +	of_node_put(platform);
>> +err_put_np:
>> +	of_node_put(np);
>> +	return ret;
>> +}
>> +
> 
