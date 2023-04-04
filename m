Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8082A6D5994
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 09:26:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAC7D1FC;
	Tue,  4 Apr 2023 09:25:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAC7D1FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680593202;
	bh=vWqkYF4O0y857VgTKv0I10r/jM9gGbQQP3/KszuY9C8=;
	h=Date:To:Subject:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=cbxndE7+7Kpq6EK9vSU5NSgvG7zUVwgvWzmaROQJ44isKYp/WMCGn3ewGbz8vqOgI
	 7A/ZhenYrpzKpU0ftubgHH8dPv9McluKv8EdOZqumdg5F25JbopZ7snMNxdi+thWVO
	 3G6Le5KWLAZRCu6DkpqVbfvZ0AQNz10e/rd83DCU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25709F801C0;
	Tue,  4 Apr 2023 09:25:50 +0200 (CEST)
Date: Tue, 4 Apr 2023 09:20:36 +0200
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v5 2/5] mfd: Add support for the Lantiq PEF2256 framer
In-Reply-To: <20230403142822.GA8371@google.com>
References: <20230328092645.634375-1-herve.codina@bootlin.com>
 <20230328092645.634375-3-herve.codina@bootlin.com>
 <20230330160510.GB489249@google.com>
 <20230331094208.41ab4420@bootlin.com>
 <6d39e9c3-fb6a-4b2a-9889-8fe8d86716d5@linaro.org>
 <20230331141104.42445da9@bootlin.com>
 <a642e653-e3e2-c3d2-68cb-1efc92be05bb@linaro.org>
 <20230331165904.4e7f46a1@bootlin.com>
 <20230403142822.GA8371@google.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5A6WPHRTKQPDMOW4F2MKV2O7DKBU4ZMC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168059309283.26.4986552199879242637@mailman-core.alsa-project.org>
From: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 099DBF8024C; Tue,  4 Apr 2023 09:20:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2695FF80054
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 09:20:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2695FF80054
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bF9LMVcG
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0215D100007;
	Tue,  4 Apr 2023 07:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680592840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MgIsW0qR4mlwDF7VB/khNuIeqTpteSt5vwKWK7TYUOU=;
	b=bF9LMVcG9wCH3QhnqTPy2T2/rtdeIPWu9hRTAd8iH64pr68Mcjou6acFp2okVBLgm6+jqZ
	ScOfcqNk/PmF4m2PSAjrfA8ZMy2dkprUCLRGAyVpII++WRlaq8ev+jjhNRmVykHrjG+TlP
	JIj/pZx0n3AC2oSbc1VEdjQY4udYfLL/fiLYXukffjll96KQ4xYZ5VljGiaFiAkMedlH+m
	aVrm8oAdljZFZ5rPKL2wZJ+fj8kp17Vr/6E8DsMCUr3eLYg57f+iayCHu2YNmPBwVcOQaI
	84Pj29TUa93jWk/iM0UQN7nlnOsy3xUiHY8DHuIogXLuCZd9ZUh+CqRFK3jipw==
Date: Tue, 4 Apr 2023 09:20:36 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v5 2/5] mfd: Add support for the Lantiq PEF2256 framer
Message-ID: <20230404092036.2d1cd5d9@bootlin.com>
In-Reply-To: <20230403142822.GA8371@google.com>
References: <20230328092645.634375-1-herve.codina@bootlin.com>
 <20230328092645.634375-3-herve.codina@bootlin.com>
 <20230330160510.GB489249@google.com>
 <20230331094208.41ab4420@bootlin.com>
 <6d39e9c3-fb6a-4b2a-9889-8fe8d86716d5@linaro.org>
 <20230331141104.42445da9@bootlin.com>
 <a642e653-e3e2-c3d2-68cb-1efc92be05bb@linaro.org>
 <20230331165904.4e7f46a1@bootlin.com>
 <20230403142822.GA8371@google.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5A6WPHRTKQPDMOW4F2MKV2O7DKBU4ZMC
X-Message-ID-Hash: 5A6WPHRTKQPDMOW4F2MKV2O7DKBU4ZMC
X-MailFrom: herve.codina@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5A6WPHRTKQPDMOW4F2MKV2O7DKBU4ZMC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Lee,

On Mon, 3 Apr 2023 15:28:22 +0100
Lee Jones <lee@kernel.org> wrote:

