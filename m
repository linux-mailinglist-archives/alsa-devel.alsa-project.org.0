Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D93C6F904E
	for <lists+alsa-devel@lfdr.de>; Sat,  6 May 2023 09:44:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84F172B63;
	Sat,  6 May 2023 09:43:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84F172B63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683359052;
	bh=noJFXBQCxFcwpfQt3K/PRrXpMZ9IvWjcRtW3O+wbsKk=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eJ6SUybaXXx8yEVKY28FXsqgo6j81NjvnYIZt0n/hHZdiQur7ve/m5KBZtx9UMpLG
	 Pyj3DxCn2RHWi6G82hmssaPoITzxoCWC0GkZ1RaUlqxEsVvGicynn82ph5Hq5Pbluq
	 IV4b8s08sIovt+voJtV0XrYHmvikbpSoN04eVBMo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB8CAF80520;
	Sat,  6 May 2023 09:43:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B08A3F8052D; Sat,  6 May 2023 09:43:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1AB8FF80520
	for <alsa-devel@alsa-project.org>; Sat,  6 May 2023 09:43:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AB8FF80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=aafNNnNg
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3062c1e7df8so1737800f8f.1
        for <alsa-devel@alsa-project.org>;
 Sat, 06 May 2023 00:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683358981; x=1685950981;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fW4KRIYUMRVsD5UctMtgx/S9KUAXGGFHwiF8ujkNxLM=;
        b=aafNNnNg3WETWSnrpa2zXFujk6MCMhxzi/+xAHoyg6PlXfPHNnnc0gYXK2171mT2cz
         5DsjTcEWGKhu7nVn23M8T8V/3vrb5F6Z5ZzESgcJxBkaSkxzO31v1wflW4qXVyeU3xak
         Go1j3XCxgmdqoSWWYk9LKCWVXxFtIPTtEuiwEczJqW6tByz9BOE/LMGZSpeSbWMROq9u
         XOkGZOtOW0z42kvPgsARNjFixrDfmNZ49QVP/deCXzfuHQFJn1zIj8p6nF0/MHOrmNHS
         H/OPnpdlLOguj4ZAiNERbzwIsDYBzEI0CCmBELYwuW+7ZYBBTvwC+xdzZ6WHMjpPsbuO
         juCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683358981; x=1685950981;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fW4KRIYUMRVsD5UctMtgx/S9KUAXGGFHwiF8ujkNxLM=;
        b=WzVwljjVpUOjDA+uXtMtxUCyXaGnBZNcHFV1bUbJyww48QX1UxTsxU010mEZIUTHDw
         2r3h7YXAFaB3VGdPThy2D/7789Mocf8slYD/556P5wfePs/ti6WmVBNuOVEO4fRZLSVm
         /iHdtIvLznnCvTanT9u8bYlDPZyIVpHKr4JkMHXWHgXM6FEw7AKaXj4/PqtLr1sqwBVH
         jJsbbhj8V/dc0fQj4hohaRuCd53AjvzyP/e/6AQO6aFd6xC4VxPs5KClztlVUUHu7AO6
         hmDgAacCBTUAaf87VX5Yy+2ZlcCe2d1wvSikM5MKI6VyOylEYn5F0mvoo/vEMkOfaOdl
         ppXA==
X-Gm-Message-State: AC+VfDyBEtQhf1/Rpf06qQTgrcxF5YebrG7nzRhOCg2GW6i3dmRwy/Al
	jDT9I/Bm5LO9sOVchJC3pGDTtQ==
X-Google-Smtp-Source: 
 ACHHUZ605kDOxqkmkZRMGKiOsisZf8+xAmQJT2IqoRzmIBY9Zxj+uSKlW43jZ7WJHJR5CY76pECKBA==
X-Received: by 2002:a05:6000:c:b0:306:32fa:6737 with SMTP id
 h12-20020a056000000c00b0030632fa6737mr2892704wrx.8.1683358981048;
        Sat, 06 May 2023 00:43:01 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 o17-20020a5d4091000000b003078a3f3a24sm702366wrp.114.2023.05.06.00.42.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 May 2023 00:43:00 -0700 (PDT)
Message-ID: <4823a770-f3c4-695f-5699-4c8d8179b507@linaro.org>
Date: Sat, 6 May 2023 08:42:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/3] ALSA: pcm: add snd_pcm_add_chmap_ctls_with_prefix
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20230505165514.4666-1-srinivas.kandagatla@linaro.org>
 <20230505165514.4666-2-srinivas.kandagatla@linaro.org>
 <87ttwqgfxh.wl-tiwai@suse.de>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <87ttwqgfxh.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ATHBKPHFSEDUY2XU2XGPV3MMSZUCE7QD
X-Message-ID-Hash: ATHBKPHFSEDUY2XU2XGPV3MMSZUCE7QD
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ATHBKPHFSEDUY2XU2XGPV3MMSZUCE7QD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 06/05/2023 06:57, Takashi Iwai wrote:
> On Fri, 05 May 2023 18:55:12 +0200,
> Srinivas Kandagatla wrote:
>>
>> On Qualcomm SoC which has multiple Display Port controllers, using
>> snd_pcm_add_chmap_ctls() to add chmap controls from every ASoC hdmi codec
>> instance for a give card fails while adding second instance as the control
>> with same name "Playback Channel Map" already exists from the first instance.
>>
>> Fix this by adding a new api wrapper to pass ASoC component name prefix to
>> avoid such duplicate control naming.
> 
> It implies that you have conflicting PCM objects with the same PCM
> device number from the same card.  How can it be?
Thanks for the inputs, this is only issue with my local changes, Sorry 
for the noise, Please ignore this series.

I had some local changes to debug an issue around pcm device numbering 
with backend dailinks from device tree and frontend dailinks from tplg.
Will start a new thread to discuss this issue.

thanks,
srini
> 
> 
> Takashi
