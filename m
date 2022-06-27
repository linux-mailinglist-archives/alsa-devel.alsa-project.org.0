Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BCF55B973
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 14:12:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 005B71661;
	Mon, 27 Jun 2022 14:11:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 005B71661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656331940;
	bh=3EBy0UU/AtgvOL/f3Cl80Fmb6EXiCIRY2nBldKViqBw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o82Tee6IXv0ipuVCnX2qDpzYpvOktWxmK3Qof1I3u6LBXL99Gsklh5iWZDbegSVJx
	 bOyqugUZb+pDz2/ApNsQ8tdD6ZBlYzsAOJ1jB5KJZLDp8cCniSlDTHxEhW+frki0V9
	 A+IDQr/YWCg509qt508TrZO3/v+6AJRh0jaJLVJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A07EF80107;
	Mon, 27 Jun 2022 14:11:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC11FF8028B; Mon, 27 Jun 2022 14:11:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34808F80128
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 14:11:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34808F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="pKEwEnLE"
Received: by mail-ej1-x62a.google.com with SMTP id fi2so18680918ejb.9
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 05:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=C3KL/sYPaJbDkn8gHvUu80xf6BHf0wMPSq7pgt2dfq4=;
 b=pKEwEnLEh8eqTkxHzxxMwYACs1ZSGTH5+wEp9YlifpBiyk69QxOsm0mfCb0/1Ya20f
 M6WIuZaXX1CT47L2Vf+JZGLNmbP2UKH+lfLAAZI7/pfli1Jzf/Kpk093ITmcNLIwwwHg
 3K/coyY0CPCy45hA5P04xwlclE1EW0HaPQfHboyYOyVl0O18seEg3KcqiaJAMPw8341u
 cdawriRVsEB71eokqznyk4+g4n60khejwOpfca1/nvrv1Xky5yzoeJAqX0eU29kw5gPD
 lDZl6n0pdnkSWSrEdjHuMnoAAcZ7z9yrZ7pfWf5FUGv8TfwDKvGGanfFEXAvPhaQezo9
 efQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C3KL/sYPaJbDkn8gHvUu80xf6BHf0wMPSq7pgt2dfq4=;
 b=PhU2zbPmjbYj6gkegSl6BU/HRsVMEgeSmPdqnwEuOY69O73zyLvVjLpTIzclbSBNq1
 8FXP/fTFPTDLWUTQY70lBggBRhUtQMqTC/udvjsqLCemRlMKlJCXfK7l5GEryKXPIzJB
 FgxyACkskusexDzuAGFQpG2JfO5IHfyD/M7v7bwAbCUgrWmI/thbpKDB3qIr6ZI6pJn7
 Y8kqoJnVvPOU2vOHadzczvUPIiELqKE7glislwP6M/RcjSMzXmZYKAI+Wkb2IZzhKau9
 rrVP/+hLBiBG+/tIPcM38vDaF/jTg/p2cUOFOYCmVgRXFgM7Z6DbyexkO3+hfiNY6aqZ
 tcYg==
X-Gm-Message-State: AJIora/ShfDSzWWzUYsEPQfJIXCPBYEKEJMd+dFPqCMuZDGLn15txy+u
 n0WlBMczFBDTcNKnckIqLSIJAA==
X-Google-Smtp-Source: AGRyM1uXHMGZ2GyrPysszA/LYuf0pD6D/mj5ICrd5hPH/m735Qkr/ACQEbCz1XcuXuY5CbJ9dSfnzg==
X-Received: by 2002:a17:907:9620:b0:722:fc5e:3259 with SMTP id
 gb32-20020a170907962000b00722fc5e3259mr11884062ejc.579.1656331875094; 
 Mon, 27 Jun 2022 05:11:15 -0700 (PDT)
Received: from [192.168.0.249] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 b12-20020a05640202cc00b004335e08d6c9sm7473365edx.33.2022.06.27.05.11.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 05:11:14 -0700 (PDT)
Message-ID: <a25126ed-ef39-8316-6ae5-9551aa8120b0@linaro.org>
Date: Mon, 27 Jun 2022 14:11:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] ASoC: samsung: s3c24xx-i2s: Fix typo in DAIFMT handling
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220627094335.3051210-1-ckeepax@opensource.cirrus.com>
 <803785ef-42b7-647c-9653-702067439ae9@linaro.org>
 <YrmYbZV4mj9d9++t@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YrmYbZV4mj9d9++t@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, jrdr.linux@gmail.com
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

On 27/06/2022 13:45, Mark Brown wrote:
> On Mon, Jun 27, 2022 at 11:49:46AM +0200, Krzysztof Kozlowski wrote:
>> On 27/06/2022 11:43, Charles Keepax wrote:
>>> The conversion of the set_fmt callback to direct clock specification
>>> included a small typo, correct the affected code.
> 
>>> Fixes: 91c49199e6d6 ("ASoC: samsung: Update to use set_fmt_new callback")
> 
>> Where is this commit from? It's not in next.
> 
> 0b491c7c1b2555ef08285fd49a8567f2f9f34ff8 - if you can't find something
> search for the subject, people often get things wrong.

Finding it by subject does not solve problem with Fixes tag, that it
might be pointing to incorrect commit (e.g. rebased).

> 
>> You should put such big patchsets in your own repo (e.g. on
>> Github/Gitlab) and feed it to linux-next or at least to LKP.
> 
> The size of the patch set isn't really relevant here, the same issue can
> apply to anything that can be built in more than one configuration.
> People should of course try to do things that work but equally we
> shouldn't be putting procedural blockers in place, we have integration
> trees for a reason.

I would say that size of the patchset is a proof someone is doing bigger
work and we want the bigger work to be tested even before hitting
maintainer's tree.

My comment was not a requirement (procedural blocker) but a suggestion,
because maybe Charles was not aware that developer trees can be tested
for free.

> 
>> This way you would get build coverage... because it seems the build was
>> missing in your case.
> 
> That coverage has apparently also been missing in -next for several
> weeks.

Eh, it seems defconfigs for this old platform do not select sound, so we
rely on randconfig. :(

Best regards,
Krzysztof