> On Fri, 31 Mar 2023, Herve Codina wrote:
> 
> > On Fri, 31 Mar 2023 15:44:19 +0200
> > Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> >  
> > > On 31/03/2023 14:11, Herve Codina wrote:  
> > > > Hi Krzysztof, Lee
> > > >
> > > > On Fri, 31 Mar 2023 11:13:30 +0200
> > > > Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> > > >  
> > > >> On 31/03/2023 09:42, Herve Codina wrote:  
> > > >>> Hi Lee,
> > > >>>
> > > >>> On Thu, 30 Mar 2023 17:05:10 +0100
> > > >>> Lee Jones <lee@kernel.org> wrote:
> > > >>>  
> > > >>>> On Tue, 28 Mar 2023, Herve Codina wrote:
> > > >>>>  
> > > >>>>> The Lantiq PEF2256 is a framer and line interface component designed to
> > > >>>>> fulfill all required interfacing between an analog E1/T1/J1 line and the
> > > >>>>> digital PCM system highway/H.100 bus.  
> > > >>>>
> > > >>>> My goodness!
> > > >>>>
> > > >>>> It's been a long time since I've seen anything quite like this.  
> > > >>>
> > > >>> Yes, old things but working on recent kernel.
> > > >>>  
> > > >>>>
> > > >>>> My suggestion to you:
> > > >>>>
> > > >>>> * Split this up into components that fit functional subsystems  
> > > >>>
> > > >>> It is done. The audio part is present in ASoC subsystem (path 5 in this
> > > >>> series). pinctrl function is implemented in this driver and, as I don't
> > > >>> want to share registers, I would prefer to keep this function inside this
> > > >>> driver.  
> > > >>
> > > >> The amount of defines and huge functions like pef2256_setup_e1()
> > > >> contradict it.
> > > >>
> > > >> Even the pef2256_setup_e1() really does not follow Linux coding style -
> > > >> you know the size requirement, right?  
> > > >
> > > > I know that pef2256_setup_e1() is quite big and I will look at a way
> > > > to split it in a consistent way.
> > > >  
> > > >>
> > > >> pef2256_get_groups_count, struct pinmux_ops and others - this is
> > > >> pinctrl, not MFD! They cannot be in MFD driver.  
> > > >
> > > > Maybe the issue is that MFD was not a good choice.
> > > > The "function" provided are not independent of each other.
> > > > The "main" driver (pef2256.c) needs to do the setup and handle the interrupt.  
> > >
> > > Just like all PMICs...
> > >  
> > > > The "function" provided are some glues in order to be used in some sub-systems
> > > > such as audio. Indeed, ASoC needs a codec DAI to be connected to a CPU DAI.  
> > >
> > > Just like in all other cases...
> > >  
> > > > These "functions" need to be started (ie probe()) after the pef2256 setup was
> > > > done. So a start (probe()) order relationship is needed.  
> > >
> > > Just like in all other cases, so I really do not see here anything special.
> > >  
> > > >
> > > > If a MFD driver needs independent children to handle independent functions,
> > > > the pef2256 does not fit well as a MFD driver.  
> > >
> > > Why? So far everything is exactly the same.
> > >  
> > > >
> > > > I switched from misc to MFD just to handle child DT nodes instead of having
> > > > phandles. Using child DT nodes instead of phandles is really a good thing and
> > > > need to be kept.  
> > >
> > > Your DT bindings and nodes are not related to driver design. It does not
> > > matter for Devicetree if you put it to misc or MFD.
> > >
> > > It does not matter for driver whether you call it in Devicetree foo or bar.
> > >  
> > > > The switch to MFD was probably not the best thing to do.  
> > >
> > > Maybe, but your existing arguments are not really related...
> > >  
> > > >
> > > > What do you think if I switched back the pef2256 "main" driver (pef2256.c) to
> > > > misc ?  
> > >
> > > Why? What would it solve? You want to stuff pinctrl driver to misc, to
> > > avoid Lee's review? No. Pinctrl goes to pinctrl. Not to misc. Not to MFD.  
> >
> > Just to be clear on that point, I do not want to avoid any reviews and Lee's
> > reviews are fully welcome.
> >
> > I just misunderstood. I thought the issue was that the pef2256 MFD driver has an
> > internal setup() and that the 'function' provided were not independent (they share
> > the pef2256 API).
> > My first feeling was that it was expected a kind of 'empty' driver for the pef2256
> > MFD driver. The pef2256 driver cannot be empty. That's why I talk about misc.  
> 
> It can be empty.  That's what simple-mfd is for. :)
> 
> I suggest that none of this (besides the child registration, which is
> achieved by a simple OF API call in this case) has anything to do with
> MFD.  We are not requesting and initialising shared resources and we are
> not using the MFD API to register children.  The pin control
> functionality clearly needs moving to Pinctrl and the rest, if you
> cannot find a suitable home for it *may be* suitable for Misc.
> 

I am confused and I am not really sure to understand where to put my driver.

The core pef2256.c needs to:
1) setup the pef2256
2) add the children

To add the children it calls  devm_of_platform_populate() to add the audio
parts as several audio children can be available with the same compatible
string.

I plan to move the pinctrl part to the pinctrl subsystem. With this done,
the core pef2256.c will probably add the children using:
- a mfd_cell for the pinctrl part
- devm_of_platform_populate() for the audio children

The setup (E1 lines and TDM configuration) still needs to be done by the
core pef2256.c. Moving this part only to Misc will break the hierarchy.
The audio children depends on the core pef2256.c as this one do the setup.
Having in the audio children and the part that do the setup in same hierarchy
level is not correct. Audio children should be children of the part that do
the setup.

So, the structure I have in mind:
- pef2256.c (MFD)
  implement and do the setup at probe()
  Add the children at probe():
    - pef2256-pinctrl (pinctrl) added using mfd_add_devices()
    - pef2256-codec (ASoC codec) added using devm_of_platform_populate()

Lee, with this in mind, can the core pef2256.c be a MFD driver ?

Best regards,
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
