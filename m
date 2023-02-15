Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED87698449
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Feb 2023 20:17:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 962C4A4F;
	Wed, 15 Feb 2023 20:17:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 962C4A4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676488673;
	bh=2o0NBlI99vxjR5tJ0+4CS+psmmcp56zqp2u+m8SinuQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TA2ItxX7WtsaiKeAGiBStfq8tYMjLygGcWXYFD+yYYrbwr5cWDn6nLVO+gHsNEHmi
	 5u5sHqxQCNcdeABd5rXxdnfRP+6FDFCzcLQUMRPD+18r11oWS0HcCJz/BwgjUt7t2L
	 dpu9hFgi7sby3FFHKKm2vr/xXdJCm2pA9B/jY+lw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A8F5F800E3;
	Wed, 15 Feb 2023 20:17:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84716F800E4; Wed, 15 Feb 2023 20:16:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61FCDF800AA
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 20:16:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61FCDF800AA
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-16df32f2ffdso13497952fac.1
        for <alsa-devel@alsa-project.org>;
 Wed, 15 Feb 2023 11:16:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PW1m1yQHM9XDpw4IOvOruehCKlPQgSONUVgmXhDIYf8=;
        b=p4koiDTMEkBopBet1NNMRjPT6RD6n8mz06j01D+uCsh+jjieSk/QwUY3Nl8LLnoh5S
         /4nmy6lEij0KdR/+1RwYth6q2FbCFEz+Dkix14rkQjYeQ7y7mqxK8A8qig8J/zUME1F3
         h9U4A1xq85kedLXpHY+KbGbIBF5V3IDuq3VrbqEtVU5WdZtTl1aCJJqnBCPta8PkL1jB
         vyWQ3k6iJiyGJmSE775i7UvDzwp2RUkMOcR0gRZSXk0ag4bZ7/lr4CHkiXUqBAPNp1/2
         6aEM0/CjOW4XpTWp+0/qOwvO6Tr5u9OgcdoNTZ0rQWhAc2KxiA4t9uuBNaBAR0abA8pB
         vaCA==
X-Gm-Message-State: AO0yUKUPb/VBYMGC7Q5yL8PPydLJOMq0yPyVpQsOLD9a5OwIjOrwwKeU
	OfO4Nt8UhfNUXfyQoikf8Q==
X-Google-Smtp-Source: 
 AK7set9i3pcpR00UkNEQS3Uh8VyZQHo+YJjV/Yrf/s71LptmDnJn6po1KLPiFeqH5Dnm4F9xM9ROwg==
X-Received: by 2002:a05:6871:60e:b0:16d:2b42:811a with SMTP id
 w14-20020a056871060e00b0016d2b42811amr1849530oan.17.1676488609294;
        Wed, 15 Feb 2023 11:16:49 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 ec22-20020a0568708c1600b00143824af059sm7361240oab.7.2023.02.15.11.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 11:16:48 -0800 (PST)
Received: (nullmailer pid 424169 invoked by uid 1000);
	Wed, 15 Feb 2023 19:16:48 -0000
Date: Wed, 15 Feb 2023 13:16:48 -0600
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: sound: ep93xx: Add I2S and AC'97
 descriptions
Message-ID: <20230215191648.GA408047-robh@kernel.org>
References: <20230212232137.299005-1-alexander.sverdlin@gmail.com>
 <46d5b6af-23e1-4178-83bc-b4a435b1426e@linaro.org>
 <109868b9492aecaca0a7170cba9fb51e62de7116.camel@gmail.com>
 <c4f5f733-ce22-2dfa-30f7-cde309eadaf9@linaro.org>
 <ba51ecefb814115e977d90062ca5fe99859cb327.camel@gmail.com>
 <Y+uiaqvdIL4IpRlC@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+uiaqvdIL4IpRlC@sirena.org.uk>
Message-ID-Hash: TK27NQM3TESEEXKZNLEEJN5RNVTVU6T5
X-Message-ID-Hash: TK27NQM3TESEEXKZNLEEJN5RNVTVU6T5
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 devicetree@vger.kernel.org, Hartley Sweeten <hsweeten@visionengravers.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TK27NQM3TESEEXKZNLEEJN5RNVTVU6T5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Feb 14, 2023 at 03:02:02PM +0000, Mark Brown wrote:
> On Tue, Feb 14, 2023 at 03:26:14PM +0100, Alexander Sverdlin wrote:
> > On Tue, 2023-02-14 at 15:11 +0100, Krzysztof Kozlowski wrote:
> 
> > > OK, but then I like the example - if datasheet would use name
> > > "clk_clk_this_is_clk" would you still find it meaningful?
> 
> > > Every clock input in clocks is a clock. There is usually no need to say
> > > that a clock is a clock...
> 
> > I see you point, but this is legacy code (sound/soc/cirrus/ep93xx-i2s.c)
> > which took these names back in platform data times... I also see that
> > rather majority of *i2s*.yaml use something "*clk", so maybe it could
> > be accepted for legacy code?
> 
> Even ignoring the whole legacy thing these are industry standard
> names for the clocks - they are pretty much universally named and
> referred to with the clk suffix.  I can't see what removing it
> would accomplish other than reducing clarity.

Agreed.

If a clock is called "Nclk" then I think that is fine. If it is 
foo_bar_clk, then yes, 'foo_bar' is preferred.

Rob
