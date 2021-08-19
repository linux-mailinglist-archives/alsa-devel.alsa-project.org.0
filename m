Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF1D3F274A
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Aug 2021 09:06:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 091601676;
	Fri, 20 Aug 2021 09:05:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 091601676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629443189;
	bh=zt1ld0zy582lERLrBHToiU4pB40ur6WjbdRGAZIg4Lw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V21LkvEm/GLuenkKbJJNH5SsrN431uJ87HRZ4cgXr9nK/cpHTxesSqB/sqQ7RglG0
	 5nmoGmt/Qco8hCawei00fiygUDHUedrZ+TobwC/0urNxKXvGf+slHi0hAEIjKqPsbV
	 CF9NBuhNSqs5kVbb3z/si0640beMoNT2Z6eXUWYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88737F80515;
	Fri, 20 Aug 2021 09:02:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AF37F8026D; Thu, 19 Aug 2021 19:01:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4D5BF800EC
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 19:01:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4D5BF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gtjctdvw"
Received: by mail-ej1-x632.google.com with SMTP id gt38so14172469ejc.13
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 10:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HOnBGLFQ/RPkWyVebKZOihfXyP1VfPHshsIs+J3gUi4=;
 b=gtjctdvwMmR+KSoAu9WPHrM3VQ1bojXNADyhNT5C/CWdI8eqrxzXML8ywRkuk+hlfz
 PprjBPzk510Gbr3qulBKAN51iG1gZxzii91z5gVuaUKxQqWsuboVjsJOupWDhCebGfxo
 wlPv3URrKTYZyCy0MMU9x7fOoPcxQWawlhwrh7LtfJhK4mHo3tlmpGyFr0kyxb0g6VHX
 OVoFeCsjuRwezH3VmWztgW2hSuMj/1Fjw8N0DLu3HAa2he1INBu9ybJw1o/Spe6kHhGS
 3O4RBHvAT7BTA/GkzpOi20MjfjCQf9YjRh0ehoCd1Q2TGuwUJla1eCGY7Ldp1eb8vhhK
 AQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HOnBGLFQ/RPkWyVebKZOihfXyP1VfPHshsIs+J3gUi4=;
 b=Q8mJXffP62Q6SYZMtdx4FxUIg3RTth8XWf40woLeA77zFJ/kiiPkYugQTWev5Xjr4Q
 CjN45pn72Sq1YsZ5MDOSnPdkxX/L8DICzNe5xYVG8/nYCKh/wzcmpECCQ8i+h7e9RYVB
 p8cRbWIzUvrsiPb+oz2jsLCUodH3zJsJXNl4FFxRKOiG2gZzD8obmieeGKF6w2/dKYav
 oYaAauwteePV7PZWm0Ha5fWdmN92cljZJrvvhDEDqmzkNwIC/9k9vNDjdIY9jMPE2P5a
 +YiikgULnl1XpEcnzRy2e5TQBE7B7hIRF7n5DbDhdZsZHbH8n3NeRYKGYkgLLxUEmhCU
 Gsew==
X-Gm-Message-State: AOAM533QwcCAYdgi/p11xeIyvWGVq0U5XNthxPhS7Z12JThamOkIt0en
 SEpv4qbj47pDDyfuL+KAptI=
X-Google-Smtp-Source: ABdhPJyWDs5yB6T1OuTS+UOyjwaJiM6R+2uqmgtC45avvP1J/qktmzyKNhL1VibEzRQtpC1IDes4vg==
X-Received: by 2002:a17:906:b787:: with SMTP id
 dt7mr17258690ejb.111.1629392488064; 
 Thu, 19 Aug 2021 10:01:28 -0700 (PDT)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84])
 by smtp.gmail.com with ESMTPSA id n23sm2090257eds.41.2021.08.19.10.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 10:01:27 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: sound: add rockchip i2s-tdm binding
Date: Thu, 19 Aug 2021 19:01:25 +0200
Message-ID: <1870492.5CqhBlFY90@archbook>
In-Reply-To: <20210819141617.GM4177@sirena.org.uk>
References: <20210817101119.423853-1-frattaroli.nicolas@gmail.com>
 <2412250.zZEsDtmPgG@archbook> <20210819141617.GM4177@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Mailman-Approved-At: Fri, 20 Aug 2021 09:02:12 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
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

On Donnerstag, 19. August 2021 16:16:17 CEST Mark Brown wrote:
> On Thu, Aug 19, 2021 at 03:52:55PM +0200, Nicolas Frattaroli wrote:
> > On Donnerstag, 19. August 2021 14:08:36 CEST Robin Murphy wrote:
> > > > +  rockchip,no-dmaengine:
> > > > +    description:
> > > > +      If present, driver will not register a pcm dmaengine, only the
> > > > dai.
> > > > +      If the dai is part of multi-dais, the property should be
> > > > present.
> > > > +    type: boolean
> > > 
> > > That sounds a lot more like a policy decision specific to the Linux
> > > driver implementation, than something which really belongs in DT as a
> > > description of the platform.
> > 
> > I agree. Should I be refactoring this into a module parameter or
> > something along those lines? I'm unsure of where this goes.
> 
> Why is this even required?  What is "multi-dais" and why would
> registering the DMA stuff cause a problem?

After some research, it appears that multi-dais is a special driver that
downstream uses to allow multiple sub-DAIs to be combined into one DAI
that has all the channels of the sub-DAIs. This does not seem like
something that should be done at that level to me, because it seems
like it's pushing a sound driver configuration into the realm of
hardware description.

In retrospect, I should have stripped this out before submitting it,
because I should not be submitting things I don't understand completely.
I apologise.

> > The particular configuration may even vary per-board; an I2S/TDM
> > controller may be connected to an external codec which does not
> > support capture, whereas on another board it may be connected to
> > one that does.
> 
> If the external device doesn't support both directions then why does the
> driver for the I2S controller in the CPU care?  The constraint handling
> code in the core will ensure that nothing tries to start something that
> isn't supported

I went over the downstream text binding description again and from that
it appears that the playback/capture-only capability is something
specific to the controller, not to any device connected to it.

The downstream device tree for the rk3568 specifies playback-only for
I2S0, a.k.a. the one connected to the HDMI that I can't test because
we currently don't have a video clock. Another downstream device tree,
specific to what appears to be a robot demo for the px30 SoC, uses this
property on i2s1, which tells me that this is not an actual description
of the controller hardware but just a description of the application.

While not relevant to the device tree schema, the driver reacts to these
properties by setting the opposite directions _minimum_ channel number
to 0 (from the default of 2.)

My conclusion from this is that this reeks of nonsense and I will look
into what happens when I simply remove these properties and lower the
channels_min to 0 in the driver. If it turns out that on some SoC for
some I2S/TDM controller instance there is a limitation where specifying
that the controller only handles either capture or playback does make
sense, we can always add it later.

Thank you for your comments,
Nicolas Frattaroli


