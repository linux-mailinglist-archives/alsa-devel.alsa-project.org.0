Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 656C37FEF08
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Nov 2023 13:25:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87E29DF8;
	Thu, 30 Nov 2023 13:25:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87E29DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701347112;
	bh=SPIvWbIv933y/XdFvXx3iX3SgmiEqTXsvp6X68e2we8=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=h1Sxcpifanz7tJBHDbCy0gp3PdmwaL62wa1wskix0KO/69U5t+5e2lSPEjt97K39v
	 mMe3XBtGR2lQHJYGvu0n755zuVpPdEIpgxtNL78g3C7//CIIJRkWeJKDM+jElzoFvr
	 C+Kbj6ucLI8oMVARXWfeILqW3G6mha0x4DHciswk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D824F8058C; Thu, 30 Nov 2023 13:24:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AC06F8055A;
	Thu, 30 Nov 2023 13:24:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A5FDF8016E; Thu, 30 Nov 2023 13:24:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B996CF80104
	for <alsa-devel@alsa-project.org>; Thu, 30 Nov 2023 13:24:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B996CF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ui7jFUej
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-54b8a4d64b5so894014a12.0
        for <alsa-devel@alsa-project.org>;
 Thu, 30 Nov 2023 04:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701347071; x=1701951871;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DohD+zPdgRQov8rgbOlj4kgq1RsGhFx7NPzpyVYUFqs=;
        b=ui7jFUejn7xWMDhPWcMHwseoduXaXLg8OHHnrrYAIJeJDdPrpSHhD7N1CW0NkFeVxc
         u/WqUzWbWqghpyzpJQqJ9KE2tHsbEeju3hacVGhGGSHSbeZjN3mn8f/PccTX0PcpdSrK
         iaAmqG++hKdntHBaYHKYlMwPfFcaCh+3jcOno6GcNpIm8/LtEvPe/Qfht+4WI7yknZXD
         U/l43SamlnbH5Syz/vNAOtsSzxYX2I5RLFU7SroK3wTj49wagSY8ixLVhFW3MBLEKR2y
         hunG4xt7f7cCA4pNXdcpODQDSTwub+ie4sHqiZ+T/Ig2zrwoIlJxNCQ7oqzlkqbYDWLo
         nJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701347071; x=1701951871;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DohD+zPdgRQov8rgbOlj4kgq1RsGhFx7NPzpyVYUFqs=;
        b=BibYgzqzgoTtPXkLKuSgw5leTJPO/94XnXogBexr5AVOMZ3JGB2kqm0FKKmH5B7smv
         Kf6v3uvi0OobwRal7hQoX/eiNYt8Jvbo6uNJx+jt4kKvCiJ8e7h4JH89xiNimSGJBAJ4
         h0ExWexjE2w8Dy0OTznZXpVQHUWOdMaBBET+a8gE2TEOYoUd+MYnuZo5WDoABsfy+TqS
         txuwgXKme5fm4y9OJhZ+MwxnTxcErlrWo5TJY+ryF2RoopCfTIJzbqzf+8hepCtlIhqW
         9eJmfQT4yTKUQTz7XJ2BmniA+bNBbbptkqwnguv+L7YF2XUyNLgx4v1+ry83r2tqrfDY
         OACg==
X-Gm-Message-State: AOJu0YxaWaVNbgDTG4pqxZDMxw5DvpOK1HCWylro4mvUNNtZiZFCepzu
	o2JXz0/TP4oPbZ/xtZe0Disuqg==
X-Google-Smtp-Source: 
 AGHT+IFioR13YQ+qfneJ+7APmy6pnKR276TO+VIZUZm+mbkgfJynRObFBd7p0BnwIiZlFKKqRuzaEA==
X-Received: by 2002:a17:906:b20a:b0:9e6:4410:2993 with SMTP id
 p10-20020a170906b20a00b009e644102993mr11763050ejz.18.1701347071507;
        Thu, 30 Nov 2023 04:24:31 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 e20-20020a1709067e1400b00a17ca6996a2sm620669ejr.178.2023.11.30.04.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 04:24:31 -0800 (PST)
Message-ID: <0cf0b5f0-165d-401a-a2ec-2fada4fdcebf@linaro.org>
Date: Thu, 30 Nov 2023 12:24:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: qcom: audioreach: Add 4 channel support
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20231020084919.18628-1-krzysztof.kozlowski@linaro.org>
 <f882b666-8a68-4341-a143-cb226ab7d22b@linaro.org>
 <81b23ae7-bb01-4c23-80df-df171fbc2d08@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <81b23ae7-bb01-4c23-80df-df171fbc2d08@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6IAZGWCXVIH6KZUM6DQKLVECGFI5R2W5
X-Message-ID-Hash: 6IAZGWCXVIH6KZUM6DQKLVECGFI5R2W5
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6IAZGWCXVIH6KZUM6DQKLVECGFI5R2W5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 30/11/2023 12:17, Krzysztof Kozlowski wrote:
> On 23/10/2023 10:42, Srinivas Kandagatla wrote:
>> Thanks for the patch,
>>
>> On 20/10/2023 09:49, Krzysztof Kozlowski wrote:
>>> Add support four channel streams.  Map channel 3 and 4 to left/right
>>> surround ("quad(side)" from ffmpeg standard channel list) to match what
>>> is in qdsp6/q6dsp-common.c driver.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>
>>> ---
>>>
>>> quad(side):
>>> https://trac.ffmpeg.org/wiki/AudioChannelManipulation#Listchannelnamesandstandardchannellayouts
>>> ---
>>>    sound/soc/qcom/qdsp6/audioreach.c | 25 ++++++++++++++++++++++---
>>>    1 file changed, 22 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
>>> index 5974c7929dd3..4dd2a2e261c9 100644
>>> --- a/sound/soc/qcom/qdsp6/audioreach.c
>>> +++ b/sound/soc/qcom/qdsp6/audioreach.c
>>> @@ -833,6 +833,11 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
>>>    	} else if (num_channels == 2) {
>>>    		media_format->channel_mapping[0] = PCM_CHANNEL_L;
>>>    		media_format->channel_mapping[1] = PCM_CHANNEL_R;
>>> +	} else if (num_channels == 4) {
>>> +		media_format->channel_mapping[0] = PCM_CHANNEL_FL;
>>> +		media_format->channel_mapping[1] = PCM_CHANNEL_FR;
>>> +		media_format->channel_mapping[2] = PCM_CHANNEL_LS;
>>> +		media_format->channel_mapping[3] = PCM_CHANNEL_RS;
>>
>>
>> These are fine, but duplicated from q6dsp_map_channels(), Please
>> consider using q6dsp_map_channels().
>>
>> Also when you do that pl get rid of PCM_CHANNEL_L and PCM_CHANNEL_R
>> defines in audioreach.h
> 
> The code is not exactly equivalent, e.g. for one channel L (=1) -> FC
> (=3). I assume that's okay for you.
> 
Yep, that is okay for me.

--srini
> Best regards,
> Krzysztof
> 
