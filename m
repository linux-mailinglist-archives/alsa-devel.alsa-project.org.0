Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 513816D488A
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 16:29:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7029F1FC;
	Mon,  3 Apr 2023 16:28:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7029F1FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680532177;
	bh=aej23k5z9qaNercgUUixFZ2HyL5qPQ4L5cFb7K9ar7k=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HAJPrs7caEchy4MOHA20/2WwDBc+d4gfQVojwtorsIZQw2SYlPWPlJFUlDpyhkMqF
	 aucgMBVJQKIWmDV/KW3wUzgdmt07H0tevllLkUicxFFKaKb8fjeq/qM+hdsfv9furj
	 P/q9JRYPQGIcjGL7uiHJdPdRLYUH0IQ00fx7gX0g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59334F80249;
	Mon,  3 Apr 2023 16:28:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDA28F8024C; Mon,  3 Apr 2023 16:28:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86437F801C0
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 16:28:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86437F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gWMnDw8a
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 54FEA61DCC;
	Mon,  3 Apr 2023 14:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91DAFC433D2;
	Mon,  3 Apr 2023 14:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680532109;
	bh=aej23k5z9qaNercgUUixFZ2HyL5qPQ4L5cFb7K9ar7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gWMnDw8aiv/KC7jH5LFqxCHubCEoBcWBgleD9SGZq4yMRe57l/tCXkWkVT6fDZNMY
	 TRmLbFicfUEaOAJE4r3DB/yo5+nYfTXxyV1ynR95C6UgLUv3qSagXcx3h2vLEgSzjW
	 3frNu2gNK0b1IuU9CNcsAOq/6nNtsRNaLBPWbAKNHODW2TcKtg4Rx2AfMEacXwXJDV
	 M16CYW7mw2ulxdhqblRJSsHMX/d5dPGAC9gA14Jrie6aWWNpjW/9x6LCZWjrgdpX7t
	 df5uN7W/iAIrYIESNsGvn18gTh6xebyhvnQcZeybjFU5YFE6VMEkATa3OAqQlynF2A
	 Qse9diBl2g0XQ==
Date: Mon, 3 Apr 2023 15:28:22 +0100
From: Lee Jones <lee@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v5 2/5] mfd: Add support for the Lantiq PEF2256 framer
Message-ID: <20230403142822.GA8371@google.com>
References: <20230328092645.634375-1-herve.codina@bootlin.com>
 <20230328092645.634375-3-herve.codina@bootlin.com>
 <20230330160510.GB489249@google.com>
 <20230331094208.41ab4420@bootlin.com>
 <6d39e9c3-fb6a-4b2a-9889-8fe8d86716d5@linaro.org>
 <20230331141104.42445da9@bootlin.com>
 <a642e653-e3e2-c3d2-68cb-1efc92be05bb@linaro.org>
 <20230331165904.4e7f46a1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230331165904.4e7f46a1@bootlin.com>
Message-ID-Hash: 4GMV4WKH4NIW3LYOLSLKSKU74VREO45L
X-Message-ID-Hash: 4GMV4WKH4NIW3LYOLSLKSKU74VREO45L
X-MailFrom: lee@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4GMV4WKH4NIW3LYOLSLKSKU74VREO45L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 31 Mar 2023, Herve Codina wrote:

