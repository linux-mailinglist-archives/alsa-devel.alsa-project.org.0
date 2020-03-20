Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 486C618C439
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 01:23:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B11DE17C8;
	Fri, 20 Mar 2020 01:22:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B11DE17C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584663785;
	bh=vr1j1MCsadkOnB8cI79yaYQoZGEZuTmwpWblI/5kSVA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I0PdjnlxPlN7mwzqzP5mEl4jzoglxugmJHJJHLhVa7tSB6eR2V0z6id2B5hAssbBp
	 tKrD8yKJOhgK9eSskp4Wt1mJXZwH7NJlPm9UZtPmvfA1S7V6XkdfI4VwzT1cV/Rnix
	 Gn6uGQ+SBZ9s/NYXUHIGwgw5esSwKanUdCy8Utlk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B9A6F80217;
	Fri, 20 Mar 2020 01:21:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8197CF8022B; Fri, 20 Mar 2020 01:21:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D4D5F800C0
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 01:21:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D4D5F800C0
Received: by mail-il1-f193.google.com with SMTP id k29so4090996ilg.0
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 17:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FuTx6V6iQX3TQQufQK6K65FrEVN9gM5pUAmus1MSvNc=;
 b=k68WnXfJsb7d6J4YNdQ1an6qzvJxC1b7WnIiWJNG629xfSvCFq34Dm8RtCVit0Fja5
 TpcNziibgUC0AhPaEVqBCS89hlYcGkSkogc0tfXKoY58nOYsZsYXzRtCOUPA7HPsj/Go
 6Y5SzV9ej8HD598Tg1rIQnzWC/dlOrN08VaM4xWkxVF5y0yluRBScuJpWk8mRrtKYEkc
 R586kMAV2NiG0yzhUYpi4PKCCbTLxAWM9ISnNjrJjJ2dQqh/g2Q+l1hA4akycYenXsAa
 9U96wHSieKasK6XLNyhcSJKxN//Wp8aClshUeR8k0L9zf6vZR1tmQ4uxM7YX7X3fIJ9V
 oJhA==
X-Gm-Message-State: ANhLgQ2DuvY9mXQFKv7VPEdW579CoT3wyjsxmwy8gPF/w06mAAH+QcGB
 PcjMoPpCBYaafOpXi7aBnw==
X-Google-Smtp-Source: ADFU+vtWkY9RoNxxzvof2BMoe1HJaDzh6VsWtHCXeQqV0u6VhrRgZXrJYD2kh9SusnEkFODar2PWAQ==
X-Received: by 2002:a05:6e02:e0e:: with SMTP id
 a14mr5896966ilk.104.1584663676074; 
 Thu, 19 Mar 2020 17:21:16 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id t24sm1275351ioj.13.2020.03.19.17.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 17:21:14 -0700 (PDT)
Received: (nullmailer pid 11035 invoked by uid 1000);
 Fri, 20 Mar 2020 00:21:12 -0000
Date: Thu, 19 Mar 2020 18:21:12 -0600
From: Rob Herring <robh@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 2/3] bindings: sound: Add documentation for TI j721e EVM
 (CPB and IVI)
Message-ID: <20200320002112.GA10030@bogus>
References: <20200319092815.3776-1-peter.ujfalusi@ti.com>
 <20200319092815.3776-3-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200319092815.3776-3-peter.ujfalusi@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 broonie@kernel.org
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

On Thu, 19 Mar 2020 11:28:14 +0200, Peter Ujfalusi wrote:
> The audio support on the Common Processor Board board is using
> pcm3168a codec connected to McASP10 serializers in parallel setup.
> 
> The Infotainment board plugs into the Common Processor Board, the support
> of the extension board is extending the CPB audio support by adding
> the two codecs on the expansion board.
> 
> The audio support on the Infotainment Expansion Board consists of McASP0
> connected to two pcm3168a codecs with dedicated set of serializers to each.
> The SCKI for pcm3168a is sourced from j721e AUDIO_REFCLK0 pin.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  .../bindings/sound/ti,j721e-cpb-audio.yaml    |  93 +++++++++++
>  .../sound/ti,j721e-cpb-ivi-audio.yaml         | 145 ++++++++++++++++++
>  2 files changed, 238 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/ti,j721e-cpb-audio.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/ti,j721e-cpb-ivi-audio.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/sound/ti,j721e-cpb-ivi-audio.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/sound/ti,j721e-cpb-ivi-audio.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/ti,j721e-cpb-audio.yaml: duplicate '$id' value 'http://devicetree.org/schemas/sound/ti,j721e-cpb-audio.yaml#'
Error: Documentation/devicetree/bindings/sound/ti,j721e-cpb-ivi-audio.example.dts:21.23-24 syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:311: recipe for target 'Documentation/devicetree/bindings/sound/ti,j721e-cpb-ivi-audio.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/sound/ti,j721e-cpb-ivi-audio.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
Makefile:1262: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1258054

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
