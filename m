Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B238F1BDB65
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 14:07:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 317B5168A;
	Wed, 29 Apr 2020 14:06:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 317B5168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588162026;
	bh=BHx6Adc582HX/EI7gEWPQT8miSuzlW266b32vPCYeME=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X2zkzLtPmR8hI9b3IsVJDF/BpAweNg8Il1jK4WJYjGMOfY6YLRDm3iF80qssTZ8E9
	 7nOqDyoh7KBmEmiUKN6DLrOJmIGWjU/PXwVW13Pwe9B8RUBch7OyCmWYiK4Bbd3Jg7
	 RJD5mqL+hiljAjGeJuH69pxF4AT6suZuISQe7xq8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38299F80232;
	Wed, 29 Apr 2020 14:05:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 623E6F8022B; Wed, 29 Apr 2020 14:05:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_26,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25B10F800B6
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 14:05:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25B10F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="StwkJngH"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 27F8B208FE;
 Wed, 29 Apr 2020 12:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588161914;
 bh=BHx6Adc582HX/EI7gEWPQT8miSuzlW266b32vPCYeME=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=StwkJngH70s5roDZrk0Vd0cSxaoWgkq9/v/SdRm0VsfveIt/PScZ4eGrr0cCqV5Yi
 bgXyOwH5HMG8tiQL2kbbdS1mALhVuxn6iUOzJd9DzIKPw4LwXeyZ8XdAOiDFocEt5O
 rfDMpk4aRr6mied40vjSshkkuH1tA5VSghN9ckWA=
Date: Wed, 29 Apr 2020 13:05:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [linux-sunxi] Re: Audio sound card name [was [PATCH 4/7] arm64:
 dts: allwinner: a64: Add HDMI audio]
Message-ID: <20200429120511.GG4201@sirena.org.uk>
References: <20200426120442.11560-1-peron.clem@gmail.com>
 <20200426120442.11560-5-peron.clem@gmail.com>
 <20200428080020.35qcuylwq2ylmubu@gilmour.lan>
 <CAJiuCcc2LQ4L36KSfO8iLVFBUO6k+zsZFX+_Ovm_10PoWO4AsA@mail.gmail.com>
 <20200428160417.6q5oab2guaumhhwi@gilmour.lan>
 <CAJiuCccFFUJJzXwygLQbDK4fGJ61p72Hv7vj3WVP-=z=J1Yj0Q@mail.gmail.com>
 <031ee5d3-8a30-82ee-76db-c0e8a1073046@arm.com>
 <CAGb2v65rRbRpUTdkTF3hd5LnLQQt19YVOyVzM5te5XNVhQQH=A@mail.gmail.com>
 <20200429081729.qa3gqtl5sof2jhem@gilmour.lan>
 <f9b701d9-0c4e-6e41-1ce8-52adf0f59a2a@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RMedoP2+Pr6Rq0N2"
Content-Disposition: inline
In-Reply-To: <f9b701d9-0c4e-6e41-1ce8-52adf0f59a2a@arm.com>
X-Cookie: I know how to do SPECIAL EFFECTS!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Takashi Iwai <tiwai@suse.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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


--RMedoP2+Pr6Rq0N2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 29, 2020 at 11:43:06AM +0100, Robin Murphy wrote:
> On 2020-04-29 9:17 am, Maxime Ripard wrote:
> > On Wed, Apr 29, 2020 at 02:24:00PM +0800, Chen-Yu Tsai wrote:

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

> > If we also end up with "HDMI" as our card name, then the userspace has no way to
> > tell anymore if it's running from an rk3328 or an allwinner SoC, or something
> > else entirely. And therefore it cannot really configure anything to work out of
> > the box anymore.

> OK, you're a userspace audio application - enlighten me as to what exact
> chip you're running on here, and why you need to know:

> card 0: HDMI [HDA ATI HDMI]

> or how about here?

> card 0: Intel [HDA Intel]

In the case of HDMI for embedded platforms since there is generally no
control in the audio path it is unlikely to make a *huge* difference,
though if there are expansion buses or multiple HDMI ports it can be
useful to help people identify which particular HDMI port it is.  For
other cards the names are part of userspace working out which config
file to apply to the card so deduplication can help, and also the
plastics tend to matter.

> With simple-audio-card we're talking about trivial interfaces that often
> don't expose any controls at all, so there's unlikely to be much
> 'configuration' for userspace to do beyond choosing which card to output to.

This is a reasonable assumption for HDMI but it is not at all a
reasonable assumption for simple-audio-card in general - just because
the links between the SoC and the external components are simple that
doesn't mean that any of those components are simple, and even if the
hardware is simple that does not mean that configuration is unimportant
- the difference between full scale output and appropriate headphone
volumes is for example *extremely* important.

--RMedoP2+Pr6Rq0N2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6pbXcACgkQJNaLcl1U
h9Bzugf/c28iLtVw25sffS7FxnwHu5kFpEMA6AESU/nbib3pIGkMPZg+yn69tK3S
bdnoVTnaJl2n84nFz/STXBtafZ0xebeAN+eZu0Gd7vtygVQlVGBP0QqPBo04u2Ko
xSfYbaycfHROmTbbL5xIoJ0XaxNOgnZd0epZRpcvNDkDZJ8YvlwoR5Ooi8C/SR9E
xqmpX9gmh59QtZf3NS5mQ+4PIHwxw35rxIgA1P6mIFRaseuz6njlFAlpKpCfWHy8
ZOYQ79RmdZDUSkqlOtUToBxkOrVCPHHmr5YoblVd3P3olP4ZBcmpnRuB4+QkxifA
7T5xU5H+PZPzUMBmDu6Mtx6P+4INhA==
=xohR
-----END PGP SIGNATURE-----

--RMedoP2+Pr6Rq0N2--
