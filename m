Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE1B7DA28E
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 23:36:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 380A5A4D;
	Fri, 27 Oct 2023 23:35:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 380A5A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698442606;
	bh=BXDZuGFnsO0YWaG9oM2iKZrocAFptHShQekgPzjfVNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JZFQI2Tp6DTWPIHFCQN9DJdHRPYXf3ayiXHQvmWp2ZyCqUBqNFt/tq+ET0aNB7OiB
	 gRMWF2H7TYNlE/X++WvXkjTZH1HHY3FqaKVFJH6KRGanPzJOBlYlBHF6iWU1+A0hVd
	 qUpVJTuakJVZjwH5loJ1MT2B9h+LmrOOBIXQSVEQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A75F1F80224; Fri, 27 Oct 2023 23:35:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 451BCF80165;
	Fri, 27 Oct 2023 23:35:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB171F8019B; Fri, 27 Oct 2023 23:35:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com
 [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3951DF8012B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 23:35:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3951DF8012B
Received: by mail-oo1-f45.google.com with SMTP id
 006d021491bc7-5842c251d7cso1392723eaf.1
        for <alsa-devel@alsa-project.org>;
 Fri, 27 Oct 2023 14:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698442545; x=1699047345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S01/m+UkdNRB6iMJPFGQoMRsSYHCWIY0UEsdJKSaDcE=;
        b=EHHwILmPe1XqUtqyIDyzf3b7v7P7qls3IAT9BEzFbGfLvAQ94YZQfeE0zpne/KDD9N
         +SgqHP6TuXD9/rI4fkGnvsTTlsO/7lTqT/6JZnW01wC2xIt4EcuPcU0RP1Cx1ZHsg+f4
         eAE4RyejEh1R90EESzTG5dKfB4RAhRcxTtiCM7BvlfHNMxvxQEo8rWzSg1gN90cB3aIa
         m/sSD33D6tU0UHeDzzx5wCzc8+K56WWs92c00dY2D9qA71oxT16F5t0ElNbyC8TqA7G+
         Sk5h9YlwruhCb0lBufE3QVrjbNI/64zWPb+sV8OqADdFYwBzOn+aAv5B1LOoVwCNEMC4
         P+4Q==
X-Gm-Message-State: AOJu0YzTlRcQEGVwSpWf2PTmkyDlJVGChbK643lT+RfxX92PS3+fiR1S
	othxagY2AbWXq+wVZxLGCQ==
X-Google-Smtp-Source: 
 AGHT+IHC3Ocx06EeQtGzauTEivlJu9qRN/UWQolL0W2b0N/emKZ2p5F/Qqyuf0mOd25BGAXFc+0TQw==
X-Received: by 2002:a4a:eace:0:b0:586:b79f:b0ee with SMTP id
 s14-20020a4aeace000000b00586b79fb0eemr4106284ooh.5.1698442545087;
        Fri, 27 Oct 2023 14:35:45 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 c4-20020a4aacc4000000b00581eb0bc164sm526287oon.0.2023.10.27.14.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 14:35:44 -0700 (PDT)
Received: (nullmailer pid 3412526 invoked by uid 1000);
	Fri, 27 Oct 2023 21:35:43 -0000
Date: Fri, 27 Oct 2023 16:35:43 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Seven Lee <wtli@nuvoton.com>, broonie@kernel.org, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, conor+dt@kernel.org, YHCHuang@nuvoton.com,
 KCHSU0@nuvoton.com, CTLIN0@nuvoton.com, SJLIN0@nuvoton.com,
 scott6986@gmail.com, supercraig0719@gmail.com, dardar923@gmail.com
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: nau8821: Add DMIC slew rate
 selection
Message-ID: <20231027213543.GA3405817-robh@kernel.org>
References: <20231027082144.639369-1-wtli@nuvoton.com>
 <20231027082144.639369-2-wtli@nuvoton.com>
 <20231027-pronto-prideful-2cf3415a9d87@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027-pronto-prideful-2cf3415a9d87@spud>
Message-ID-Hash: LBCRQQNDNEJJ4OVNEBNBEOGMXMH5J2SP
X-Message-ID-Hash: LBCRQQNDNEJJ4OVNEBNBEOGMXMH5J2SP
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LBCRQQNDNEJJ4OVNEBNBEOGMXMH5J2SP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Oct 27, 2023 at 03:11:35PM +0100, Conor Dooley wrote:
> Hey,
> 
> On Fri, Oct 27, 2023 at 04:21:43PM +0800, Seven Lee wrote:
> > Add input with DMIC slew rate selection
> > 
> > Signed-off-by: Seven Lee <wtli@nuvoton.com>
> > ---
> >  .../devicetree/bindings/sound/nuvoton,nau8821.yaml        | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
> > index 3e54abd4ca74..01028b7ff85c 100644
> > --- a/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
> > +++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
> > @@ -89,6 +89,13 @@ properties:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> >      default: 3072000
> >  
> > +  nuvoton,dmic-slew-rate-selection:
> > +    description: the number from 0 to 7 that sets the DMIC slew rate.
> > +        The unit is mV/ns. 0 is the slowest, and 7 is the fastest.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    maximum: 7
> > +    default: 0
> 
> I meant make the property in terms of the unit, so
> nuvoton,dmic-slew-rate-volt-per-sec (or similar, Rob would likely know
> better how he likes the unit suffix for a more complex unit like this
> one) and then make it an enum with possible values corresponding to
> the real values that putting 0, 1, 2, 3 etc into the register produces.

>From what I've seen, you often don't know what units the h/w settings 
correspond to. Often it's just fast, medium, slow or something. And 
here, 0 doesn't make sense if the units really are mV/ns. 

So I'd just drop '-selection' and be done with it. (And clear up the 
units part).

> 
> Cheers,
> Conor.
> 
> > +
> >    nuvoton,left-input-single-end:
> >      description: Enable left input with single-ended settings if set.
> >          For the headset mic application, the single-ended control is
> > @@ -127,6 +134,7 @@ examples:
> >              nuvoton,jack-insert-debounce = <7>;
> >              nuvoton,jack-eject-debounce = <0>;
> >              nuvoton,dmic-clk-threshold = <3072000>;
> > +            nuvoton,dmic-slew-rate-selection= <0>;
> >              #sound-dai-cells = <0>;
> >          };
> >      };
> > -- 
> > 2.25.1
> > 


