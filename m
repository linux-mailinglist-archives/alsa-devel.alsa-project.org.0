Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9AB303EDB
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jan 2021 14:38:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF6C617A7;
	Tue, 26 Jan 2021 14:37:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF6C617A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611668315;
	bh=7YuUvSQdT/9yQpCdwou6DuNUmWTWxxjjqnzdhUxKMK8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=shGiZrZxZTccBMQCkDAJMoWV5k2JLCoDYwiM95jUY+YgR07az410MhYKExkfelvb2
	 MT5d7x0WvyzcaS7OrQ0F2KMYSIE9pi5mLG88jvWpuWrCsSqqdjyRa3dC44A1uLiFIQ
	 4Ti4v4iNPz2obuJ61SO/vZbc4CBQ1fnMocvElnM0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DD15F801D8;
	Tue, 26 Jan 2021 14:37:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83CA7F8015B; Tue, 26 Jan 2021 14:37:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD38BF80108
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 14:36:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD38BF80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="h+zW47f0"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 20D2C22B2C;
 Tue, 26 Jan 2021 13:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611668214;
 bh=7YuUvSQdT/9yQpCdwou6DuNUmWTWxxjjqnzdhUxKMK8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h+zW47f0+3+RQT2TlLNwAa4MyB7Ke1ery+xx05yjejwV46aDOaDvU+RyMgry83RBV
 4q/Qo2Q8HxI4Kzph+86wzFUk+4xVtP04A9Nn5cU8KHOFC8w3r7YIwDzm/V1mOeNjBf
 JlRVz/QMWztT2X4z9w1VhHJ+M3a423+Ztz06HDEQooxlFPq3c6ZL1I7UTWYfKp15tP
 DkpEtC0nHHHLo2vsBYdRPdkKoaL86XMgu/0X5u+Mx3TO8WkNV6Q9XwDxGKGeRmuQMj
 6VsoA3DJibkJjEEIkkrmcrvgejzuwUAyeyTL1/31dnAaCcsda2zeFhcUXTYQ4yn5VM
 im9BDQwWsv8RQ==
Date: Tue, 26 Jan 2021 13:36:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [RFC PATCH 1/2] ASoC: soc-component: add
 snd_soc_component_read/write_field()
Message-ID: <20210126133612.GB4839@sirena.org.uk>
References: <20210126122020.19735-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7iMSBzlTiPOCCT2k"
Content-Disposition: inline
In-Reply-To: <20210126122020.19735-1-srinivas.kandagatla@linaro.org>
X-Cookie: I don't understand you anymore.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, vkoul@kernel.org
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


--7iMSBzlTiPOCCT2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 26, 2021 at 12:20:19PM +0000, Srinivas Kandagatla wrote:

> +#define __soc_component_field_shift(x) (__builtin_ffs(x) - 1)

Why not have this be a static inline?

> +unsigned int snd_soc_component_read_field(struct snd_soc_component *component,
> +					  unsigned int reg, unsigned int mask)
> +{
> +	unsigned int val;
> +
> +	mutex_lock(&component->io_mutex);
> +	val = soc_component_read_no_lock(component, reg);
> +	if (mask)
> +		val = (val & mask) >> __soc_component_field_shift(mask);

I don't understand why this is open coding the locking when it's just a
simple read and then shift?

> +	mutex_lock(&component->io_mutex);
> +
> +	old = soc_component_read_no_lock(component, reg);
> +
> +	val = val << __soc_component_field_shift(mask);
> +
> +	new = (old & ~mask) | (val & mask);
> +
> +	change = old != new;
> +	if (change)
> +		ret = soc_component_write_no_lock(component, reg, new);
> +
> +	mutex_unlock(&component->io_mutex);

This needs the lock as it's a read/modify/write but could also be
implemented in terms of the existing update_bits() operation rather than
open coding it.

--7iMSBzlTiPOCCT2k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAQGssACgkQJNaLcl1U
h9DlKgf9FlXbJvk+CCVzGfmugYnMLXiQZZUgTx5sDr4Ulxd2ZLhz/j2mSFj8Ja2z
4nPYXI/DVdIyErnosbKx7bqd7NMhm61FhTAyr4CLbnB/2ZIRDcLw66HwsLcMtqW2
6oV0fd7YCyjs5kqaNToDn/upr3jWqOmYkKLGoOoFpIThQxce7QXmnlD1TkkmtTUa
cwUukMLQHb+kP3fTxJQ5F8++DvVZfFzRwQEuadPvzkA+uCCA/wyYT/S6+u8Kc3Hi
1vWfXsrwiqGqQEd4lsj1hPLeiJ+T/VRsy2qn0eYUUmPPj3eH00xFrwS3mXEHPVRH
K5Se9hdIHYO+s3HNPjepVcY0I0h1tg==
=mgxe
-----END PGP SIGNATURE-----

--7iMSBzlTiPOCCT2k--
