Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0D7449C0D
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Nov 2021 19:56:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EABF165D;
	Mon,  8 Nov 2021 19:55:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EABF165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636397800;
	bh=KbKh7gtKU59qLgO0vWspS4/tfP97Qxa2M7CQgP9uqP4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ty01mrya9pX1EnUGHNfesFgpG8DOKvVfXZ0WYMWMqluZTKMGAa6hfWfx38hkYLR+/
	 SgA47RZ+tkWnkOshnmlAX6HKKCBNG8PtjL/ATbQUUyFbIHeV4z0FFZNyZRD/NfkA0m
	 6YUIV2s0BlTWfmDKiU6g9X/utOIxeRHG7o7JMdH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDAA0F804B1;
	Mon,  8 Nov 2021 19:55:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3433F8049E; Mon,  8 Nov 2021 19:55:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94651F801D8
 for <alsa-devel@alsa-project.org>; Mon,  8 Nov 2021 19:55:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94651F801D8
Received: by mail-ot1-f42.google.com with SMTP id
 h16-20020a9d7990000000b0055c7ae44dd2so11051453otm.10
 for <alsa-devel@alsa-project.org>; Mon, 08 Nov 2021 10:55:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rVRh1sxzpaMQeA+0p6EZeOg5M9eCwHLOcOw6O1U43pE=;
 b=EwoFItS82V2jQ/SV9ZzdSts93ypBGB4ISrI3oftp6h19wMu3DcZgk/xWF7bxStz/Kw
 pDtsjniTJ1YDdIYk9wdJKLXJXS578jPevsSxZqQXcwjn72Nf80zCz6Iv30y1bbg0B7be
 tgk+G/ccFPzBNLtE8ypKLP736JWu8v5uQmZGoqnIDU+jjVl4Y1+WaXb6Gd9x6rlG84HC
 LBwvX97wVu/73SnZ9iQ96cjMMnt8BEvda78XBVB8Di9dq4/HDX/6ENAzV1X9qkKr+U39
 1EPOfrlTSiqFjfOnslyMBj6hOsWAsj4pzsvBvV+AOUifsUGOeEpV/tXQIEpk4VcWysNE
 ok6w==
X-Gm-Message-State: AOAM5325w5tZ120x9vquOMEsu0/wLvxifABKUNHYgTx0lZUgoURxyYW2
 ZuyMyvXMqa8Y4NQJ8QRO8A==
X-Google-Smtp-Source: ABdhPJyohxO+K12heylMLci20BfZuAXUmtzxjEv0ifKRtxwCkxt4R3ufjC0VuUmqblEHbDIynR9zVw==
X-Received: by 2002:a9d:4d0f:: with SMTP id n15mr991993otf.127.1636397711483; 
 Mon, 08 Nov 2021 10:55:11 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id p62sm6243908oif.43.2021.11.08.10.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 10:55:10 -0800 (PST)
Received: (nullmailer pid 4020110 invoked by uid 1000);
 Mon, 08 Nov 2021 18:55:09 -0000
Date: Mon, 8 Nov 2021 12:55:09 -0600
From: Rob Herring <robh@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH 3/3] ASoC: dt-bindings: cs42l42: Convert binding to yaml
Message-ID: <YYlyjT9bB+EKYoGL@robh.at.kernel.org>
References: <20211028140902.11786-1-rf@opensource.cirrus.com>
 <20211028140902.11786-4-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211028140902.11786-4-rf@opensource.cirrus.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, broonie@kernel.org
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

On Thu, 28 Oct 2021 15:09:02 +0100, Richard Fitzgerald wrote:
> Replace the old .txt binding with a new schema binding.
> At the same time, some of the descriptions are updated to make them
> clearer, fix errors, or just make them fit better into the style
> of schema binding.
> 
> The cirrus,hs-bias-ramp-rate property was missing from the old .txt
> binding and has been added to the yaml.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>  .../devicetree/bindings/sound/cirrus,cs42l42.yaml  | 225 +++++++++++++++++++++
>  .../devicetree/bindings/sound/cs42l42.txt          | 115 -----------
>  MAINTAINERS                                        |   1 +
>  3 files changed, 226 insertions(+), 115 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/cs42l42.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
