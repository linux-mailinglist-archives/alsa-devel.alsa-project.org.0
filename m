Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C812C160BBC
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 08:39:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5043D167D;
	Mon, 17 Feb 2020 08:38:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5043D167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581925157;
	bh=UwHRK0FnJ/W8XBOVbunan7P8McTBXzYcyejvhWFCYqo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U1VgrjQcoSA0EacaLDJTiw0XT7bxVVVHC7bXGGWkCnv5cEm3DfLf4WB7ZSajj75qN
	 ahLoOsnsYhCrUdYZJ6oI00TuoefD7BiI+gPe+3GZT4Ud1Mw4Cxh1O6iIdonppS4MIx
	 6RwHiiMNflG8CJy6kOsJhWeCUymN30MpB/Wmejzs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 746AFF801F4;
	Mon, 17 Feb 2020 08:37:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6533F80172; Mon, 17 Feb 2020 08:37:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1FE5F800B6
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 08:37:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1FE5F800B6
Received: by mail-ed1-f65.google.com with SMTP id p3so19536005edx.7
 for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2020 23:37:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IFs/wu3fMgnSIGPEioJWp31NAFCMyffCU1mWgEeziQM=;
 b=def5itXIHg3fFbl/edAKHE9lNSefifbquTSaMMzrqAK6s0Lp9SUyReHYEwDNk3Haoo
 FyRKidbgxjYVpQSg9Y5a5NCfblyai4fbNfpvrNaemRTnYjcr0uXuGW7XR0Qzr33bMTjX
 MBXaXFXkqCMCgrNp9OVdP3yFe+UA3mIiAz1Si4dUWNLMjc/EaQvP8jeF+RNwuIf9TreQ
 bhRY5zGUomPzpWRlRONoxYyTAWK7rteuz87HWGlC7Yrc89lzrSeuN2zr1lZO526g0I7O
 7Cnl3pz4L2GFbAfb4HXkdC3mNGERH/qVJlL4jWHPpleLEGuxZ8PLKLfE7CZv2LC3sn9p
 unZg==
X-Gm-Message-State: APjAAAXkXqU7UDzWN27NyIJUKvWgXvYkW7UEXAilbO6Uwp+jMKF+THSj
 yDuvs0Af2yLeqT6ln7ZjzM7YqODE0uI=
X-Google-Smtp-Source: APXvYqy867/UQm85hFVClOAeNz3g7CYWaj/bU75R99/KSGVG0EuX2GZs/wa6+5l3QQXjQmlnKuaCjw==
X-Received: by 2002:a17:906:cf8f:: with SMTP id
 um15mr13254717ejb.289.1581925049264; 
 Sun, 16 Feb 2020 23:37:29 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49])
 by smtp.gmail.com with ESMTPSA id qt20sm843830ejb.65.2020.02.16.23.37.27
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2020 23:37:28 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id a6so17226908wme.2
 for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2020 23:37:27 -0800 (PST)
X-Received: by 2002:a05:600c:34d:: with SMTP id
 u13mr21218005wmd.77.1581925047487; 
 Sun, 16 Feb 2020 23:37:27 -0800 (PST)
MIME-Version: 1.0
References: <20200217064250.15516-1-samuel@sholland.org>
 <20200217064250.15516-8-samuel@sholland.org>
In-Reply-To: <20200217064250.15516-8-samuel@sholland.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 17 Feb 2020 15:37:16 +0800
X-Gmail-Original-Message-ID: <CAGb2v66gif5urvyRy=Tt-bNvpzL5Te8wne6tEA+KSPH-J7BWrA@mail.gmail.com>
Message-ID: <CAGb2v66gif5urvyRy=Tt-bNvpzL5Te8wne6tEA+KSPH-J7BWrA@mail.gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@free-electrons.com>,
 stable@kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [RFC PATCH 07/34] ASoC: sun8i-codec: Remove
	extraneous widgets
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

On Mon, Feb 17, 2020 at 2:43 PM Samuel Holland <samuel@sholland.org> wrote:
>
> This driver is for the digital part of the codec, which has no
> microphone input. These widgets look like they were copied from
> sun4i-codec. Since they do not belong here, remove them.
>
> Cc: stable@kernel.org
> Fixes: eda85d1fee05 ("ASoC: sun8i-codec: Add ADC support for a33")
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
