Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E363B8FE72
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2019 10:45:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69C031663;
	Fri, 16 Aug 2019 10:44:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69C031663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565945115;
	bh=JjXvqyjt24Mz7HQUQ0kUgcQ8hqKRGO8skbl/Z6laW28=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fmk5luajGjPcHrTFsTuwyPmJblSpH1V6nxt/drZE28WGy3yoJWLokXTkDaI55Haa6
	 hyeLcJ9ZQ4Vy4cIwxHerRqkWqj/ztm68L2XaoNBTQFC4k1Gdt4N1C4520dvJYFVf5P
	 7OKUw3ENtpuqcaP0mprjfInhm3o3QJvrBxdCMz1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82154F801DB;
	Fri, 16 Aug 2019 10:43:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82ADCF80214; Fri, 16 Aug 2019 10:43:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63C4CF8011F
 for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2019 10:43:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63C4CF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="STcQyjZv"
Received: by mail-wr1-x442.google.com with SMTP id r3so790505wrt.3
 for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2019 01:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pFRvrKyH0I4QnvUx395WxMq9iu8NVY2o16J2DCWx9l8=;
 b=STcQyjZvZ/MhRvATSl4qPfh52o3xBP9svQnUIWIbJv5Zo+4IIW+frPXqQrvrlV78/r
 blAXCx+DQ1n7xX1fIE0Mz0LAQuZ/nkT46N70bLYCgZ6lH2bqKbg/23wKX2I7LxHbLgCA
 4LLYQF1IgBm0hM+E3fRRPrOp8185UyiFvePFtJLoYwN5R2YMLBnqpl502RPAXykKw0gw
 LFkx9gC6QARe5v+JJsKU4R+DduKEFF3HQdQWbU+ZwnT59M/w243p/Q/51ksj8KoGRcts
 nLprlF6eGguqYXJ8lWpHZfDcZu5U2YJ+qTWE2s+UKRGbuChQKmRcN7JTRTILTUmqDFCh
 E7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pFRvrKyH0I4QnvUx395WxMq9iu8NVY2o16J2DCWx9l8=;
 b=sqQbRNqUhTw0xAovTNV+SH9Eb53SM+xIm1uWRTPDBRGDX4oDg5TY0Hsyba1/Bt0P6z
 ISmCrO/g23EeGkfdooWtvcEdUv2bGw3OM0Jl33QkV6YRL5zthYVHttubbBSxyrD3do3/
 dmoL6l8Fzxc3xhnabYm/0TXsc37gY5egRR7FNscjDgykCFGCBm+rkkKSfflJ3Fe87fi4
 JzRTy16SEYaeQgSgxdQgQb102fPoiNPdIhtwVGgTg1W+arnKPF5ozc4u2e0Z20sAEAJJ
 x98GnIBkQBbRQic5knVW4Dg8POSQeZnktRwcwpIbMvW75V9HcYf7E8t5YLekChiLbe/Z
 W5Zw==
X-Gm-Message-State: APjAAAW9o9rM0nLwjtk6QoOlfWfdK1UjP2r9uQ0As/HUF4kHqOPco6Iw
 HV0J2DT13zLuaNuNCprR6GGN5ZkHpZM2C3tLTD4=
X-Google-Smtp-Source: APXvYqziLPt73QNgLo9LXiTpN/lVIzHTLStHToquyieRzTEbEwTPJ+UiCq/hk6kambjzcE7RpavR/kHMVD9snoMauBs=
X-Received: by 2002:a5d:5408:: with SMTP id g8mr1784018wrv.201.1565945004412; 
 Fri, 16 Aug 2019 01:43:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190815154500.29090-1-pierre-louis.bossart@linux.intel.com>
 <20190815154500.29090-2-pierre-louis.bossart@linux.intel.com>
 <20190815164942.GB4841@sirena.co.uk>
In-Reply-To: <20190815164942.GB4841@sirena.co.uk>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 16 Aug 2019 11:43:13 +0300
Message-ID: <CAEnQRZAM6VkCewfVYysz-NmPNEz-CSe763Cv-kz9kyNjx8uMtQ@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/3] ASoC: SOF: Add OF DSP device support
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

Hi Mark,

On Thu, Aug 15, 2019 at 7:50 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Aug 15, 2019 at 10:44:58AM -0500, Pierre-Louis Bossart wrote:
> > From: Daniel Baluta <daniel.baluta@nxp.com>
> >
> > Add support for device tree based SOF DSP devices.
>
> I'm not seeing any binding documentation here.  Binding documentation is
> required for any new device tree bindings supported in code.

Binding documentation together with the actual dts nodes were sent
to Shawn.

https://lkml.org/lkml/2019/8/7/682

Shawn,

Can you pick 4/5 and 5/5 patches from series above? 1-3 are sent to
Mark to go through to alsa tree.

thanks,
Daniel.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
