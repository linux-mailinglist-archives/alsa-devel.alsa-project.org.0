Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B306D1BAF
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Mar 2023 11:14:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BD601F9;
	Fri, 31 Mar 2023 11:13:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BD601F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680254077;
	bh=GXQzMvN9P0xySru3ubxWlFL5jW7wuILuT5nMRGGI7Go=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SoNmmgozXjGtM6YT2yH5znc9fJse5atmcGyI/6KMWWHaewrNbk694dLi6w3lFzx1L
	 1LJ8BBJOgb9WRaRJ9OU5PmK6oSlJ8m1QWxdzeEKYoKF3zQ7V70blm1X6GYzszCK3Fu
	 sHUSX89YgdSoKVdBPu1zowg7FNUZjaS8vCwn6R4c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC220F8024E;
	Fri, 31 Mar 2023 11:13:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FC8FF80272; Fri, 31 Mar 2023 11:13:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1DBC1F8021D
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 11:13:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DBC1F8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=WC+wOwWs
Received: by mail-lj1-x229.google.com with SMTP id e9so7069429ljq.4
        for <alsa-devel@alsa-project.org>;
 Fri, 31 Mar 2023 02:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680254012;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z3/dMT5UuvB37dzopTiUDnIZpm0CxSZnHqspthqK8JA=;
        b=WC+wOwWsj7fRR25XoXXAcsaXtlPkMrYEP9HQrUhPItIXCsAKujQ+jhC85kkmJIwDj4
         YuwlzhEuZhRYxemC60ky7ScWF4O/0qJmdVjzbfN+zR/Tj+uVK4dK/p5StJKLwz6NUgOC
         rktLz37FXgVzoYaYnahi7FBL3lwIX6IvHYuX2E33MpJOPCAKZBdiUpLu29nH/0V9nq4y
         gJZr3UqhKk7ysi4Obz7k3FRlv9oevLU2nWqRM1k1azIm/mDbsec+FSqwTmhmlLE72fwh
         6xmHBUJ7YA3whLJQkeyj/4ta6daNjC9oWqLJ32gY6Z7FM4o3WL1J3cmQKnl3p8ocnOpf
         18AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680254012;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z3/dMT5UuvB37dzopTiUDnIZpm0CxSZnHqspthqK8JA=;
        b=uJ07zNGjz99MZwlsxfS/Y+e2FSjd3yUeGd/8l24WCG68PFEf+LOkaUHPM2Tkizb2sH
         G5zE/t8l05T9ZLIP+tkDghQgQG2SE3I3UpJZWSoklbtmEwCTCw1P40UJabJjbPsdGBIh
         aubG+s9w8qKz33VCkHtWQhcerTmgiNDolUqH/h2HZebRSvoXENJzWo8NSyTSa7nlXEEy
         IaGM1EaJTj+bm1fUOEitxxsvrygptSfM0uUt+kVSPgep2WPn+WgC3XZe/POwSIMjViLe
         DUYqw+vPfih/NFT/R4tEy7HZOz1tlwu6zuUhu6nIJAvu8u4IZbM3u1hTQWvBnUCgytu5
         Xvcg==
X-Gm-Message-State: AAQBX9cvA56dcS2V3B/wt9dzqlUQ2fnVbX1upAieNUDCYP7Qk0mlJmOM
	h6l3XOnrW/l/yy5P01gl2RRSVw==
X-Google-Smtp-Source: 
 AKy350aHqb4lGEq9xuL+CqwXWf+p1B4k/YE/fjbuw1FXgrTSK9GNORIG36d7rS2+r93bTRU954vAmA==
X-Received: by 2002:a2e:9e98:0:b0:29c:d0ef:481c with SMTP id
 f24-20020a2e9e98000000b0029cd0ef481cmr7710603ljk.28.1680254012225;
        Fri, 31 Mar 2023 02:13:32 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id
 j18-20020a2e8512000000b00297dad1a2b0sm267241lji.103.2023.03.31.02.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 02:13:31 -0700 (PDT)
Message-ID: <6d39e9c3-fb6a-4b2a-9889-8fe8d86716d5@linaro.org>
Date: Fri, 31 Mar 2023 11:13:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 2/5] mfd: Add support for the Lantiq PEF2256 framer
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>, Lee Jones <lee@kernel.org>
References: <20230328092645.634375-1-herve.codina@bootlin.com>
 <20230328092645.634375-3-herve.codina@bootlin.com>
 <20230330160510.GB489249@google.com> <20230331094208.41ab4420@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331094208.41ab4420@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FSTPWH63O7XRU4DDS55CVAQ4YWTOU7N7
X-Message-ID-Hash: FSTPWH63O7XRU4DDS55CVAQ4YWTOU7N7
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FSTPWH63O7XRU4DDS55CVAQ4YWTOU7N7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 31/03/2023 09:42, Herve Codina wrote:
> Hi Lee,
> 
> On Thu, 30 Mar 2023 17:05:10 +0100
> Lee Jones <lee@kernel.org> wrote:
> 
>> On Tue, 28 Mar 2023, Herve Codina wrote:
>>
>>> The Lantiq PEF2256 is a framer and line interface component designed to
>>> fulfill all required interfacing between an analog E1/T1/J1 line and the
>>> digital PCM system highway/H.100 bus.  
>>
>> My goodness!
>>
>> It's been a long time since I've seen anything quite like this.
> 
> Yes, old things but working on recent kernel.
> 
>>
>> My suggestion to you:
>>
>> * Split this up into components that fit functional subsystems
> 
> It is done. The audio part is present in ASoC subsystem (path 5 in this
> series). pinctrl function is implemented in this driver and, as I don't
> want to share registers, I would prefer to keep this function inside this
> driver.

The amount of defines and huge functions like pef2256_setup_e1()
contradict it.

Even the pef2256_setup_e1() really does not follow Linux coding style -
you know the size requirement, right?

pef2256_get_groups_count, struct pinmux_ops and others - this is
pinctrl, not MFD! They cannot be in MFD driver.

> 
> Also, I sent a RFC related to HDLC and PHY. In this RFC, the pef2256 is
> considered as a PHY and handled in the PHY subsystem.
>   https://lore.kernel.org/linux-kernel/20230323103154.264546-1-herve.codina@bootlin.com/
> 
>> * Run checkpatch.pl
> 
> I did.

There are tons of weird indentation,e.g.:
+#define     PEF2256_2X_PC_XPC_XLT	(0x8 << 0)
        ^^^^ there is only one space after #define

... and other style issues:

CHECK: Please don't use multiple blank lines
CHECK: spaces preferred around that '+' (ctx:VxV)
CHECK: Alignment should match open parenthesis
CHECK: Macro argument reuse '_groups' - possible side-effects?
CHECK: usleep_range is preferred over udelay; see
Documentation/timers/timers-howto.rst
CHECK: spaces preferred around that '/' (ctx:VxV)


> 
>> * Remove all of the debug prints
> 
> I can do that in the next iteration if really needed.
> 
>> * Move all of the defines out to a header file
> 
> These defines are related to registers. As I don't want to share these
> registers, is it really necessary to use a header file for them ?
> 
>> * Be more verbose in your documentation / comments
> 
> I can improve the API documentation present in include/mfd/pef2256.h.
> Do you thing that is necessary ? Only a few devices will use this API.
> 
Krzysztof

