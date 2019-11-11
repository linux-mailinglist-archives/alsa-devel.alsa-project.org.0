Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB226F7D26
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 19:53:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5426D1671;
	Mon, 11 Nov 2019 19:53:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5426D1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573498431;
	bh=QhVUI6Cdm9BHE/rHo43JlNrmdHE+WuIiPjPtdqNX+no=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pfD8DGMwmkHJ8iIRFTiKMwkjjA3Mnj9S4pzNlct0W9WbLi0WwB91FPX//rPrK8zp0
	 7ktXMIJDnUNmvty0+3H7zBOuyShf5FR+g9HAUeoSu8vW0Pyr4PH5GzIV31F1yqTVw5
	 nHGAiwADIdOlA9Jc+mwMkjTNCHMQZ8aC+ns40frA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5848DF80518;
	Mon, 11 Nov 2019 19:52:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C854FF804FF; Mon, 11 Nov 2019 19:52:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A3BEF8015C
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 19:52:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A3BEF8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="aF75HNJH"
Received: by mail-qk1-x741.google.com with SMTP id 71so12137088qkl.0
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 10:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+Pb5UoucrgGddH2HlDKDr7PgogucKnOoofI8wOJbcSo=;
 b=aF75HNJHuX21bqGodDnOIERKQiV/ed0RgpYLlKnvaDQLrjs275iD0DUkbyUybBzIrN
 OjPVGGF9hrU0mmT8P6pNxGCWG9uBGeTS3QqT3r2jH6tzLqLgMBDJ24MPhVsJNiMCVz30
 m5Lvspi8MYLbrOuIbmVeaHP+rHzaj5JAd1/pWtzAWnz5rfsQr0c89H/G9QwJqvwN+ISM
 SNoRWcFzvsGatNE7+VLbp24C8D5+VwMvT9j2vo4IhmNEAaUeUFcA5yYaGwNZANDNNKaC
 TnnndldP7Pi/psKK/bObYxrkMnMggfhk4zJGZcW45o61RJVR2uiXD46pTzb9xaeKz2gI
 JqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+Pb5UoucrgGddH2HlDKDr7PgogucKnOoofI8wOJbcSo=;
 b=S95zgaqZHBdTGUPsQO+/Ud0ny5z8QwgnySEbEYGyp7NYhJs+tRLVaM+eH45bzChRSI
 LqEbyZk4bdgcmAuaik8OSRVT+PN1CPj7QRj34b83G3KbqDTCPhvuCtDMdbbCcwx/Vdch
 8h399UciaDbslmnPHlLUDH04nXqgerqLbjXwOD4jbtsMXxqglXVjm1QpolfPw/I4ZpdK
 uHlezLqTQPmGOPFoFho8n4Ilaa15oTjnCmA2idghZ6kFQvl+2DOI2JejfUxoN9fjnk3x
 5pa14zgKnLin0I+4hOEa+ie4OTe0wQiPqyTEgaJtvLzhF/cVgsup7gFmQs1M6H4TAhFp
 mRVQ==
X-Gm-Message-State: APjAAAVgXRyLqd4E4tMtl1ufLCbXzJ3/WHiN1H8J1Shx1Q1Do1KoPYQh
 Z9QznJaNkfrRKgUWxvEgAOhWMEt5u8WbQt4TNMxdAA==
X-Google-Smtp-Source: APXvYqyNF+DKKnoScIuFZJT5wh6EdbxvGzdQdzQOkMrZ2eUVxxmVg+262w7xlibSTH8ZBCPVp9sUuzX3+6y/IXL+iV8=
X-Received: by 2002:a05:620a:13c2:: with SMTP id
 g2mr11194944qkl.158.1573498319927; 
 Mon, 11 Nov 2019 10:51:59 -0800 (PST)
MIME-Version: 1.0
References: <20191107015808.26844-1-cujomalainey@chromium.org>
 <20191107015808.26844-6-cujomalainey@chromium.org>
 <cedaf20b-6752-5f49-64c4-0f3abec8244c@perex.cz>
In-Reply-To: <cedaf20b-6752-5f49-64c4-0f3abec8244c@perex.cz>
From: Curtis Malainey <cujomalainey@google.com>
Date: Mon, 11 Nov 2019 10:51:49 -0800
Message-ID: <CAOReqxjWove6=9x+Hm0-xEJ_4-iocZo4fnwzV73-sxobTTuCyQ@mail.gmail.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Curtis Malainey <cujomalainey@chromium.org>,
 Mark Brown <broonie@kernel.org>,
 ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 06/11] ucm: docs: Add DisableSoftwareVolume
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Nov 11, 2019 at 7:22 AM Jaroslav Kysela <perex@perex.cz> wrote:
>
> Dne 07. 11. 19 v 2:58 Curtis Malainey napsal(a):
> > Some userspace audio servers might default to software volume, this
> > allows the ucm to force its behaviour
> >
> > Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> > ---
> >   include/use-case.h | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/include/use-case.h b/include/use-case.h
> > index 05628303..1aeaf9d4 100644
> > --- a/include/use-case.h
> > +++ b/include/use-case.h
> > @@ -334,6 +334,8 @@ int snd_use_case_get_list(snd_use_case_mgr_t *uc_mgr,
> >    *      - This is used on platform where reported buffer level is not accurate.
> >    *        E.g. "512", which holds 512 samples in device buffer. Note: this will
> >    *        increase latency.
> > + *   - DisableSoftwareVolume
> > + *      - Set to "1" to force userspace to use hardware volume controls
> >    */
> >   int snd_use_case_get(snd_use_case_mgr_t *uc_mgr,
> >                        const char *identifier,
> >
>
>
> My understanding is that if the hardware volume controls are defined in UCM,
> then the UCM user (audio server) should use them. Otherwise, the software
> volume control should be applied. I don't see the reason to have this info
> doubled.
>
>                                         Jaroslav
>
+Jimmy Cheng-Yi Chiang can you clarify in what context CRAS might need
this value? The only cases I see are for Chat 150 C and Jabra SPEAK
810. There are no volume mixers associated with these files.
> --
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
