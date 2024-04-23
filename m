Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C288AF2FE
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Apr 2024 17:56:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66321F52;
	Tue, 23 Apr 2024 17:56:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66321F52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713887782;
	bh=Ej8/m7SdFnqgrwQhjVcEPBmt81QzHjxp6CjbBxx+vI0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CfNSnO4UpSput8XQhddyCyT1r/7OezUzcz3RjdafYGj+cszzZ94Ev9M6+XzcMqzz3
	 xQ9NTN3D9PuAfVPsxD0LSE2cJz0IiAAOWQwxT6zt6NrWSDYo87rUR9zRUNcu9wQN5x
	 R4hJYtj5Yo/rS7OSK4Lav7BPEfnFR5aS5qD9svRU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F12AF8056F; Tue, 23 Apr 2024 17:55:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5F20F80570;
	Tue, 23 Apr 2024 17:55:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9A96F80423; Tue, 23 Apr 2024 17:55:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10B4AF8003C
	for <alsa-devel@alsa-project.org>; Tue, 23 Apr 2024 17:55:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10B4AF8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FmRc3DC5
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-345b857d7adso4613984f8f.1
        for <alsa-devel@alsa-project.org>;
 Tue, 23 Apr 2024 08:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713887734; x=1714492534;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IW7ZL4jAlMLz9cl+B/4SKCxX48cMreRrpQi5eMp0DZg=;
        b=FmRc3DC5BeAHDqzA94fYsRTZLaxo8HCHFo3GUwky2s/MzI6VvcvutIl4EFdYkb6WLM
         ikFJPgH3VWyaBOU/hFcqmF7e/saOGtuGgaK6JDZHMMkhLrhajUGgpOFmbHC1qgathLbn
         sRU8jDL5aoY9JlRPQvpO42tMvpvDiXwmwNTktaC1m3I1f6M+rLwAVFz+KB9JItziQRXi
         r8K6yMfnLH6GSRYXu++AhglixgGagndBVUdwhqHPl8HgpafXdW62texcJNoS7qRWHRQx
         XI/pl78dZFKr3/4T2qDNCh6sxkjUd/CUvj6ori7utXUfHBx0KCogpqDkzNbCZ/0zw0Fb
         RSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713887734; x=1714492534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IW7ZL4jAlMLz9cl+B/4SKCxX48cMreRrpQi5eMp0DZg=;
        b=eX6925FHv5vD16pJEZ9k/0EEaDipu/rcw6bo3z66CIYYp75oc9SDIZAWcFC0zujn8B
         EchfjySG4IqkHrrS5VzPF2LfPAl5axEoE/8Dhyp6tmrP9n/9PDUaaz9HNGYAvobGP5Uk
         8MSLOeaqG+BjIw8jbNNb4UkuIeNVKDyFdkgWv9OJtFQDoBRsRQ9KL2N14EtvSbog+7bh
         zgDUMS7QZtPGgWYaEwn8m43IA28lv5ouv641f+8Hfm/g0aPF/dvwPXv/kEznWDP6Ybnx
         WcLy2NrveMwqu+cAS6FheQ+pBS7Th/GP1HsRNMsEwgd5ZarPDIFRrj3jKpOBvMjYsXWI
         6n2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyQesKTn6dcqogfXS7GoTBxqQCioYJrJTr3iMbdemshuGglEb77EFTVwALR6BI1N9K3spN77bUp6QZ6ZIckfMbokL/faR2f6iKaa0=
X-Gm-Message-State: AOJu0YydeJfS5n0o/iruq3EfaMuLb4RiTeHLEYyCupz0kQElFmVBBY0L
	RyTvjb2qdCDJmGkQrrfwgJCiC5tQGYR3cX+/jpU42mZONpxx1GjHkAhgRtEIeus=
X-Google-Smtp-Source: 
 AGHT+IE8hjf2SDJhBCEz7Eup94Cqf+emuhCs+kF2rRPWSjs9aeWo2uin89OSuJPdxvp0W8z6jY9zNw==
X-Received: by 2002:a5d:69c1:0:b0:343:ef1b:9f69 with SMTP id
 s1-20020a5d69c1000000b00343ef1b9f69mr11023947wrw.43.1713887733821;
        Tue, 23 Apr 2024 08:55:33 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 a6-20020a05600c348600b0041ab78cb237sm2690632wmq.31.2024.04.23.08.55.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 08:55:33 -0700 (PDT)
Message-ID: <b9d0e2fd-069c-439c-a85f-1e99bf9018c3@linaro.org>
Date: Tue, 23 Apr 2024 16:55:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] ASoC: qcom: common: add Display port Jack function
To: Johan Hovold <johan@kernel.org>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20240422134354.89291-1-srinivas.kandagatla@linaro.org>
 <20240422134354.89291-3-srinivas.kandagatla@linaro.org>
 <ZiejT5yddioQ8upR@hovoldconsulting.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <ZiejT5yddioQ8upR@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WLCG4E4ZTCA6JXDE2VI3Y6YZGDKFCGZI
X-Message-ID-Hash: WLCG4E4ZTCA6JXDE2VI3Y6YZGDKFCGZI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WLCG4E4ZTCA6JXDE2VI3Y6YZGDKFCGZI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 23/04/2024 13:02, Johan Hovold wrote:
> On Mon, Apr 22, 2024 at 02:43:52PM +0100, Srinivas Kandagatla wrote:
>   
>>   static const struct snd_soc_dapm_widget qcom_jack_snd_widgets[] = {
>>   	SND_SOC_DAPM_HP("Headphone Jack", NULL),
>>   	SND_SOC_DAPM_MIC("Mic Jack", NULL),
>> +	SND_SOC_DAPM_SPK("HDMI/DP0 Jack", NULL),
>> +	SND_SOC_DAPM_SPK("HDMI/DP1 Jack", NULL),
>> +	SND_SOC_DAPM_SPK("HDMI/DP2 Jack", NULL),
> 
> Shouldn't these be split in dedicated HDMI and DP jacks too? What if you
> have a machine with HDMI and DP jacks which would otherwise both claim
> "HDMI/DP0"?

These map to the Jack's added as part of qcom_snd_dp_jack_setup and 
belong to DISPLAY_PORT_RX_0, DISPLAY_PORT_RX_1, DISPLAY_PORT_RX_2.

If its going via USB-C DP controller it will be either DP or an HDMI ?

This is the most common naming for the USB-C DP/HDMI jack events.

Qualcomm LPASS in some older SoCs had a dedicated HDMI interface which 
is different to this one.

Usual Other ways to connect HDMI is via external HDMI Bridge using I2S 
interface which totally different to this DP interface.

So none of these will conflict.


hope this clarifies.

thanks,
Srini
> 
> Johan
