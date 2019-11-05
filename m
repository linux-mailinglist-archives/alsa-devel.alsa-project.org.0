Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC56F055B
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 19:50:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D141416E5;
	Tue,  5 Nov 2019 19:50:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D141416E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572979856;
	bh=Wz0zHqgL3BpkKj+K8HR7g1cuDz2MRYtx364gWS1Yobs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S0n7HwNSJW/YYO25oBAKXS3oLdwANntO0Gdz+414vjilsDGfY45E022WXyf04DSh2
	 N+WkMFZzvLObX2dJRBG5PWv+Gpx3ol8/bNGQo6q4HijPmVbMIAOV5WaMYNWUVgRl2T
	 iVUNca+eS2D2H8WiFsQ4HtTaOmN8AS70HC0775/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B438F8049B;
	Tue,  5 Nov 2019 19:49:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41E62F8049B; Tue,  5 Nov 2019 19:49:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC33FF800F3
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 19:49:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC33FF800F3
Received: by mail-oi1-f193.google.com with SMTP id s71so18498403oih.11
 for <alsa-devel@alsa-project.org>; Tue, 05 Nov 2019 10:49:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Qj5LiYO9Gp8VVa5aloZ7icPxyBMoZMvJD6YekkOcDko=;
 b=g7L7gGLOF91+6E1W17zAH/0ZbnwvuMP8Zi3+OJ01ZwR/qYPSNYZ8lTXBi9Q+sME9w5
 ANokuXEv1wfuSNiL6zmSZuO1m0rb8MGDXJ2dYIw01jhW8pxc/rT82erVqRP9C6/KT3QR
 g+nmkt9PJew2IKUmJtXovdAyrl4J5Mb0b3C3G57icHptiZwJfiUHbQfNcRG6kkuDpb54
 /w1Zbtx6eRnlCnXIbeklQIqn6B1NbOgmkib44olsnqnQZR+it5YdKPirsR+YGD8iVlPC
 HMZxiImMraAM6uG1Asu8dBNGJDSev3KTrRMXfG3b3Xjj8II/am2tfXfHQXJsvye9jTyd
 miGg==
X-Gm-Message-State: APjAAAVP5Ts3D6efjZ5izpSrcNgaDDD3MQ4uR4ecwvu5gyypDvryrtWi
 AQMMse5L4JMWbUAE1K205g==
X-Google-Smtp-Source: APXvYqyrkBUlvV4cInkJ0w/GC7dlp4bZRcgeBsiVsjLD/Uy3nlwd90V6BQaJ97S30Z3HKKwFfh/7vw==
X-Received: by 2002:aca:a842:: with SMTP id r63mr394336oie.118.1572979745545; 
 Tue, 05 Nov 2019 10:49:05 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u18sm2530972otq.31.2019.11.05.10.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 10:49:04 -0800 (PST)
Date: Tue, 5 Nov 2019 12:49:03 -0600
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20191105184903.GA4709@bogus>
References: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
 <20191029112700.14548-9-srinivas.kandagatla@linaro.org>
 <CACRpkdYc-3Nk7VGj8mAjaM4C0dc_X7ZOK0cptW2Sr+kKwvyFVg@mail.gmail.com>
 <4f0e22ab-6aa1-2ed1-a85b-fb66531e0b2a@linaro.org>
 <CACRpkda2CdbPe7jsomZSxdJ1wE65OmNYDsZNj1OmfzdvG4kWng@mail.gmail.com>
 <502c64dd-a249-bb2c-7bc5-8c66fa66be35@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <502c64dd-a249-bb2c-7bc5-8c66fa66be35@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, bgoswami@codeaurora.org,
 Vinod Koul <vinod.koul@linaro.org>, Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v3 08/11] dt-bindings: pinctrl:
 qcom-wcd934x: Add bindings for gpio
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Nov 05, 2019 at 01:27:45PM +0000, Srinivas Kandagatla wrote:
> 
> 
> On 05/11/2019 13:25, Linus Walleij wrote:
> > On Mon, Nov 4, 2019 at 10:35 AM Srinivas Kandagatla
> > <srinivas.kandagatla@linaro.org>  wrote:
> > 
> > > This controller just has Output enable bits, No pin control properties.
> > > 
> > > As you suggested I can move this to drivers/gpio in next version.
> > OK perfect, thanks!
> > 
> > NB: this probably also affects the compatible-string which contains
> > "pinctrl*" right?
> Yes, I will suffix it with "-gpio" instead.

Not a discussion we should be having because you should name this after 
what's in the chip documentation not the OS subsystem it happens to land 
in.

Rob
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
