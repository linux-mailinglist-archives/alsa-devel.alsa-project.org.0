Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FBA14BCA9
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 16:16:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAD581670;
	Tue, 28 Jan 2020 16:15:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAD581670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580224566;
	bh=Iptnz1/KMI6Co30hyvoQ9HvXTwZwFkORGwhEPOfMz68=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l9UY0knRtrYV7o96ROtsRfLrhK392avkxl2lMGmD5KXD+UxkCKIF1ZZU36nUB8bXN
	 ZoKvHZvnvjWNcFvJDC6md5UuFuoSHX8W7Yx5kSF0B1nZmeEWxtXNIZB5qDNf9BTKlr
	 Rha8kNCzZWCeoxCXaxM1hGsSZoJY/E4k8HrNRKx8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D22B5F800FF;
	Tue, 28 Jan 2020 16:14:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6ACE0F80150; Tue, 28 Jan 2020 16:14:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52B16F800FF
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 16:14:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52B16F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="H1skIQKL"
Received: by mail-wm1-x343.google.com with SMTP id c84so2933223wme.4
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 07:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=tkYqwExLIVz81Yabub4QxxDkif38vL80tq20V7kTMeA=;
 b=H1skIQKLYvzP8AdYKyCGpG8piPHcjkyq/50cT1w3sZZ3c1lP60SJjOk2+YIW9lxy0a
 0eFMkwTR0kPXvCCpD1BHf31x/ljdOx4DMo8EcE+VdZraH7HGMdaP7QA2cd+gC8/+Z/9L
 adH7MYvbTq3YTndeTghIDR7tdG+XXKV1OnCGqgXGAM03mcq2NTF/KJEc5lTvnCFNT97u
 +3iweIzGK7RDhcu238MvtECEkJjqH6VqqUpEzfEeqe/HvnQbxD1DWaU9fMv2wnzK84kB
 nDfCmTkR7pht+/CxpVhJrAQSlNCvJGpnOa/hwUVhp4Z3lNQgCdW5i3OlCtBIP3lg1eOl
 YbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=tkYqwExLIVz81Yabub4QxxDkif38vL80tq20V7kTMeA=;
 b=iHYhQnR2oxGLW3fuwULRN8sYOrqgh8jsjIuP3Cg1sFzHMwN5n+OwSAfd2V8IRErMKt
 icKEnldE+5fNJvV9sd55TDm0I4y4TKJDbESdnr2nIYWD5BBsUVPqEiIZchdftI6ilkhk
 pZ0jM8PfaCuVTYo6ZpJIlQtde5vT6oFbbkdT0DA+ilUNs2ytsffZ748MBAfqu5mj3Kym
 M2bAqxbGTbKU3QWRtyRhfmqG8Lunamr11tjIikzUPM90g8R0csPc51gDF4CGBQigDeLZ
 nQb4fikmcF7jjrSknX7/ZhD/dJ5UQdwJY7hpQeDSe/BiDdrJeX1ftO83qqWkYtZOi5xc
 7erA==
X-Gm-Message-State: APjAAAV4zeoWkDuzlSC9l3Ma8BI4QVrgC8g+tWrtn3WSyZeQwwlNLmA5
 sUaC7d36n1aRZjr6P/yd3rUQ3LlHVTqs7HW4ug4=
X-Google-Smtp-Source: APXvYqyfA8r8NBFtivbtqkNOf88arkbCVPz8oq9D9l2nDnsbPhJB3Sj5GY7nvrHEgz7Biyv7a9Y/WaiLy6XokwSm36Q=
X-Received: by 2002:a7b:cbd6:: with SMTP id n22mr5838003wmi.118.1580224456439; 
 Tue, 28 Jan 2020 07:14:16 -0800 (PST)
MIME-Version: 1.0
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 28 Jan 2020 17:14:05 +0200
Message-ID: <CAEnQRZC=9_fnqEuBJsjc1QpCsXtV0NbAT0o_Yh58uMYGfHxz_A@mail.gmail.com>
To: peter.ujfalusi@ti.com
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [alsa-devel] Managing resources of DSP from arm core side
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

Hi Peter,

Liam mentioned that at some point (when working for OMAP)
you might have had the same challenge I'm facing now.

I'm trying to figure out how to properly manage resources needed by
the IPs configured
by DSP.

On i.MX8 we the following scenario:

- Application processor (arm64) exposes an ALSA sound card to applications
- DSP (Hifi4) does the processing

DSP has direct access to  DAI registers but it doesn't have (easily)
access to other resources
like: pinctrl, power-domain, clocks, etc.

I was wondering how did you tackled this for OMAP?

I have already created a dummy CPU DAI on Linux that it will take care
of this [1].

It is a part of a Back End link like this (simplified view):

links[i].cpus->name = "dummy_dai";
links[i].platforms->name = "dsp";
links[i].codecs->name = "cs42888";
links[i].no_pcm = 1;

It works pretty well for basic playback / capture.

thanks,
Daniel.

[1] https://marc.info/?l=alsa-devel&m=158022296519597&w=2
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
