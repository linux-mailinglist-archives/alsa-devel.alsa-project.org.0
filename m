Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8488767593
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 20:39:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3919582A;
	Fri, 28 Jul 2023 20:38:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3919582A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690569556;
	bh=V6GfwiwZhhAo9EKxw9F08iud7qpwpey7vDzyT3dCeJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fhjuQNTuAJL4p27FX5z8eEIW+tVZ9yEvfSxjvKECLbUChIxce25jH5QdSsiYZD9hU
	 4ZQUnaUkCtweKkVJIHE0mLtFlAnBlvSSF5GdsmQecMf6U6bxXR1J3U+hqLqcmXKVzH
	 hSWfcJmof8BwRNyAieptP/wfWDX6gwgdmcg/PaLM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F674F80535; Fri, 28 Jul 2023 20:38:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46A51F80153;
	Fri, 28 Jul 2023 20:38:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80672F8019B; Fri, 28 Jul 2023 20:38:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 727B3F80153
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 20:38:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 727B3F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=AGp+sPPY
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1bbc64f9a91so19523975ad.0
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jul 2023 11:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690569492; x=1691174292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=33rFVY7OX9UkeWBGFwT8EclqMxrl4R8dedNz9bKvxDQ=;
        b=AGp+sPPYuUqVRuwsfE9zLwd/0wQ1PyqWr/E+SShiflsTRolH7KQFms0vp6Iz18yg5l
         yyXkofuwxadnA24u9OFXuqrKvomEco71UnJ2hvZYlItq6Bt+J9FHpI7vN7XoZs1xpm+x
         bPy7O3JcgiU891wJkhPj+/1ZkSAP1bBRrfaNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690569492; x=1691174292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33rFVY7OX9UkeWBGFwT8EclqMxrl4R8dedNz9bKvxDQ=;
        b=ErCi6DEZcWNdDIBsox1c49pDbo/N4vA/va30WhJnueqjL2tuti0DmxFA7wftYher+6
         R0o2VpEdXa0jcVXrpL7XbMW2DiGzfUtDaKvcqVT0H4J5JcSS0eTcC8xJQPdraG3bcC3H
         PJTGVgfZ8mIJEI+K/z9qak+Q8l/mwaktHqxxGf1h1vpyrYpaA1JKI9QcaVuxOMb3b8Qj
         ORMzOXaPSu7PfyX0uuSHe8pnMuoX77tFd6N0jspgbhbQU3N1wAr9aXPN2L7ejRmmr74t
         TZU9Cd6vfpOc9GvOS+UEg0S78ycN3bD7LREtfRR+0fMxBUqcpt9zpxs3znGkq39OJ+v4
         r4/w==
X-Gm-Message-State: ABy/qLY8ZWAk5Apzc1QE2gYU7hUiyl3JfZIe4nkJTwkloDSoblMT+Wwx
	NQHLL6BXgUY/xJfCqnaL2VCEB4662tVYWsowCAU=
X-Google-Smtp-Source: 
 APBJJlGs+KiAjovc4Ff5bXdv+1247KNp4pAQW/e6jaoOH3v88JUN99m0BT5bc653vOVDiJeYTmDZgA==
X-Received: by 2002:a17:903:248:b0:1b9:cf52:2bcf with SMTP id
 j8-20020a170903024800b001b9cf522bcfmr2621118plh.0.1690569491651;
        Fri, 28 Jul 2023 11:38:11 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id
 ix13-20020a170902f80d00b001b9d7c8f44dsm3907903plb.182.2023.07.28.11.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 11:38:11 -0700 (PDT)
Date: Fri, 28 Jul 2023 11:38:09 -0700
From: Kees Cook <keescook@chromium.org>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Justin Stitt <justinstitt@google.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: xen-front: refactor deprecated strncpy
Message-ID: <202307281133.16D4305@keescook>
References: <20230727-sound-xen-v1-1-89dd161351f1@google.com>
 <ZMNILDgqHEGf8fNF@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMNILDgqHEGf8fNF@mattapan.m5p.com>
Message-ID-Hash: NBSUNOHS5I6FAHSONCOZBA2CQOA7D3R5
X-Message-ID-Hash: NBSUNOHS5I6FAHSONCOZBA2CQOA7D3R5
X-MailFrom: keescook@chromium.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NBSUNOHS5I6FAHSONCOZBA2CQOA7D3R5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 27, 2023 at 09:46:36PM -0700, Elliott Mitchell wrote:
> On Thu, Jul 27, 2023 at 09:53:24PM +0000, Justin Stitt wrote:
> > Technically, my patch yields subtly different behavior. The original
> > implementation with `strncpy` would fill the entire destination buffer
> > with null bytes [3] while `strscpy` will leave the junk, uninitialized
> > bytes trailing after the _mandatory_ NUL-termination. So, if somehow
> > `pcm->name` or `card->driver/shortname/longname` require this
> > NUL-padding behavior then `strscpy_pad` should be used. My
> > interpretation, though, is that the aforementioned fields are just fine
> > as NUL-terminated strings. Please correct my assumptions if needed and
> > I'll send in a v2.
> 
> "uninitialized bytes" => "leak of sensitive information" => "security hole"

For xen_snd_front_alsa_init(), "card" is already zero-initialized in
snd_card_new().

For new_pcm_instance(), "pcm" is already zero-initialized in
_snd_pcm_new().

So things look good to me!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
