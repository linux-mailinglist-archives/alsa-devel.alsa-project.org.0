Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B82767614
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 21:12:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 149A5845;
	Fri, 28 Jul 2023 21:11:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 149A5845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690571565;
	bh=FztGtLjuoljT9BuTpmG2cccQBvz8m1jinN22J6JFzbM=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IbpDxH5e1hDfX0ptBYr6+j7UNB6tx4L1EZ2MM2a+EG+jmmXZ7IoiBQ4zkjwSz8taB
	 IWx0KZn9Ns/X8iRC1CKo669lQWJrD2sOsFO5VGXGu79CvYvrJ6K7a1rOOKo3uGXK0o
	 Fa0Ad1FVQHdj0EyKW/hgXlRpUeIyW9sV8sEGXn5s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BABBF80535; Fri, 28 Jul 2023 21:11:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D1EBF80163;
	Fri, 28 Jul 2023 21:11:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 806F2F8019B; Fri, 28 Jul 2023 21:11:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5175F80153
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 21:11:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5175F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=bbabpIxG
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-58440eb872aso26192167b3.3
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jul 2023 12:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690571503; x=1691176303;
        h=cc:to:from:subject:message-id:status:references:mime-version:lines
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FztGtLjuoljT9BuTpmG2cccQBvz8m1jinN22J6JFzbM=;
        b=bbabpIxGO3boIg9vf5YobCjg0n52L+Fr49fpDJnaZuPkxc8D8pdzd9HafgJTaPtd5R
         rRJzAK01EWmDhXibwwSQ4JqcG5p4vsJ0yFAB6MFo73hfX//zqYZ6NoX+9XALYzBMTwlx
         KRaGNXiBbDtliwxlSHd19kDDVUGka5xYGmxAHA8ShtRWnLBZs6Wx66zBMyigalhYV6NU
         8mQ53Kjm94wOLo02pMITqaBIBLc7+3yDMs6ynDvqHJeXOhAx2GgHlxbCrBb4taJnSGQ7
         Rs3ie2zMU2KfvBnyM+NK1Ui+aAteLeNr6txejrKgQTW7n25byv1vLMzQUDZq2sM860Yc
         DBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690571503; x=1691176303;
        h=cc:to:from:subject:message-id:status:references:mime-version:lines
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FztGtLjuoljT9BuTpmG2cccQBvz8m1jinN22J6JFzbM=;
        b=j5rIgsWXpdk5217a3EbGU18WXQ6IOaNpUfji/1bA1YOW7r2aK4hSQ0AWX3aJfTTaeG
         0Zqnt3CZ4oXGJFyltlyyUJY5RrOvjIhDzjVABYHpby6Cytvzg2QhqPB129F3lvi2i0p7
         MkBdbfCwKcoLCNew2s1iM8TUYIwqeXDrkG+k34fwQV7HUHqUB+RrEuI1UvrlKn0dvZ1x
         Pzozzrg7wky2Xr3EnBUg0dNikniw4Tqz2r2Amp0CK9AB6UclLD9PMKA3FhUr8tChEdS6
         dPxtxgjXyd0UzSFo3HzmPb+a4zfkNyPQuwUF6HyQO9P1Axdicr7lnOrUrP7QFLkv/9u8
         yz5w==
X-Gm-Message-State: ABy/qLZ5lXapEItJRKL83fivYvUdtUtn1ihFi9By7IriPkM2C2CRt1OW
	ZsM2LQev+7+6VFs5VN3C4FcYBtHHDqhhUr6ILQ==
X-Google-Smtp-Source: 
 APBJJlGvcJRtoJfjVKE/syeC8RCxktDOWFE3YH6pPAx6gyI5gJlFbY4kk9jWpk6q50Qa/rLwGAKwPpoMFZFK0JoifA==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:2d0d:0:b0:d06:3c3c:17eb with SMTP
 id t13-20020a252d0d000000b00d063c3c17ebmr14344ybt.5.1690571503198; Fri, 28
 Jul 2023 12:11:43 -0700 (PDT)
Date: Fri, 28 Jul 2023 19:11:18 +0000
In-Reply-To: <202307281153.B9D0831710@keescook>
Lines: 25
Mime-Version: 1.0
References: 
 <20230726-asoc-intel-skylake-remove-deprecated-strncpy-v1-1-020e04184c7d@google.com>
 <20230727-asoc-intel-skylake-remove-deprecated-strncpy-v2-1-152830093921@google.com>
 <f0f0ebe4-55fb-4861-a94c-77c82ec600c5@sirena.org.uk>
 <202307281153.B9D0831710@keescook>
Status: RO
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
X-Mutt-Fcc: ~/sent
X-Mutt-References: <202307281153.B9D0831710@keescook>
Message-ID: <20230728191121.4092351-1-justinstitt@google.com>
Subject: Re: [PATCH v2] ASoC: Intel: Skylake: replace deprecated strncpy with
 strscpy
From: Justin Stitt <justinstitt@google.com>
To: Kees Cook <keescook@chromium.org>
Cc: Justin Stitt <justinstitt@google.com>, Mark Brown <broonie@kernel.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Nathan Chancellor <nathan@kernel.org>,
 alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Message-ID-Hash: PWULK35NI74H32YIYOJD2XG4BDSUQF2G
X-Message-ID-Hash: PWULK35NI74H32YIYOJD2XG4BDSUQF2G
X-MailFrom: 
 37xLEZAsKClI3ECD27CD2DD08805y.w86u5Cu-xyFy5u5Cu-9B83ywD.8B0@flex--justinstitt.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PWULK35NI74H32YIYOJD2XG4BDSUQF2G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jul 28, 2023 at 11:56:08AM -0700, Kees Cook wrote:
> On Fri, Jul 28, 2023 at 12:27:24AM +0100, Mark Brown wrote:
> > On Thu, Jul 27, 2023 at 08:30:18PM +0000, Justin Stitt wrote:
> > > `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> > >
> > > A suitable replacement is `strscpy` [2] due to the fact that it
> > > guarantees NUL-termination on its destination buffer argument which is
> > > _not_ the case for `strncpy`!
> >
> > Please don't send new patches in reply to old patches or serieses, this
> > makes it harder for both people and tools to understand what is going
> > on - it can bury things in mailboxes and make it difficult to keep track
> > of what current patches are, both for the new patches and the old ones.
>
> Hm, I see "X-Mailer: b4 0.12.3". Is this a default behavior of b4? (If
> so, that needs fixing.)

I don't believe this is the default behavior of b4 but somehow it
happened. I believe I did a dry-run of this v2 before sending it and
somehow it replied to the top-level thread? I have no idea but I'll
double check before I attempt sending a vN next time.

>
> --
> Kees Cook

