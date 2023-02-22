Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E010269F017
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 09:22:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30B93EA2;
	Wed, 22 Feb 2023 09:21:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30B93EA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677054150;
	bh=E91Ks+Gxvk54nOAAtccS2G1Ld+FxX2vsMvnRdljEnuc=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ciCojG+uLCxf4tynTDxuesRh/LlHMfXf16Slwk2PVeAS+qPBPUqKhDvbw7Fa5xnC+
	 kJ+Lx6yJAhRRly+gOifpcOwLwc8YTQdoUsGN3R/hPSCl+u5L7TdSX0u11fL1FLzBTM
	 P7lIHwrIbcGONkMJrJDdN3hZL34KtsYvJbRhRVQo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21611F80544;
	Wed, 22 Feb 2023 09:20:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4CC0F80266; Wed, 22 Feb 2023 09:14:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37AE6F80125
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 09:14:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37AE6F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=eyrVUqnE
Received: by mail-ed1-x52b.google.com with SMTP id cy6so21500011edb.5
        for <alsa-devel@alsa-project.org>;
 Wed, 22 Feb 2023 00:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xj/6AyELfHI0tKgaBGNk0fyFVeR5csP7/YL61ZGE4Xk=;
        b=eyrVUqnER8VYc2JyypJRTTLZWi2RuVoKQT8Xm298bWSpuBvRedvo6MZEcHXbdwUJdD
         FP94ARAJ4ey3XJTfTaXLkh8GTSxTzplteXVI6Xt8JmkeEtqo/8BLFl77N/WA7QX5P5wF
         FmXN6+J0VeqrYXjgwL7DsIf1jXDwluv2alBbRanVpC7TDD4KHhlPy0WZCGtl2BXNrMmY
         DIyqE7xqBqsjACJfjzzmMRXX5Zl/ID+U+olV3MwR91v+7TMOFTcq8V791ZEzfPTmn0QC
         f8kKfXcHcdwlkUoVe4sjjYh6b5HZ9xbCbn/aGfpiZv8cz1eKOD1lPfl2q4lYfmix7q+I
         G5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xj/6AyELfHI0tKgaBGNk0fyFVeR5csP7/YL61ZGE4Xk=;
        b=cvbGQrgODm1TgPxABDTAV6De/DU0HQ3ojouxw9Q29mNPRtY5Xp7QNkeaRXdo8G50HU
         csCvMgB0JuDFH0gAGnanLQ2fZJlGCAxaTA/V9wgJyLglJrn1M1OK4Ihw99/1n+kdd3wS
         z9AOYn0WrhN1dtw11o7IOHBhf6qcd1hWoOOhTXf+zlmbsQtEntmJN9CvN8Hm/qL9Pa4P
         5dH3of3fbwkJ+je/ve7+t4IRsatYo8H15uItzgFFgPPylzbnhCwTjWinbbAa+LOqyFLx
         DDe2j+quhVpKkFXKx6L6dM4ODsrgb33UxHTStZob0VngA8Hs9rgpjdZBgEncCGM6mVZI
         RMfg==
X-Gm-Message-State: AO0yUKVF0FMP/rBMqiVPJaPYehSwnp1z3M4bvE5jijX/wuy0Rtb4WaxQ
	KL7dl5jDhIh4UenVeQy5dNtnad189NEqUfm0lTo=
X-Google-Smtp-Source: 
 AK7set+vh8ZSYnSuxrULngtfrZiKENvscmdFhJ7qS/OrAXSltDPmE4QBQ5fNy+vQLDfu9owooRq4qarjYjxuDzJnk08=
X-Received: by 2002:a50:9fa8:0:b0:4ac:b8aa:3ffc with SMTP id
 c37-20020a509fa8000000b004acb8aa3ffcmr3264891edf.4.1677053653220; Wed, 22 Feb
 2023 00:14:13 -0800 (PST)
MIME-Version: 1.0
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-10-clamor95@gmail.com>
 <Y/VIpVwFu5gUUcsz@sirena.org.uk>
In-Reply-To: <Y/VIpVwFu5gUUcsz@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 22 Feb 2023 10:14:02 +0200
Message-ID: 
 <CAPVz0n34MMs-AeHfuxpC3dL=0MKSqrSn3zgrCHbjozR183CWnA@mail.gmail.com>
Subject: Re: [PATCH v1 09/10] staging: dsp: add support for Fortemedia FM34NE
 DSP
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: clamor95@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CZDTBJAOAFQB2G4O6RB32PX4SCRVNXUA
X-Message-ID-Hash: CZDTBJAOAFQB2G4O6RB32PX4SCRVNXUA
X-Mailman-Approved-At: Wed, 22 Feb 2023 08:20:08 +0000
CC: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=D1=81=D1=80, 22 =D0=BB=D1=8E=D1=82. 2023 =D1=80. =D0=BE 00:41 Mark Brown <=
broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Feb 21, 2023 at 08:32:10PM +0200, Svyatoslav Ryhel wrote:
> > FM34NE is digital sound processing chip used for active
> > noise suppression mainly on ASUS Transformers.
>
> This looks like it should be fairly straightforward to support
> within ASoC without too much work, and since it's in the audio
> path it should probably be referenced from the sound card it'll
> end up having an ABI impact on the card.  Take a look at wm9090

wm9090 is a sound codec, like rt5631 or wm8903 while fm34 is NOT a
sound codec. It is sound processing device which must be active only
when DMIC is used. In all other cases it has to be bypassed. At the same ti=
me,
it has to be set up because else there will be no sound on the actual devic=
e.
In the current state the driver sets up DSP and sets in constant bypass mod=
e.

> for a moderately complex example of an analogue only device
> (which this appears to be in terms of system integration).
