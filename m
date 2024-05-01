Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0BF8B8BE8
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2024 16:32:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C66EEDF9;
	Wed,  1 May 2024 16:32:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C66EEDF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714573952;
	bh=AphrBmxGkcaj2qIlAaOm39t9pyYxnyCEZkj7FYWiqzE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uGd4rr2ffXJkrRjeV8q1s1xnCTqAsv3KyVDXEGM5bg5DJ6rXlRYZ7q2xYhYT8CU06
	 AdPcakjSSXVZryAmYBFcvvECYGBtMXcEnPpAUEWmY2P8sUZPJxymx4O1ukJahgq9bZ
	 R1EQofu+8lVynM2MstO7al9Nnw2L2cQrVEZI7/3E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3732CF805A0; Wed,  1 May 2024 16:32:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B79A1F805A1;
	Wed,  1 May 2024 16:32:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C790F80266; Wed,  1 May 2024 16:31:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59FC6F8003A
	for <alsa-devel@alsa-project.org>; Wed,  1 May 2024 16:31:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59FC6F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=coLq06Hj
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-51eeb947b78so238578e87.3
        for <alsa-devel@alsa-project.org>;
 Wed, 01 May 2024 07:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714573907; x=1715178707;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJVbHukCXEaePN2wzT1sgOowBG+6IalEgxA9uuwr5Us=;
        b=coLq06HjXQIy9VhyRrUiPTHz3md/87Af9dmYcRhapd00iREumt4JRMtj2qr/d7CoQp
         Fy2wz67+MXIC2iUgl9BqnK4l5KhNHAkKa8nEZjmRVUir9AuIESG8EG2Ngnea/vepc0be
         G7rsnRwtJm4eXY8f5PkGxq6jRrMvyjOdWDN2XO+YH1k9gnvnluTAAOfB8ANOPF2vmIbS
         Dr0/tYaIssQ3VEywr/+zZPixHQdsK1qIhEGVIzl5lwdQA4hSWwNeCQF7lQoMe0UcIcji
         NJtbo2jaO2KnHlq1lrX9kivS+LUP6cOtTedh5KOngiP4R7SCuYk9sFPsQI8xW/WIe85h
         pPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714573907; x=1715178707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJVbHukCXEaePN2wzT1sgOowBG+6IalEgxA9uuwr5Us=;
        b=ERng7vJzPqEncywalvMJD13T2PAV17lV8tdvdiIZW5waggjRTOI7qHPxOaz8fVALyP
         ornFZvjCCDsQ8MzNZt0O67m4QD2ot6htc3w6zkedN86SO0K1UI9BUAoaLoGGwo+WEesQ
         N8VDAUgNF/0YmhBclw1hHeIF0x3G9UXHT2WGStzj541V2ZiBOSbNH3yGWJgK6xpAwhpz
         ZYDuTrPmcf9IkA81m7dyP/DpyKcYeUjXg5/byqcdZyyhODwlVGVbc6VWwKVGRNMV36LS
         MZo6Mem/g0k6vKFLlRpqLXtXwAmfEua7NNBIn48WIfE+87PHx/jEEP3NhbTItAIxhvjb
         4/Mg==
X-Gm-Message-State: AOJu0YzHhDeoNj9kkv+4f3mPud9AdMxo8S0SyR/TdxbOM5dG+8d/b61g
	QQ70y24hjznXdmVb2XKwAw0XXhyV3Gu5Red43La2OY+/ApVRGSjejWGAJNvCcp52MW1oi3ClZL6
	KJW5Mc1GhLEIUZytR7crWV0wZBgfxV158
X-Google-Smtp-Source: 
 AGHT+IEUkhYiKHFgZKb4KmaQ/AvzxpIxYbccjxgvioNPtOT0niAGionvRTF5brj6u+h3oKABPfn3IolRk23kL5mcB+c=
X-Received: by 2002:a05:6512:20c9:b0:51a:c207:12b with SMTP id
 u9-20020a05651220c900b0051ac207012bmr1337543lfr.37.1714573906624; Wed, 01 May
 2024 07:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <87cyq7nw19.wl-tiwai@suse.de>
 <20240430171020.192285-1-mbarriolinares@gmail.com>
 <87mspakltl.wl-tiwai@suse.de>
In-Reply-To: <87mspakltl.wl-tiwai@suse.de>
From: Manu <mbarriolinares@gmail.com>
Date: Wed, 1 May 2024 11:31:35 -0300
Message-ID: 
 <CA+64nrt8gP5gJXaC=MS5AHjfZFSz=AvUT-CcRV9o2+zSenVXfg@mail.gmail.com>
Subject: ALSA: usb-audio: Adding mixer controls to Mbox3
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, kernelnewbies@kernelnewbies.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: BQSZRZZLDEP5UYJX33HJVUHPNWDAXUHO
X-Message-ID-Hash: BQSZRZZLDEP5UYJX33HJVUHPNWDAXUHO
X-MailFrom: mbarriolinares@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BQSZRZZLDEP5UYJX33HJVUHPNWDAXUHO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thank you for all your help, Takashi!

I would like to add the hardware mixer controls for Mbox3.
I have already identified every control in the function "mbox3_setup_defaul=
ts"
of "quirks.c", but I am unsure about the structure needed to make the contr=
ols
appear in alsamixer (further investigation is required). I would appreciate=
 any
help you or anyone else can provide.

Manuel Barrio Linares


On Wed, May 1, 2024 at 4:55=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Tue, 30 Apr 2024 19:10:18 +0200,
> Manuel Barrio Linares wrote:
> >
> > This adds support for all sample rates supported by the
> > hardware,Digidesign Mbox 3 supports: {44100, 48000, 88200, 96000}
> >
> > Fixes syncing clock issues that presented as pops. To test this, withou=
t
> > this patch playing 440hz tone produces pops.
> >
> > Clock is now synced between playback and capture interfaces so no more
> > latency drift issue when using pipewire pro-profile.
> > (https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/3900)
> >
> > Signed-off-by: Manuel Barrio Linares <mbarriolinares@gmail.com>
>
> Applied to for-next branch now.  Thanks!
>
>
> Takashi
