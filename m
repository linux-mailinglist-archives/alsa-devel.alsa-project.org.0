Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 929F942FD81
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 23:35:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B1BF1897;
	Fri, 15 Oct 2021 23:34:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B1BF1897
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634333700;
	bh=sfslgEVh6E6+qlaFeS7mLmrwgNe66NsHcDGVl4BYKoA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r8yGuPVUCTlmwl4BgUbec7TSCyYzJjW9wTEy+0B95bIskwOMQKHGZO8Y4+kfSX7GD
	 bEcqU/liMEt8x9zA9+03JSkwJQ60brWaFwcCkAsRvARdPaz61YjCJrl0H66HA6YyWn
	 Xi5u3VdenZHkvP0So3+zxoyhgoA/oITDh/AKbW7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DA22F80167;
	Fri, 15 Oct 2021 23:33:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7F43F80269; Fri, 15 Oct 2021 23:33:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2EE9F80167
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 23:33:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2EE9F80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qis8HY5a"
Received: by mail-lf1-x129.google.com with SMTP id y26so47200959lfa.11
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 14:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gix2t0OaFc3liLwqh7FD+UgpYjMWRC2yF5wlNLCRBI8=;
 b=qis8HY5aJowC4EqJFx3MOPhEGhcXjXhZTpVf0O0ZaJ8dAFgGw91o/hVODkU7FRxcw6
 AZU8vc1BfB4zTjM1P62wns5tOI3qN2C+s4pQ1Wsy7bv7gKL7jKc2hWKLs86XVr4W4TUT
 h5GijvI+PE96P1JI/y2GSZq49aFy6a6+/4SPzO/ECa11w6Y/Kv6VmU9qceSy5gDjzk8o
 pnepTbIkXzhYSl8fZ83W2Z3QQXtAUBpmlgoDMhpCXuKK0p9NHv69rY9hNa2BbT6Eg8it
 MsEqAMGICMa6VJqyKAXdLuPQ4xTTE1dI1LqDGKMGRp/pg/8J7tVBDb3taihP7FUws+6E
 ilHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gix2t0OaFc3liLwqh7FD+UgpYjMWRC2yF5wlNLCRBI8=;
 b=LRJfpw53WisNA6yllcgKknh+hbLIj0Z3sdmpasQc9JzwRmBCGMolTXT9STQ9qdEUfp
 4Z1P/dPoRzpBAISvLgI/aBe8cI3xGdGs4+EQXEBTWCUTJUY3qW0SGQSBBRgjmW1aQ45T
 fVmw5e5q2bkQdMOrymylisT5ZRhHPllJhTmbHWfp//hs3g/zwMQY4cu9V1rZb1scPz91
 eB9vUyqoe8WpH5CZrXruFRc4YsdOThRyQet1I2i597C+Ph0PK5dhsQv9kyL78WaYaojx
 KNU+Iivvph4gMrdD7fvfFRp0ZpVcieLYwkad+yxzrgb2f7oyZLwv9Tbh+XHz3Dl9wA5T
 c4kA==
X-Gm-Message-State: AOAM533sgNUZcZLzl3edyBouw5Habg0slUmNwwh5MQkgMPrakDDzNXKF
 5SfbJw29rj//3leRb5cBGOZAn8mpTIw=
X-Google-Smtp-Source: ABdhPJyGE7Et43k/hdPxjdpBoYE8kfL5iTjenGOdjS4PvWxGzZHpGXrxlrYYk3a+u1/JkqbbVxvBCQ==
X-Received: by 2002:a05:6512:3b94:: with SMTP id
 g20mr13375031lfv.77.1634333616241; 
 Fri, 15 Oct 2021 14:33:36 -0700 (PDT)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84])
 by smtp.gmail.com with ESMTPSA id f23sm689425ljn.110.2021.10.15.14.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 14:33:35 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] ASoC: dt-bindings: rockchip: i2s-tdm: fix rockchip,
 cru requirement
Date: Fri, 15 Oct 2021 23:33:34 +0200
Message-ID: <2236749.301RoY5kYM@archbook>
In-Reply-To: <8553b0cd-95e4-c3db-c75a-d3b28e99f131@arm.com>
References: <20211015143115.1445707-1-frattaroli.nicolas@gmail.com>
 <8553b0cd-95e4-c3db-c75a-d3b28e99f131@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

On Freitag, 15. Oktober 2021 19:44:56 CEST Robin Murphy wrote:
> On 2021-10-15 15:31, Nicolas Frattaroli wrote:
> > The behaviour described in the bindings is exactly the opposite
> > of what it should be, so this patch fixes the description and
> > adjusts the if conditions for adding rockchip,cru to required.
> > 
> > Fixes: 510f1c133aed ("ASoC: dt-bindings: rockchip: add i2s-tdm bindings")
> > Signed-off-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
> > ---
> > 
> >   .../devicetree/bindings/sound/rockchip,i2s-tdm.yaml   | 11 ++++++++---
> >   1 file changed, 8 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
> > b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml index
> > ce3e18b50230..93f5221e9381 100644
> > --- a/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
> > +++ b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
> > 
> > @@ -86,7 +86,7 @@ properties:
> >       $ref: /schemas/types.yaml#/definitions/phandle
> >       
> >       description:
> >         The phandle of the cru.
> > 
> > -      Required if neither trcm-sync-tx-only nor trcm-sync-rx-only are
> > specified. +      Required if either trcm-sync-tx-only or
> > trcm-sync-rx-only are specified.> 
> >     rockchip,grf:
> >       $ref: /schemas/types.yaml#/definitions/phandle
> > 
> > @@ -147,8 +147,13 @@ required:
> >   allOf:
> >     - if:
> >         properties:
> > -        rockchip,trcm-sync-tx-only: false
> > -        rockchip,trcm-sync-rx-only: false
> > +        rockchip,trcm-sync-tx-only: true
> > +    then:
> > +      required:
> > +        - rockchip,cru
> > +  - if:
> > +      properties:
> > +        rockchip,trcm-sync-rx-only: true
> 
> FWIW, isn't this just a long-winded way to say
> 
>    if:
>      anyOf:
>        - properties:
>            rockchip,trcm-sync-tx-only: true
>        - properties:
>            rockchip,trcm-sync-rx-only: true
> 
> which itself could still be more concisely
> 
>    if:
>      not:
>        properties:
>          rockchip,trcm-sync-tx-only: false
>          rockchip,trcm-sync-rx-only: false
> 
> ?

Hi Robin,

you are absolutely correct. I'm not very familiar with dtschema yet,
so I mostly just did what I know would work, as I didn't know about
"not" or "anyOf" in this context.

However I don't think this patch is going to get a V2 because I may
have found a way to easily get rid of the CRU property altogether,
making this patch sort of obsolete in the very near future.

Thank you for your review nonetheless, I learned some more dtschema
today thanks to it. :)

> 
> Robin.
> 
> >       then:
> >         required:
> >           - rockchip,cru

Regards,
Nicolas Frattaroli



