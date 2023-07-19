Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 759DC759B6A
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 18:50:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E69F91F4;
	Wed, 19 Jul 2023 18:49:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E69F91F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689785402;
	bh=g5oKfuESxM+AbYitYVm52qNXw+XWHUNvJL7SdYQTD1A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f0HQVTlMEQBFPyY+UakHjl6oBR4yzMHROBWKDwHRXV9ydVOaK+NvCkCLVwcYCPiJK
	 5jGpugEmUa8nETj1fW48C32mIpDDswXy88o2/pQLrRQmq3UEaPJY1iRp5Ypo/eoMKz
	 JdfUjujlZPvgLHkllsjYHkhoWOHCg0/XCkpTM8/M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EE3AF80520; Wed, 19 Jul 2023 18:49:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2634F8032D;
	Wed, 19 Jul 2023 18:49:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF25CF8047D; Wed, 19 Jul 2023 18:49:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40403F80153
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 18:49:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40403F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=owITUim9
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-51f64817809so718911a12.1
        for <alsa-devel@alsa-project.org>;
 Wed, 19 Jul 2023 09:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689785342; x=1690390142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5oKfuESxM+AbYitYVm52qNXw+XWHUNvJL7SdYQTD1A=;
        b=owITUim9KtkXTm/sHKMPJvCR/Jav8bcKjZmelH3deMYE6RexIHkb7sP3I00tgazDpN
         da7AgknVpC8VAJNcX8VrnfM0/c2nYuWoMoj348aPdQD62ThaVkNUGx4TlQ9bT1twfY+L
         V37xhOQprPMRZ62bwcqIrQ/ANrY8i/F7DINqbH+pAz3PMwc17I47lXAA8mazLZoYkSs+
         e4KVLu8EiyNALjRG3IUvy6Du2Xtg6nUKm/TJLQ0/yhXySVjBudtU05w57yI8X4oP2HuG
         zMiAr62Tb3nacDfS8qkLI3sXrBe1Ms709DsKUN8jhbC0hU4Tsxcf+gC/HmiwzwGn9o82
         JvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689785342; x=1690390142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5oKfuESxM+AbYitYVm52qNXw+XWHUNvJL7SdYQTD1A=;
        b=IGXExZ66IFnmmlexaTFYh9yVFFYoN4rsGp8EUZbO5G7yXuBmgikOjEEINZPrnAjqd/
         xq9C83rmiw5XDbPwsMraSYzfkfE47RyGKZGXbhjdL5AkpOXuG7o0NH/A39Yl0FKhh94O
         vbqm/Bn8lnkj/2uOrM4YaBhs3zagMt5VGE0zBrPcWrJE705p9wZDpJrXESnKU3GZ7cRT
         uSf1ZYKhQD9uaMjwgBL/ruLZrLwLuVxnzsS66+AZODaIdoOMgcNhTs1wYTebww+GH5ps
         PXPdQPEasVPslgRSfkhzyvj8xBTxQKxhkYd65ZB7XNnVaAAUd5nhlWPhmpJadWOrTr3/
         q42w==
X-Gm-Message-State: ABy/qLbXcaaw5DCDnT0HHXjgwE/WSkkcT0f0dOxZMGwy59D15zzlgkQY
	xLrPN1w7nyk40nwWafFO8WN45tSXjet9NnjgWLCa63KYcnQ=
X-Google-Smtp-Source: 
 APBJJlFVxTBOJZyOAApETTi1cRHOhfvHsqzZIpoAZFguJ4tWPkKoTOnqKPrWk2Z72eDkR6FaHpGVLbFHpVIf9yUfU3U=
X-Received: by 2002:a17:90a:5386:b0:263:484c:f173 with SMTP id
 y6-20020a17090a538600b00263484cf173mr2648285pjh.2.1689785341744; Wed, 19 Jul
 2023 09:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230719163154.19492-1-matuszpd@gmail.com>
In-Reply-To: <20230719163154.19492-1-matuszpd@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 19 Jul 2023 13:48:50 -0300
Message-ID: 
 <CAOMZO5A6BYuJYr_6mLSKhAYTQYpki3otdrOaH7Gw+2177rXn9g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: Add support for 22.05 kHz sample rate
To: Matus Gajdos <matuszpd@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: IO2EO46GN5ZXZUUSC5ZU32IN3NZ3NK6I
X-Message-ID-Hash: IO2EO46GN5ZXZUUSC5ZU32IN3NZ3NK6I
X-MailFrom: festevam@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IO2EO46GN5ZXZUUSC5ZU32IN3NZ3NK6I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jul 19, 2023 at 1:32=E2=80=AFPM Matus Gajdos <matuszpd@gmail.com> w=
rote:
>
> Add support for 22.05 kHz sample rate for TX.
>
> Signed-off-by: Matus Gajdos <matuszpd@gmail.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
