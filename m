Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FA1948C24
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2024 11:24:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 966083A9B;
	Tue,  6 Aug 2024 11:24:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 966083A9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722936262;
	bh=sqkJhDv+6oUT4nQ2lKcK8oFvGgPM/oPyq4n6jeUGC6E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CUbDJ2CsH5qZsagpHXJTXhGU5/E3gy7T8hpFOe7b0iTWIaRYFCAKHlo4nMfF29Vmv
	 ApcBFLTUwT8knL4s1hws9Nec9379nfVQpRmzWFjBx6ac1gubjl4q9BZo9zrwIkhvdR
	 jeMzHdtm+Hkx2dEnhfRpTjym1bKWFRKLClYT3EtM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FB6FF805AE; Tue,  6 Aug 2024 11:23:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0F11F8057A;
	Tue,  6 Aug 2024 11:23:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C50EF8047C; Tue,  6 Aug 2024 11:22:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 63A00F800E3
	for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2024 11:21:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63A00F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=EnPRhHbi
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2f1870c355cso5027311fa.1
        for <alsa-devel@alsa-project.org>;
 Tue, 06 Aug 2024 02:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722936112;
 x=1723540912; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sqkJhDv+6oUT4nQ2lKcK8oFvGgPM/oPyq4n6jeUGC6E=;
        b=EnPRhHbi7NRoOjDa+jy95UqdqmQ+xC9nAWsmOlFGzZTmYeGVJUWWqSRCi6MvOK5W1z
         heggodtyxwxEZiJA9KSI/HWkFJxsxuZw7O2M7wxUM7cIOveMODyFuJ4V+ZjysfQW+vko
         V/JUhMXGyYi40+X8cnlOFbNKdFo7JBGfv/ZUPwT66nONsd96payL+ZiFyfh1OutCnnMG
         N1CHuaMAV4BxxdrLJnkXZz2VgTzDKvb/y/q6uQ/VrzXjOF+1QxAQVC/+EGbrgrLIovae
         7+5/uxBDdLWMBwJQWAMv1YPxZTYbJnJzjxuMNtC/ZX2FcgD2l6VWx1aLq2SbaT7zJGu1
         f2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722936112; x=1723540912;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sqkJhDv+6oUT4nQ2lKcK8oFvGgPM/oPyq4n6jeUGC6E=;
        b=Up4UV+prl/MAtJXljAjDM9sL1OaG/AnEM3lgHOC+kpHdZINdvlYHUcm8wH6LNsB3eQ
         3hsTwaT5DWv+CEEY4YLduGXPWokrFYSQPSxSdPFulBgFD5gGi+2eAn/UasknPw1O0Hr1
         j+wlc3vQkyuEdZMNaGT/5MmJ7+MJFakMkpLx+auCSrkMAA2E37d47KuNexCOuA9zgT32
         RQ3LRKs13bfzTcqpUbIXnfdlRhCY6PuPGQCK/V11xVWyUunyeH1qha2w1wMyAppbCILq
         p0k9pKw64r2pz5QNPmHzabdQZKjKJV6Br8IaVrjXt5zi63hVb4GINclLHGfIS3vMd7WT
         +DuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlqNtrLnT7X8sjhnKrlB3HMbXfrwDOiMle+PvejAeCoCcDzta0haKKQxxqs4s5RENz89c4WE7GFd4KkWN1RB8wQraXpIcg8pgpwdA=
X-Gm-Message-State: AOJu0YyelKYcH3tn/+zKvbNW0xDH/+Y+gNRInpHkbzLhbYxf6sN7yo3R
	m14d8H7MT+cET/66AJuJmLK/XhyNoPGRO31Oe2oEyrTw1EJ+0jQHLKvDwfpvhp8=
X-Google-Smtp-Source: 
 AGHT+IFeTtsP8+6H91ULn+8s1Jzamf9Fh+dKBHWwa5CDk0Tz2O9PLeglp+ALCgLSDZU90YcDG0s7Ig==
X-Received: by 2002:a2e:9548:0:b0:2ef:265e:bb93 with SMTP id
 38308e7fff4ca-2f15aa84e0cmr94527721fa.3.1722936111909;
        Tue, 06 Aug 2024 02:21:51 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c541:c0a5:2f43:ca78])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4282bb98109sm230716785e9.39.2024.08.06.02.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 02:21:51 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Mark Brown <broonie@kernel.org>,  linux-rt-users@vger.kernel.org,
  Arseniy Krasnov <avkrasnov@salutedevices.com>,  Liam Girdwood
 <lgirdwood@gmail.com>,  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai
 <tiwai@suse.com>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  alsa-devel@alsa-project.org,
  linux-sound@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org,
  kernel@sberdevices.ru,  oxffffaa@gmail.com,  Thomas Gleixner
 <tglx@linutronix.de>
Subject: Re: [PATCH v1] ASoC: meson: axg-fifo: set option to use raw spinlock
In-Reply-To: <20240806065021.PINvpze_@linutronix.de> (Sebastian Andrzej
	Siewior's message of "Tue, 6 Aug 2024 08:50:21 +0200")
References: <20240729131652.3012327-1-avkrasnov@salutedevices.com>
	<1ja5i0wags.fsf@starbuckisacylon.baylibre.com>
	<2b16b95e-196e-4d8a-98c3-3be568cdd18a@sirena.org.uk>
	<1j5xsow839.fsf@starbuckisacylon.baylibre.com>
	<7dfdade5-3a57-4883-bfac-067c50ec0ffb@sirena.org.uk>
	<1j1q3cw5ri.fsf@starbuckisacylon.baylibre.com>
	<20240805153309.k_SfHw62@linutronix.de>
	<1jplqnuf5r.fsf@starbuckisacylon.baylibre.com>
	<20240806065021.PINvpze_@linutronix.de>
Date: Tue, 06 Aug 2024 11:21:50 +0200
Message-ID: <1jle1auhu9.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 7Y67CQCTDQOIW4TCCZVLWG3X4HVJHT5K
X-Message-ID-Hash: 7Y67CQCTDQOIW4TCCZVLWG3X4HVJHT5K
X-MailFrom: jbrunet@baylibre.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7Y67CQCTDQOIW4TCCZVLWG3X4HVJHT5K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue 06 Aug 2024 at 08:50, Sebastian Andrzej Siewior <bigeasy@linutronix.=
de> wrote:

> On 2024-08-05 18:07:28 [+0200], Jerome Brunet wrote:
>> Hi Sebastian,
> Hi Jerome,
>
>> Thanks a lot for taking the time to dig into the driver specifics.
>> The IRQ handler is actually not awfully critical in this case. The HW
>> will continue to run regardless of the IRQ being acked or not
>>=20
>> The purpose of the handler is mainly to let Alsa know that 1 (or more)
>> period is ready. If alsa is too slow to react, and the buffer allows
>> just a few periods, the HW may under/overflow the buffer.
>>=20
>> IRQF_ONESHOT is fine because snd_pcm_period_elapsed() 'notifies'
>> all past periods, not just one. The irq handler does not need to
>> run again until this function has been called. It also helps if the
>> period is ridiculously small, to try to reduce the number of IRQs.
>
> IRQF_ONESHOT is used to disable to keep the IRQ line disabled (after the
> primary handler) while the threaded handler is running. This implies
> that the primary handler must not be threaded under PREEMPT_RT.
> =E2=80=A6

This is the point I was missing. It is clear now. Thanks a lot.

I have tweaked #1 and added a few tags but the gist remains the same.
I was going to add you under 'Suggested-by' but maybe putting you as the
actual Author would be more appropriate.=20

What do you prefer ?
