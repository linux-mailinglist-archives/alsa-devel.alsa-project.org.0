Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE96691E8B
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 12:43:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3814843;
	Fri, 10 Feb 2023 12:42:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3814843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676029415;
	bh=ySFMVBlnxHOb5Y96rtve9uPJPbijU4A0bfrUpEuxnxI=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ht20xHpXERzdgiYv+dotn1RDZeMMcN3mrLByu7ZAR5p2DsSAiEn4Cna4hQ/4xXhWo
	 BAjQHI6gFr/a7EiPodzzh0xdXN+mg0Kc4zCauIdEXagfyMQxueeOUiZ3DJDEjCwBi8
	 puNehVV/76D+/Is3P03eoZWFMuCkLnTpBB/ddw4U=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16426F800B8;
	Fri, 10 Feb 2023 12:42:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B348F800E4; Fri, 10 Feb 2023 12:42:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3D666F80094
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 12:42:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D666F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cBtmB/qS
Received: by mail-wr1-x432.google.com with SMTP id bk16so4771300wrb.11
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Feb 2023 03:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ySFMVBlnxHOb5Y96rtve9uPJPbijU4A0bfrUpEuxnxI=;
        b=cBtmB/qS2YRjTQINDzh4Uev44unqt248JmvcIQWQySbdWIs9og6UYKQPi4Vj43FVae
         M20C5g2TPa8H6soNBdCiknRSzq+NfdzxXMNz4E87dSifQ2mkNpcPtDGxADTChjNv6kkb
         DyP9mHOf+Jhq285bfm1UwfqDdJ6Tg4jarVXXqEUK/VAHiE60k1Eh4t4fvPqi1dDI8LyR
         wt/FjjWPyccx79ZnI9TnWVMy5VNA4bl2ZwrQGFl92aVpPUp56rwvAyn4dbUFOYhh4WKB
         EOEtFo58jwZWJaS2DzHg6cXpfEjbeSpcy8B65r2sYOaEkSXkWB1a/exnSwsSTFeQN3OU
         2/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ySFMVBlnxHOb5Y96rtve9uPJPbijU4A0bfrUpEuxnxI=;
        b=OCRIqWM3GU6QEpdJJxlhf1Q8oQBYob7Cr00WvScNISG/sQrm1yczs88/wCU+Ucg2yL
         /0qzIcAcWne07eGMhWMG3GxfPLHOB0vY5BFrutcKcHST7YH4j+uSp6vLMuj0ycA7GvT1
         UbBRDV617MfvfZKMGm7I11dATQslDR8uqKo2AJQcovjBf6OojldrxHaaVJCC2ksbIGju
         dnF+GOZdiLz2oHsfG+GbXop+LjtLHCuEzNw7bRvmG6Z1UYR5okTdEW0MVzKaFfWaHogw
         ie8UVXV0JoCWGdXg5tksJGP7yy9pC0QLUyh6DyJDhuzgPaMhsf5hItBjZrZyeQJ2Kiy8
         nIiw==
X-Gm-Message-State: AO0yUKX+BAefzZm/lJhZYsYEv1i2f027TRWp1rljDk00doA2w35bOyPd
	rG2mtvJTxXIWUslE2V4l7XuWrA==
X-Google-Smtp-Source: 
 AK7set8XXnPNrt7IWyasppe1/1a8+HcM15XPzrRHWU+jxvFbBG89hkqokhp7yTCcVa+37B621VmN/Q==
X-Received: by 2002:a5d:654a:0:b0:2bf:b3e9:d338 with SMTP id
 z10-20020a5d654a000000b002bfb3e9d338mr13034559wrv.31.1676029346256;
        Fri, 10 Feb 2023 03:42:26 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 t2-20020a0560001a4200b002c3ef7e74bdsm3330917wry.73.2023.02.10.03.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 03:42:25 -0800 (PST)
Message-ID: <8e78d645-c3e6-0575-0e3e-412d03eec640@linaro.org>
Date: Fri, 10 Feb 2023 12:42:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 4/4] ASoC: cs35l41: Document CS35l41 shared boost
Content-Language: en-US
To: Lucas Tanure <lucas.tanure@collabora.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20230209083726.1337150-1-lucas.tanure@collabora.com>
 <20230209083726.1337150-5-lucas.tanure@collabora.com>
 <9b20bdb2-64e0-4888-e8df-fdf1b021c445@linaro.org>
 <a6601fb7-284b-f51a-25a5-09b7733fd5f6@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a6601fb7-284b-f51a-25a5-09b7733fd5f6@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: EBO5AMDLIG2FWL7JSTDCPUFLIVHO6LB3
X-Message-ID-Hash: EBO5AMDLIG2FWL7JSTDCPUFLIVHO6LB3
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EBO5AMDLIG2FWL7JSTDCPUFLIVHO6LB3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09/02/2023 11:26, Lucas Tanure wrote:
> On 09-02-2023 08:53, Krzysztof Kozlowski wrote:
>> On 09/02/2023 09:37, Lucas Tanure wrote:
>>> Describe the properties used for shared boost configuration.
>>> Based on David Rhodes shared boost patches.
>>
>> No improvements in subject, I asked twice for it. What does the command,
>> I gave you, print?
>>
> Should be
> ASoC: dt-bindings: cirrus,cs35l41: Document CS35l41 shared boost
>

Yes, thanks.

Best regards,
Krzysztof

