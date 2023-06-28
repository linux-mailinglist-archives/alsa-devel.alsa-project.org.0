Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE4B741957
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 22:12:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EB2C3E7;
	Wed, 28 Jun 2023 22:11:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EB2C3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687983133;
	bh=LLcceKwXay+1+LZDqQSJ8DdnOTd9XJoa6qAnUlgbGhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Wyg1Zh8PehoSG6MQr4wRPrDDDT1DpV3Ewv+6++/lz44jtDH8Sud/g9LD67ZknzvFU
	 GO+2j1mDj+eizb9SH+T9xEp4QK7Qlhv369m0rDn51pjGt5h9mdeuTeMbhgTKJ230Q8
	 krxcKrSM7ySroHAYUEbZPYG/SBwhtc/N1GUP8X7I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DDC0F8027B; Wed, 28 Jun 2023 22:11:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 92EB3F80212;
	Wed, 28 Jun 2023 22:11:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40189F80246; Wed, 28 Jun 2023 22:11:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9AE26F80124
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 22:11:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AE26F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ny+Dig9e
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CCE0F6145E;
	Wed, 28 Jun 2023 20:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05DF5C433C0;
	Wed, 28 Jun 2023 20:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687983072;
	bh=LLcceKwXay+1+LZDqQSJ8DdnOTd9XJoa6qAnUlgbGhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ny+Dig9eSI8aD48PEXYHzX0z4qqIyDFR4n9v6cCNGMCJIuUkM3THoCcDTZXFEo0iC
	 4pZSWDZDTu+NSJjYsR74RLvpclufEOOnYAMEzqs8y+O+w6t2DS/wwm7iXfJ50U74Py
	 tlWQZbEZEOsEHxp0xbcG4lpIzaiwo6CzLehq3g8WFubcVqyVMQqTM6cneR/1N/aOXf
	 DCfi7lw7VUlaKsMWs0zu3q9pfYNjCOCKH57v1bD+1bJqxYB8nkTPWAE3XF+YsheRNV
	 3nQjPTCxd/bNW4DvJNE4Dr7AFDTrxd2F/qF+4raCfkes3j7wvNuKhcOJb7MCCoE/Y5
	 J6DsMfu9kAncg==
Date: Wed, 28 Jun 2023 21:11:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	krzysztof.kozlowski+dt@linaro.org, andersson@kernel.org,
	robh+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, johan+linaro@kernel.org,
	perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
	linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 2/3] ASoC: qcom: q6apm: add support for reading firmware
 name from DT
Message-ID: <12c19702-9a0a-45b9-9dc0-6b62879fae81@sirena.org.uk>
References: <20230628102621.15016-1-srinivas.kandagatla@linaro.org>
 <20230628102621.15016-3-srinivas.kandagatla@linaro.org>
 <f71c8d2b-d5f4-42bb-932f-5b9ec6117ffc@sirena.org.uk>
 <73dce263-bee6-554f-9eb6-af4aa7badab1@linaro.org>
 <c377aefe-2678-4ba7-96b3-2186e8f3f1b4@sirena.org.uk>
 <fabef33c-a8c7-af61-80b4-91e55081c977@linaro.org>
 <c5bbdaa9-43fb-4ec3-af7d-b1629d2d88f7@sirena.org.uk>
 <CAA8EJprRH6aFj17A-sJzzHJXG7vNWu-yznSh7oA3WBXRv19wvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YMXJcNcxLhYXGPw7"
Content-Disposition: inline
In-Reply-To: 
 <CAA8EJprRH6aFj17A-sJzzHJXG7vNWu-yznSh7oA3WBXRv19wvw@mail.gmail.com>
X-Cookie: HELLO, everybody, I'm a HUMAN!!
Message-ID-Hash: HQFP3FTK6QXIZFVKLQEDHVP5EJHJ4I3B
X-Message-ID-Hash: HQFP3FTK6QXIZFVKLQEDHVP5EJHJ4I3B
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HQFP3FTK6QXIZFVKLQEDHVP5EJHJ4I3B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--YMXJcNcxLhYXGPw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 28, 2023 at 11:00:54PM +0300, Dmitry Baryshkov wrote:
> On Wed, 28 Jun 2023 at 22:40, Mark Brown <broonie@kernel.org> wrote:
> > On Wed, Jun 28, 2023 at 10:33:16PM +0300, Dmitry Baryshkov wrote:

> > > This quickly becomes overcomplicated. Some platforms use different firmware
> > > naming structure. Some firmware goes into a generic location and other files
> > > go into device-specific location. So having a generic helper doesn't really
> > > help.

> > That sounds like a job for symlinks surely?

> Excuse me, but I don't understand the goal for such symlinks. In my
> opinion (and more importantly, in the opinion of qcom maintainers),
> firmware-name does the necessary job. It provides enough flexibility
> and doesn't require any additional dances around.

The goal is to avoid adding a Linux specific ABI if we don't need one,
and to allow later adjustment of what's selected on the userspace side
more easily (eg, if a more specific firwmare is found).

--YMXJcNcxLhYXGPw7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSck9gACgkQJNaLcl1U
h9BlIAf/U3zhxoGXi5DoWCg8Bs+vMFignIh07oSJjhgCaLNRBDO8u+xB0O2y3Ttc
huuRgDvcmjdZu1j258LPOc2dOwsYlGpIGNZuO2MxbeRxWLvJ+jYolrQr693R0H7Z
H7tR1GmW2+kU10RHflKOdoByXYSFg3s8Y37K1gUAKYDFCtDdk72sSeRdKWAyxlb1
cieBspLTI7ezND4O8mBpNZTkPrw6TFGDtETlk6ek5ySbUD2beWWTbBWbb604LJrI
IGStw1SfiHcu6eY0zm7BFyiWJgowKLxzq4Aesy/ok/Ng8ztRXk1dYttxFifSY+x0
GSDE23I/jS9mukoIMyL1z3/nA0ty4Q==
=jB6O
-----END PGP SIGNATURE-----

--YMXJcNcxLhYXGPw7--
