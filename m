Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 362931F433F
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 19:51:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE51C1674;
	Tue,  9 Jun 2020 19:51:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE51C1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591725111;
	bh=GmOf7ufLopIQ4dm5tWeT9BTmDlXoHbRAmXYulRxbARg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NstJUbYMFa9gskjLrxvnEz5kwcSCExBf4+jWOt/qL0KCBQfpAiqeNniZd6MpPtPJ5
	 xvEA9bx1XCqMbQBxYu3ssN9dK8n/iy+A5s9/MNlGSo6pXP1aTR7ae3qSl15Ved6kLP
	 SqApTifVZaxJLsaCdwQAKBVK2HKadE/angO/oUx0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3D19F80278;
	Tue,  9 Jun 2020 19:50:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21ABDF8028C; Tue,  9 Jun 2020 19:50:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23C1EF80124
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 19:50:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23C1EF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qBlCD7TE"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1500320801;
 Tue,  9 Jun 2020 17:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591725002;
 bh=GmOf7ufLopIQ4dm5tWeT9BTmDlXoHbRAmXYulRxbARg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qBlCD7TE7EFTt9PmZafc3XGZkCUYr70hyzrVUttbz0QUrhGE+ZKD3ilnm5gavV5aN
 NShzrd92zAMR12KJn5yRqWK6hNb+kNIOu8EonT++JAT1G7MwZYQUkMalwtLgErwqPA
 cfTOtJX7xuvIUUh1lI8qFVC5AfvWBZt9lRQe3g0g=
Date: Tue, 9 Jun 2020 18:50:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [RFC PATCH 2/2] ASoc: tas2563: DSP Firmware loading support
Message-ID: <20200609175000.GO4583@sirena.org.uk>
References: <20200609172841.22541-1-dmurphy@ti.com>
 <20200609172841.22541-3-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vEfizQhTV1P/vojJ"
Content-Disposition: inline
In-Reply-To: <20200609172841.22541-3-dmurphy@ti.com>
X-Cookie: Be careful!  Is it classified?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com
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


--vEfizQhTV1P/vojJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 09, 2020 at 12:28:41PM -0500, Dan Murphy wrote:

>  	.val_bits =3D 8,
> =20
> -	.max_register =3D 5 * 128,
> +	.max_register =3D 255 * 128,
>  	.cache_type =3D REGCACHE_RBTREE,
>  	.reg_defaults =3D tas2562_reg_defaults,
>  	.num_reg_defaults =3D ARRAY_SIZE(tas2562_reg_defaults),

Should some or all of the DSP memory be marked as volatile?  I guess if
we only write program to it then on reload after power off it should be
fine to just blast everything in again and ignore the fact that some
will have changed, but it might be helpful for debugging to be able to
read the live values back and do something more clever for restore.

>  #define TAS2562_PAGE_CTRL      0x00
> +#define TAS2562_BOOK_CTRL      0x7f

*sigh*  Of course the two levels of paging register are not located
anywhere near each other so we can't easily pretend they're one double
width page address.  :/

> +static int tas25xx_process_fw_single(struct tas2562_data *tas2562,
> +				     struct tas25xx_cmd_data *cmd_data,
> +				     u8 *fw_out)
> +{
> +	int num_writes =3D cpu_to_be16(cmd_data->length);
> +	int i;
> +	int ret;
> +	int offset =3D 4;
> +	int reg_data, write_reg;
> +
> +	for (i =3D 0; i < num_writes; i++) {
> +		/* Reset Page to 0 */
> +		ret =3D regmap_write(tas2562->regmap, TAS2562_PAGE_CTRL, 0);
> +		if (ret)
> +			return ret;

Why?

> +
> +		cmd_data->book =3D fw_out[offset];
> +		cmd_data->page =3D fw_out[offset + 1];
> +		cmd_data->offset =3D fw_out[offset + 2];
> +		reg_data =3D fw_out[offset + 3];
> +		offset +=3D 4;
> +
> +		ret =3D regmap_write(tas2562->regmap, TAS2562_BOOK_CTRL,
> +				   cmd_data->book);
> +		if (ret)
> +			return ret;

This manual paging doesn't fill me with with joy especially with regard
to caching and doing the books behind the back of regmap.  I didn't spot
anything disabling cache or anything in the code.  I think you should
either bypass the cache while doing this or teach regmap about the
books (which may require core updates, I can't remember if the range
code copes with nested levels of paging - I remember thinking about it).

> +static ssize_t write_config_store(struct device *dev,
> +				struct device_attribute *tas25xx_attr,
> +				const char *buf, size_t size)
> +{

This looks like it could just be an enum (it looks like there's names we
could use) or just a simple numbered control?  Same for all the other
controls, they're just small integers so don't look hard to handle.  But
perhaps I'm missing something?

> +	tas2562->fw_data->fw_hdr =3D devm_kzalloc(tas2562->dev, hdr_size,
> +						GFP_KERNEL);
> +	if (!tas2562->fw_data->fw_hdr)
> +		return -ENOMEM;
> +
> +	memcpy(tas2562->fw_data->fw_hdr, &fw->data[0], hdr_size);

Should validate that the firmware is actually at least hdr_size big, and
similarly for all the other lengths we get from the header we should
check that there's actually enough data in the file.  ATM we just
blindly copy.

It'd also be good to double check that the number of configs and
programs is within bounds.

--vEfizQhTV1P/vojJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7fy8cACgkQJNaLcl1U
h9DyjAf/U3fDLekpB9MZStpSggO6T3wCfTbWFhFNd8RAcNjhjzxnoumprzpXP7vS
0udC8M7ISpLr6EIdhF6WScsoEWCM/1quzrZ8T3TSAz5pfAiuepmWMYgZiLr532vv
jGtuTYBno7H+Kx4CKOc5+mnd7cFWaSQkxWui3/uwDrWrdQRQRva9oZRW5NdYLFGY
5H2uzDpRDnRetbs4xJztGJ7d4FcgSutaJFsfhe6xMEaN8Hgk73m5UBAK1Epv2LTz
kswZnjp6SO8jdJCLyiblXnliDIRn/ftQz5hTY2ZLUmZ1ylwpbtuoTdGwpp4NoYfU
2Qo3ZYiD2Gd7QnI6Jqb6H6LM/8IMNw==
=c5qv
-----END PGP SIGNATURE-----

--vEfizQhTV1P/vojJ--
