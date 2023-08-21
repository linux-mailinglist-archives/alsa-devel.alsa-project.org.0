Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F6B782466
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 09:23:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93757827;
	Mon, 21 Aug 2023 09:22:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93757827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692602594;
	bh=Yx9Vb7koBMTLBTCpWlEn/DsLgSuwiqD6i9hVpUR50EA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X3/mMIvH337y0SKwI/rB4WhGeHZe4nTfjp8BzNmCYTFoKRwMFuRIRSfIz+IJyOJey
	 QrvtqfoLkK9G7v2cTLLPaCrUIVacs1nkvGQOVYfYosN6Yc+i2BdANPQI1+wDTxpB4d
	 cNH7AVrESC9e7kgNVVO7AqRN+R7EWpZS2oZVYNfM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 069F6F80508; Mon, 21 Aug 2023 09:22:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE1E4F8016C;
	Mon, 21 Aug 2023 09:22:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A71B9F80199; Mon, 21 Aug 2023 09:22:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92AE5F800F8
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 09:22:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92AE5F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=u5QT6x/F
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-d62bdd1a97dso3011474276.3
        for <alsa-devel@alsa-project.org>;
 Mon, 21 Aug 2023 00:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692602526; x=1693207326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgI1MYhv8309+bCWxdxoJqdqvZCrtsQ/VE9m30u9HF4=;
        b=u5QT6x/FxMVr+1aoFCgsJDj0QEzfuHcrI2+VtQeO3v/dDMfnEXre6eKjslbAPuUGTR
         aDUsBu03dfbFVS8OhYUJcmZRNRxDOJQK6WxjkipX7+Fd0mFDQ5MV5BjVeGuHVtrGJNbJ
         ABD+WhvSqFyI0oNdtM/dDZBfYoqbEG8UatfAl8s4MibiV1a0vVRj7TTPWy3g6zF6Zlnv
         Hnx7JSh5IjFD1Zj9/8hUuYRLDQAMHhlxn4UXcU4/t3qc+6D+q93GHHvFJ7feucAIuzzw
         Ytn4kIvomeBgbEXGMAFSY06730ouBsxWljY/tT5fZycl1G5UNmE9iI7QTtvC2zGFK9Jf
         7sSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692602526; x=1693207326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZgI1MYhv8309+bCWxdxoJqdqvZCrtsQ/VE9m30u9HF4=;
        b=Zp6qKt3dpTAp96dnn/wykNW90b9LAyXcvwcy4f9IBN43Tk55+AlaKBzbFJU4GD31vz
         3uDXtDIqIJQq0VEgI3yFfLuf+sT/s9+PnBKJ1JBjwQXJYWzShOSBHbOhVIkbaEXBIJVx
         3ZGrXnDal0wQwm3OaQMI7zh0pkxUSTia3qiFT3NHHoV/1yc1ADAkP5jbQksrthhL1Ct2
         +hSQW97df8kDOjQATOE6GroiWidsQ6SWxH6xFBf7MZQ8tBdBuWQc2eiSgckwIUOqpRif
         2B6OKdk+O0UGksQm1XNAxwom/yaEZf7EB52f+PFFKWOGhb0YdHm+e4dNHU+BflG3Kxcw
         88QA==
X-Gm-Message-State: AOJu0YxlEr1endPq+uv8/Bu3FrFWzQlbK+8ElNJzJUCugKajoYL5T8Oz
	gQt8VQV1ULLZsLojEIifcbVC39QjlRz9EFJtIqXDmA==
X-Google-Smtp-Source: 
 AGHT+IF/JTlr0dFi7ImP5aRW58ulW03tzkcnFFuhr9AUEC0SHkebzyrNv7zePScJNAsfPiEBnyQ9/wv9Y8G7TlIDK6A=
X-Received: by 2002:a25:abeb:0:b0:d5b:1dd9:8e3f with SMTP id
 v98-20020a25abeb000000b00d5b1dd98e3fmr6148796ybi.41.1692602526568; Mon, 21
 Aug 2023 00:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1692376360.git.christophe.leroy@csgroup.eu>
 <5f671caf19be0a9bb7ea7b96a6c86381e243ca4c.1692376361.git.christophe.leroy@csgroup.eu>
 <CACRpkdamyFvzqrQ1=k04CbfEJn1azOF+yP5Ls2Qa3Ux6WGq7_A@mail.gmail.com>
 <fc5f1daa-58a1-fb86-65ba-c6b236051d45@csgroup.eu>
In-Reply-To: <fc5f1daa-58a1-fb86-65ba-c6b236051d45@csgroup.eu>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 21 Aug 2023 09:21:54 +0200
Message-ID: 
 <CACRpkdaiW1QgQAjaC3hTsTjwvuWw9OUwXGsH2t3X8k+ueuBN4A@mail.gmail.com>
Subject: Re: [PATCH v4 21/28] net: wan: Add framer framework support
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Herve Codina <herve.codina@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: SMI72U34W72XYCQUMDIDVR6BYT6ITQIK
X-Message-ID-Hash: SMI72U34W72XYCQUMDIDVR6BYT6ITQIK
X-MailFrom: linus.walleij@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SMI72U34W72XYCQUMDIDVR6BYT6ITQIK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 21, 2023 at 7:19=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 20/08/2023 =C3=A0 23:06, Linus Walleij a =C3=A9crit :
> > On Fri, Aug 18, 2023 at 6:41=E2=80=AFPM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >
> >> From: Herve Codina <herve.codina@bootlin.com>
> >>
> >> A framer is a component in charge of an E1/T1 line interface.
> >> Connected usually to a TDM bus, it converts TDM frames to/from E1/T1
> >> frames. It also provides information related to the E1/T1 line.
> >>
> >> The framer framework provides a set of APIs for the framer drivers
> >> (framer provider) to create/destroy a framer and APIs for the framer
> >> users (framer consumer) to obtain a reference to the framer, and
> >> use the framer.
> >>
> >> This basic implementation provides a framer abstraction for:
> >>   - power on/off the framer
> >>   - get the framer status (line state)
> >>   - be notified on framer status changes
> >>   - get/set the framer configuration
> >>
> >> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> >> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> >> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> >
> > I had these review comments, you must have missed them?
> > https://lore.kernel.org/netdev/CACRpkdZQ9_f6+9CseV1L_wGphHujFPAYXMjJfjU=
rzSZRakOBzg@mail.gmail.com/
> >
>
> As I said in the cover letter, this series only fixes critical build
> failures that happened when CONFIG_MODULES is set. The purpose was to
> allow robots to perform their job up to the end. Other feedback and
> comments will be taken into account by Herv=C3=A9 when he is back from ho=
lidays.

Ah I see. I completely missed this.

Yours,
Linus Walleij
