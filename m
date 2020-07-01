Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF530211612
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 00:32:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D45E168D;
	Thu,  2 Jul 2020 00:31:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D45E168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593642720;
	bh=CQoLjCvVWSNdm1wSu07odj4x0bP83pMXj6gR1QhYTA0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oAZUQDeSF8/Jnt0QgxgtTbHT1z6ri862UedIpPwz24fsBKr7i8ev4iW6E+JySsB3g
	 nmqtHCDJajfeG3lLPF9G5tDK9Xf6owFbdHqDWzZLoxHKdEXa1kUMLfujXyANsx5Qux
	 bdAuvuF/nQyDS3gjGx7/RKU+9ZfWJxys4dLqON2s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FE4EF80256;
	Thu,  2 Jul 2020 00:28:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C894F80256; Thu,  2 Jul 2020 00:28:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 576E7F801D8
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 00:28:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 576E7F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rr6NyPFK"
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF16A20853
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 22:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593642508;
 bh=CQoLjCvVWSNdm1wSu07odj4x0bP83pMXj6gR1QhYTA0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rr6NyPFKuysi3BqpwA30/kvPI6XNFatjwE8VHD20QlyPn/NHa7Qy7MssJB4RLFzU4
 or4iJTeNx6oobg6pS9A3iZFYtp4Fu6HsN+mHhd83JaKofy2V4jHV1enj2e+FWJVxvv
 sNFgCtA+mEOg0IehUtdcGlM3NFL/5B2Bqt4ZrjFU=
Received: by mail-ot1-f48.google.com with SMTP id h1so481384otq.12
 for <alsa-devel@alsa-project.org>; Wed, 01 Jul 2020 15:28:28 -0700 (PDT)
X-Gm-Message-State: AOAM533wEARnuch9XKUKOLuWMDGTrJwiFBkGz9m+cxNczAjAlWmbIy//
 XAzfN8GNnxoBSDIhcICxdp+Aa4F4yqXDHheRDA==
X-Google-Smtp-Source: ABdhPJzNc0YwqiAvVov7e4Lfkj5nA8eHsEAJmp5uOMLSsbhI8wcaqnnf2Dc6U3W9pLQJ2XIUTNtfDgEH5XByiXRy1hw=
X-Received: by 2002:a05:6830:3104:: with SMTP id
 b4mr24830173ots.192.1593642508080; 
 Wed, 01 Jul 2020 15:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200630223020.25546-1-festevam@gmail.com>
 <159364215574.10630.10014931369710772889.b4-ty@kernel.org>
In-Reply-To: <159364215574.10630.10014931369710772889.b4-ty@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 1 Jul 2020 16:28:16 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLzae5qUJXF-otsUQqy+zyk9fD_AKd8b8F+PFWZBH1QDw@mail.gmail.com>
Message-ID: <CAL_JsqLzae5qUJXF-otsUQqy+zyk9fD_AKd8b8F+PFWZBH1QDw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: simple-card: Fix 'make
 dt_binding_check' warnings
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Fabio Estevam <festevam@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On Wed, Jul 1, 2020 at 4:22 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, 30 Jun 2020 19:30:20 -0300, Fabio Estevam wrote:
> > The following build warnings are seen with 'make dt_binding_check':
> >
> > Documentation/devicetree/bindings/sound/simple-card.example.dts:209.46-211.15: Warning (unit_address_vs_reg): /example-4/sound/simple-audio-card,cpu@0: node has a unit name, but no reg or ranges property
> > Documentation/devicetree/bindings/sound/simple-card.example.dts:213.37-215.15: Warning (unit_address_vs_reg): /example-4/sound/simple-audio-card,cpu@1: node has a unit name, but no reg or ranges property
> > Documentation/devicetree/bindings/sound/simple-card.example.dts:250.42-261.15: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
> > Documentation/devicetree/bindings/sound/simple-card.example.dts:263.42-288.15: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1: node has a unit name, but no reg or ranges property
> > Documentation/devicetree/bindings/sound/simple-card.example.dts:270.32-272.19: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1/cpu@0: node has a unit name, but no reg or ranges property
> > Documentation/devicetree/bindings/sound/simple-card.example.dts:273.23-275.19: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1/cpu@1: node has a unit name, but no reg or ranges property
> > Documentation/devicetree/bindings/sound/simple-card.example.dts:276.23-278.19: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1/cpu@2: node has a unit name, but no reg or ranges property
> > Documentation/devicetree/bindings/sound/simple-card.example.dts:279.23-281.19: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1/cpu@3: node has a unit name, but no reg or ranges property
> > Documentation/devicetree/bindings/sound/simple-card.example.dts:290.42-303.15: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@2: node has a unit name, but no reg or ranges property
> >
> > [...]
>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Can you apply this for v5.8 or drop and I can apply with all the other
warning fixes I have queued. This is the last one.

Rob
