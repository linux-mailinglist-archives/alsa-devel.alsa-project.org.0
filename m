Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FD464B5ED
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 14:17:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C4A918B4;
	Tue, 13 Dec 2022 14:16:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C4A918B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670937450;
	bh=uYW8ngtYoaArORhIGNz+N1HRIJWKZIGor2TMPA0JIpg=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jB4z6lgYo2FtvosgyeAEDN0PQhEO0V4sFeHPdd2ClSN1tkA1NVp9Y6nTqzhoglOu/
	 BP1ZUfylaPUbPhVg8at8RWgQnz1DMjdeWrirz3IisASN7YPbMB9Umr5HRkFQjrdYxH
	 BuN/dBsLwS1RksK2536Yjte142GMYab929o4JEkc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06DD5F80073;
	Tue, 13 Dec 2022 14:16:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88F83F804E2; Tue, 13 Dec 2022 14:16:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFD13F80073
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 14:16:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFD13F80073
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=DxKRlpbZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670937388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gAnN9iBmxqXK5irYpUjM4/pL4e7GEf2tT4c9xFueYo8=;
 b=DxKRlpbZge3nltyxDd4BsO5g/PhhMTuLNnzd5MACKtBnT4ZqWCbCeP8XEt3Auk8DUvWxR1
 XFmSUTD6Xpv95GcIfG/fA5sgKaJ/NvAwxu6RjSUGEaWPQ3AZq9cNXytfjMoRoa2ffYdCPm
 4jZa6677w0lkaoU7VUBXkgJs7s67IuU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-7-501DHx9UPtmT6Kve5FIVtw-1; Tue, 13 Dec 2022 08:16:26 -0500
X-MC-Unique: 501DHx9UPtmT6Kve5FIVtw-1
Received: by mail-ej1-f69.google.com with SMTP id
 sd23-20020a1709076e1700b007c16f834c4aso4046380ejc.22
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 05:16:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gAnN9iBmxqXK5irYpUjM4/pL4e7GEf2tT4c9xFueYo8=;
 b=C5ulnbEb4TG1G9i9tqnN0sUxVIbbH7okmufi6ncgQeAWHjZtWwU16kDaUiqYtBF+KG
 AoaOaRXNN5+94d5TEaDtqUNk4/IKwgPWY5Kx6nzJAbSMY2YTpXPlKyo6kJYB2HzaRasU
 0EYn8PfzKCGJfgRsQwxWTlNpKfH+riFj9uEiFgBLvLDy+BvBagGtiAt660lHBEWCCFub
 It58GuXb/EK5k3CTN86fiX0+tRwpKhdx8SMh3E9JR+4iwJwiy2u39naG8jh9BxTegrzG
 dnVWa+iPXmKeHy+MOMcmRuJ5MRNTfjC98xBN6r5rMqQT/B2aIezOdrB6aSUGFIsa+lfz
 kC7w==
X-Gm-Message-State: ANoB5pnvteV82vxonjQfJiJz4FUznQjWhjRPfx8QFqJwwP8TOXwWG0te
 2xmfVauwEQWz07erDxF0ac8NkGqkxtw4ucXq0MrEeU++1rCcxpc6PFGZQpfI4HbaBZXks3M+cdC
 FzXjudckpLvV9r5mcz3V+L4o=
X-Received: by 2002:a17:906:3810:b0:7bc:bf29:c58 with SMTP id
 v16-20020a170906381000b007bcbf290c58mr16584170ejc.2.1670937385686; 
 Tue, 13 Dec 2022 05:16:25 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7mlrgbznX1S5LgQUU5Db5B1SQgZCG2Ot6s4lYkVwv6HNfNf7xYoWXmrY/xWTzSansOXHyeLg==
X-Received: by 2002:a17:906:3810:b0:7bc:bf29:c58 with SMTP id
 v16-20020a170906381000b007bcbf290c58mr16584155ejc.2.1670937385471; 
 Tue, 13 Dec 2022 05:16:25 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 f30-20020a170906739e00b007ae243c3f05sm4476521ejl.189.2022.12.13.05.16.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 05:16:24 -0800 (PST)
Message-ID: <e996f539-96e4-7086-f1a6-db434a5b90fb@redhat.com>
Date: Tue, 13 Dec 2022 14:16:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] ASoC: rt5670: Remove unbalanced pm_runtime_put()
To: Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>
References: <20221213123319.11285-1-hdegoede@redhat.com>
 <c490d006-20f2-bf47-fe4e-61d9ba29b6a7@intel.com>
 <Y5h4NQ+tq+k3UMLm@sirena.org.uk>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y5h4NQ+tq+k3UMLm@sirena.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On 12/13/22 14:03, Mark Brown wrote:
> On Tue, Dec 13, 2022 at 01:55:50PM +0100, Cezary Rojewski wrote:
> 
>> From i2s (non-sdw) Realtek codec drivers found in sound/soc/codecs it seems
>> that only rt9120.c defines PM ops and configures the PM for the device.
>> OTOH, there are several which define suspend/resume on ASoC component level
> 
>> Thus, voting for a complete revert.
> 
> Note that with ACPI you can have runtime PM things happening at the ACPI
> level so even if a driver does nothing when suspended there can be some
> benefit from using runtime PM.  No idea if this applies to any systems
> using these devices or not though.

Yes I was thinking the same thing, I said in my other email that I was fine
with a revert because in my experience the codec ACPI devices don't have
a _PS0 / _PS3 method.

But to make sure I just checked and I noticed this is not entirely true.

E.g. on the ThinkPad 10 tablet there is:

                Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                {
                    CKC3 = Zero
                }

                Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                {
                    CKC3 = One
                }


However the "board" driver already directly controls this clock, including
switching to an internal RC oscillator for jack detection when idle, see:

sound/soc/intel/boards/cht_bsw_rt5672.c:

	ret = clk_prepare_enable(ctx->mclk);

	clk_disable_unprepare(ctx->mclk);

	drv->mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");


So also having runtime-pm muck with this is not really useful
and I guess might actually cause problems in some cases (at least
it is one more thing which can go wrong).

Note _PS0 and _PS3 will still run on system suspend/resume
but by then we should have already powered-down the codec,
including calling clk_disable_unprepare(ctx->mclk); .

TL;DR: I'm still fine with reverting the original commit.

Regards,

Hans





