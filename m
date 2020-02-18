Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 956CB162FD0
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 20:25:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 153C71692;
	Tue, 18 Feb 2020 20:24:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 153C71692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582053911;
	bh=gQhUGUSeGYs+1xZPVYd52aPv3VYM0O0vUd+5QxYItLg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lZpxno5DHmEzCq2HgDcxox9M+B6pYEHWzHwoEuTfe5HbgkcN+TVDmmMyOR9dLuBWQ
	 yUgz/JGTVBnhx08l1FaKq8YBAv7S+d8rxEgGALx4rb6Dl2bbXUmytjgwxtA2DH6uh6
	 DaQ/3GSn5Whd7c+dfDi+nk2092DXAfGsUmeexRbM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1ECC2F8014A;
	Tue, 18 Feb 2020 20:23:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB461F80148; Tue, 18 Feb 2020 20:23:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 42A54F80137
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 20:23:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42A54F80137
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39CFD31B;
 Tue, 18 Feb 2020 11:23:23 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE5633F703;
 Tue, 18 Feb 2020 11:23:22 -0800 (PST)
Date: Tue, 18 Feb 2020 19:23:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 2/2] ASoC: tlv320adcx140: Add the tlv320adcx140 codec
 driver family
Message-ID: <20200218192321.GN4232@sirena.org.uk>
References: <20200218172140.23740-1-dmurphy@ti.com>
 <20200218172140.23740-3-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="b1ERR0FXR0PvNIRE"
Content-Disposition: inline
In-Reply-To: <20200218172140.23740-3-dmurphy@ti.com>
X-Cookie: No alcohol, dogs or horses.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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


--b1ERR0FXR0PvNIRE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 18, 2020 at 11:21:40AM -0600, Dan Murphy wrote:

A couple of very small things, otherwise this looks good:

> +	if (unlikely(!tx_mask)) {
> +		dev_err(component->dev, "tx and rx masks need to be non 0\n");
> +		return -EINVAL;
> +	}

Do you really need the unlikely() annotation here?  This is *hopefully*
not a hot path.

> +static int adcx140_codec_probe(struct snd_soc_component *component)
> +{
> +	struct adcx140_priv *adcx140 = snd_soc_component_get_drvdata(component);
> +	int sleep_cfg_val = ADCX140_WAKE_DEV;
> +	u8 bias_source;
> +	u8 vref_source;
> +	int ret;
> +
> +	adcx140->supply_areg = devm_regulator_get_optional(adcx140->dev,
> +							   "areg");
> +	if (IS_ERR(adcx140->supply_areg)) {

You should really do the request and defer at the I2C level, that avoids
running through the whole card initialization repeatedly when the device
isn't ready.  Basically try to do all resource aquisition at the device
level and then use it at the card level.

--b1ERR0FXR0PvNIRE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5MOagACgkQJNaLcl1U
h9Chkwf/aMC28AErRf96cbNZaa0JETsT1ZBpqi+o02dFL9JyXHDeMaOYtKdHNSkd
AaY5N6tioO/1AuvEed8mWfrlwnDjF2phkINUIZEZMqUHaU/YPRZrmGJvLfTMV2R4
aXyjU31pkz+VNNAwmX42BagezDOUh4XR1hpVInqNSbhUfv7mUeZCiemsYmwsNgXU
Q8fGLBTDHMDAQ3D0HsowNJKTSfcuNzIKbU1K3W4ZRsJrr7Be8zVhzZll/IqBzkdN
CMvufpVukGPruNgFdFQpiswM4oqBbKs5vEPrrrzYURxK+9G+nN4qP3rRb323o6LE
KhaVYwNfXlfsL0RViR7OgbcQpYRTtg==
=n7UO
-----END PGP SIGNATURE-----

--b1ERR0FXR0PvNIRE--
