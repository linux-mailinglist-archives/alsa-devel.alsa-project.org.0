Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A94F2284FE
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 18:11:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D552A1667;
	Tue, 21 Jul 2020 18:10:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D552A1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595347874;
	bh=j3OL6uml46nIXpf1TK9WGFnvbhZupq+kt5REI1TS3OA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c301du6y3No4hK4UcNGNt/AqDhzPNweFLeit0nE0qB7F6SZaDVhUrNBY/FtDslZZ6
	 JD5sLYTVA7uZcmoXd6wXmFR4vQkK37EZJowHbsX4mUdgtyNlX1jgX0d/AMrEuNOdpO
	 Q7fmYdsGTyC0RYpqRbE/EIwGu3XkPevldy3GjlOY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2947F80268;
	Tue, 21 Jul 2020 18:09:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88DF4F8024A; Tue, 21 Jul 2020 18:09:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 649FDF80087
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 18:09:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 649FDF80087
Received: by mail-io1-f66.google.com with SMTP id i4so21931180iov.11
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 09:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s7SKGdsuV2Lu9rv7tAf0+85g7Dfyi1SjWCVPk0H7xuI=;
 b=H9TvND8CCNJTVMWMvLafSFhh6ClhqNUmvxZrmLDqNH4rxEG56UNbuRZuQcVM2Q350S
 fen4swEm6L4enPGO97SV1imdBy7bN1ZRLaS/twuohOevFMEsG1BkwePinc8q3cCqedm1
 6J3Xhcj4x3bYZTjR4KpZNd7F56oYoxludnx8QQztlh+T6LMwS70GBzNaMGQTpfMzsW1U
 V4f+VBjac5DD4DOVT+Bkt9AT99ari26bcgWIkVRVmBTFytrAMqlLqatSvq/RWKuqqxLM
 oaSG7aXkyRhWmd+uCw7oyQSrM9+GnMOmj50WjwMzNSSrV8ZhFcRs25yCO3ChDOnW/1+t
 ZFFw==
X-Gm-Message-State: AOAM5316gho6VrkoQm16Tw6SkhnfPpF3IPmUWHzQfk2pTaTHERjo7p5X
 WWlMKQEstbSSDBwPdHjQLQ==
X-Google-Smtp-Source: ABdhPJzBawMxgCSX0AUQwfBS8OL1XXe8O8X04c1o3zkG/+VwBdElqh52sabgY3AaXrOc8zdZ1zwEhw==
X-Received: by 2002:a5e:c30f:: with SMTP id a15mr29017311iok.184.1595347759305; 
 Tue, 21 Jul 2020 09:09:19 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id l5sm10360248ios.3.2020.07.21.09.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 09:09:17 -0700 (PDT)
Received: (nullmailer pid 387113 invoked by uid 1000);
 Tue, 21 Jul 2020 16:09:13 -0000
Date: Tue, 21 Jul 2020 10:09:13 -0600
From: Rob Herring <robh@kernel.org>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: Re: [PATCH for v5.9] ASoC: Replace HTTP links with HTTPS ones
Message-ID: <20200721160913.GA387081@bogus>
References: <20200719153822.59788-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200719153822.59788-1-grandmaster@al2klimov.de>
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 linux-doc@vger.kernel.org, lgirdwood@gmail.com, shifu0704@thundersoft.com,
 afd@ti.com, cychiang@chromium.org, nikita.yoush@cogentembedded.com,
 lkp@intel.com, corbet@lwn.net, yuehaibing@huawei.com, tzungbi@google.com,
 dinghao.liu@zju.edu.cn, jbrunet@baylibre.com, devicetree@vger.kernel.org,
 keescook@chromium.org, rikard.falkeborn@gmail.com, broonie@kernel.org,
 dmurphy@ti.com, pankaj.laxminarayan.bharadiya@intel.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, colin.king@canonical.com,
 l.stach@pengutronix.de
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sun, 19 Jul 2020 17:38:22 +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  Continuing my work started at 93431e0607e5.
>  See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
>  (Actually letting a shell for loop submit all this stuff for me.)
> 
>  If there are any URLs to be removed completely
>  or at least not (just) HTTPSified:
>  Just clearly say so and I'll *undo my change*.
>  See also: https://lkml.org/lkml/2020/6/27/64
> 
>  If there are any valid, but yet not changed URLs:
>  See: https://lkml.org/lkml/2020/6/26/837
> 
>  If you apply the patch, please let me know.
> 
>  Sorry again to all maintainers who complained about subject lines.
>  Now I realized that you want an actually perfect prefixes,
>  not just subsystem ones.
>  I tried my best...
>  And yes, *I could* (at least half-)automate it.
>  Impossible is nothing! :)
> 
> 
>  Documentation/devicetree/bindings/sound/adi,adau1977.txt   | 6 +++---
>  Documentation/devicetree/bindings/sound/tas2552.txt        | 2 +-
>  Documentation/devicetree/bindings/sound/tas5720.txt        | 6 +++---
>  Documentation/devicetree/bindings/sound/ti,tas6424.txt     | 2 +-
>  Documentation/devicetree/bindings/sound/tlv320adcx140.yaml | 6 +++---
>  Documentation/sound/soc/dai.rst                            | 2 +-
>  sound/soc/cirrus/ep93xx-ac97.c                             | 2 +-
>  sound/soc/codecs/hdmi-codec.c                              | 2 +-
>  sound/soc/codecs/max9850.c                                 | 2 +-
>  sound/soc/codecs/mc13783.c                                 | 2 +-
>  sound/soc/codecs/pcm186x-i2c.c                             | 2 +-
>  sound/soc/codecs/pcm186x-spi.c                             | 2 +-
>  sound/soc/codecs/pcm186x.c                                 | 2 +-
>  sound/soc/codecs/pcm186x.h                                 | 2 +-
>  sound/soc/codecs/tas2552.c                                 | 2 +-
>  sound/soc/codecs/tas2552.h                                 | 2 +-
>  sound/soc/codecs/tas2562.h                                 | 2 +-
>  sound/soc/codecs/tas2770.c                                 | 2 +-
>  sound/soc/codecs/tas2770.h                                 | 2 +-
>  sound/soc/codecs/tas5720.c                                 | 2 +-
>  sound/soc/codecs/tas5720.h                                 | 2 +-
>  sound/soc/codecs/tas6424.c                                 | 2 +-
>  sound/soc/codecs/tas6424.h                                 | 2 +-
>  sound/soc/codecs/tlv320adcx140.c                           | 2 +-
>  sound/soc/codecs/tlv320adcx140.h                           | 2 +-
>  sound/soc/codecs/tlv320aic31xx.c                           | 4 ++--
>  sound/soc/codecs/tlv320aic31xx.h                           | 2 +-
>  27 files changed, 34 insertions(+), 34 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
