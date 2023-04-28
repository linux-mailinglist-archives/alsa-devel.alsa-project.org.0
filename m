Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E476F1BFA
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Apr 2023 17:53:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60CB11317;
	Fri, 28 Apr 2023 17:52:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60CB11317
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682697194;
	bh=7Z16HxlpRs9tVjVsYQipQRpK94V2dMirSzJ63ImxjL4=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kx2MrNqg/R6t3g8Z+UW1SopFR2hobE8HFoSznXybdW/Dmxf7JzR3H17iQc2NDeGK/
	 u7gn8l8l4NeqFoG+AONlIBw3DmRwk48oqWw+YhfhzPid9GVggqbeGzTH48/1U879hz
	 cALSeTxWpkKLuI+pxA5pH+zkDnCYz4Ve4v4d5c4E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F5BDF80236;
	Fri, 28 Apr 2023 17:52:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFC01F8025E; Fri, 28 Apr 2023 17:52:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F621F800AC
	for <alsa-devel@alsa-project.org>; Fri, 28 Apr 2023 17:52:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F621F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=CJ5NPcs4
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-38bed577755so67515b6e.0
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Apr 2023 08:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682697128; x=1685289128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mJ1hDD1DVdMDrElUjLaXAWEire+Mo7bp6iBp1c0A0CY=;
        b=CJ5NPcs42fA/gv598ewwKpL9Ff0x+Wb3AygG8tTQdN7Tq5ENNxwoRJ8meun6Vw5yCQ
         +BHJfUDvmfq6sHvNgpPcn8BYjulUqcXwL5CyvTPB4RTR0eqi9lK+8zc8DMoRF578tkqK
         HXAqvYJcxEJ9PS4xa4P3kr7k9Tzdl388k5TOR5vLOe4bc8kFv5JktBCnM5VXEeaekLrK
         vtxmThSzKFnsl/fVIw7wDaIdtX1MNC/jyzPQPQdAMta4/WbjcL13JQOoeu5PG7adwyCW
         uXqu6kDIE+w32Z0zfSqpU5T343cKgbd89PvxYd3dKLOLSH6AQEaNgVKzrGg9MU7ZBFNS
         wL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682697128; x=1685289128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJ1hDD1DVdMDrElUjLaXAWEire+Mo7bp6iBp1c0A0CY=;
        b=bdUr7jm92XRe9EEnrZvszDirnwTxctnO1Xvz66bZGTahhg45kngRMSp+HihQpnQUAg
         g8US1bYffSQLgcSUE0Tm+mY0uVzoZVVdqCtyOWZhKfX/MsG3iWy9g9Snr65kuHQ3+CWJ
         mp/vAVNmI3NqaZumg2uvzyPBfu8+9VRUTpTIBAWSNdbMEVy0LdZHheQmWf3MTQXHES92
         wKPF+lhEArRaDUK1ba7tqxL7jfcJR76RuxqehB1xY9atOPUvgzf2+WhIYwcsO8ppPext
         79DXGXD2//OeTnfAIIvlAFeeF7I8+6JVWA5amGXwnw0VlhwNH3gwZ103WBCOD7squ1lp
         VynQ==
X-Gm-Message-State: AC+VfDwJWGSQjCeKTDjWq7KkWkiLJwxuXv4O6QaDhL0+QyRg8myIwQ07
	tbd3P8C2CRLwE6sTN1LI8G0=
X-Google-Smtp-Source: 
 ACHHUZ7lKt6+ENlhvNaeOwXErE7A15Rjeav+FPNllNR6jYgTHKXP4LCzm+vZ2CjCLh/GLLfeGBcZFg==
X-Received: by 2002:a05:6808:278e:b0:38e:105f:1258 with SMTP id
 es14-20020a056808278e00b0038e105f1258mr2733971oib.52.1682697128376;
        Fri, 28 Apr 2023 08:52:08 -0700 (PDT)
Received: from geday ([2804:7f2:8006:264a:5968:9b0c:9bfd:8124])
        by smtp.gmail.com with ESMTPSA id
 i205-20020acaead6000000b00383ce81c186sm9007492oih.32.2023.04.28.08.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 08:52:07 -0700 (PDT)
Date: Fri, 28 Apr 2023 12:52:30 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: semiydsemiyd@163.com
Subject: Re: How to mix multiple pcm capture stream into one and save to wav
 file as if it's from one single multi channel alsa card device
Message-ID: <ZEvrvsooKSynbnzU@geday>
References: <168257479762.20.3215919601496636554@mailman-web.alsa-project.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <168257479762.20.3215919601496636554@mailman-web.alsa-project.org>
Message-ID-Hash: 5OSHXOCGSWRTMF2MMBQYG625UBIGBE3W
X-Message-ID-Hash: 5OSHXOCGSWRTMF2MMBQYG625UBIGBE3W
X-MailFrom: geraldogabriel@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5OSHXOCGSWRTMF2MMBQYG625UBIGBE3W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Semyid,

On Thu, Apr 27, 2023 at 05:53:17AM -0000, semiydsemiyd@163.com wrote:
> now...i want to open all the devices at the same time. and have them save to one single wav file. As if i'm opening one single alsa capture device with  8 channels.
> the saved wav file should look something like this (take this 8 channel wav file for example)
> 
>  First Multichannel Sample 
>  --------------------------
> {BB FF FF}  3 bytes slot1
> {A1 FF FF}  3 bytes slot2
> {00 00 00}  3 bytes slot3
> {00 00 00}  3 bytes slot4
> {00 00 00}  3 bytes slot5
> {00 00 00}  3 bytes slot6
> {00 00 00}  3 bytes slot7
> {00 00 00}  3 bytes slot8
> 
> Second Multichannel Sample
>  --------------------------
> {E6 FF FF}  3 bytes slot1
>  .,.. etc ....
> 
> 
> Is this possible and if yes how can i do that?
>

For such a task usually I'd use JACK on top of ALSA with the
alsa_in/alsa_out scripts or the Zita tools.

Good luck,
Geraldo Nascimento

> thank you guys
> 
> 
> semiyd
