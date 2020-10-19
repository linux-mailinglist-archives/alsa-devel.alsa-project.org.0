Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AECE2930FE
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Oct 2020 00:13:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 287941716;
	Tue, 20 Oct 2020 00:12:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 287941716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603145587;
	bh=MUXGRME1gcQc3Ii9PNK8+/8qxTt25Uslhzeek5/HdlA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wj2p8V2HTpkbnMMKxz7RblSTNpmvD5SNVJHOoA30zj6FGpD9qRsWdIrpuT0lqKgCQ
	 /Bb4gWwErUdN33SAl3KD2L7vQeUWUmc7RlLo0epjasU+Ig55PCyZ1nXmAo1YyIMMjT
	 LakI9LWUHnXSdxJofO8AQ5waWDhLoKLrl/OQ7BKs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39CD1F80279;
	Tue, 20 Oct 2020 00:12:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4151BF80289; Tue, 20 Oct 2020 00:12:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E0A9F80121
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 00:11:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E0A9F80121
Received: by mail-ot1-f68.google.com with SMTP id k68so1308903otk.10
 for <alsa-devel@alsa-project.org>; Mon, 19 Oct 2020 15:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pMuRP7PwPZH/1QCeF9m+2AemyNEiW+4ppV1kMNUMQ/U=;
 b=mihrMK2Q9w9Sm/TYaZeM7WnLSt7dToBwsYGRLlRLbN5diS6uQsHy2DhGXoeW+1bFCH
 3eYhtOc6nWYqDinHt0l0+ZvAndgZhCE1xK6mlIsEPxKR/QFAjkAKC+qKliyzyK0VEAVy
 DTGYnPT+hAtu5z6gpQ9TuEVvhtjbSWXAbVyvaXN4VOI5pOBJ7SKMl9vLmjZQhdigFa0m
 FPkze0XqT//HjS8RYGVXLGLALr4Bm4rjkMzM1pZ545ZBTfVWkQ3S6EAdWqmTn1hbgoyh
 nRh3qbElFl06L/gKMZD5p2/yoC+vZ2zYEDMDxnqZfkD9clxIvY8N0IS1VYYb72If15GB
 vgUA==
X-Gm-Message-State: AOAM533iS1swzPYBXLxpFxxx7SIUwNeEiuRCBIHWENNR+GLohA1IaP5j
 A0RqYCMpC0oN7t7A+F5baw==
X-Google-Smtp-Source: ABdhPJzhOnt38ZSjVsNhD0vUKJmX6whzxZHUESJU7+2jyu5TxMgWUSeRU0XkpNHzJSgKNWCPDJJCEg==
X-Received: by 2002:a05:6830:1c32:: with SMTP id
 f18mr1413460ote.276.1603145514519; 
 Mon, 19 Oct 2020 15:11:54 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h6sm266576otr.28.2020.10.19.15.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 15:11:53 -0700 (PDT)
Received: (nullmailer pid 3689734 invoked by uid 1000);
 Mon, 19 Oct 2020 22:11:53 -0000
Date: Mon, 19 Oct 2020 17:11:53 -0500
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v4 09/15] ASoC: dt-bindings: audio-graph: Convert
 bindings to json-schema
Message-ID: <20201019221153.GB3679866@bogus>
References: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
 <1602859382-19505-10-git-send-email-spujar@nvidia.com>
 <87o8kz9blh.wl-kuninori.morimoto.gx@renesas.com>
 <2c9abfd5-f7eb-0b8d-f45f-9f56f37881b5@nvidia.com>
 <87v9f6hlvb.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v9f6hlvb.wl-kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 rlokhande@nvidia.com, swarren@nvidia.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, jonathanh@nvidia.com,
 devicetree@vger.kernel.org, nicoleotsuka@gmail.com, broonie@kernel.org,
 linux-tegra@vger.kernel.org, mkumard@nvidia.com, viswanathl@nvidia.com,
 lgirdwood@gmail.com, nwartikar@nvidia.com, p.zabel@pengutronix.de,
 sharadg@nvidia.com, dramesh@nvidia.com
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

On Mon, Oct 19, 2020 at 01:41:40PM +0900, Kuninori Morimoto wrote:
> 
> Hi Sameer
> 
> > >> Convert device tree bindings of audio graph card to YAML format. Also
> > >> expose some common definitions which can be used by similar graph based
> > >> audio sound cards.
> > >> 
> > >> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> > >> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > >> ---
> > > I'm posting this patch to Rob & DT ML.
> > > Not yet accepted, though..
> > 
> > Thanks for letting me know. I guess below is your patch,
> > http://patchwork.ozlabs.org/project/devicetree-bindings/patch/877dtlvsxk.wl-kuninori.morimoto.gx@renesas.com/
> > Do you have plans to resend this or send next revision?
> > 
> > I can drop my patch once yours is merged and refer the same for Tegra
> > audio graph card.
> 
> I'm waiting response from Rob now.
> It is merge window now. I will re-post it without his response
> if -rc1 was released.

Sorry, fell off my radar. Now replied.

Rob
