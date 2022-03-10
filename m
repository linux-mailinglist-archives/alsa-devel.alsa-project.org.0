Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 357EF4D5349
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 21:52:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC2131900;
	Thu, 10 Mar 2022 21:51:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC2131900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646945560;
	bh=DbyPbpik+r/H9bBxxNvLxr+w6StJECFNemwuPbz1loU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Syn/3/x6FxalWnLM0HrGRD1qVCcZQQI2QAusPJVFwId8T3vz1FeB85u6ff9OgYHBy
	 CfDb9ofMabSvCcDH2YH8/wVUV3bRcXWdp8b12a+6lo8c/PWbzRKuRbAAeSifxQx/z2
	 Ha7Z0tjE460VFmQ5f3K1THvCmuxbkIrg5Y9vWMhE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B778F8013C;
	Thu, 10 Mar 2022 21:51:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43A2AF80137; Thu, 10 Mar 2022 21:51:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCE01F8012C
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 21:51:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCE01F8012C
Received: by mail-ot1-f43.google.com with SMTP id
 j3-20020a9d7683000000b005aeed94f4e9so4893967otl.6
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 12:51:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=slxCGGqrUztha0XPfFAUWL5ID7RQgaEMphARvX9hCBs=;
 b=x80cdeUdYmD7hWDPbYLQeFF6Fo/3aBNARj6wd/STY3yFZZhjk2T59u4sfcmnraHPPv
 Xr9WrDfhPH+ALT2M1O0I9vQDMDJWV1xh9O26HIcBv4pVY8uKAlCsr/qu2euHGe/5kFx5
 BzuzJgGVJAgSu1oaWwUY2OpdcfNnQaNhxuD6xptQquVJGhYod9TAR/g433h31e2ZdBcZ
 /qoCtQNsYQ8WSHdmnP8L6Z3eRcKDHpftEZy3mPYznXv786OtuJ7EgAhyb53R0EO6TcOO
 Imui76/1D8tJRM9I/mn7BKSbuWGzTO5xFg/HNNb2885BuK5Vi5aH/nrxN+ZrEz6qE9H7
 FtXQ==
X-Gm-Message-State: AOAM5302F1i4qDAwUp/gPe3qQnSJmX7nP7QYzmVgu8W7G3hUXqYVZF53
 tpJM6/V3ndou7qnFYWGVMg==
X-Google-Smtp-Source: ABdhPJz8G/QtOa+879lxZGa2RhwdFvUCb7Fy+vOXp2rvMTapgI5pc7gEgYdwEjMMeo8zWtoeAvPFGw==
X-Received: by 2002:a05:6830:22f2:b0:5c4:3f05:33cf with SMTP id
 t18-20020a05683022f200b005c43f0533cfmr2425782otc.330.1646945475301; 
 Thu, 10 Mar 2022 12:51:15 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y8-20020a544d88000000b002d525da014bsm2668280oix.42.2022.03.10.12.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 12:51:14 -0800 (PST)
Received: (nullmailer pid 2046461 invoked by uid 1000);
 Thu, 10 Mar 2022 20:51:13 -0000
Date: Thu, 10 Mar 2022 14:51:13 -0600
From: Rob Herring <robh@kernel.org>
To: Alifer Moraes <alifer.m@variscite.com>
Subject: Re: [PATCH 3/4] ASoC: wm8904: extend device tree support
Message-ID: <YipkwW6rUbWweXn7@robh.at.kernel.org>
References: <20220307141041.27538-1-alifer.m@variscite.com>
 <20220307141041.27538-3-alifer.m@variscite.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220307141041.27538-3-alifer.m@variscite.com>
Cc: pierluigi.p@variscite.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@gmail.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, eran.m@variscite.com,
 broonie@kernel.org, patches@opensource.cirrus.com, festevam@gmail.com
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

On Mon, Mar 07, 2022 at 11:10:40AM -0300, Alifer Moraes wrote:
> From: Pierluigi Passaro <pierluigi.p@variscite.com>
> 
> The platform_data structure is not populated when using device trees.
> This patch adds optional dts properties to allow populating it:
> - gpio-cfg
> - mic-cfg
> - num-drc-cfgs
> - drc-cfg-regs
> - drc-cfg-names
> - num-retune-mobile-cfgs
> - retune-mobile-cfg-regs
> - retune-mobile-cfg-names
> - retune-mobile-cfg-rates

If you want to add all this, convert to DT schema first. 

They all need vendor prefixes for starters.

> 
> Signed-off-by: Pierluigi Passaro <pierluigi.p@variscite.com>
> Signed-off-by: Alifer Moraes <alifer.m@variscite.com>
> ---
>  .../devicetree/bindings/sound/wm8904.txt      |  53 ++++++++
>  sound/soc/codecs/wm8904.c                     | 113 +++++++++++++++++-

Binding changes go in their own patches.
