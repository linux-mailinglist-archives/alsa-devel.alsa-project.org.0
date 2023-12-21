Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D3A822175
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 19:55:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 297BC149C;
	Tue,  2 Jan 2024 19:55:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 297BC149C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704221716;
	bh=6IL/idsjPpNrA/kDZh3Wf4QGHuJb8x57N1ifjiYZCC4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e2A2WbS3/4rsqeYw54zKcqmngcRI3K8OxtNS4/3/1wW7tT1GtYEzVTt8u4rb0I9Zq
	 3+cgttd8qxRghctZtrlLj9j3jkfx0ru+dO89VL3FQRWKfV4RbuWme56DiwYQLDA0Vq
	 YqaFz9xdV/2eVBU5QsCuFq1PAKkSH+y89S57Tero=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 709E5F80CAA; Tue,  2 Jan 2024 19:51:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10A0EF8077D;
	Tue,  2 Jan 2024 19:51:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71D0EF80153; Thu, 21 Dec 2023 12:24:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2976F800D2
	for <alsa-devel@alsa-project.org>; Thu, 21 Dec 2023 12:24:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2976F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XNWyehuN
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40d3352b525so6869125e9.1
        for <alsa-devel@alsa-project.org>;
 Thu, 21 Dec 2023 03:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703157876; x=1703762676;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGkZwIdmLi60ShwVAK7ggKym2AkjQZ0+N0ICnJdPIpA=;
        b=XNWyehuNz3UnhJ0oigMRyCUleOft6VIiWYQjxz+DTANugFJJSIiVavS1e/q95NhsdA
         x1StGCCOgl+cf7ZZyDbD7RZqQf57SR72+PVhzhQ5hNoULfHFjj6OpokF0ffPGkxPLS6L
         CBZMHDU3+/DTN32d9o/j9pKqJ35P8vz8VMtPm7wcQUHYa0sHgyYdE1ygsuRKjh/sIsqf
         39DJnnAQBPuO47dsPUBhvgVE4XN10/C9hVc36Fo03WJ/nlH+vGUFfk6JtQUi2bQg4i1m
         200ejiN4zAcA3q4fGs90zXcX8Kh/kFNbJ41Cc9gOIJvWtqRcN5tLRUgIcqXAGsk7TVRp
         Jt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703157876; x=1703762676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGkZwIdmLi60ShwVAK7ggKym2AkjQZ0+N0ICnJdPIpA=;
        b=pcmIziw4HruuJa7qysnv8Gr8IwJud6xTVFWId9ZhNduZ7Xtv3n0bb8NVniswhAcGzx
         Xnt99HTbGGFLSe+SoAdOSxFn+MPwoqJrKm+srfI3QZu1eZRFdt0cdUWJVzhCmeEKK1KA
         RwfBetGkrfWZJ5Co4im5mAcoIDMVicWk5C4NA7LXkI9oUAL3WGnaVHwcSzdTjU8Rgs8X
         OcFXxbD8/56gpgzmn9dcoeptSQt9CKc6bNvhwcBsxlzm4q2ekE5EWiOLJ+0b1PMUJH4s
         rwd0dfe/dlTrTeNX7IU8juWRmmd3ZoS3N1+ks2rRjiUax3MvGBzKcKoYvHAFf63UVXT8
         WmrA==
X-Gm-Message-State: AOJu0YzbInQ/Df29BwwVyhJWK83UAl8+Gwm5Lr9uUGyJCKejWjLgJrzl
	2ouvUTd5lpkMGHd8qvwmfw==
X-Google-Smtp-Source: 
 AGHT+IEY0zeOkEmWqxzOZOz9OMEjZ8EZ5dx8hGr56e2e8YMsAf+s1y30sszRmEvQ0vIVdg0Em94KmQ==
X-Received: by 2002:a05:600c:4445:b0:40c:2d85:3a01 with SMTP id
 v5-20020a05600c444500b0040c2d853a01mr657257wmn.161.1703157876018;
        Thu, 21 Dec 2023 03:24:36 -0800 (PST)
Received: from alex-pc-ubuntu.lan (31-10-153-16.cgn.dynamic.upc.ch.
 [31.10.153.16])
        by smtp.gmail.com with ESMTPSA id
 d24-20020adfa418000000b003368d3437d5sm111465wra.44.2023.12.21.03.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 03:24:35 -0800 (PST)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: sbinding@opensource.cirrus.com
