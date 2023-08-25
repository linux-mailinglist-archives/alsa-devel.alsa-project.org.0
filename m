Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F3A788DED
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 19:43:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAAB5844;
	Fri, 25 Aug 2023 19:42:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAAB5844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692985416;
	bh=ZrQYaZFh0g/05d2OMWO/GojEDaRAYNGGdRhiavhFehA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dKBH2BP4gFThCgJQUqzO7jJXwIKWzE0U4L3QBj0cU/3d0D6XO//hedchw5fwXNOot
	 fLPyrrLycB0lMIVhp/ggCVJl9FRG9grzDfAC8kGxVuEydrAR5x+V6zkg8UZgwAFz/A
	 9JXB1AydkdauubFNTPdqP0DGCHcauaU+jAC5a9cI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39919F8023B; Fri, 25 Aug 2023 19:42:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF7E3F800D1;
	Fri, 25 Aug 2023 19:42:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82B95F800F5; Fri, 25 Aug 2023 19:42:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C554F800AE
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 19:42:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C554F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=i4SMUVbO
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-564cd28d48dso659644a12.0
        for <alsa-devel@alsa-project.org>;
 Fri, 25 Aug 2023 10:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692985354; x=1693590154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J3ci+EjgCAFSX8m1G5nSJW4m5U8sK20mFLdqrj2z0sM=;
        b=i4SMUVbOS+4MOQce86ZHF0ZSYsvbSsunrm+5w20kL7byKRhLT+JvgiFfIRdDmuUcAR
         iBbeOviUD7wgF+lP0pZry6QQo92jY2JkI5U/R4RMuZ2RexrJR27/j2YLAgeYXvkNRBzv
         PtN6ckS6c1MLPUVy+0u/qEzYLPiVl0fCLoGhvMXakFjSleB4gl+frrsUahVObPeX6oDC
         mvOK6pJLSruYr/tw9AuWPcKCQH6i/eNvthKXqG4OgOL7rlsEJJ3Vh+xYHMPZzRqoNXLo
         BlXFI8UiHxXym9TES3GudMdrSGOH8BxTIhrRrV3Z8CSiRfjK2fsSjxyf07ZDs1pfCLU2
         bWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692985354; x=1693590154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J3ci+EjgCAFSX8m1G5nSJW4m5U8sK20mFLdqrj2z0sM=;
        b=I5kwjnL2J13cHZH1XMUQVQmX8KRk3yXktXtaw1rR4xvH60wWu2+XJEAORyHitIMi85
         vU3Q4p+mP5FySaxhO5iTtoTdG1+qIfAWBvXMctxNtal6nC7SGYBMoggwHIuqLa7tKblg
         7BDzY45y63mYaU7oucBlXCB8Dh+sY1osMUMpeYXMzfK7VI87xZIBSZaE5/OpUVHJ3t5h
         oWz59SU0IWOPWjkQ4Bi/dTR2MZ2Co0Zwhi6+OmCm+Fnxml1pzbskoi/vZEGFTkVev77n
         ruvjuOpLqBnHRX7qAZsbKEC/AQORrR11Zc/O7FXBRc6HsfcEhKMzAk7ILcl60csnar1m
         xuCQ==
X-Gm-Message-State: AOJu0YzTZXCEjrAINcyHvWxKxFQChwTg8ngUVaxW7YJv/dcADjHal4pI
	SEInb4BESaGD9pbneRf0zBY0RE81GFmNDfdQN2Jq6Q==
X-Google-Smtp-Source: 
 AGHT+IHJwfe0h/TSqFPxWOdVW5HwOTM9ZcNPYoEOHln/V6kRE9iHKetjiAhLxJhHY2XFXkfYHHkqi8endVjH4FvUX9k=
X-Received: by 2002:a17:90a:ea92:b0:26d:15dd:6702 with SMTP id
 h18-20020a17090aea9200b0026d15dd6702mr15420641pjz.5.1692985353389; Fri, 25
 Aug 2023 10:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230824210339.1126993-1-cujomalainey@chromium.org>
 <87il9374ph.wl-tiwai@suse.de>
In-Reply-To: <87il9374ph.wl-tiwai@suse.de>
From: Curtis Malainey <cujomalainey@google.com>
Date: Fri, 25 Aug 2023 10:42:21 -0700
Message-ID: 
 <CAOReqxjHJ0UXWUk+6CA9uTtick57xFLG7BXh=Y6BVycgxjHfHA@mail.gmail.com>
Subject: Re: [PATCH 0/2][RFC] Refactor snd primitives refcounters
To: Takashi Iwai <tiwai@suse.de>
Cc: cujomalainey@chromium.org, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 4MMB5KJPRLHXQ4B5MBK46NEY4TS4J7U5
X-Message-ID-Hash: 4MMB5KJPRLHXQ4B5MBK46NEY4TS4J7U5
X-MailFrom: cujomalainey@google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4MMB5KJPRLHXQ4B5MBK46NEY4TS4J7U5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Aug 25, 2023 at 4:16=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> Thanks for the patches.  But, as the 6.6 merge window open is pretty
> close, I'd postpone those unless it's urgently needed.

I have no timeline since we have the workaround in, hence the RFC

>
> Also, before moving the resource tied with the device object, we'll
> need a refcount to the ctl dev from pcm dev, as PCM does release chmap
> at its free path (calling free_chmap()).  Otherwise it'll lead to
> another UAF, if both objects releases are done asynchronously without
> dependency.

Got it, thanks.

>
>
> BTW, the cover letter and the subject prefix of the patches don't
> match, and also the cover letter didn't include Cc.  Please try to
> make both cover letter and patches sent properly.

Thanks for catching that, I was struggling getting cc to copy across
with git from get_maintainers. I will give it another shot with v2.

Curtis

>
>
> thanks,
>
>
> Takashi