> On Fri, 31 Mar 2023 15:44:19 +0200
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>
> > On 31/03/2023 14:11, Herve Codina wrote:
> > > Hi Krzysztof, Lee
> > >
> > > On Fri, 31 Mar 2023 11:13:30 +0200
> > > Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> > >
> > >> On 31/03/2023 09:42, Herve Codina wrote:
> > >>> Hi Lee,
> > >>>
> > >>> On Thu, 30 Mar 2023 17:05:10 +0100
> > >>> Lee Jones <lee@kernel.org> wrote:
> > >>>
> > >>>> On Tue, 28 Mar 2023, Herve Codina wrote:
> > >>>>
> > >>>>> The Lantiq PEF2256 is a framer and line interface component designed to
> > >>>>> fulfill all required interfacing between an analog E1/T1/J1 line and the
> > >>>>> digital PCM system highway/H.100 bus.
> > >>>>
> > >>>> My goodness!
> > >>>>
> > >>>> It's been a long time since I've seen anything quite like this.
> > >>>
> > >>> Yes, old things but working on recent kernel.
> > >>>
> > >>>>
> > >>>> My suggestion to you:
> > >>>>
> > >>>> * Split this up into components that fit functional subsystems
> > >>>
> > >>> It is done. The audio part is present in ASoC subsystem (path 5 in this
> > >>> series). pinctrl function is implemented in this driver and, as I don't
> > >>> want to share registers, I would prefer to keep this function inside this
> > >>> driver.
> > >>
> > >> The amount of defines and huge functions like pef2256_setup_e1()
> > >> contradict it.
> > >>
> > >> Even the pef2256_setup_e1() really does not follow Linux coding style -
> > >> you know the size requirement, right?
> > >
> > > I know that pef2256_setup_e1() is quite big and I will look at a way
> > > to split it in a consistent way.
> > >
> > >>
> > >> pef2256_get_groups_count, struct pinmux_ops and others - this is
> > >> pinctrl, not MFD! They cannot be in MFD driver.
> > >
> > > Maybe the issue is that MFD was not a good choice.
> > > The "function" provided are not independent of each other.
> > > The "main" driver (pef2256.c) needs to do the setup and handle the interrupt.
> >
> > Just like all PMICs...
> >
> > > The "function" provided are some glues in order to be used in some sub-systems
> > > such as audio. Indeed, ASoC needs a codec DAI to be connected to a CPU DAI.
> >
> > Just like in all other cases...
> >
> > > These "functions" need to be started (ie probe()) after the pef2256 setup was
> > > done. So a start (probe()) order relationship is needed.
> >
> > Just like in all other cases, so I really do not see here anything special.
> >
> > >
> > > If a MFD driver needs independent children to handle independent functions,
> > > the pef2256 does not fit well as a MFD driver.
> >
> > Why? So far everything is exactly the same.
> >
> > >
> > > I switched from misc to MFD just to handle child DT nodes instead of having
> > > phandles. Using child DT nodes instead of phandles is really a good thing and
> > > need to be kept.
> >
> > Your DT bindings and nodes are not related to driver design. It does not
> > matter for Devicetree if you put it to misc or MFD.
> >
> > It does not matter for driver whether you call it in Devicetree foo or bar.
> >
> > > The switch to MFD was probably not the best thing to do.
> >
> > Maybe, but your existing arguments are not really related...
> >
> > >
> > > What do you think if I switched back the pef2256 "main" driver (pef2256.c) to
> > > misc ?
> >
> > Why? What would it solve? You want to stuff pinctrl driver to misc, to
> > avoid Lee's review? No. Pinctrl goes to pinctrl. Not to misc. Not to MFD.
>
> Just to be clear on that point, I do not want to avoid any reviews and Lee's
> reviews are fully welcome.
>
> I just misunderstood. I thought the issue was that the pef2256 MFD driver has an
> internal setup() and that the 'function' provided were not independent (they share
> the pef2256 API).
> My first feeling was that it was expected a kind of 'empty' driver for the pef2256
> MFD driver. The pef2256 driver cannot be empty. That's why I talk about misc.

It can be empty.  That's what simple-mfd is for. :)

I suggest that none of this (besides the child registration, which is
achieved by a simple OF API call in this case) has anything to do with
MFD.  We are not requesting and initialising shared resources and we are
not using the MFD API to register children.  The pin control
functionality clearly needs moving to Pinctrl and the rest, if you
cannot find a suitable home for it *may be* suitable for Misc.

--
Lee Jones [李琼斯]
