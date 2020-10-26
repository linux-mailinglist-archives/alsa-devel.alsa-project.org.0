Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEEF298F72
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 15:35:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A08616C7;
	Mon, 26 Oct 2020 15:35:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A08616C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603722953;
	bh=rhucgPrQo05ZoYOS3Q1MmlcIuYc9RHCHXgRdEpX9XLk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PfUiamNhPc92v/MAzYvq6kIhdE4ekSuPf1ubUSHbOjbp+TM4gt8IaJi7IYmPCtSsx
	 pE/syZxybCaRTp+OhCKlO79U4ERIhayDZteRRfnzjhRQOXwFIOqTgSTokit2FqluGM
	 AU4zunrebkCD2jhSZLYGFrwr+B4FmwXsvlRUI2Ic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87B61F80249;
	Mon, 26 Oct 2020 15:34:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F8B4F80212; Mon, 26 Oct 2020 15:34:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EE11F80086
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 15:34:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EE11F80086
Received: by mail-ot1-f65.google.com with SMTP id f97so8175804otb.7
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 07:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Gu70+4d8Zu8/uxoB6xBSb3yW/hLHlyYk/LMJt3p6Pnk=;
 b=XTSpcLAcYDW+8di3O/34r753GImLglb9kC+cXGpfc02gfI18xShRFzWzjQX4FWspfg
 oeNMGro6+5GkaoI2B54+uExU+0penwjIbaS+hZl7LbPucFL5g/Pc8CQhEeV1bK8teuug
 5KWgFfog5h/++nLuiYALXhFgJZaoNV0DiMx5G/WC7a1AG2e7m1e+eh364Yl1nIq8Hu9H
 EIKJKC9RCvWMzbYkYzXbQ6cYskiAlt9PZZIPX85R07yo6VcpcoEl+CNntDNeTRKwlZmo
 /wUgaCHHk2wcgxClhSWBUHDJCfG1foHI/37sYeeXypQsKpz0MgprIkwAHDG3vZZ1fMee
 TuMA==
X-Gm-Message-State: AOAM530CmQmd/HnwSR6KpjGSq5sZKo+OJ/pzEm4yh5zNXiToIpa2zTCC
 Q736MesMI8evi0mgVIq9WA==
X-Google-Smtp-Source: ABdhPJw+O158CQSA6jqE9RrNha1lkKYpXpyDC9T1facmMZ7+/cjPi+O4C7tiVHVLFM1bBF8uzV9oKg==
X-Received: by 2002:a05:6830:1e44:: with SMTP id
 e4mr15220194otj.346.1603722850794; 
 Mon, 26 Oct 2020 07:34:10 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e3sm3969247ooq.0.2020.10.26.07.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 07:34:10 -0700 (PDT)
Received: (nullmailer pid 117630 invoked by uid 1000);
 Mon, 26 Oct 2020 14:34:09 -0000
Date: Mon, 26 Oct 2020 09:34:09 -0500
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: stm32: dfsdm: update audio properties
Message-ID: <20201026143409.GA117596@bogus>
References: <20201020155709.2621-1-olivier.moysan@st.com>
 <20201020155709.2621-2-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201020155709.2621-2-olivier.moysan@st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, alexandre.torgue@st.com, tiwai@suse.com,
 arnaud.pouliquen@st.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 broonie@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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

On Tue, 20 Oct 2020 17:57:08 +0200, Olivier Moysan wrote:
> - Add missing compatible property in audio node.
> - Remove obsolete "st,stm32-dfsdm-pdm" compatible.
> - Remove useless comment in adc io-channels description.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
>  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml    | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
