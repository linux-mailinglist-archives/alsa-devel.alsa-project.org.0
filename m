Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FC06C6935
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 14:11:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD859EDB;
	Thu, 23 Mar 2023 14:10:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD859EDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679577072;
	bh=2mc/hKpX6DR+52LyrZ1sFYmOW/do4xBEjCaJiA0PBFk=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A5ITH7/wmAuRKYX7MF/fM/phY7fkwVj14pNwBgqel/lqZBTu3X1ZXv2GCcBP/XdVR
	 bsj+8hNhQtnFTKuyjppSPSJhM7TZ8moxqzuR04zILVwlNVkMWuO6tgPsgGzT+ycuuT
	 xDZuAL7KI2ITxEDiB+MOluwdogOtmCzmiICFtOMk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15AF2F80520;
	Thu, 23 Mar 2023 14:10:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 127DEF8027B; Wed, 22 Mar 2023 11:56:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08528F80093
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 11:56:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08528F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=bDsGkBzy
Received: by mail-ed1-x52a.google.com with SMTP id ek18so71064777edb.6
        for <alsa-devel@alsa-project.org>;
 Wed, 22 Mar 2023 03:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679482578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eribAeLlAZpM0sozfmroYZLd0JWUDJYfvoB2UDqzTlc=;
        b=bDsGkBzybZ7XSWupknT9Ksnp8uRqhwlyXWzafjT0YGpQhD1CLATrzpugsITAAyk5GO
         ROv0j73u+KWJofgT8KuUHvCeaob/Qmh26wKRHdBMgkuTtAMKtI84g+dqSqxiGu852Aw7
         nhkaFQLhy3nylmWLPy2nkQ0ygs52Kuy5RQAValIP0GkeICWmxYljxy/S2SwO7C4kZ7jF
         Vy4UvmS6AwpuitEa366FIXROYEzOe9+j22xsVfEq0mBTTct/h38E3LRshEPf7IUpgJ0q
         141/IPr6haUvfTGIWqCYeu5pFX7oEPujtBaYTXXXqOd1zDZe/JehlEd7eBG245c6xGba
         MbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679482578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eribAeLlAZpM0sozfmroYZLd0JWUDJYfvoB2UDqzTlc=;
        b=kZjB4jRiA1VxB1PLpzENPW8tpo42WjOApUywpqqDrus9gEgzwe8CBWjyQzmQ5VFbiz
         sNzmjT8TP/n7LKZdyaUvOwhRpoR145VTwn+VtJIk/x4Yo/53qi/PpLr4a9d6p2W3iMT7
         saioKqgU3HLhxi/X/tl0ag2kDAhr2xfxosMuwvIO4smvMVFJM8rssw5L3uedv9t7Um3f
         gm8GLjvS5PL4pyHr/yalyJyAWJ6YK6av1rOeHIhLcIeRPYCp+Fm0aaULH3ddKpDVffik
         2s3G/2JsNW19pPwk5AZsiSkqZywoNWacICdEBbmmcx5M7znsGrI5mHBTk1QLypACvsqw
         qgwA==
X-Gm-Message-State: AO0yUKUAaFw4AsN4lPGL6nGo+MmKbNF/jm4xo8eJQV36hyz/ygBPY6HN
	8A4jBXRuotmKv7lh7aBEzxtchF+3KJyiHFL1ac8=
X-Google-Smtp-Source: 
 AK7set8bTdcte9x03OjkSvsMixpWbUh5BMuJ76sBNCDUZEGwGaxof5QMGQfH8r7GG6JyIUFucpR+j1QZN+WW3boVZz4=
X-Received: by 2002:a17:907:2c46:b0:92f:cf96:e1f6 with SMTP id
 hf6-20020a1709072c4600b0092fcf96e1f6mr3049751ejc.11.1679482577793; Wed, 22
 Mar 2023 03:56:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230308073502.5421-1-clamor95@gmail.com>
 <167933710348.198283.16107220354236772396.b4-ty@kernel.org>
In-Reply-To: <167933710348.198283.16107220354236772396.b4-ty@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 22 Mar 2023 12:56:06 +0200
Message-ID: 
 <CAPVz0n2AuCb7fmLkzdimiZvqneQw7gXCfMTRvhp1n1zwRckfaA@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 0/8] Fix sound on ASUS Transformers
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: clamor95@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JQ3TQZCLBYWTFBKYWC76L7SWIFEKZOZU
X-Message-ID-Hash: JQ3TQZCLBYWTFBKYWC76L7SWIFEKZOZU
X-Mailman-Approved-At: Thu, 23 Mar 2023 13:09:59 +0000
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Takashi Iwai <tiwai@suse.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JQ3TQZCLBYWTFBKYWC76L7SWIFEKZOZU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=D0=BF=D0=BD, 20 =D0=B1=D0=B5=D1=80. 2023=E2=80=AF=D1=80. =D0=BE 20:31 Mark=
 Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, 08 Mar 2023 09:34:54 +0200, Svyatoslav Ryhel wrote:
> > - add quirk for headset detection used by some T30 devices
> >   (ASUS Transformers, LG Optimus 4X HD and Vu);
> > - add RT5631 and MAX9808x machine drivers
> > - update bindings
> >
>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-=
next
>
> Thanks!
>
> [1/8] dt-bindings: sound: nvidia,tegra-audio-common: add coupled-mic-hp-d=
etect property
>       commit: 2a7a8ebe85e1fa7e929f6f986a61f10321093c43
> [2/8] ASoC: tegra: Support coupled mic-hp detection
>       commit: eb0b8481c2e03a5ae01f6bea60b42109bd12b6fe
> [4/8] dt-bindings: sound: nvidia,tegra-audio: add RT5631 CODEC
>       commit: 2060c9b8ae2a1f6abec483709f4209b6e3602b89
> [5/8] ASoC: tegra: Support RT5631 by machine driver
>       commit: 44b2fc2edb61e956885b4305bddaaec7f05d93d2
> [7/8] dt-bindings: sound: nvidia,tegra-audio: add MAX9808x CODEC
>       commit: 85a375fe8df906b2701346e03e71501e6861a75a
> [8/8] ASoC: tegra: Support MAX9808x by machine driver
>       commit: d007a87bd7d181854b53b3e7fcbcf66c4bef86b2
>
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>

Thank you, Mark Brown! You have asked me to update commit name for
codec machine dts schema commits (those, which contain CODEC in the
subject), should I still update and resend them or you will handle those?

I still need v3 to update existing device bindings to the currently working
scheme. Should I exclude commits you have picked?

I have DMIC fix for wm8903 codec driver required for tf101 and tf300t,
should I add it into v3 or I have to send it separately?

Thanks in advance,
Svyatoslav R.

> Thanks,
> Mark
>
