Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 234FC687832
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 10:04:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5BAB847;
	Thu,  2 Feb 2023 10:03:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5BAB847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675328690;
	bh=4uGx4yay+6lyQnqcpulVDm/b0lAJ05l2PoyxcLQhiK0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JPSphtKyhdzniq7RcA9N5RkEn22OO0PGbuD+rYyVE9yfdiC/o4DNSSCVOjN5kseOy
	 RXF7CfNZ7p3TlIjEnCYHN72Ck757A00hOVinvdH1MltUeyhQEj7OKcaTe+JEZSBTTQ
	 o0uljBtXg5AWbJBsLy8151kHP33M3gtWZKAmvdbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34702F800E3;
	Thu,  2 Feb 2023 10:03:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DA34F804C2; Thu,  2 Feb 2023 10:03:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2492FF80169
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 10:03:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2492FF80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YRPfCH+G
Received: by mail-wm1-x331.google.com with SMTP id bg26so845600wmb.0
 for <alsa-devel@alsa-project.org>; Thu, 02 Feb 2023 01:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7F5YTzHrVyr8QuuHkXVmJUZpVCaBRGUSFsoCx+3N03A=;
 b=YRPfCH+G/7MHufVPyLtQ5D6FdhMqwLFJYSOac8c/Rj1F2Jbm+ohgMFD5UqVOzA9n+N
 zXg/aNARZWYNUeouOB6k/YqLD3EfqO1J6wzwMs+J7FuaMnQwn+DU/qRwvsoQZanwlmA3
 sfAPy1q3gHeva2N+wieTu4yxYo9TCnFXGLrt8aokgh0ChRIAqMfcVuJiLhmcsDXXfqK8
 HQTXR7anVDaTR/8M+X3+cVq/DYB051MgGJ/tNGPkixjwlPM5aZOjMiMDO6ExEwZAffRZ
 XojjWXnGuUNdEZx4ai8C7958LsMP3SdayNjk08nH6vVeSksYfzLeqTMYKwxrJbifaNbP
 I5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7F5YTzHrVyr8QuuHkXVmJUZpVCaBRGUSFsoCx+3N03A=;
 b=m5JcKz2COhyKwGkGcMSsv0U+dHzchk5PDBKQKMGm613DGcFbvFZwuyRb1uy+43+i/+
 P+UZoi0AjJatnrQ47bzHafrxl4luRygB57J4oqSMaBbvl7wgBeZmoXj+DPPinkCfAoXn
 2o0FSRQeV/vy/GboGmw/Xbf+7P+E4EldkZZ+L2fgN5y1KAlr9GtbJJ+hM01X39/vLIRj
 4KyAg7nitIA7vF3HRJXfEqD81rJ9t86aa5nf529TVTPh79wGc62h0YxsUFKApI3xF1Ma
 mEaMjmfr4FfQxTlj2y+mtXRFQJ0PWzqPz7/JQPSw7J8Z4MO4CSuvklguCeTNr3Zkmlhp
 a2Gw==
X-Gm-Message-State: AO0yUKXZzHM4JZHQoBJwoo2ND65H1A1wb1lb/47AFGjhrthFkSSgSW21
 s2fKWdFrpCQMnEzKSBU4g0eUpg==
X-Google-Smtp-Source: AK7set9lAC5MNe/nu7qxCknw/Oxh/cCzvtvfddKrsencwwfHUr3rd+VCW9H823WXjZIkxGD/S6ERcg==
X-Received: by 2002:a05:600c:4f03:b0:3dd:e86e:8827 with SMTP id
 l3-20020a05600c4f0300b003dde86e8827mr5019102wmq.4.1675328613859; 
 Thu, 02 Feb 2023 01:03:33 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 ip23-20020a05600ca69700b003dc59d6f2f8sm3877475wmb.17.2023.02.02.01.03.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 01:03:33 -0800 (PST)
Message-ID: <a21e7783-cb1c-8fec-78e7-bdffcd5e25f1@linaro.org>
Date: Thu, 2 Feb 2023 10:03:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] ASoC: dt-bindings: Drop broken irondevice, sma1303 binding
Content-Language: en-US
To: Ki-Seok Jo <kiseok.jo@irondevice.com>, Mark Brown <broonie@kernel.org>
References: <20230201131059.65527-1-krzysztof.kozlowski@linaro.org>
 <1bcd61d6-810f-1239-1b6e-367e0fe87370@linaro.org>
 <Y9pxGUMWyMeXQpZM@sirena.org.uk>
 <6491d6fb-2a10-1c80-d422-8300d5a75ce4@linaro.org>
 <Y9p+p6wt8WugDBuH@sirena.org.uk>
 <SLXP216MB00776F066D70DB2F3F77B09E8CD69@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
 <SLXP216MB0077228B6071F62B183F4D648CD69@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
 <6439a587-0b65-a037-1013-b697e19000a4@linaro.org>
 <SLXP216MB0077847FB6CF0EF4511E3A628CD69@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SLXP216MB0077847FB6CF0EF4511E3A628CD69@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 02/02/2023 09:58, Ki-Seok Jo wrote:
>>> Is there anything else I should do?
>>
>> Correct the binding:
>> 1. Add all properties - just open example-schema and your file and
>> document everything 2. Fix non-existing reference (there is no such file
>> as name-prefix.yaml) 3. i2c_bus -> i2c
> 
> Fortunately, I modified the 3thigns you said, and I also tested with the
> above command with the contents.
> 
> So, I'll send the patch file again.
> If it has any other problems, please give me feedback.

My revert was not applied, thus please send incremental fix to the bindings.

Best regards,
Krzysztof

