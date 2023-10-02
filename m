Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 265197B9B80
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 09:49:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88807E94;
	Thu,  5 Oct 2023 09:48:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88807E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696492167;
	bh=gMNi9DNabSmzuXHfHwWyV508gW5QFPCosMp/KN7q980=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=te17dAz9Nwyeunb2cnc94hJacvcdwy/K0JmhAoGJtb4zQRJOJWFzy+A10/d6H8Alp
	 YY7gFzFI5uiQGZ7dTa16yYg7XPCSkWuvI8ZdQgy9GPc1hCaSAFz50lThC9+fIe6T31
	 +gekdPjILNupGkPKZb3EXpQyGYrPSqVXJLhgXgH8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3B93F805C0; Thu,  5 Oct 2023 09:47:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C7ECF805BB;
	Thu,  5 Oct 2023 09:47:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 788F5F80310; Mon,  2 Oct 2023 15:17:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BE243F800C1
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 15:17:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE243F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dkoIykff
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40666aa674fso18087985e9.0
        for <alsa-devel@alsa-project.org>;
 Mon, 02 Oct 2023 06:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696252661; x=1696857461;
 darn=alsa-project.org;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z+g2r1MHpKADoUhttLvqNozABTTCpwn69LleV+mBSZw=;
        b=dkoIykffhFmbhG4gZxb9+PoxRjPVbz/qVHgp0poHS4tQ2xTkPb9UBTtEOfVYJrA5NP
         eZMwM6ZwEDkfn29Rah606DPEJsoKQudPA0VfWeaxOxBtH2YmBLKfnyVQBSVjoQo/hvpP
         +DR0jmbI7KkoS8VCflPDuig03P2ZYQCzFRt27Mh9tCigNaL+zznXZ+ncnwfYwxs7hx5l
         0DNeuaF8tDs5NV/ixdqBj2pA7ZEEXuI26hA2zK+wBJIGbk4b8EfWPcbY8NKKNcn4F+Vb
         YS9Uo40HAui9imuCDPyHPqrUkW2ItpZleBWr7yluUGZo92uQLHuL1NTNJf5xUwDvsa6/
         Z4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696252661; x=1696857461;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z+g2r1MHpKADoUhttLvqNozABTTCpwn69LleV+mBSZw=;
        b=QD/3xVi0FAp4yJuAM94cmz60LFyOu4j/d14jh+h4NIO91n1wA/p053A+gZ9cqEXk3N
         omIwVCfLrI2cevbjHjl7rEZbKx7MfPGSa8MneQA79iULOaut9vC0CgYRE1WPGATJHSuT
         vRMBw+shOzMx1dGihO2ihXBTMPNgfvNwztxUYIgMH7W6/Rozkis1gdQ7m/xhu9A+WtIp
         o+q3di7rLfiwn8XKX2zwmlby736NhfGmPh4pMpYZ5WBEqyj0eikP26sL9UtyJshBs55r
         dmXtCu42RcosdPsy33ctwMke3vZWRK8rwa+R84KEpC7o8gLSZXE5NQ88FdtnEcLwMGpH
         DaiA==
X-Gm-Message-State: AOJu0YzK+4ZrIZ4R/4Br7RAeC9MnQT9ATU8ctYOaOnFdtHrbcBYhauiE
	2A5B4JctZB07a1oZjVbFPm0=
X-Google-Smtp-Source: 
 AGHT+IGeZQu02JzP/Nlg3C7p7vx5VY6jCwGLZ0tAXK3iajF+JbhjNs9qkMjRAcg7uKIaJxyg3RvqMA==
X-Received: by 2002:adf:ec47:0:b0:313:dee2:e052 with SMTP id
 w7-20020adfec47000000b00313dee2e052mr9195032wrn.26.1696252660381;
        Mon, 02 Oct 2023 06:17:40 -0700 (PDT)
Received: from yoga ([2001:638:904:ffe5:5742:c50f:bd0:6aa6])
        by smtp.gmail.com with ESMTPSA id
 t11-20020a5d42cb000000b0031431fb40fasm6907727wrr.89.2023.10.02.06.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 06:17:40 -0700 (PDT)
Date: Mon, 02 Oct 2023 15:17:33 +0200
From: Sven Frotscher <sven.frotscher@gmail.com>
Subject: Re: [PATCH v4] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
To: Mark Brown <broonie@kernel.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
	mario.limonciello@amd.com, git@augustwikerfors.se,
	alsa-devel@alsa-project.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Takashi Iwai
	<tiwai@suse.com>
Message-Id: <9XKW1S.IRRCIDM08XWX1@gmail.com>
In-Reply-To: <89698b5f-a616-4f49-802a-21326a868c7f@sirena.org.uk>
References: <20230927223758.18870-1-sven.frotscher@gmail.com>
	<46560887-0b6e-42ac-96c3-b4dbc1d7cb61@leemhuis.info>
	<4fa7d39d-dc34-4550-97fa-2b089f364cca@sirena.org.uk>
	<541ac45b-8de7-4fa2-85ee-456d34e60aa9@leemhuis.info>
	<64c78944-4d62-4eda-b92b-3b415fea3333@sirena.org.uk>
	<65KW1S.A6C8VBV29YCM@gmail.com>
	<89698b5f-a616-4f49-802a-21326a868c7f@sirena.org.uk>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-MailFrom: sven.frotscher@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2MG5YAPIDPGYQS5W656ZOQPRDJNGRSDF
X-Message-ID-Hash: 2MG5YAPIDPGYQS5W656ZOQPRDJNGRSDF
X-Mailman-Approved-At: Thu, 05 Oct 2023 07:46:47 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2MG5YAPIDPGYQS5W656ZOQPRDJNGRSDF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



>>  > Until someone tests or otherwise provides specific information on 
>> a
>>  > given machine we're just guessing about how it's wired up.
> 
>>  What specific information are we talking about here? I have the 
>> 82YM in
>>  front of me and could help investigate.
> 
> We need to know what magic set of quirks makes the thing work.  Are 
> you
> saying that your patch doesn't actually do that?

It does.

Maybe the non-quirk check (ll. 395-403, seems to be using ACPI) is too 
specific? But I'm a bit out of my depth here, so I can't investigate 
that by myself.


