Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E09160B7C
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 08:19:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 389CB168A;
	Mon, 17 Feb 2020 08:19:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 389CB168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581923994;
	bh=xhirEYxJ3+T5uOxOr5vqmKhhnWuZNQnWKw4sCZByXL8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R9AhZu/9uQXUVsEKAASSn9USuC0fPbNmzmBH1l4o55inVKY2mk20VOtkIDQ7JBNx1
	 RQuIzp2LijetNnMddwCcEzlOZzUgFiVOEt/QyAz5mhtEa20kOjExu7qZfOxW1LbY6I
	 G+Ot8WtzoNQyqcFVAzXcMdpG5Rgp5Y7WvM1MSh9k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F8CCF801F4;
	Mon, 17 Feb 2020 08:18:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0360CF80172; Mon, 17 Feb 2020 08:18:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53CBCF80096
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 08:18:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53CBCF80096
Received: by mail-ed1-f68.google.com with SMTP id m13so19475684edb.6
 for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2020 23:18:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dW4Ej8MLzzPbydvCeEmiQskFOW2o/76spt2iKZQxuT0=;
 b=R3dUg7vOj29oNUe5Q7MvTqHUGkxj0VpN3JolC05PwcYKBAXa2h+iNAp4LaUWaCMb/p
 Pl3JFUT3F0gaoLiLJT6anSkqk4smdLj+8bfqvcCK/9x2LGkqiA3eUvENtUyGETatPPqO
 pqYufhEiARdkJ29iGze8VakcmOwnueNY7gD3I4ZauVi7dEGMBZKHk0/CMRozX68cMuCo
 wP4+DC29dnrLGKDWG4tfsyFJfO/BakIy9SQ+cwVbopVyLJd5AO69lF5hvPRn/al62rhN
 hDAdxD+CZ6aviCnWz+2GrJo8NnvBMdP2btFBnSez2/ejxVpDDGZfpbpH6ICRrDAL/YoU
 kyww==
X-Gm-Message-State: APjAAAWwOKzb+8q760r2UzSUuXkjwbjfUDTEaF0buRKY3nwkEjptIr9y
 qUl5thzyyBhez4ouPLDL06fmS13XkQI=
X-Google-Smtp-Source: APXvYqzI6H+0R9rUEaSevdxYW70vvAEgTzWxU6Ht7vgudd/3R8iYsOd+ynxZJ8Q7jim67zGJsycsaA==
X-Received: by 2002:a17:906:b351:: with SMTP id
 cd17mr13061347ejb.45.1581923885156; 
 Sun, 16 Feb 2020 23:18:05 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46])
 by smtp.gmail.com with ESMTPSA id y4sm855073ejp.50.2020.02.16.23.18.04
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2020 23:18:04 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id a9so17168886wmj.3
 for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2020 23:18:04 -0800 (PST)
X-Received: by 2002:a05:600c:34d:: with SMTP id
 u13mr21111044wmd.77.1581923883938; 
 Sun, 16 Feb 2020 23:18:03 -0800 (PST)
MIME-Version: 1.0
References: <20200217021813.53266-1-samuel@sholland.org>
 <20200217021813.53266-6-samuel@sholland.org>
In-Reply-To: <20200217021813.53266-6-samuel@sholland.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 17 Feb 2020 15:17:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v65v=wPJNxPfOzp2bcevk0qoDiW-+KFBO1MKHz6gE86DPQ@mail.gmail.com>
Message-ID: <CAGb2v65v=wPJNxPfOzp2bcevk0qoDiW-+KFBO1MKHz6gE86DPQ@mail.gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Luca Weiss <luca@z3ntu.xyz>, Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH 5/8] ASoC: sun50i-codec-analog: Enable DAPM
	for headphone switch
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

On Mon, Feb 17, 2020 at 10:18 AM Samuel Holland <samuel@sholland.org> wrote:
>
> By including the headphone mute switch to the DAPM graph, both the
> headphone amplifier and the Mixer/DAC inputs can be powered off when
> the headphones are muted.
>
> The mute switch is between the source selection and the amplifier,
> as per the diagram in the SoC manual.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

BTW, have you also considered tying in the headphone volume control?
It also has a mute setting.

ChenYu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
