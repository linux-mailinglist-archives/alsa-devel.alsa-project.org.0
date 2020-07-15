Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D67ED22178E
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 00:11:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E489C1675;
	Thu, 16 Jul 2020 00:11:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E489C1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594851118;
	bh=93EiFIk/NdwdF/mi7fmL6xvs1z7iai9XGWJoodXPosk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g56I4QVyreSkT9HChVJkHL1fdrNM4nVRhWrvhQqGDs59sGht5/iEMYY8DbV7z2TCJ
	 WQj0vE7fXrblk3em1W4pG0WMq6ArCJBjmx6RqaZ+wT9X1wCfYjTXxUp1YrE2MYRxmt
	 JZeH/araMCKb+sCIYYKKXffDM0NmcjTVS1s4nAzM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F5EAF80229;
	Thu, 16 Jul 2020 00:11:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D072F8021D; Thu, 16 Jul 2020 00:11:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D71AF8014E
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 00:10:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D71AF8014E
Received: by mail-io1-f54.google.com with SMTP id v6so3954007iob.4
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 15:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bs4UvWlAUqqCoLxMvImO4Yyx0pE7t+ca9ZPzNIql2gA=;
 b=WNePLc9Fcc/My9HXE7//AkY86NLhRBgV1ewTHPI2WBvz70RmnWNUY9HJT+Q+VS3WZm
 4hA1GwBBgLX24lIfTcorGsH8UuGZ0OChtHCZfBpCil1S4p4znsmZ+w2yVudJfxbhXZRM
 4yNrMeHe03+i9nVRH6bcgtTXcL97v7HYUAJxGFAQ5VdDovPdCOZdk25nmUiwAioKcIok
 EI/XF5MwDu+AuSBhcSiLCw0J5GSe4mOB2JLowo7HsXmHdCBDxhNEBNLpf2ar1pN80Juj
 z+j1fLi1s/7XbVqTWY/zv9aFC8k/88Si9dcjGiaSTL7/SAcQJJoDnFX+ahfyOOnaiKW3
 jdeA==
X-Gm-Message-State: AOAM531YWJK0gmf64+WmpYVEmtzXMfZlUOtvNfU4MqlhuKQjAGB+jEPd
 tg6zXdjTrWLX/tkq6Dq0NQ==
X-Google-Smtp-Source: ABdhPJzywfwMkAxR2QgSwYC2Kedi45mHiQTzllbo4ZvapAVObxEPmKtxc/SMvZB/mHBePWd7cSiCqw==
X-Received: by 2002:a5d:8f0b:: with SMTP id f11mr1449175iof.200.1594851057295; 
 Wed, 15 Jul 2020 15:10:57 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id f76sm1744517ilg.62.2020.07.15.15.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 15:10:56 -0700 (PDT)
Received: (nullmailer pid 905964 invoked by uid 1000);
 Wed, 15 Jul 2020 22:10:55 -0000
Date: Wed, 15 Jul 2020 16:10:55 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH][resend] ASoC: dt-bindings: ak4642: switch to yaml base
 Documentation
Message-ID: <20200715221055.GA905934@bogus>
References: <87lfjwxlna.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lfjwxlna.wl-kuninori.morimoto.gx@renesas.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
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

On Tue, 07 Jul 2020 08:35:38 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch switches from .txt base to .yaml base Document.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> 
>  - 2weeks passed, but nothing happen
> 
>  .../devicetree/bindings/sound/ak4642.txt      | 37 ------------
>  .../devicetree/bindings/sound/ak4642.yaml     | 57 +++++++++++++++++++
>  2 files changed, 57 insertions(+), 37 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/ak4642.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/ak4642.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
