Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A78977482F
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 21:28:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 816D2826;
	Tue,  8 Aug 2023 21:27:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 816D2826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691522896;
	bh=ANghrSx9C8A8HM9OR3ej0JLsctnaUip386SnFAieWlA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hcY/DVev3UhQUyB8dTuX6eahBKmKySpiAF/s7ah6ed9qwiecqO0fVJGGpgXzWpPmD
	 zpxv1VV0LOp7kJ2xOi6jfefRosBx82xS0/uuzQj+JXFNeqSWP4wMJiZ7jm/RR283m3
	 dJ9AjYD8wXsAWAfCECHn4FSeMA73aYA8KsAJA3qk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D3A0F8053B; Tue,  8 Aug 2023 21:27:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1592AF80154;
	Tue,  8 Aug 2023 21:27:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB399F80534; Tue,  8 Aug 2023 21:27:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7BE4F800FE
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 21:27:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7BE4F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=qVqXUC+S
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-267f8f36a3cso3468400a91.2
        for <alsa-devel@alsa-project.org>;
 Tue, 08 Aug 2023 12:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691522827; x=1692127627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txVQbZmoWGP3Z2QzuiN1QvSEQ3LTRUL5BPTfMROYgIQ=;
        b=qVqXUC+ScCus2sXHxYWQ0Ffck/+XtzpopkNgjo0bH/SsRFJ4LvmcnUL/t0FpKld1MJ
         aBPqBN8u1CSKiiRe5q8HSW4GV54ErukbYU19V0IC4HfiCRkK89pi9k0EjnCKSRBgB//o
         OX647bxR/J2e09OixqB5BCDJMipED8jTlQ/GUOn32J2xh0BY0hYf+Swt7dYbcx38afHw
         BELqKlbBiAXvHLgY4PXjNsNA6oVGd/XleRPLa0T6XOEVem+cH70KAs539kBpzN67558t
         g+gJ3U26xVPOIkSja1f+whMSgiM+6OchmP5S8BlLs81Rq1gfm3iEP1cCVUzFuyn18bMr
         IfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691522827; x=1692127627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txVQbZmoWGP3Z2QzuiN1QvSEQ3LTRUL5BPTfMROYgIQ=;
        b=VBIIUjZYTztEHCPCu7T3KudaMtnhsQhVtaPOzq6wnEMDbV6BcvWgHvNRNIWDVFvghn
         ESciuP9JBFc22mNcuiT/xTIvt9wyxj6stVFYT7MwqOrRMukpf8QIybo5SvbNMHtFn1Zc
         vSXnEKY2bi9jNp8DvEZbWzcAdQctmiwKk9XJyGHIUPvLMhyyV3J3ORJ91qKf9ZF7N4Mf
         WPBh70L5BYWOg+0eUjQD8ZUY6JBdYzDxiBhtYVqmhkjaH3a8xZ7Zeq49DuBXnbpA36si
         DmLR6+WBg5Sy5EIzo4JuzKQnnKVo9Zs4MzQnmHc0qFVhoNoayL38BYV2GmPl56HkrcV5
         VwbQ==
X-Gm-Message-State: AOJu0Yzfys+WU8un3YPDJ+knGQVTOTOdXiF+XZHSTQeWfThJk7l2gLp8
	km6mzU8M7liBJepyS0Q/YuY/6eqkNdps5ia4vwUmqg==
X-Google-Smtp-Source: 
 AGHT+IEXzgR9Gznd36QdBrss56EUIkrsvGjSZ7F9z5oAy9OqJusv564Byb8m0nhz4pu3aGLiMSQiyVWBv0FBEJCGIkY=
X-Received: by 2002:a17:90a:d34b:b0:268:5e70:508a with SMTP id
 i11-20020a17090ad34b00b002685e70508amr427386pjx.43.1691522826465; Tue, 08 Aug
 2023 12:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230807135207.17708-1-tiwai@suse.de>
 <CAOReqxhV=gfwNpxnEU+ruOx6gjD2BSZbYPJ6+iWzkPCidFmCBA@mail.gmail.com>
In-Reply-To: 
 <CAOReqxhV=gfwNpxnEU+ruOx6gjD2BSZbYPJ6+iWzkPCidFmCBA@mail.gmail.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Tue, 8 Aug 2023 12:26:55 -0700
Message-ID: 
 <CAOReqxgCDdXAEyF8pt4dePQ2H_ub=hYczvO1xGpKWAt35z5B2Q@mail.gmail.com>
Subject: Re: [PATCH RFC 0/6] ALSA: Fix UAF with delayed kobj release
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Curtis Malainey <cujomalainey@chromium.org>,
	Stephen Boyd <swboyd@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 34WNBJHA5QCMPHGL2ITJ2VIPZ2TKMWNQ
X-Message-ID-Hash: 34WNBJHA5QCMPHGL2ITJ2VIPZ2TKMWNQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/34WNBJHA5QCMPHGL2ITJ2VIPZ2TKMWNQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 7, 2023 at 3:34=E2=80=AFPM Curtis Malainey <cujomalainey@google=
.com> wrote:
>
> > It's just a RFC and only lightly tested.
>
> Thanks for the series
>
> I will be hammering this in my test setup for next several hours

Testing has yielded 0 bugs overnight.

After discussion it seems like this might be more of a workaround for
the APIs than properly using them. Adding Stephen for more input but
having two kobj in the same allocation is technically not correct as
you essentially refcounting the same thing twice. Also having an empty
release function essentially nullifies the purpose of the refcounts.
We should probably consider something that uses the API as intended
rather than trying to fight their function.

Curtis


Curtis

>
> > I myself am not sure whether
> > this is the best way to go.  It might be better to take Curtis'
> > approach, just converting the device to its own allocation, too.
> > (But I don't know whether Curtis' patch set covers all cases -- can
> > still be a UAF of card_dev due to devres vs kobj release?)
>
> My original commit does not cover the devres kobj release race, only
> the race among the kobj themselves.
>
> Curtis
