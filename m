Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 433C124889F
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 17:04:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D49811713;
	Tue, 18 Aug 2020 17:03:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D49811713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597763089;
	bh=/Au42xAltT4UIkIAu/0BCAbvou4lntMo5L1yDg87RPo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kae7n93gL3JvOpcncxjXhVd7QKuEg4dohxgqCpgnUqnf85dhtZiLQRn6XeTTaV1z5
	 rndjWvXdNlO7vAipOrFhlwehVuMptsc+1IbHr/c6onHQj2lOwdp2W555PGjlNwVP5m
	 pdiW07wpxOgwsMUQZrX9pQrTTpjsO/mDPZDi33AM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 061FDF80104;
	Tue, 18 Aug 2020 17:03:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E61A2F80228; Tue, 18 Aug 2020 17:03:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB236F80104
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 17:02:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB236F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Gb+VTDOy"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0F985206B5;
 Tue, 18 Aug 2020 15:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597762976;
 bh=/Au42xAltT4UIkIAu/0BCAbvou4lntMo5L1yDg87RPo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gb+VTDOyjTUgtk3IQY10NgidC0k5bHEanm05OxqNw+2FD/GDTn3v6Zin6FqFGq/RO
 22eOA+toA6ryOWhnLbiKhlqe0YvhboXwQ38lMHCYKsAu/uQeEW6sUG12uftGtfp/4s
 Ov/N2VwdXqVu8XlYzXih7O7ErdO+/PnzQgZlnfDg=
Date: Tue, 18 Aug 2020 16:02:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Brent Lu <brent.lu@intel.com>
Subject: Re: [PATCH v3] ASoC: hdac_hdmi: support 'ELD' mixer
Message-ID: <20200818150225.GC5337@sirena.org.uk>
References: <20200818004413.12852-1-brent.lu@intel.com>
 <20200818143632.16539-1-brent.lu@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pAwQNkOnpTn9IO2O"
Content-Disposition: inline
In-Reply-To: <20200818143632.16539-1-brent.lu@intel.com>
X-Cookie: You're at Witt's End.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
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


--pAwQNkOnpTn9IO2O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 18, 2020 at 10:36:32PM +0800, Brent Lu wrote:
> Add a binary mixer 'ELD' to each HDMI PCM device so user-space can
> read the ELD data of external HDMI display.

Please don't send new patches in the middle of existing threads, it
makes it hard to keep track fo what is going on.

--pAwQNkOnpTn9IO2O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl877YAACgkQJNaLcl1U
h9ALXgf8COAHlHSEiVOtPyp/q80RUFjIinu+Fl/Ici/1rbVn2e6HfyoKPntkcdsN
/MnEHoNs/YceorJgRS27MLtYuH/d7UcuVoaswd52DMV3Jat2VrBE18B4y9xdLgk3
3sAlOgMpfmfvlnCGs1LMtxMjZXML3Ld8cXYAJNr4Eio1+ovXYnZ2ihNtoVXpEhMW
zC9EShuuu0FatftsHxGvHo2wpxxoEeMYSSAQY9lR9Wq1LPQRib4zRubsjsshGp/Q
i2Id2nM7bTrkSfhGtW9MXqNUr7rztZt9YyG/LkEGsUyzCZHBeYIrOKX4M9eZUQNR
epCsSSEFOadhYuaoT+z5P+pxt1CMAA==
=NwDr
-----END PGP SIGNATURE-----

--pAwQNkOnpTn9IO2O--
