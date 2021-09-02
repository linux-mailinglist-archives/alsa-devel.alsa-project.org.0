Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C85B3FF431
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Sep 2021 21:28:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0DDC17D3;
	Thu,  2 Sep 2021 21:28:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0DDC17D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630610934;
	bh=LhDShVj6QOhNkUmwbmjB7Rk0b4fp/hCawCMRWlPqfZ8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HzLm/Ae/PAL6F9FuccuQj92aLSVuVQXlp/OmZ2U4mI4ZTLM1Qszd75VJ2rlDy4uBK
	 uKufdJQ99r4fFEL8CKW2RLk1bX5dQITEGo392/c4E/U4xZbIwPZcP6Nf9/OHqMfKOA
	 f6nW6bxwT62VgO4BOT85qR2Wv9vXjABcBv5Fxb/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 625FBF8028D;
	Thu,  2 Sep 2021 21:27:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 362F4F80269; Thu,  2 Sep 2021 21:27:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 297AFF800AF
 for <alsa-devel@alsa-project.org>; Thu,  2 Sep 2021 21:27:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 297AFF800AF
Received: by mail-ot1-f50.google.com with SMTP id
 q11-20020a9d4b0b000000b0051acbdb2869so3937716otf.2
 for <alsa-devel@alsa-project.org>; Thu, 02 Sep 2021 12:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vTEOj2Oz/vkZd9p2VPI7+5Yw+i+4KcedhEoFPxZ0RV0=;
 b=LFWgaHLMMTK2fyoJzhvQOSsgsBJhftQ8UCgDB+qtdnpzat0gQelj776jgfVlk8XONe
 NU1Ny58BCQN15uFsYUM0RD8w9J+mjOKcxnl9aDn4VxLUWIr5CIkFPCqEcjQVLaNcvAaj
 HQ3/uh1LuC/zkG5qp+G6NxtlTW4KC8ifCG1aQ+ET+4uiukpY7G4kjVU8Bm0OGd+NeXmD
 lPTHebUJytCTXeGmBgTocN+i3Bfoz2uqQuZ62T5OhrA5gQfsMEwH4Aluz+iImVbxPcpK
 reczFEOgab+dXtOQGtTCPJnHZ9oQkhr/VlhzUFyRwPhtIrzewwYCFRI2MN8/osVYXp/S
 5Fzg==
X-Gm-Message-State: AOAM530t/gsMDFBOROjppNpwYArj9YkHadV5c/z3s+2PPNcHDG+Q0t/g
 2Cs8iTqSHhkUocUpfHSTLA==
X-Google-Smtp-Source: ABdhPJwDfs8TaxQM2Rdk9jCeoYg+mHv5mL1sLoQllJ2+R1ddJdVlycHR6CRdLwImN8IQHdNSQu61Zg==
X-Received: by 2002:a05:6830:2781:: with SMTP id
 x1mr4141031otu.334.1630610846795; 
 Thu, 02 Sep 2021 12:27:26 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id s10sm542189oog.14.2021.09.02.12.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 12:27:26 -0700 (PDT)
Received: (nullmailer pid 1247901 invoked by uid 1000);
 Thu, 02 Sep 2021 19:27:24 -0000
Date: Thu, 2 Sep 2021 14:27:24 -0500
From: Rob Herring <robh@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v2 1/3] ASoC: Add json-schema documentation for
 sound-name-prefix
Message-ID: <YTElnNRjM3JTnYIw@robh.at.kernel.org>
References: <1630562033-13231-1-git-send-email-spujar@nvidia.com>
 <1630562033-13231-2-git-send-email-spujar@nvidia.com>
 <1630584239.106707.685602.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1630584239.106707.685602.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 stephan@gerhold.net, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 jonathanh@nvidia.com, broonie@kernel.org, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, jbrunet@baylibre.com
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

On Thu, Sep 02, 2021 at 07:03:59AM -0500, Rob Herring wrote:
> On Thu, 02 Sep 2021 11:23:51 +0530, Sameer Pujar wrote:
> > The 'sound-name-prefix' is used to prepend suitable strings to a
> > component widgets or controls. This is helpful when there are
> > multiple instances of the same component. Add relevant json-schema
> > and is inspired from sound-name-prefix.txt documentation.
> > 
> > Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > ---
> >  .../devicetree/bindings/sound/name-prefix.yaml     | 35 ++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/name-prefix.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/sound/name-prefix.example.dts:19.28-22.11: Warning (unit_address_vs_reg): /example-0/analog-amplifier@0: node has a unit name, but no reg or ranges property
> Documentation/devicetree/bindings/sound/name-prefix.example.dts:24.28-27.11: Warning (unit_address_vs_reg): /example-0/analog-amplifier@1: node has a unit name, but no reg or ranges property
> Documentation/devicetree/bindings/sound/name-prefix.example.dt.yaml:0:0: /example-0/analog-amplifier@0: failed to match any schema with compatible: ['simple-audio-amplifier']
> Documentation/devicetree/bindings/sound/name-prefix.example.dt.yaml:0:0: /example-0/analog-amplifier@1: failed to match any schema with compatible: ['simple-audio-amplifier']

I'd suggest you just drop the example. This schema is not a complete 
binding.

Rob
