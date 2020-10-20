Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA1B293B49
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Oct 2020 14:21:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C16DE1718;
	Tue, 20 Oct 2020 14:20:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C16DE1718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603196471;
	bh=v6hvzZnm5fO2LRuaf67yjm5Dmk41dAfQBo695kCsG/c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WB9K8VMhxMSqSfcSua/X6l8VjcjGc5L1liqUuFy+D5kH/kztL5qz1MDyTlWpsmL+o
	 WbZ74De2YvC9/y5FlNYcrJphO4DdeXfF3ni62dJhYNF6JTOzgHqDvgtN5DoYkhuJdP
	 zoNmUC7+Hn3MChj++k+1J4y6AJNvApXg54Fjmi50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B578F8010F;
	Tue, 20 Oct 2020 14:19:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7B68F801F2; Tue, 20 Oct 2020 14:19:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86066F8010F
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 14:19:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86066F8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZJJ/FkLc"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 427942222F;
 Tue, 20 Oct 2020 12:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603196363;
 bh=v6hvzZnm5fO2LRuaf67yjm5Dmk41dAfQBo695kCsG/c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZJJ/FkLcr/+ezJTlcNE93HVLZFVLAgVCweDitu6Xjjt0lx+j8u2muD2BZeJ5OKhWC
 F/KlgfG/e+ktLqHgxyHqT+l5ubxWadGxHAgHIGncHt3ye3W4AT6Lo4pKaqTEUvnLor
 29xF8Osd83iq1oX9q5S63X53T3HoF89FKQDuSJiU=
Date: Tue, 20 Oct 2020 13:19:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Subject: Re: [PATCH] ASoC: cs42l51: manage mclk shutdown delay
Message-ID: <20201020121913.GB9448@sirena.org.uk>
References: <20201020090457.340-1-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Content-Disposition: inline
In-Reply-To: <20201020090457.340-1-olivier.moysan@st.com>
X-Cookie: The people rule.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, alexandre.torgue@st.com,
 linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, tiwai@suse.com,
 lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, arnaud.patard@rtp-net.org
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


--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 20, 2020 at 11:04:57AM +0200, Olivier Moysan wrote:

> +static int mclk_event(struct snd_soc_dapm_widget *w,
> +		      struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
> +	struct cs42l51_private *cs42l51 = snd_soc_component_get_drvdata(comp);
> +
> +	if (SND_SOC_DAPM_EVENT_ON(event))
> +		return clk_prepare_enable(cs42l51->mclk_handle);
> +
> +	/* Delay mclk shutdown to fulfill power-down sequence requirements */
> +	msleep(20);
> +	clk_disable_unprepare(cs42l51->mclk_handle);

Why not use a switch statement here?  The control flow is a bit odd with
what's basically an if/else done with only one branch in the if - this
isn't idiomatic for DAPM stuff apart from anything else.

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+O1cAACgkQJNaLcl1U
h9A/vAf+JYXtEW1+AAEACgq9gDYA589X13HKVS73HAERhV2VefPqsSWHlF+UhKx1
YUOU94GV71Ch7RLyaoFfQhaxVZghyjDXxWeqsMe1mJwxVfBCAxq5N6Q/Mm/hyORl
fA62L8BHyO2iDoJX72VoaGN0HLxTzqWvHXvnhU7tfaaTAVVVdNpBPSya+pbU8EM6
Ya6XwOejv7Rr3wcO1OsmVJfxW+n4xjyrM06oM+Ld7VSVTXKxdaAgltBthCPxD9pO
Km4xA9vhbo76xXiER2/arnWKgqSsXAT8bJbK5oipa/RlpnpFXZvokhd0bxBmkOop
xss2mjf+rEEkN3hJS2irSUZb0/X5sw==
=Yz7U
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--
