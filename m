Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E784F906AAF
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 13:05:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C9F4E66;
	Thu, 13 Jun 2024 13:05:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C9F4E66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718276729;
	bh=tAcSgvKXqfnSUFX2CtxDigGjnUYTBy78IoinGdlH2fw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tan9AhIf6vLkrjcVadXdOelGEvN36gTV4o+OjYwZtObs4/Nu7HRNK2XN2VHNh86Bn
	 RAUCEs1+JYk6vYQP+jMYfxiBsvtD4u+2gu2cXbYJNqIPY+rJfqlttEIXPYnaqLOlWA
	 oHhb7XAHTrPOYWaVIra18UjhTW/8D32LH/Kz7dTo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40ADDF805B6; Thu, 13 Jun 2024 13:04:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DADF0F805B3;
	Thu, 13 Jun 2024 13:04:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56DE6F8057A; Thu, 13 Jun 2024 13:04:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D65D5F800D0
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 13:04:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D65D5F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xyuM40u9
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-57c83100c5fso789608a12.3
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Jun 2024 04:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718276690; x=1718881490;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r05GSGoeixdTdrkrNQk/uUV5myauBem2SPDkvyRDYgc=;
        b=xyuM40u9jj/o4VZRlXZbcZOzPqWtnRn+MwegyIqsHfloKNP5p3MqqV8U2M75ExEp5k
         eU7c5/Qyg+wsDq6a07rGSkrUTTS35O6BBJLD9mq8HB0HASHXrjKR+46f4Er3NNcbdRJR
         TiGfTATE8tLxMU36r7oPE+QKjT+Naeq6Dfy+sm4SovI4SyCx8qthiAmQljZiHs+esCa5
         ZvYkNrFdJquM9ve5XRI1xhTZG7jJtA9nDmUnC2KgKhAlQ3VkmuSQKeHwqJDG2NMXAdwo
         IEK91jXYfURZezhaQoIVreI/dlOtskyCrFeGF+XKoir9ZLyPDQkH8LYI/Nv7myH6IPwJ
         SqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718276690; x=1718881490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r05GSGoeixdTdrkrNQk/uUV5myauBem2SPDkvyRDYgc=;
        b=XeaeAlbYjoQMNKp/CHw2Eyg/4o8d2cTVEE0D+JJma3DKBmkOx1Uo6RRetOtnXkiR9Z
         o0l0yGb5V3H8K7YTzPON8fqLly+RfNDsTYJjhvoxYBgriVrThbgJNvb7J+jLZBwF3Ted
         zlvPtlqIIOEt5Mqt7Uxbqz0nUCituIVNWZBE2UOXgcCqPBlSKDwioySaeG4QyPj84/Al
         B/LwunPjX1srNygZhOIICjz8J8HNXfcxwURKzEwqoZpDhAvd2Y14RAyF9KZ98/KgzaYC
         2UijzZjFnquaKMw+cG9Jx3ZrhuHQGgJ/i0PY/j0iYc0G6xFNs4sg5kRfa6ES1mTZC9XG
         sbiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP00eY/7+MgkjyXdeqWw92jrZG85pRQVkH5WSrU3lw+jhZOgo2m0xC1CL5rHqytmuBnWpmhm9tw9xh+hNfJlpbBZkjTWwkYGuY38w=
X-Gm-Message-State: AOJu0Yz6IobLHuQ2RGgFtmiHvDyDnZBEja4SImCNoHGUjOGaj7W7enqI
	ug2sxTjotPh0Hdhl26jA5TQb2KXMwiYC8U9WYOAN5uat24e2D0J42BtLjKqwXEs=
X-Google-Smtp-Source: 
 AGHT+IFZMCZjqTdFJ+VphErIaK9g4laFVqVLl8sNw4G7xzHX0fkq7AQsk5RVkxZ0AbcMTIBCZQzPyg==
X-Received: by 2002:a50:d7d9:0:b0:57c:5f22:f9c1 with SMTP id
 4fb4d7f45d1cf-57ca976a4e8mr3004561a12.21.1718276689646;
        Thu, 13 Jun 2024 04:04:49 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da37csm768974a12.27.2024.06.13.04.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 04:04:49 -0700 (PDT)
Message-ID: <93b2de4e-dc2d-4781-9c1b-d6ad6d888eb2@linaro.org>
Date: Thu, 13 Jun 2024 12:04:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] ASoC: codec: lpass-rx-macro: add support for 2.5
 codec version
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240612-lpass-codec-v25-v4-0-f63d3676dbc4@linaro.org>
 <20240612-lpass-codec-v25-v4-3-f63d3676dbc4@linaro.org>
 <a6793126-ba1c-4679-a2c2-eabad4f5a506@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <a6793126-ba1c-4679-a2c2-eabad4f5a506@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AZ2ZRIYVQLPQKRCJSN7D4D2M5U5S4V6K
X-Message-ID-Hash: AZ2ZRIYVQLPQKRCJSN7D4D2M5U5S4V6K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AZ2ZRIYVQLPQKRCJSN7D4D2M5U5S4V6K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 13/06/2024 12:00, Krzysztof Kozlowski wrote:
> On 13/06/2024 12:49, Srinivas Kandagatla wrote:
>> LPASS Codec v2.5 has significant changes in the rx register strides.
>> Due to this headset playback on SM8550, SM8650, x1e80100 and all SoCs
>> after SM8450 have only Left working.
>>
>> This patch adjusts the registers to accomdate 2.5 changes. With this
>> fixed now L and R are functional on Headset playback.
> 
> I was just about to respond, are you sure this is suitable for sm8450? I
> looked now at registers and sm8450 (which should have codec v2.5) has
> old style register layout.
> 
from 2.5 the layout has changed, I have verified it on SM8450, with and 
without this patch, This fixes the issue one speaker issue.


--srini
> 
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> I tested earlier version of patchset on SM8550 and X1E80100.
> Best regards,
> Krzysztof
> 