Cc: alex.vinarskis@gmail.com,
	alsa-devel@alsa-project.org,
	david.rhodes@cirrus.com,
	james.schulman@cirrus.com,
	josbeir@gmail.com,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	perex@perex.cz,
	stuarth@opensource.cirrus.com,
	tiwai@suse.com,
	tiwai@suse.de
Subject: Re: [PATCH v2 1/2] ALSA: hda: cs35l41: Safety-guard against capped
 SPI speed
Date: Thu, 21 Dec 2023 12:24:34 +0100
Message-Id: <20231221112434.13730-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <8170413d-07a8-4e77-b43d-78cd9e4ea76f@opensource.cirrus.com>
References: <8170413d-07a8-4e77-b43d-78cd9e4ea76f@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: alex.vinarskis@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QUDK45L4H6VYEDGXZOLZM6CCER27PAJE
X-Message-ID-Hash: QUDK45L4H6VYEDGXZOLZM6CCER27PAJE
X-Mailman-Approved-At: Mon, 01 Jan 2024 13:17:35 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QUDK45L4H6VYEDGXZOLZM6CCER27PAJE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Sorry for incorrect expression and confusion, it is indeed not the driver
that hangs. What I meant is that _computer_ "hangs" on wake up from
suspend. Unlike boot, where driver does not delay boot process, on wake up
from suspend it seems it does - after lid was opened/power button pressed,
with firmware loading taking ~180seconds in total, computer still has
black screen and is irresponsive for said duration, which is completely
unacceptable.

I do not have enough expertise in particular area, but it sounds very weird
to me that audio driver is delaying system wake up process at first place.
Was this intentional? I would assume/guess most correct solution would be
for driver to run non-blocking, like it does on boot, but again, I am not
too familiar with the subject.

> (~80s per amp) to load the firmware.

Besides firmware loading, there are general initialization/communication
taking place as well. I have disabled firmware loading to try: at a speed
of 3051Hz, it takes ~16 seconds on boot (non blocking, so not a big deal)
and ~7-8 seconds on wake up from suspend (blocking, so it is still not
acceptable).

I am myself extremely exited to get support for 9530 in upstream, but I am
just afraid that such a big wake up delay is a huge hit on a end user, and
would affect everyone with 9530 where intel-lpss patch was not applied yet.

> Instead I would prefer that we instead disable the loading of the 
> firmware in this case.
> Without loading firmware, the volume is much lower, but at least you 
> still have audio.

This indeed sounds like a better approach, I did not think of that. This
should work much better for generic cases, but unfortunately, will still
not prevent devices with _extremely_ slow SPI from badly affecting UX

Taking into account the above, and unless driver being blocking on wake up
can be resolved, perhaps it would makes sense to do both?
a) Your suggestion - disable firmware loading if SPI speed is not in MHz
range and
b) Do not initialize device at all, if SPI speed is ridiculously low (like
for example 3051 Hz)?

I have tested on 9530 without firmware loading, with SPI speed set to
50000Hz: it delays wake up by ~0.9-1 seconds. Subjectively, I think this is
the maximum acceptable delay.

> I have a patch to do that, which I was planning on pushing up 
> (hopefully) today.

Thanks for following up on this!

> 
> Thanks,
> 
> Stefan
> 
> >   		/*
> >   		 * Manually set the Chip Select for the second amp <cs_gpio_index> in the node.
> >   		 * This is only supported for systems with 2 amps, since we cannot expand the
> > @@ -219,8 +232,6 @@ static int generic_dsd_config(struct cs35l41_hda *cs35l41, struct device *physde
> >   		 * first.
> >   		 */
> >   		if (cfg->cs_gpio_index >= 0) {
> > -			spi = to_spi_device(cs35l41->dev);
> > -
> >   			if (cfg->num_amps != 2) {
> >   				dev_warn(cs35l41->dev,
> >   					 "Cannot update SPI CS, Number of Amps (%d) != 2\n",

FYI intel-lpss patch was submitted for review [1]. However, as it is in
different tree, it cannot be guaranteed that it will be always applied
when your patch for 9530 and other Dell devices will be applied, which is
why I am insisting on safety guard against _extremely_ low SPI speeds.

[1]: https://lore.kernel.org/all/20231220205621.8575-1-alex.vinarskis@gmail.com/
