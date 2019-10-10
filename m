Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C234CD2B3C
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 15:25:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47FE71670;
	Thu, 10 Oct 2019 15:24:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47FE71670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570713907;
	bh=ewuO8dsS2IuKgRd1jOtt1fKeNJUvZE61ktYk8IXsxKQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IHOkxv7BT9JfJ0FXEYfJYsAjKrm2LoahYbVQ263Q1COgVoL+c7HVgpwvTaIobPSZG
	 mkn1PTwAG2auUxehn8pP5mI0Es8rqo3SE6D4O+2euDQhcsrUuAD88JCSL1zvfxeenN
	 MyDaG4L/ECThnHWmvk1Bo0SLiPbDZm10FFUaDC3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4171F8038F;
	Thu, 10 Oct 2019 15:23:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07CB4F8038F; Thu, 10 Oct 2019 15:23:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9999F800E3
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 15:23:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9999F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="B88lpczA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WociR5V+PwUtDGUiulMlt+az7TEdfqJQTJBOofSQeIw=; b=B88lpczAXQldWnyO8Im9vdCEv
 daXUQXh+wZyng11oMF3dtD8+xtR1wQDi92EbTcjf757S/kd/3vMN3xUUt1KFVma+wUSvOf9Q5kZrS
 zZgZmChOHr9R05ehraysEp+s3TpmcKHZiG+YZIG+UMp3R3zkGr37++IozSVUV9WUGhGrY=;
Received: from fw-tnat-cam3.arm.com ([217.140.106.51]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iIYPU-0001Mi-99; Thu, 10 Oct 2019 13:23:16 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id EC10BD0003A; Thu, 10 Oct 2019 14:23:14 +0100 (BST)
Date: Thu, 10 Oct 2019 14:23:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20191010132314.GQ2036@sirena.org.uk>
References: <20191009085108.4950-1-srinivas.kandagatla@linaro.org>
 <20191009085108.4950-3-srinivas.kandagatla@linaro.org>
 <20191009163535.GK2036@sirena.org.uk>
 <95637c0a-8373-0eda-47e5-ac6e529019e5@linaro.org>
MIME-Version: 1.0
In-Reply-To: <95637c0a-8373-0eda-47e5-ac6e529019e5@linaro.org>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 spapothi@codeaurora.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, pierre-louis.bossart@linux.intel.com
Subject: Re: [alsa-devel] [PATCH v7 2/2] ASoC: codecs: add wsa881x amplifier
	support
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
Content-Type: multipart/mixed; boundary="===============8420132652905083536=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8420132652905083536==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8Km4OLyaxUtVIPha"
Content-Disposition: inline


--8Km4OLyaxUtVIPha
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 10, 2019 at 10:28:04AM +0100, Srinivas Kandagatla wrote:
> On 09/10/2019 17:35, Mark Brown wrote:
> > On Wed, Oct 09, 2019 at 09:51:08AM +0100, Srinivas Kandagatla wrote:
> > > +static const u8 wsa881x_reg_readable[WSA881X_CACHE_SIZE] = {

> > > +static bool wsa881x_readable_register(struct device *dev, unsigned int reg)
> > > +{
> > > +	return wsa881x_reg_readable[reg];

> > There's no bounds check and that array size is not...

> I converted this now to a proper switch statement as other drivers do.

> > > +static struct regmap_config wsa881x_regmap_config = {
> > > +	.reg_bits = 32,
> > > +	.val_bits = 8,
> > > +	.cache_type = REGCACHE_RBTREE,
> > > +	.reg_defaults = wsa881x_defaults,
> > > +	.num_reg_defaults = ARRAY_SIZE(wsa881x_defaults),
> > > +	.max_register = WSA881X_MAX_REGISTER,

> > ...what regmap has as max_register.  Uusually you'd render as a
> > switch statement (as you did for volatile) and let the compiler
> > figure out a sensible way to do the lookup.

> Sorry, I did not get your point here.

> Are you saying that we can skip max_register in this regmap config ?
> Then how would max_register in regmap be set?

I'm saying that you appear to be relying on max_register to
verify that you're not overflowing the array bounds but you
max_register is not set to the same thing as the array size.

--8Km4OLyaxUtVIPha
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2fMMIACgkQJNaLcl1U
h9A3/Qf6Ar7ffTTO6fQ9eEU2xlK6kaCO7YSeWXTP1fKzuKvQy6Fd/XOsax1HiBF/
8/H4lV/CNqnW88GwSAgBm7acHnRQwDrq1UkVlImEMNkslEr9q5ANt5CHrUb0DNcW
TI6RkEi4gJj0nfkBozu9aRww71xEYNR+DPcmb/1rugVUdh1WYmFop9sAImmdn+5d
zGGIdGTWdDu71UTPmx272j1zd6226SeJw7ONW4lmacud+HlEnAFRV3OBBc+ftGFD
G6kIhnTS0mnSuzhmGEkyzCTHHuG6Sjv1Co/qRKrV+PdqRPhxPln10rw8N9/Wv55n
5CXKfA5YtlVQjpfqaSr2fmE3YCtiew==
=ZHzM
-----END PGP SIGNATURE-----

--8Km4OLyaxUtVIPha--

--===============8420132652905083536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8420132652905083536==--
