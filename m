Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5882A481FF3
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Dec 2021 20:35:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA1911725;
	Thu, 30 Dec 2021 20:35:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA1911725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640892952;
	bh=tTQjUImUfEwnmMlnVD9yEjShbKH9jA4y/pRZSzxHJzM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TwH12cDOJQOci31x+OnnUIf5dxRZ0MuYpr6CJylEXX9ZyM3bKOrb0E/65rIZjm2rU
	 UNVUsV1AJRW5zqmDqmlX11gsyLzVxEyt639dd9DUPN5IpxU2k/M+dXEWJqtrk6mv7w
	 3iazNyo1KgMuAaHYcxnYj8OFr3ztwqv/n2PtzvMc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47C58F80149;
	Thu, 30 Dec 2021 20:34:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96346F8012A; Thu, 30 Dec 2021 20:34:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FA81F800EB
 for <alsa-devel@alsa-project.org>; Thu, 30 Dec 2021 20:34:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FA81F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="aknv77lS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1640892868;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=Cr8n4Vmv0zYVDG8vZW4zB9BVYfDV/FKb09iNH4DWH9w=;
 b=aknv77lSX6yKfTaxOQpcq8wS7TPjZS4W6QoLUj1v3AUegA6RkFDOow5SRb06+cADNl
 tiT8AZxAdhz4GaDqt6Kuf9+QwPuoeNL78DAYkOgyfYYcaAaKzCeHAM1+HYdPts0nc+NF
 vw+T+WlcHc9+UsH7pgl4jUkvqKonxzR3cvaCZPB5C2Wuly4LuKb2eET8WCiaivQ1p4j2
 E+vOQrMjpaY46Se9UEOjEHrKg4HzlYBXALuEaJoFSJ7YRAMWQngUGTb4vNbFLvZYEpKN
 BvF8p+vyyGyZA8yLynj0VO85hV3itt+U7eRcV+rgEjumpwIxSXP4bxi9NzzIHs8Hp26O
 tFwg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLVrK88/6Y="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 47.35.3 SBL|AUTH)
 with ESMTPSA id x08baexBUJYRYHu
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 30 Dec 2021 20:34:27 +0100 (CET)
Date: Thu, 30 Dec 2021 20:34:23 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 5/5] ASoC: Intel: bytcr_rt5640: Add support for external
 GPIO jack-detect
Message-ID: <Yc4Jv4HJwhEhdkHg@gerhold.net>
References: <20211227153344.155803-1-hdegoede@redhat.com>
 <20211227153344.155803-5-hdegoede@redhat.com>
 <Yc4A2sa/tmRqcjrU@gerhold.net>
 <197a6c81-1d0b-b34d-d364-33bf254deab5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <197a6c81-1d0b-b34d-d364-33bf254deab5@redhat.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bard.liao@intel.com>
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

On Thu, Dec 30, 2021 at 08:12:27PM +0100, Hans de Goede wrote:
> On 12/30/21 19:56, Stephan Gerhold wrote:
> > On Mon, Dec 27, 2021 at 04:33:44PM +0100, Hans de Goede wrote:
> >> Some boards have the codec IRQ hooked-up as normally, so the driver can
> >> still do things like headset vs headphones and button-press detection,
> >> but instead of using one of the JD pins of the codec, an external GPIO
> >> is used to report the jack-presence switch status of the jack.
> >>
> >> Add support for boards which have this setup and which specify which
> >> external GPIO to use in the special Android AMCR0F28 ACPI device.
> >>
> >> And add a quirk for the Asus TF103C tablet which uses this setup.
> >>
> > 
> > Can you clarify what exactly is the difference between the setup on
> > ME176C and the TF103C? I'm a bit confused why you're using the GpioInt
> > as GPIO for TF103C and as IRQ for ME176C. It's GPO2 pin 0x0004 for both
> > of them as far as I can tell.
> > 
> > If I remember correctly the vendor kernel from ASUS also used it as
> > simple GPIO on ME176C. I'm not sure if it actually belongs to the
> > RT5640, I just tried using it in a way that is compatible with your
> > headphone detection code. :)
> > 
> > Before I switched to your code I was actually using it as simple GPIO
> > similar to your changes here (this could only detect headphones though):
> > https://github.com/me176c-dev/linux-me176c/commit/ea3de8e47414371fdeeae819c686f737c02fac7d#diff-28a5a6c5e3db2a315d022023f3cda69ef0475ef036e22dd5ffa0fb4af31c9f81
> > 
> > In other words, my question is: Should we also use BYT_RT5640_JD_SRC_EXT_GPIO
> > for ME176C? Or can TF103C also use the same setup as ME176C?
> 
> The Bay Trail SoC GPO2 pin 4 is connected to the codecs GPIO1 pin,
> which is best thought of as the codecs IRQ pin, because that is how
> the rt5640 codec driver configures it:
> 
>         /* Selecting GPIO01 as an interrupt */
>         snd_soc_component_update_bits(component, RT5640_GPIO_CTRL1,
>                 RT5640_GP1_PIN_MASK, RT5640_GP1_PIN_IRQ);
> 
>         /* Set GPIO1 output */
>         snd_soc_component_update_bits(component, RT5640_GPIO_CTRL3,
>                 RT5640_GP1_PF_MASK, RT5640_GP1_PF_OUT);
> 
> This may seem to be directly connected to the jack-inserted switch
> of the physical jack, but it is not, the IRQ just happens to go
> low/high together with the jack state (the IRQ handler is sensitive
> to both edges).
> 
> But when low (jack inserted), it can go high again even though the
> jack is not removed *at all*. This happens on an overcurrent situation
> on the mic bias current, which is how heapdhones vs headset are
> detected (headphones short the mic contact triggering OVCD). So it
> really is a totally different pin from the jack-inserted switch,
> it just seems to be directly connected most of the time.
> 
> On the ME176C the actual physical jack-inserted switch is connected
> to the JD2 aka IN4N pin of the codec and the codec driver checks
> for jack-insertion like this:
> 
> 	val = snd_soc_component_read(component, RT5640_INT_IRQ_ST);
> 
>         if (rt5640->jd_inverted)
>                 return !(val & RT5640_JD_STATUS);
>         else
>                 return (val & RT5640_JD_STATUS);
> 
> And the physical jack-inserted switch is *also* connected to
> the Bay Trail SoC GPO2 pin 27 (second GPIO resource in the AMCROf28
> device), but we ignore that since before this patch-set the rt5640
> codec code assumes the switch is always connected to one of the
> codecs JD pins.
> 

Ahh, I think I mixed up the first and second GPIO resource in the
AMCR0F28 ACPI device. I thought you're using pin 4 as GPIO here but it's
actually pin 27. Looks I was also using pin 27 in my "driver" back then.

When quickly looking at the following line in your patch and my "driver"

static const struct acpi_gpio_params amcr0f28_jd_gpio = { 1, 0, false };

... I had a 50 percent chance if it refers to resource 1 or resource 0
and clearly I guessed wrong. :(

> 
> On the Asus TF103C, the codecs GPIO1 aka IRQ pin is connected
> to the Bay Trail SoC's GPO2 pin 4 just like on the ME176C.
> 
> What is different is that the jack's physical insertion switch
> is *only* connected to the Bay Trail SoC's GPO2 pin 27 and not
> connected to any of the codecs JD1/JD2 pins *at all* so we need
> to work around that.
> 
> I hope this helps explain.
> 

Yep it does, thanks for the detailed explanation!

Stephan
