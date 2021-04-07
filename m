Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B058356FFE
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Apr 2021 17:17:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 206461661;
	Wed,  7 Apr 2021 17:16:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 206461661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617808649;
	bh=94PRIMWG4V3sgv4oARYxnmjhrvLu3NubLdmmO0Dgjuo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SMKruqIw+qSbs6kXGI69YCgbDCzEgqQWlM0F7WeDqXrMZMgEgT9IQEN/RfM14dRK5
	 AcKVZj8U6q/kFTX7NzlScNbWZxuOPUfiN6Bmn0kM66UvI+zfehmxXUiLpPQKoWbkOs
	 mA+k1eNiiLXMxIX20OcIwOWxyM0BfpLmDjakYc/w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C904F80168;
	Wed,  7 Apr 2021 17:16:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB685F8016A; Wed,  7 Apr 2021 17:15:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DC68F80124
 for <alsa-devel@alsa-project.org>; Wed,  7 Apr 2021 17:15:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DC68F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BF4g7p0G"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5764B61222;
 Wed,  7 Apr 2021 15:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617808551;
 bh=94PRIMWG4V3sgv4oARYxnmjhrvLu3NubLdmmO0Dgjuo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BF4g7p0GvM/lL5494Bp3z0or+u55EH1ofQEvNHjxLj+3XFtOLnH2ISD6pmDUnUq+I
 gHc6wiOwVnWBBjROSmxmEaPuvwrp6DcXa5bIjh3wt5+fMj7OCH101qsGf9hQhIsV2Q
 QIfX4rbNgx2fI4DZ+ET4nYzsuXX8z1FLgecYf0yZpybvjzQFDrDKMM+uqKUOVUxQwP
 0gRQX1u5wM0ZV1ly4QlWEuzuD53BmxKwIJ5YiXHZSGafS5a8bI765b+sJddaXfL81F
 tnZB8N/hcv/RQrQNyzNfv89gpLntv/UML2/GLiJ3qGVRfolY0V/Y5VzJw2VsAUJ1L6
 y8MSVCCUIPiew==
Date: Wed, 7 Apr 2021 16:15:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Perry Yuan <Perry.Yuan@dell.com>
Subject: Re: [PATCH v6 2/2] ASoC: rt715:add micmute led state control supports
Message-ID: <20210407151534.GE5510@sirena.org.uk>
References: <20210404083159.1620-1-Perry_Yuan@Dell.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4Epv4kl9IRBfg3rk"
Content-Disposition: inline
In-Reply-To: <20210404083159.1620-1-Perry_Yuan@Dell.com>
X-Cookie: Dry clean only.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, mgross@linux.intel.com,
 hdegoede@redhat.com, lgirdwood@gmail.com, Mario.Limonciello@dell.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com,
 platform-driver-x86@vger.kernel.org, pobrn@protonmail.com,
 mario.limonciello@outlook.com, Dell.Client.Kernel@dell.com,
 linux-kernel@vger.kernel.org
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


--4Epv4kl9IRBfg3rk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 04, 2021 at 04:31:59PM +0800, Perry Yuan wrote:

> +static bool micmute_led_set;
> +static int  dmi_matched(const struct dmi_system_id *dmi)
> +{
> +	micmute_led_set = 1;
> +	return 1;
> +}

This isn't how we usually record DMI quirks, usually we'd query once on
probe and store the data in the driver data struct - see other users for
examples.

> @@ -358,6 +388,7 @@ static int rt715_sdca_put_volsw(struct snd_kcontrol *kcontrol,
>  	unsigned int mask = (1 << fls(max)) - 1;

> +	dmi_check_system(micmute_led_dmi_table);
> +	if (invert && micmute_led_set) {

This check for invert is odd and could probably use a comment.

--4Epv4kl9IRBfg3rk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBtzJUACgkQJNaLcl1U
h9Dpcwf9F6efsgl8SxB48L2h93SnAp+aXJZGvsihl3talmxVNg7zmoGcUoHsDMU8
Q48ZaYHXa2Zehw7UMpBlQ1Iww60W43c3yVSv5xS9C5FZdr7pvn0fjVhVX121uSTt
BeTI2r8BH0ndjb29prof+duUTHGBx+I81NjAC7aK26EIcnkHZqREM1dhVbJtSd+I
p+ofEZVpTswy5qECN1/JtYf6QvlRJ3x0QOCaq8E4Sj1URTRP3NCMSJH9h/WaItae
sJvELh1IcUMel0ElT1TEtf/fgDZVgiQh3PmRkA6qtrqturKrWSw61T99EE80Rn7j
ZsK6s1vQEXo5vslhtx5JoOGtK8wDTQ==
=w3kO
-----END PGP SIGNATURE-----

--4Epv4kl9IRBfg3rk--
