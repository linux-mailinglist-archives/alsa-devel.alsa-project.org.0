Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DA18C1C67
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2024 04:28:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D88DE9A;
	Fri, 10 May 2024 04:28:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D88DE9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715308097;
	bh=bvd3blX+RJMgsJ0g7k7yJaqxHwFVzRJsAHzoNG3fBQw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G8bbxW1lDzkAeVv83wVN+ZIJPpsf3ztnFBaONVjRtdQH7GRrgvWIr5zxc8cReizYU
	 cyRvHN3xDsL3qgTlrpCSampwQFAOqlZdSylmVRhRgXrNU082bXrC/D7gZGefN7t+lC
	 MwJKivupf8+sZuefGh4Vl5ry6i/apvKdJ6xehsdQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F478F805A8; Fri, 10 May 2024 04:27:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3251F805A9;
	Fri, 10 May 2024 04:27:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8354FF8049C; Fri, 10 May 2024 04:27:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19F34F8024C
	for <alsa-devel@alsa-project.org>; Fri, 10 May 2024 04:27:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19F34F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ahzOp5C0
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-36c7bd2586eso6660115ab.0
        for <alsa-devel@alsa-project.org>;
 Thu, 09 May 2024 19:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715308046; x=1715912846;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJIg9+M0Tl5oWYiRO4lX+sJC4I6tROA3nCXlHyRlexU=;
        b=ahzOp5C0w3Z1FTJzUyC1zxUKCki0KtPPGt1TeZwcs1TM9Z0DVpneIB6ucIgFdMSbjB
         dIZezjU7m//1K26xR78nBCj8qq1mJVK/ab8dIpKSHF9oH0nIT8WsYCIe2Zkr58IgWh5j
         1Xf6DD5nU+nuVSZXjUUJuQzmdwNGAGmG9xPycZGmHhrUr/sqLIxAFf/Nk6RXtlIRgtpg
         cK4oSPqA3qwS6nr766NxkBINaI6Q5e0Q6k3kidVrZsCrZ8Gh6QdKT1ScNhCQSrQauiCE
         R/cYT0EMu70XLpjUSEt3KSIHmSPc0K42D2R5jPaesUOL/A5WiW2pmwXwuuG5Z1cHv8ho
         lhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715308046; x=1715912846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJIg9+M0Tl5oWYiRO4lX+sJC4I6tROA3nCXlHyRlexU=;
        b=eHG6dPwDmNzY2tl2cDC4NW76wL6fXfjb4lUG6+gZbhhWVVfjpCCaNSVxkhJS5eW2Cf
         90IENm8Uo9w3pPSOqeLKWqy5jTkl8E9+MBFRMylc4KA8C/LIPucDiu+weEdNlsmmi3Nh
         iUKTzXCfNKZAb7Mh8kZmaEw4Lrl1c5mi+mHrshoU5w9WaNLVDHBUm5hDLE4uXnGbP41v
         KgiGVEXZ5alSEvEC/xgoUXBS5RGRVNsEuMcJNO9qjviiPTS18zPy8crDXaS6yVX5eF8W
         GLk0KDtTD03HMs7C4rfzD1lz/Gf5LZJYODYKKcWMSOChDQFUxDQaHui+66heLgbn0CkK
         PvTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVZBCp1k/VoMO2ZmfgQH009eDh4NWReHhFbbaJM5gJMJY9EdBopU/e2CcB7oUA8AzlVPvuOCpmqvwKLC31DGDzXwm0dFty6FmOCHs=
X-Gm-Message-State: AOJu0YzrhsA46Hv+ZM9XtXB2waTRydUSthQo9srrMzO5zdTXVAFQnYTb
	BSV8V6LCza52gOFHgvQis84ZkIR4n6zeSx/b4IavQHrFgDQf4Ve3sGFFXPqcaqoyh6+80ZruzqA
	a3QLVemV9lfAKmf04LH8jkeaauXE=
X-Google-Smtp-Source: 
 AGHT+IHBDYC2n71XP7WOuLCEc5J/fR/L9KPq4RQs/MbDRpyTSl0Iy+I8EcqM5V65ejYgeqpob2OgmskIn0fzTVIGW24=
X-Received: by 2002:a05:6e02:1387:b0:36a:3f20:8cb with SMTP id
 e9e14a558f8ab-36cc14ae0dbmr18245525ab.18.1715308046371; Thu, 09 May 2024
 19:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <1715223460-32662-1-git-send-email-shengjiu.wang@nxp.com>
 <1715223460-32662-3-git-send-email-shengjiu.wang@nxp.com>
 <20240509-repurpose-dumping-156b57c25960@spud>
In-Reply-To: <20240509-repurpose-dumping-156b57c25960@spud>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 10 May 2024 10:27:15 +0800
Message-ID: 
 <CAA+D8AOkDbj_QsF9VescuAfFjKcB8FnOXqwjXVrrBM1Ck4ut4Q@mail.gmail.com>
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
Message-ID-Hash: SGMQDF6EJ5SX5AFP4LORUMANFD3U3TUF
X-Message-ID-Hash: SGMQDF6EJ5SX5AFP4LORUMANFD3U3TUF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SGMQDF6EJ5SX5AFP4LORUMANFD3U3TUF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, May 10, 2024 at 1:14=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Thu, May 09, 2024 at 10:57:38AM +0800, Shengjiu Wang wrote:
> > Add two PLL clock sources, they are the parent clocks of the root clock
> > one is for 8kHz series rates, named as 'pll8k', another one is for
> > 11kHz series rates, named as 'pll11k'. They are optional clocks,
> > if there are such clocks, then the driver can switch between them to
> > support more accurate sample rates.
> >
> > As 'pll8k' and 'pll11k' are optional, then add 'minItems: 4' for
> > clocks and clock-names properties.
>
> Despite the detail given here in the commit message, the series this is
> appearing in and one of the driver patches makes me a bit "suspicious"
> of this patch. Are these newly added clocks available on all devices, or
> just on the imx95, or?

These newly added clocks are only available for the imx95 XCVR.

Best regards
Shengjiu Wang
>
> Thanks,
> Conor.
>
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/sound/fsl,xcvr.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Do=
cumentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > index 1c74a32def09..c4660faed404 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > +++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > @@ -50,6 +50,9 @@ properties:
> >        - description: PHY clock
> >        - description: SPBA clock
> >        - description: PLL clock
> > +      - description: PLL clock source for 8kHz series
> > +      - description: PLL clock source for 11kHz series
> > +    minItems: 4
> >
> >    clock-names:
> >      items:
> > @@ -57,6 +60,9 @@ properties:
> >        - const: phy
> >        - const: spba
> >        - const: pll_ipg
> > +      - const: pll8k
> > +      - const: pll11k
> > +    minItems: 4
> >
> >    dmas:
> >      items:
> > --
> > 2.34.1
> >
