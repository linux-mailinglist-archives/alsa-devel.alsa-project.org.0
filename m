Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB04A7DBEB9
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Oct 2023 18:22:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 015EB14E;
	Mon, 30 Oct 2023 18:21:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 015EB14E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698686526;
	bh=lwbzUuW1aOxjwsXApLRGWceIvJkvo1xXplXhfkETyWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r+g7rGi81j9b0SO5R7Oc41BYj0lwijFvYN5H8JlT2D1Wa4gzduaGuWCVInoNRXs0L
	 c9d938xGSHlVmxtY0866XrtX9iNFLPwmq/yXFamRBnQuadrTGma+oH05hvt3OQn18h
	 vGi/qor7HgXQlHZelXqSSzuPkhPoXhrPtgtoYzT8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94F4BF80290; Mon, 30 Oct 2023 18:21:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8902F800FA;
	Mon, 30 Oct 2023 18:21:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B4ECF8016D; Mon, 30 Oct 2023 18:21:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D05DF800FA
	for <alsa-devel@alsa-project.org>; Mon, 30 Oct 2023 18:21:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D05DF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DgXxKtg4
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 959CACE18EF;
	Mon, 30 Oct 2023 17:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ECA8C433C8;
	Mon, 30 Oct 2023 17:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698686460;
	bh=lwbzUuW1aOxjwsXApLRGWceIvJkvo1xXplXhfkETyWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DgXxKtg40pWM70heAuYMx5enwpJX/oe3SYbETr95gr9hUhtTXa3jg/nh2ctpjrLuR
	 ud+tVgkj/LQmF27nR2mKAgfeS0cL33U0Z5/kWgZKhPMIimOwuOVHQDn9cuLdAHZHA2
	 VBHbe8GVnBFvUbAkHL08sd9GIW1eo/0t1BpR3P8qxRWffqoZ/CnvrsZd2kKAjMEnEl
	 /KCN45kvA3MwpybObB+Zg7bG8ovv9SPwXcwTh1OQ1EP6ktteTZ97r2/1aF7F0KagoD
	 jsxgzzkwTErQY81VNIFw+i/xEApCiMk+kR6zdae6YOlKVtZayWCQZYMKm7XDnLEdNg
	 fDNQc7Bi5l7AQ==
Date: Mon, 30 Oct 2023 17:20:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Baojun Xu <baojun.xu@ti.com>, lgirdwood@gmail.com, perex@perex.cz,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	kevin-lu@ti.com, shenghao-ding@ti.com, peeyush@ti.com,
	navada@ti.com, tiwai@suse.de
Subject: Re: [PATCH v3] ASoC: tas2783: Add source files for tas2783 driver.
Message-ID: <9d922584-288a-4b73-83ef-477d1bc58521@sirena.org.uk>
References: <20231028092409.96813-1-baojun.xu@ti.com>
 <7f4465c1-5e8e-4c5f-bbff-d2c930326986@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5LMN/5Y4nwdbngJK"
Content-Disposition: inline
In-Reply-To: <7f4465c1-5e8e-4c5f-bbff-d2c930326986@linux.intel.com>
X-Cookie: Boy!  Eucalyptus!
Message-ID-Hash: IJQMKLP6SMS67AIRD6DWEWDMZ6GOIA5E
X-Message-ID-Hash: IJQMKLP6SMS67AIRD6DWEWDMZ6GOIA5E
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IJQMKLP6SMS67AIRD6DWEWDMZ6GOIA5E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--5LMN/5Y4nwdbngJK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 30, 2023 at 11:05:39AM -0500, Pierre-Louis Bossart wrote:

> > +static bool tas2783_readable_register(struct device *dev, unsigned int reg)
> > +{
> > +	switch (reg) {
> > +	case 0x000 ... 0x080:	/* Data port 0. */

> No, this is wrong. All the data port 'standard' registers are "owned" by
> the SoundWire core and handled during the port prepare/configure/bank
> switch routines. Do not use them for regmap.

> In other words, you *shall* only define vendor-specific registers in
> this codec driver.

This seems to come up a moderate amount and is an understandable thing
to do - could you (or someone else who knows SoundWire) perhaps send a
patch for the regmap SoundWire integration which does some validation
here during registration and at least prints a warning?

Also worth noting that the default is going to be that the registers are
readable if the driver doesn't configure anything at all so perhaps at
least for just readability this might be worth revisiting.

> > +static const struct snd_soc_dapm_widget tasdevice_dapm_widgets[] = {
> > +	SND_SOC_DAPM_AIF_IN("ASI", "ASI Playback", 0, SND_SOC_NOPM, 0, 0),
> > +	SND_SOC_DAPM_AIF_OUT("ASI OUT", "ASI Capture", 0, SND_SOC_NOPM,
> > +		0, 0),
> > +	SND_SOC_DAPM_SPK("SPK", NULL),
> > +	SND_SOC_DAPM_OUTPUT("OUT"),
> > +	SND_SOC_DAPM_INPUT("DMIC")
> > +};

> Can you clarify what "ASI" is?

ASI seems to be a fairly commonly used name in TI devices...  In general
naming that corresponds to the datasheet should be fine, especially for
internal only things like this sort of DAPM widget.  I'd guess it's
something like Audio Serial Interface but not actually gone and looked.

--5LMN/5Y4nwdbngJK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmU/5fYACgkQJNaLcl1U
h9ARhAgAhgRuLFI+OnWYzXEkD7ojB6ZTuPex3LKj3PhI8JGwXsJbN41iFSzInS10
tMksTNi7ewYcziVKhNzn6Jq+XlWPNlCgtuxE6/hL8UdKt2KqsJGA9r7DKXNp2/kz
8zM3B/I/fRtVb6vPRyAzI7XPkFxjBWkqeraDYLXY1Rdw3EYhn9VDLy6+PLoGiRG2
08tlnKKEBG6PMytmIrqmAP+VRJbq8YLH6wnRoggvvtKGj+xhpLjyqm5wO3+LDgqi
bE1C2z7l/gqouaVoeK2vVVaXKPGZkTH0eZ7Ksk4WQ8aoakuxbGQnH6LdEh25N2es
DNLcFKS5P4KGRORpzNVluc7RB23jDw==
=dOoN
-----END PGP SIGNATURE-----

--5LMN/5Y4nwdbngJK--
