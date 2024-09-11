Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E0C975624
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2024 16:56:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A604E851;
	Wed, 11 Sep 2024 16:56:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A604E851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726066609;
	bh=5y6hlVFNZ9ghFAZ/dOgsxCt/q59tWWK+iBtItb690SU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VXhZBQUpmH9Kn0UfaDKWFHQNpSh0ltWDhd7568Az7HsmklDis4Xvl9qpNwKAjBjFL
	 EfStMQf0ekLFbEq62uwAmOlatDHyx8Umej6luoeWzclNN6J9PSMBvVjVpV4goI5VEs
	 hqY+38c5CIQk27rk1d3FBqgrGvYduvDZOKP4JErg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D32EF805B2; Wed, 11 Sep 2024 16:56:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7492AF805B0;
	Wed, 11 Sep 2024 16:56:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66A3EF801F5; Wed, 11 Sep 2024 16:56:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B3A9F8010B
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 16:56:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B3A9F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=rByEzTVJ
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-42cbface8d6so26716705e9.3
        for <alsa-devel@alsa-project.org>;
 Wed, 11 Sep 2024 07:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726066571;
 x=1726671371; darn=alsa-project.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5y6hlVFNZ9ghFAZ/dOgsxCt/q59tWWK+iBtItb690SU=;
        b=rByEzTVJ2fa6tout48EzFDSMMfIr6jaJ8myeOawZKhlyFqgYdC4fhivLaQW9YViOo9
         bYEgrlfxo1eVGdtSOJn/Whv/AvvteHk9DDuVZNcjDvxy9Vj7hYshctfgU2J+STyeGOOy
         ApR+CX89WUtq7m3rNIg7p33kNrdhDsKMzSqPJMvu+e2pporhJf1UkgknMgZPwnLnlM/D
         fUolKECn8BJnD6ilbG0r/vN9rUZL7xzuJ5r6zOCcgLcaTQXoHi8OKECmXV757O8TbD1R
         9JSJfUfzTPQSxa1TvhskplbSybh4OuSi4MKzE/wMkkgDcXlD4xTtikuyjX9JCSoUO5IQ
         K0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726066571; x=1726671371;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5y6hlVFNZ9ghFAZ/dOgsxCt/q59tWWK+iBtItb690SU=;
        b=rhbaU8xiwAOJmNMoHaOCjJpxIDFmS1RcafN9s6QkQ0KofS/n9Bi0B3wbb0JlanRybg
         R8WbeG8FY+VZxLqBenzwRO1MhOvbztHxemR++D35HvxBIqQcCgGhowcqbs0LN1QLx/ee
         kEjk9N6SshYvm+R/lSpzuh/ipSVIWVhD9DZt3vGbyyL7e/GHBklwnSPD1HGfLUB1UzH4
         kXlyx1UlHLabxmXcJiem52ltZZr4tvmJyX8cVgkATV8+m4suRejO06XKbzERGp4oJDC9
         WfTTtHr3noGYNhN0L6BZTHjtKZ6GJh1IlAK2DJ2Z2yG474ZxlRPwieZtVqcOAcznbJ6m
         hZhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB7vtggl1m9LK4rZzMPTPEdihl5WuheBTY7+0Ouk7iDuY5vDr5dPS2yZeamO7L4RyYq8P+NZXxwewK@alsa-project.org
X-Gm-Message-State: AOJu0Yzo7wt/ZHwSFNqFDA9QlT8CdDyW9tRu8zN0RZMVhkC98l1T+Wn+
	Jij2mirabZ1Q9yFZX0xYVDGL+/Ga2AKEdtI45ao6+PfAerFLprSsUrZ3dj9JR90=
X-Google-Smtp-Source: 
 AGHT+IGXbGreRimd0uqLh23FCjFV/446HYpWf16uni3SRkxonRMyp0eon2FdyilvNaU/tKo5u9ETgQ==
X-Received: by 2002:a05:600c:3b9a:b0:42c:aef3:4388 with SMTP id
 5b1f17b1804b1-42caef34492mr123874855e9.6.1726066570926;
        Wed, 11 Sep 2024 07:56:10 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:7388:2adc:a5d5:ff63])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42cb77afd5asm105511255e9.17.2024.09.11.07.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 07:56:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Jaroslav Kysela <perex@perex.cz>,  "Takashi Iwai" <tiwai@suse.com>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  "Kevin Hilman"
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  <alsa-devel@alsa-project.org>,
  <linux-sound@vger.kernel.org>,  <linux-arm-kernel@lists.infradead.org>,
  <linux-amlogic@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <kernel@sberdevices.ru>,  <oxffffaa@gmail.com>,  <Stable@vger.kernel.org>
Subject: Re: [PATCH v1] ASoC: meson: axg-card: fix 'use-after-free'
In-Reply-To: <20240911142425.598631-1-avkrasnov@salutedevices.com> (Arseniy
	Krasnov's message of "Wed, 11 Sep 2024 17:24:25 +0300")
References: <20240911142425.598631-1-avkrasnov@salutedevices.com>
Date: Wed, 11 Sep 2024 16:56:09 +0200
Message-ID: <1jo74uqlx2.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: B2CKSSU2DFZBUG6ZHDQHVKJ72IJDP5G5
X-Message-ID-Hash: B2CKSSU2DFZBUG6ZHDQHVKJ72IJDP5G5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B2CKSSU2DFZBUG6ZHDQHVKJ72IJDP5G5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed 11 Sep 2024 at 17:24, Arseniy Krasnov <avkrasnov@salutedevices.com> wrote:

> Buffer 'card->dai_link' is reallocated in 'meson_card_reallocate_links()',
> so move 'pad' pointer initialization after this function when memory is
> already reallocated.
>

The title could have been a little more specific.
Anyway

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

