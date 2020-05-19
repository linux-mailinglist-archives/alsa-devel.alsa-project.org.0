Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A69711DA4DF
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 00:44:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2442E17A3;
	Wed, 20 May 2020 00:43:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2442E17A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589928246;
	bh=Z+yhUkb54ncq98pdzZqCBEveIFtHrDMflLjR/7kU9Eg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nzc8/hAotPhdp7LvrvhfAaCvG0DKFJp5h7dfz9hYC7AUeP9A2PShccj+O8yXUNs1D
	 FVF0f8zQ/W4V2P5JZNayT9dcQ0oyKQrTbUf3ZOaEeGLjE4JG8cviThdor++KZpdHTv
	 MfiFXpItpWQR+1EeAJQj3luSBGmulVWOgQGJ6IeQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33370F801F8;
	Wed, 20 May 2020 00:42:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CDC1F801A3; Wed, 20 May 2020 00:42:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5779BF800C9
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 00:42:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5779BF800C9
Received: by mail-io1-f65.google.com with SMTP id f4so986330iov.11
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 15:42:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qgFe2xy8/2xQB5QWY3CO3CsIleZgaMC14NjFZj3FgiM=;
 b=AQVeaGj00QhNYsVZJs11/BDdioCFSs2WT2vMeqjWYIhQTWVRdzwOhSctDHBuRYHIMc
 wf4/eulY+3WLcNV5qcAI6y/VTXohsPrFjWD/OPvG7iR/XQahaMcigzhEZnFUT9bY6Xfx
 rtyPX0BouFYv4pvjNaYFx/vZEDQrU5FgJjNU11i0oI11gfueK0mN7K+NlCfS+MnkOYmr
 Z+oBw3dr4k0hAFOHKnTaz1V2YEpNMf8L9cphgLEqJsuYMOIJNlTh8fQmM9E0LQG7gFgT
 3ywuSXHQLR2MF+aY6ZQNdnhq9CXTZuQk94/2tEpXgxXBOm+FucYG035fRgYLgl06AFKR
 u5gg==
X-Gm-Message-State: AOAM531m6TqKt39B6ld7EDtCePVbQHSCTj0CCKCfUmO9QdVJmajIVlw3
 Ad/X20B/gcfHH/DODlKZTQ==
X-Google-Smtp-Source: ABdhPJytDRwoiZt9xLZNqCqKB1TxQKbXQJnN0x8nPz/zWntjyvp5bG6L19VYqss8zFDavc6WNxSe4Q==
X-Received: by 2002:a6b:700a:: with SMTP id l10mr1152861ioc.170.1589928136705; 
 Tue, 19 May 2020 15:42:16 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id q75sm398796ili.11.2020.05.19.15.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 15:42:16 -0700 (PDT)
Received: (nullmailer pid 824100 invoked by uid 1000);
 Tue, 19 May 2020 22:42:15 -0000
Date: Tue, 19 May 2020 16:42:15 -0600
From: Rob Herring <robh@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v2 2/3] bindings: sound: Add documentation for TI j721e
 EVM (CPB and IVI)
Message-ID: <20200519224215.GB488519@bogus>
References: <20200512131633.32668-1-peter.ujfalusi@ti.com>
 <20200512131633.32668-3-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512131633.32668-3-peter.ujfalusi@ti.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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

On Tue, May 12, 2020 at 04:16:32PM +0300, Peter Ujfalusi wrote:
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

Would the audio graph card work for you on this? 
