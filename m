Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AFB8C1C83
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2024 04:39:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6C9EE8E;
	Fri, 10 May 2024 04:39:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6C9EE8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715308762;
	bh=jddQeaqQrXTs71+YmSJw9dqzVBsK8JP9xHEAhWEFVmQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fV4x42ZnmwvlXKR6Bv/XgmhwvIScpyFpnan8lr73hvZqo8wPMPGIdJMp2q8WjZPx+
	 44gQDTw8AKmmlVuExwrHHxYsnB3GrI8ByC4aBL+xge+ZpxKpRDWf3uZmDEq7Jy/b2b
	 zOAJaVHAqy8zIoOoVsrMULOlvF2eY3NcAXadSu84=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8126F80587; Fri, 10 May 2024 04:38:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B649F8058C;
	Fri, 10 May 2024 04:38:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C2AAF8049C; Fri, 10 May 2024 04:38:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C65EF8024C
	for <alsa-devel@alsa-project.org>; Fri, 10 May 2024 04:38:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C65EF8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cb5xYY0P
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-36c82ca80adso7131825ab.3
        for <alsa-devel@alsa-project.org>;
 Thu, 09 May 2024 19:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715308721; x=1715913521;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+FQEvC344Cq4qFk7Z5iGhz/jJmHyyWFQPf8LCbmeGM=;
        b=cb5xYY0PqJslOnbNYSHzhNrcGg/WZjjUO30XDxRosS2hMuIBCAELN05UvX8JkTgFfb
         TJ7/3huer3pbdImc7YPmn4Ww1bModk4UBZCDG7S162zniasbtuWMlqrkwk8rmRAYPeNI
         uWfJ9taQQOOXQLwWfmQYnR4wMkgWmqHzlzteCvO+LmSGjXcNJ71W18WkuemUz6AcF7aX
         jX7G6WfAgmzjtZ7AGliWqICLJweEaO8TwUqR80al+F9POtyPge1SiaouT/4ijzqk2TTK
         9KV6gfvORioEREdUt0ibaChwbwyDbLf5yv7puymS4LQGftMW6f2YNNea+wB8eUVlqh1V
         gv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715308721; x=1715913521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+FQEvC344Cq4qFk7Z5iGhz/jJmHyyWFQPf8LCbmeGM=;
        b=hXi7K6GyCu0GATCDqEoYn9hogZYMEx6wi/U+TZPsgs2m8vgw72tKmKGTJ/SXujHYwV
         W/ud0Q4sMucRhDtNce6ylPylANg+rhZkA4iNEz0sYb1gENcwyWxt6zNUACGA7qtyb516
         lVj+Y+iPggMllEIUasGunPs7WaU8Di3VsFM1W0qOl8UNwm4KLgSHc3dtCQP2LbfNGlPj
         S7ubQjBGxElxa204lJn4bgBA8rmxZiJToycei74WnGgMujyVUFVvcNjuBPd9HzWhxZay
         shiJC/lKk9UoAnDXKrgLej3n9Pb9y543yXQpw8KA+YP9euEj/5854Fi2uWpqDAuu0fdm
         +p8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMcUcaB2tvG09yvDzH42iWeiqauQyO8qeLn9zjFPuUzFQ3CypdxLtPK2h2ub6b0qk4bhJb2m92Sey/GPhkJNuf15fN6I3F++24lOU=
X-Gm-Message-State: AOJu0YyM1oOEl3U9GwNhwOW9hpldHqeWAglp+zinSnPvFqk1aOaBoFlt
	pC/0UGOZ9xI8DE/XUfqaKamNRl9umyVTPjiwvRpKCy83o1Y6GDvefIDmyJ7Vtrncl3wwSJMFYZK
	roJrllAzZEQfYDaYx4UpFCa6RwSc=
X-Google-Smtp-Source: 
 AGHT+IFA5hOZHgUdtXLvvH+1m+oDwQZM9Yg+0AcRzMwCh6Ow6b69t1K2O1QS7dF85eTT8GVCCff9RckTga5FTH0HhIE=
X-Received: by 2002:a05:6e02:12ce:b0:36a:2a57:9393 with SMTP id
 e9e14a558f8ab-36cc144b65dmr16566235ab.3.1715308721696; Thu, 09 May 2024
 19:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <1715223460-32662-1-git-send-email-shengjiu.wang@nxp.com>
 <1715223460-32662-3-git-send-email-shengjiu.wang@nxp.com>
 <20240509-repurpose-dumping-156b57c25960@spud>
 <CAA+D8AOkDbj_QsF9VescuAfFjKcB8FnOXqwjXVrrBM1Ck4ut4Q@mail.gmail.com>
In-Reply-To: 
 <CAA+D8AOkDbj_QsF9VescuAfFjKcB8FnOXqwjXVrrBM1Ck4ut4Q@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 10 May 2024 10:38:30 +0800
Message-ID: 
 <CAA+D8AOQtwHTLsQcqh_LCvVP5CWXqiHc3-at8jv3B-kA8ORR_w@mail.gmail.com>
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: fsl,xcvr: Add two PLL clock
 sources
To: Conor Dooley <conor@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
 broonie@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: PNBTY6GPGUU4RNVFNPTHMRHFEIYEO5EH
X-Message-ID-Hash: PNBTY6GPGUU4RNVFNPTHMRHFEIYEO5EH
X-MailFrom: shengjiu.wang@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PNBTY6GPGUU4RNVFNPTHMRHFEIYEO5EH/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, May 10, 2024 at 10:27=E2=80=AFAM Shengjiu Wang <shengjiu.wang@gmail=
.com> wrote:
>
> On Fri, May 10, 2024 at 1:14=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Thu, May 09, 2024 at 10:57:38AM +0800, Shengjiu Wang wrote:
> > > Add two PLL clock sources, they are the parent clocks of the root clo=
ck
> > > one is for 8kHz series rates, named as 'pll8k', another one is for
> > > 11kHz series rates, named as 'pll11k'. They are optional clocks,
> > > if there are such clocks, then the driver can switch between them to
> > > support more accurate sample rates.
> > >
> > > As 'pll8k' and 'pll11k' are optional, then add 'minItems: 4' for
> > > clocks and clock-names properties.
> >
> > Despite the detail given here in the commit message, the series this is
> > appearing in and one of the driver patches makes me a bit "suspicious"
> > of this patch. Are these newly added clocks available on all devices, o=
r
> > just on the imx95, or?
>
> These newly added clocks are only available for the imx95 XCVR.
>

Looks like I should merge patch1 & 2 together, patch 3 & 3 together. right?

Best regards
Shengjiu Wang

> Best regards
> Shengjiu Wang
> >
> > Thanks,
> > Conor.
> >
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  Documentation/devicetree/bindings/sound/fsl,xcvr.yaml | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/=
Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > > index 1c74a32def09..c4660faed404 100644
> > > --- a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > > +++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > > @@ -50,6 +50,9 @@ properties:
> > >        - description: PHY clock
> > >        - description: SPBA clock
> > >        - description: PLL clock
> > > +      - description: PLL clock source for 8kHz series
> > > +      - description: PLL clock source for 11kHz series
> > > +    minItems: 4
> > >
> > >    clock-names:
> > >      items:
> > > @@ -57,6 +60,9 @@ properties:
> > >        - const: phy
> > >        - const: spba
> > >        - const: pll_ipg
> > > +      - const: pll8k
> > > +      - const: pll11k
> > > +    minItems: 4
> > >
> > >    dmas:
> > >      items:
> > > --
> > > 2.34.1
> > >
