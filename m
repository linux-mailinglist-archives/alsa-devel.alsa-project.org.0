Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3ED73D467F
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Jul 2021 10:58:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F50E823;
	Sat, 24 Jul 2021 10:57:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F50E823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627117099;
	bh=Fcd46JsRF5Xzokx8EbEQAOvgZr4ne1Di199XOOqGdXI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LucJbg4fjAmSnbad2K/kSfeEZdE+Mu04oZ/4AWmAbj/8njXbsH3gbGOH/nH8mTnoi
	 UCR9Usdk3eZr416f49S91agW52H2w8e399r7Zown+uqVYAL57vkfvvKssOA+3wMSGG
	 HQKLOqOGfh9svBHesTEwd8MZ32UZgFFzkg3kDKtA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B685F80517;
	Sat, 24 Jul 2021 10:53:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CEABF804AC; Wed, 21 Jul 2021 15:50:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6EBEF80143
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 15:49:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6EBEF80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jzHBQR+p"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FA9A6121E
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 13:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626875394;
 bh=Fcd46JsRF5Xzokx8EbEQAOvgZr4ne1Di199XOOqGdXI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jzHBQR+pEnqiIJxip0t4FuSz8E+W1lPkyouh6dLkDteEdm9ge/sCwTaa7GpquIPWZ
 J0Fkf0St3azwEb4NqC1pcy67n6sQPgptQ5HE/METLHQLOfXbbnmzOuPzYNsv0lU8+7
 TyCvTtC0646d+bLfTR6u1o6bPiYS1Z2riWLrMbPYNNXpj8jP/Wvu2trqpzD9clo/ip
 uT3TXYeCxm05b9iBT9e1GzHcwWU/f10rofPBKE9MU/2UWgArI+cPZ9lltowkAlvWX6
 ULQc5UAy87TlU4S8BMc4h7MBQdBe8+/+pN9a2pW3DlINWdkCQNG9bSiShN2RJu7Lpq
 WQnaDhrZXhR8A==
Received: by mail-ed1-f52.google.com with SMTP id h2so2490385edt.3
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 06:49:54 -0700 (PDT)
X-Gm-Message-State: AOAM533Q3Gmpa4uj/naKogXgxqBIWRyiuETf70alA3IJOx4yGp5fFvHK
 l63SYx4CiuOAe3Az9Vd/B/0vvNrMciC8X5YZjw==
X-Google-Smtp-Source: ABdhPJzh5cj++jO5fwUbg47UmcOOhxrwvB/MBLzILA/PNS+iWEyxrXcgOCfI8OpXmusl3DEp7otnJa9jAjW0ixfrR7g=
X-Received: by 2002:a17:906:5fc1:: with SMTP id
 k1mr37644013ejv.360.1626875382783; 
 Wed, 21 Jul 2021 06:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210720172025.363238-1-robh@kernel.org>
 <8343dfe9d1af1ad4ab806104b74a95819c765dea.camel@pengutronix.de>
In-Reply-To: <8343dfe9d1af1ad4ab806104b74a95819c765dea.camel@pengutronix.de>
From: Rob Herring <robh@kernel.org>
Date: Wed, 21 Jul 2021 07:49:30 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+XEbEJuoSiQ=PeL-34FkLqG-eYA86FvNK7K-uGbaTFwg@mail.gmail.com>
Message-ID: <CAL_Jsq+XEbEJuoSiQ=PeL-34FkLqG-eYA86FvNK7K-uGbaTFwg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Remove "status" from schema examples
To: Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 24 Jul 2021 10:53:21 +0200
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Olivier Moysan <olivier.moysan@st.com>,
 Mateusz Holenko <mholenko@antmicro.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, ChiYuan Huang <cy_huang@richtek.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Karol Gugala <kgugala@antmicro.com>,
 "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dilip Kota <eswara.kota@linux.intel.com>, Wei Xu <xuwei5@hisilicon.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Ramesh Shanmugasundaram <rashanmu@gmail.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Mark Brown <broonie@kernel.org>,
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
 Robert Marko <robert.marko@sartura.hr>,
 Alessandro Zummo <a.zummo@towertech.it>, netdev <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>
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

On Wed, Jul 21, 2021 at 2:33 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> Hi Rob,
>
> On Tue, 2021-07-20 at 11:20 -0600, Rob Herring wrote:
> > There's no reason to have "status" properties in examples. "okay" is the
> > default, and "disabled" turns off some schema checks ('required'
> > specifically).
>
> Is this documented somewhere? If not, should it be? (Maybe in writing-
> schema.rst -> Schema Contents -> examples?)

I don't think it is. I'm writing a schema for it which works for both
those that read documentation and those that don't.

Rob
