Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A2189BF81
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Apr 2024 14:54:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6549C21B5;
	Mon,  8 Apr 2024 14:54:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6549C21B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712580873;
	bh=WEyYkpof9FQ9wxzmt9yxgXdvUZ5yezofqlz1rRRr7SE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JUiVa+M9P0FjxQiKKQgkH11vtGW4OvWmL2F/mi7ldX3PXmZiJQen20JOI0qFFLaW1
	 RSsxmP5o5zYU8ET1nImgoW7m0vorsssr85r+GSYilt7D1snKMXmpkjg58M6BxAH1qp
	 m8+6+osC9nELvqZsTJULCbkQgNQLCpUQ68Ey3MNg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CE1DF805A0; Mon,  8 Apr 2024 14:54:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BBBBF80588;
	Mon,  8 Apr 2024 14:54:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90B1FF8026D; Mon,  8 Apr 2024 14:53:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 24158F80130
	for <alsa-devel@alsa-project.org>; Mon,  8 Apr 2024 14:53:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24158F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lgeSI49k
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4165caf9b2dso11046795e9.1
        for <alsa-devel@alsa-project.org>;
 Mon, 08 Apr 2024 05:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712580833; x=1713185633;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EIfWhO56deLbZSEvQDXUk02FMIpJsCPYMFdPM9Dpyf8=;
        b=lgeSI49kNiMiL/2AlJduV4FmGzjvPZZcaGaaDS1dW9sao9OjWNQvmczcfZvxSK56hE
         a0Z8MsxhEG5ZC8LcTh7xvBlOsn/FIvNLeeQZ64aPCjstHM89QKFfXaGGgiV6hzcfaaHP
         Ldv8ivK2TFZyHlg2hMwhjxKQtbLEUxJ0swrIO1eUHjWiHhyDMvghxNq03OkSMDdUOLDH
         LyD/c9Dc1GlhTP1xguZb2GpJrfd5uo6Er7dOyOmhzGad+FlJMmb1ZIvSSDghOkDHc2WR
         ck8Xdoz4I6r0aWAEh2YYynVUBby2FqtBprRVSbGaa/A/Em4xbTrvDJ+8xc3bH2qCiq/C
         voPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712580833; x=1713185633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EIfWhO56deLbZSEvQDXUk02FMIpJsCPYMFdPM9Dpyf8=;
        b=j2OFZ4xADbY+WZz5i72fI56cyTOFp0cWDJk0WvOLjTbzI7Q121QNt9q8JXym6PlTIi
         IBS73s4bkkdDLGJSQiDS0MPm5oQl+owb+aMaIe7d62gI7GsUXNpw4bDT+8ZKGseRD5EG
         K4PsW2rnhSRV6L8HqYJ9kH+K0BoOgpK9W3SOqmKub2pUMUsSKQmIOEwIbfIzSwFXBNMB
         wL5OYpcS14/abvDqyh3iYlkPhtA0Efu3N9hK5HWgSzTO/1VXYBDAC9ImXuPJh/TBuR1q
         g5wf6K1gqWsnzKcBbi5uyYEiLiklvxZZjsepI0n8MTaPiSnh1nYqRQBkXLpyqS7F292G
         5ieA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHfKnfNc8vla2kT1fiYnQBuy9jifJT/e8LwoDMQWbfL1a71mUuFsZk0jsxm6KruwZs5sV2dF4bKqtzyGjfLEZMGBUY1c0S4PoKwuw=
X-Gm-Message-State: AOJu0Yw9Z+keOcHm++wrkb9dGQTFim1/4Ag9HpkOH6jnUxAOsPk/bGIC
	4e+GxDTPZ1vCYXckVHnj+30FRWA2gAUR/8tfnub7sUfTkhpvo6+/4SVPd4hDh2U=
X-Google-Smtp-Source: 
 AGHT+IHyE5Dd+kfClSIf5iATYVOm+3kL+yD0XMIPSdxm4HEG5u0fs2phS7pNvDc9p8PpDMGtMsfFfg==
X-Received: by 2002:a05:600c:3b8b:b0:414:8889:5a2e with SMTP id
 n11-20020a05600c3b8b00b0041488895a2emr8878647wms.30.1712580833297;
        Mon, 08 Apr 2024 05:53:53 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 bg8-20020a05600c3c8800b00414807ef8dfsm13342654wmb.5.2024.04.08.05.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 05:53:52 -0700 (PDT)
Message-ID: <baa6543c-5e2e-4f28-a95b-a086b32d1f2d@linaro.org>
Date: Mon, 8 Apr 2024 13:53:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v3 2/2] ASoC: qcom: sc8280xp: Add support for QCM6490 and
 QCS6490
To: Bjorn Andersson <andersson@kernel.org>,
 Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_rohkumar@quicinc.com
References: <20240408042331.403103-1-quic_mohs@quicinc.com>
 <20240408042331.403103-3-quic_mohs@quicinc.com>
 <45yy3cvepk4uwi2jdmh4w6l5ac3dffqhbot6xzv2bwjvo637ss@pryzth2hghyu>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <45yy3cvepk4uwi2jdmh4w6l5ac3dffqhbot6xzv2bwjvo637ss@pryzth2hghyu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DUQDJVA3PUB3MOEBXWWASZUJABXGC5IJ
X-Message-ID-Hash: DUQDJVA3PUB3MOEBXWWASZUJABXGC5IJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DUQDJVA3PUB3MOEBXWWASZUJABXGC5IJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 08/04/2024 13:45, Bjorn Andersson wrote:
> On Mon, Apr 08, 2024 at 09:53:31AM +0530, Mohammad Rafi Shaik wrote:
>> Add compatibles for sound card on Qualcomm QCM6490 IDP and
>> QCS6490 RB3Gen2 boards.
>>
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> ---
>>   sound/soc/qcom/sc8280xp.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>> index b7fd503a1666..878bd50ad4a7 100644
>> --- a/sound/soc/qcom/sc8280xp.c
>> +++ b/sound/soc/qcom/sc8280xp.c
>> @@ -169,6 +169,8 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
>>   }
>>   
>>   static const struct of_device_id snd_sc8280xp_dt_match[] = {
>> +	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
>> +	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
> 
> We now have 4 <platform>-sndcard and two <board>-sndcard compatibles
> here.
> 
> Not saying that your patch is wrong, but is this driver board-specific
> or soc-specific? Srinivas, Krzysztof?

Normally this should be board specific.

In the past we made them SoC specific and provided a way to do board 
specific changes based on compatible. Recently we stopped adding new 
drivers as most of these drivers turned out to be identical and lots of 
code duplication.

Having these compatibles will help both the userspace UCM and provide 
hooks to do any board/soc specific configurations.

thanks,
Srini

> 
> Regards,
> Bjorn
> 
>>   	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},
>>   	{.compatible = "qcom,sm8450-sndcard", "sm8450"},
>>   	{.compatible = "qcom,sm8550-sndcard", "sm8550"},
>> -- 
>> 2.25.1
>>
>>
