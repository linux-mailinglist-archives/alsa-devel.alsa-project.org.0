Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84454508971
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 15:37:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 240DC1AB0;
	Wed, 20 Apr 2022 15:36:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 240DC1AB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650461831;
	bh=ttybcvAcuOW4Q8OVInp+wmQI38Nrf5uDsT8oiy9sda0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cGsmf/q3X9ZOATkmQGee/6UAYVwkobpt0qmOd132nwPysh5Q1l6c8pzQ7Y1j9kyCn
	 xaSW4A1+44sw4xLiFt8ddR20CqUwYPCug85Qej/BaqaRZhz9o2p2f5y2NlrodYzbTm
	 sQ9mU/qH//N+uKgDq/YPgT+sNWbBMhXktmUFpFlY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2887F80128;
	Wed, 20 Apr 2022 15:36:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EA7EF80125; Wed, 20 Apr 2022 15:36:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC080F800F8
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 15:36:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC080F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TrZDrs3k"
Received: by mail-pj1-x1036.google.com with SMTP id ll10so1936787pjb.5
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 06:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lXdyjsZwzid6gzFZsYx+3FvAzRzuWVqc4HAM59uiv4I=;
 b=TrZDrs3kSql9sib4o8UH2aejnB9lVPUBoAig3WO81PdWJ8jQpG2MxBkFcDMf8NBWou
 /FVnq8rG4GwfPxJSFY8qmtnxlBvSPNaxIQ47Z0BjaV3alza9bo2WSBMOLtDknFzUpYwH
 J7MIq8ULFWzX4lVq/3p62Vrqu3mZK9H4Mvsl9jA/DNBp8NaYXXQxol/qLJhIu3CzGIvL
 MzK/u0YsEw3JXizDM3rHwfPp/35uCo+BpDRmPsVRPQ62kmC9RR4mKLX1zmx8QvGzBReX
 znz0RqTRuVVrF19Hg9nEY8q/N1Ubm6cUnFI+NnsyAbIxpa0z6m9DPhbarakYNydJR1/K
 ffQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lXdyjsZwzid6gzFZsYx+3FvAzRzuWVqc4HAM59uiv4I=;
 b=U0+ahAeGK0ZnOWi4OVWN54UPKdf1jLOjILP2HTvSQ4V+Gh2kWpCA8CrR1m7ApTEcGe
 HwYdRxLt2fv5F+Ec1WIK9ntp/z/Iao60+h/mW9SOFeuoR/7fkvfwjDds5KkTxqemxrb7
 4IvFkultY7Xh3Xhv4zykUp/LHAnUJDupewmFIRdG/nQ3uIrao1kOkWHk7E9XhEPcJDV/
 s2gmZ2ByMJ9u3/wVFH/ohIgFCU5kDm2LauJH6hRuHE0ocZmLI2y/gisNxfmFozt9CnNP
 YAVt+6tILaRgqKQf7f6+w4bHp0hKDVYzzOvJux06POi1NjRZg5Eq3cAbyNvZ6ga2hKOT
 CPmg==
X-Gm-Message-State: AOAM530qIHcXH1uLiTPOSYkjD7fNRpul5Hnw1Rq83qUrcNoF+YG49t6O
 UWrRyx2MITLKi46tEPXy3QxMUDNwjDcMDDi9UvM=
X-Google-Smtp-Source: ABdhPJxtsG9w1ifLwHhGzp8j2IssoTIdZkBYyWeL5HF0RqiBvpRYeBJtoZ/6uVakf9ISJs8wuN4Uxw==
X-Received: by 2002:a17:90a:7f94:b0:1cb:1853:da1b with SMTP id
 m20-20020a17090a7f9400b001cb1853da1bmr4470119pjl.14.1650461766581; 
 Wed, 20 Apr 2022 06:36:06 -0700 (PDT)
Received: from [172.16.10.243] ([106.39.150.10])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a056a00235300b0050a858af58fsm10143884pfj.145.2022.04.20.06.36.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 06:36:06 -0700 (PDT)
Message-ID: <4e3309d9-879f-3385-3e8e-0fa1a31ddd9a@gmail.com>
Date: Wed, 20 Apr 2022 21:35:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] ASoC: fsl: Fix error handling in pcm030_fabric_probe
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <Yh90u+E3RTuGEDWU@sirena.org.uk>
 <20220420021855.8224-1-linmq006@gmail.com> <YmAD6MIuKdjgm7Yu@sirena.org.uk>
From: Miaoqian Lin <linmq006@gmail.com>
In-Reply-To: <YmAD6MIuKdjgm7Yu@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
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


On 2022/4/20 21:00, Mark Brown wrote:
> On Wed, Apr 20, 2022 at 02:18:52AM +0000, Miaoqian Lin wrote:
>> This will call twice platform_device_put()
>> if both platform_device_add() and snd_soc_register_card() fails.
>> return early on error  to avoid duplicating the error code logic.
>>
>> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
>> ---
>> changes in v2:
>> - use return statement to return early when fails
>> - rebase on top of commit 559089e0a93d ("vmalloc: replace VM_NO_HUGE_VMAP with VM_ALLOW_HUGE_VMAP")
> Why rebase on top of that seemingly random commit?  Is there some sort
> of dependency here?

Hi, it the head of master in when I made this patch. It's because you pointed out

that patch v1 doesn't apply against current code. But I am not sure what's the problem.

So I ensure the codebase is up-to-date. If this patch have no conflict, you can ignore it.

