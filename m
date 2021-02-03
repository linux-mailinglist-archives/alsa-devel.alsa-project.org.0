Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC40230E511
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Feb 2021 22:44:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5005E172A;
	Wed,  3 Feb 2021 22:43:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5005E172A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612388650;
	bh=GhHrFvN7r5X8mQ7I/mLCF9BMVsYdCamR5NRwQyKIQTg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BEYEhH9aInPzfCByqmCbvvDoBTfmMwC9n3Oez/f+YxH89lrjdDciBrbHzYmmaJVS+
	 iD4GcuJyqaXAXH0YWSMdOx2yN+YyPOFBooIw4z6gEz7n2h6ks7dMc6/mYj5+YzZPQI
	 X/jIL8w/gS5nfTAok7zStAR74xP/AhZfKJz7JUA4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B1BEF8016E;
	Wed,  3 Feb 2021 22:42:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BABBF8015A; Wed,  3 Feb 2021 22:42:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, NICE_REPLY_A, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9C8CF8013C
 for <alsa-devel@alsa-project.org>; Wed,  3 Feb 2021 22:42:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9C8CF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Jt3eshR6"
Received: by mail-lj1-x234.google.com with SMTP id a17so876959ljq.2
 for <alsa-devel@alsa-project.org>; Wed, 03 Feb 2021 13:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kGfWwvJGFe5MnbxnWxw8m85yVGSi7i3eo7HdmO414+I=;
 b=Jt3eshR6Cb65RBKKS7bJSkJwBKNbwaWYZF1yG6Unr1PpsgtzzIDhAOryZkRSpwlIas
 N46UmYuQOQmqKeoPISXsdrMfTPyEWVkG+J1BPCIN98mg8dy688bOCCzoJoysTzCizx78
 /O6GW5L5LNbCviwy3iJNCfMijC1iN58ouqMnlFtdK2IKBFk3QY6oOPvl+ZokSCoDu0Ta
 fY3QWrAwtTMdI/UzjgoLKQKhvpSSo5v9oPjILTGTshJMcWauQ01ivqgSLyIfqo+tkq8Y
 HFH4SxhaUjKINuYKX7MuSloUQxUB8uTUkelfNKFSNMbdn+ClxpW3Tz2eqiSsK0CrmIZO
 uOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kGfWwvJGFe5MnbxnWxw8m85yVGSi7i3eo7HdmO414+I=;
 b=tBjpFZyWLWxq47gMOy+dXok+FJurqA+cnSLmMJUqmE2aWVENwMJRDHwEq8zd9DvtQi
 haWlgHrXzgbyrco007fPP/uchwrfsdKOWdR/kU5XQ5QXtUndw9T7FVnTR3ILpL87vchE
 xKwbiyjxFk6Apq9Xui5SZ+G+viuOy5oQjUfPFDik/iDxWTnDEuT8k9169YtFtNKhOlLv
 /y+evgIocjZ2ghb3WkCwDqJItDy6dwg8erVp214NbMqkIT72f90jKmKXJIJI/q5D9C8t
 4gRwtJDeTsfUcIk5epZ+kuYa9IjUtBMqnDxkFelPQTlm7nf9o313Ea3o4d7YdrAZ6A6r
 GKbQ==
X-Gm-Message-State: AOAM533VgU54vkSB5+xDZJVrGrEXfjRq0zX0CBNxHo3JqhG5UqlCqrMq
 SxJaz3Ai/vf7ur8Uexf7RQk=
X-Google-Smtp-Source: ABdhPJwM9zMCbOUxbaZ2qjIu4vzLHjQlv3PhkGbm1yCJZzlYIfR2HUYhnjIfNGnWeZEdg8F7YgY8Iw==
X-Received: by 2002:a2e:b17c:: with SMTP id a28mr2794523ljm.189.1612388546509; 
 Wed, 03 Feb 2021 13:42:26 -0800 (PST)
Received: from ?IPv6:2a00:1370:814d:ea25:a10:76ff:fe69:21b6?
 ([2a00:1370:814d:ea25:a10:76ff:fe69:21b6])
 by smtp.googlemail.com with ESMTPSA id a16sm382539lji.52.2021.02.03.13.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 13:42:25 -0800 (PST)
Subject: Re: [PATCH v1 0/2] ASoC: tegra: Add RT5631 machine driver
To: Jon Hunter <jonathanh@nvidia.com>, Ion Agorria <AG0RRIA@yahoo.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Stephen Warren <swarren@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Rob Herring <robh+dt@kernel.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Ion Agorria <ion@agorria.com>
References: <20210131184101.651486-1-AG0RRIA.ref@yahoo.com>
 <20210131184101.651486-1-AG0RRIA@yahoo.com>
 <82a3375e-6105-875c-3332-33fcf2c0f785@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a9874e27-8d5c-c784-ee16-5e7b2607b058@gmail.com>
Date: Thu, 4 Feb 2021 00:42:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <82a3375e-6105-875c-3332-33fcf2c0f785@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

02.02.2021 16:23, Jon Hunter пишет:
> 
> On 31/01/2021 18:40, Ion Agorria wrote:
>> From: Ion Agorria <ion@agorria.com>
>>
>> Adds support for Tegra SoC devices with RT5631 sound codec.
>> Playback to speakers, headphones and internal mic recording works.
>>
>> This driver is used for ASUS Transformer TF201, TF700T and others
>> Tegra based devices containing RT5631.
>>
>> Svyatoslav Ryhel (2):
>>   ASoC: dt-bindings: tegra: Add binding for RT5631
>>   ASoC: tegra: Add RT5631 machine driver
>>
>>  .../sound/nvidia,tegra-audio-rt5631.yaml      | 134 +++++++++
>>  sound/soc/tegra/Kconfig                       |   8 +
>>  sound/soc/tegra/Makefile                      |   2 +
>>  sound/soc/tegra/tegra_rt5631.c                | 261 ++++++++++++++++++
>>  4 files changed, 405 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
>>  create mode 100644 sound/soc/tegra/tegra_rt5631.c
> 
> 
> I don't see any user of this driver included. Any reason why?

They should come a bit later. The TF201/300T device-trees should be in a
good state already, we just need to finalize them for upstream and send out.

IIUC, the audio codec and dock station drivers are the most noticeable
missing parts in upsteam kernel. Ion and Svyatoslav should be able to
clarify the state of the devices in a more details.
