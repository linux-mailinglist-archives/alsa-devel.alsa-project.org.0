Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 764242CBC2
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 18:23:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 123621832;
	Tue, 28 May 2019 18:22:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 123621832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559060603;
	bh=+82V3NLmeqMn0PxIuaeZOsroAFA0ANDYV/4X536dOko=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kb07KT2QC0cjpdMiJUwNlNah69w7ZxmSLLTksv7GbJy0YQmAZsVRmVxXVpHNZGlU7
	 ofOy/PpVnyn7JfZLivG6p8vqiEMMS3NReV9UQ2eL0plA2/a4SXgCxLbXVa11LNvkn5
	 Pt8io6dQkjT1xudaU9LBm7/gxamb8KyasO3M/dqo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 259B2F89706;
	Tue, 28 May 2019 18:21:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 564D1F89706; Tue, 28 May 2019 18:21:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_MED,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28760F8072E
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 18:21:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28760F8072E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="d93q7y55"
Received: by mail-lf1-x141.google.com with SMTP id b11so8658358lfa.5
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 09:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QOjttdgM/C7Ny+MeelJ/0Xb1g7mi5eOxH4hoQm53puE=;
 b=d93q7y55VpSiDCfPIdlrL752B+eqtMqA6dXWBXey/5zbzzHF5xo8+GHZEVFE4I2WEB
 G0p2/ko6aq5yXrXufQydShboI8fcUKodK6uyWLLn8fqps3gYU878Y5Ekrh5AEEjqcCkW
 EnVgwbSbk4vYnBlrMWYDyQPJQXMquODooFm5pnhFtxVZ2mNHoBLU8elWGWQWyw/Z3amJ
 hYb6QjvEcI9EWNh2tB64JN9yzJ/NXY80Tm+p8SX5b8WKG+1r2GnJTuzvg4S2sWjdISLl
 5LdQd1SK+qlBGBuEpthE74tlBktFcrJKdx8b8KZUz7bVnADa7e4WVrXFbOoRApk2zEsd
 7MTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QOjttdgM/C7Ny+MeelJ/0Xb1g7mi5eOxH4hoQm53puE=;
 b=rTSzboxiZrJ6SmnqWQxVO/rogo+YEUou41Nttzh6zIV4Y61NDRLd4+mQKtOs/81TLc
 24fpvAwMsaLy/v8OpZWWA9WoXTNdXmMKg9J/yJGQ/rvq39Tp4M7qHVZYvI0ni62ebG8Y
 ++/Q2tcsveSOuIUlm1QPhuunL6wxx5LFzeFdTODNZLXtvcIypvsPbDmVxXTNwxlIpT2I
 37xXfYsHwkcuEIiuA8aRjfTkeIrs7Brs1saaR+g3L/0jiF1JybZbuEgH//baznnStvhF
 ZGncqfuwiON0x+iailPZU6PgBykWaUBVgIM94fvsdrvJvAi87EF/onpT7pZ98EyZV9bP
 uY8w==
X-Gm-Message-State: APjAAAUvclpsJpIJaotcoPlAE3M4MsijxRayrvSxYdhzin9AA02GMlHY
 ZL4iK6t/kfLIq4sZcQc+Lb+boDiCU5ho8nW/prSNaQ==
X-Google-Smtp-Source: APXvYqw/wn6IVZjTqLPLefdMyB0a36IV5zkeo5H3x5wYhLhxVikQdovV17+EvKNfA8uPRcrFS82G6Puyc0OQfbwpLlI=
X-Received: by 2002:ac2:54a6:: with SMTP id w6mr9412824lfk.108.1559060492570; 
 Tue, 28 May 2019 09:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAOReqxjQAya8GQ4bOSBfTBHwXd38c33pOMc35rrSj4O4jMaMSQ@mail.gmail.com>
 <s5hwoii1rd3.wl-tiwai@suse.de>
 <6eb7cc4d-aa95-74b9-e849-22559737f47a@linux.intel.com>
 <CAOReqxjUk_6Fvc=CRnCWu7c=QvObxhwA_psWLz5gLO_v5Fc5Pg@mail.gmail.com>
 <CABXOdTePNR=O0EhUgFNVCUvCbqaKtpdnZw=NtFLc6aNtAWUpKg@mail.gmail.com>
In-Reply-To: <CABXOdTePNR=O0EhUgFNVCUvCbqaKtpdnZw=NtFLc6aNtAWUpKg@mail.gmail.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Tue, 28 May 2019 09:21:16 -0700
Message-ID: <CAOReqxgVdnkfst3Nabr6pFRrmeOmxVquPNjUHx4XtxQ3KY=afg@mail.gmail.com>
To: Guenter Roeck <groeck@google.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Dylan Reid <dgreid@google.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] Cannot build broadwell on for-5.3
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

On Mon, May 27, 2019 at 10:24 AM Guenter Roeck <groeck@google.com> wrote:
>
> FWIW, the Linux kernel still officially supports our version of gcc
> (4.9.4, I believe). "Your version of gcc is too old" is not a good
> argument to make.
>
> Guenter
>
IIRC, we are running modified 4.9.2, stock 4.9.2 works fine but for
some reason ours doesn't. It was not a "this is broken and that is
that" it was more a "oh, this is the issue, I am going to take this
offline now." I am in contact with the author who broke us who happens
to be another googler and he is looking into what is going on. The
short term fix is to revert 392bef709659abea614abfe53cf228e7a59876a4
on whatever branch you are working on.

Curtis
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
