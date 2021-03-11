Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EDE337312
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 13:52:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5BA6180D;
	Thu, 11 Mar 2021 13:51:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5BA6180D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615467138;
	bh=u+CzpK507sm6H5psrFndpFOIH25rMKWSpnpEg0xx/YY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FrQFmGodL2kb3fvMieT002rFWdAuCaBMA+60R/Zs89Jw8YoM5ue6ZjkwS4606p5IP
	 Ft3FcR+FQyP6WL0tH9bDEYaysSpW9IGs5eVdv6wam959OwqZBgjvsLwzoLQWvPiaTT
	 oVQ9EmUex+6LVCefMicq/b8FtKmHWJDQBg3cTX7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FBF6F80227;
	Thu, 11 Mar 2021 13:50:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02E47F80227; Thu, 11 Mar 2021 13:50:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3996BF800BF
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 13:50:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3996BF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uCm2iQLx"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28D5164E92;
 Thu, 11 Mar 2021 12:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615467018;
 bh=u+CzpK507sm6H5psrFndpFOIH25rMKWSpnpEg0xx/YY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uCm2iQLxJFhSr7cr3pM5TPjpeS8rfvE8FwgJxkhmaIriq0cppoLzhdXmhtode+je6
 +t5LPDgAnMQXkwn/WWyGigwZlTP0LezmpchgOgrLS4vmqC3dVy+zmoVXjYXcJnFIib
 hGIwDHcBJ1eWVEVNjxabfHC7ArbiFjBBNnOXsEfbTpRsUC+7+cEPABB8k7/3K3uDux
 fOz5lghrRdEWLUx+DKSV9xlNsDzoFPNNC0VBLC/L+fsBhbP/9WUb+Tk8pzVUKhqSpz
 O+HYFqeCntdMnDnJ0ItWzdZpuK8SbSncTAQDTWWFmRMI8glWKR1RhDcqTqGk/YNZ0J
 LjAt9z/U/4aGQ==
Date: Thu, 11 Mar 2021 12:49:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [RFCv2] ASoC: Add Rockchip rk817 audio CODEC support
Message-ID: <20210311124905.GB4962@sirena.org.uk>
References: <SN6PR06MB53425EF2BAED66E61C22EA9EA5919@SN6PR06MB5342.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="U+BazGySraz5kW0T"
Content-Disposition: inline
In-Reply-To: <SN6PR06MB53425EF2BAED66E61C22EA9EA5919@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Cookie: I'm rated PG-34!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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


--U+BazGySraz5kW0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 10, 2021 at 05:44:16PM -0600, Chris Morgan wrote:

At a very high level this doesn't really look like it integrates with
the framework as much as it should - the way this driver is written
doesn't really have much resemblance to how other ASoC drivers are
written beyond a very superficial level.  Please take a look at what
other drivers are doing and try to ensure that this is working with the
framework in an idiomatic way.

> index 000000000000..6d4e05440dae
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/rockchip,rk817-codec.txt
> @@ -0,0 +1,39 @@
> +* Rockchip rk817 codec

New DT bindings should be in YAML format.

> diff --git a/drivers/mfd/rk808.c b/drivers/mfd/rk808.c
> index ad923dd4e007..adb8a7da29db 100644
> --- a/drivers/mfd/rk808.c
> +++ b/drivers/mfd/rk808.c
> @@ -163,6 +163,12 @@ static const struct mfd_cell rk817s[] =3D {
>  		.num_resources =3D ARRAY_SIZE(rk817_rtc_resources),
>  		.resources =3D &rk817_rtc_resources[0],
>  	},
> +#ifdef CONFIG_SND_SOC_RK817
> +	{
> +		.name =3D "rk817-codec",
> +		.of_compatible =3D "rockchip,rk817-codec",
> +	},
> +#endif
>  };
> =20

This should be a separate patch and should be sent via the MFD
maintainers.  You shouldn't add an of_compatible here, obviously ever
RK817 has the CODEC functionality so this is just describing how Linux
chooses to split the device up rather than any property of the hardware.

> +static int rk817_reset(struct snd_soc_component *component)
> +{
> +	snd_soc_component_write(component, RK817_CODEC_DTOP_LPT_SRST, 0x40);
> +	snd_soc_component_write(component, RK817_CODEC_DDAC_POPD_DACST, 0x02);
> +	snd_soc_component_write(component, RK817_CODEC_DTOP_DIGEN_CLKE, 0x0f);
> +	snd_soc_component_write(component, RK817_CODEC_APLL_CFG0, 0x04);
> +	snd_soc_component_write(component, RK817_CODEC_APLL_CFG1, 0x58);
> +	snd_soc_component_write(component, RK817_CODEC_APLL_CFG2, 0x2d);
> +	snd_soc_component_write(component, RK817_CODEC_APLL_CFG3, 0x0c);
> +	snd_soc_component_write(component, RK817_CODEC_APLL_CFG4, 0xa5);
> +	snd_soc_component_write(component, RK817_CODEC_APLL_CFG5, 0x00);
> +	snd_soc_component_write(component, RK817_CODEC_DTOP_DIGEN_CLKE, 0x00);
> +

This appears to be configuring the CODEC in ways that I'd expect to be
configured via internal APIs and/or controls, especially the PLL setup
there looks like it's probably platform specific.

> +static struct rk817_reg_val_typ playback_power_up_list[] =3D {
> +	{RK817_CODEC_AREF_RTCFG1, 0x40},
> +	{RK817_CODEC_DDAC_POPD_DACST, 0x02},
> +	{RK817_CODEC_DDAC_SR_LMT0, 0x02},

Similarly this looks like it's a hard coded register write sequence for
a specific platform.

> +/* For tiny alsa playback/capture path*/
> +static const char * const rk817_playback_path_mode[] =3D {
> +	"OFF", "SPK", "HP", "SPK_HP"};
> +
> +static const char * const rk817_capture_path_mode[] =3D {
> +	"MIC OFF", "MIC"};

The routing within the device should be mapped using DAPM rather than
with some custom control with hard coded paths and sequences.

> +static const struct regmap_config rk817_codec_regmap_config =3D {
> +	.name =3D "rk817-codec",
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.reg_stride =3D 1,
> +	.max_register =3D 0x4f,
> +	.cache_type =3D REGCACHE_NONE,
> +	.volatile_reg =3D rk817_volatile_register,
> +	.writeable_reg =3D rk817_codec_register,
> +	.readable_reg =3D rk817_codec_register,
> +	.reg_defaults =3D rk817_reg_defaults,
> +	.num_reg_defaults =3D ARRAY_SIZE(rk817_reg_defaults),
> +};

It's weird that there's a regmap configuration here rather than the
regmap being shared with the rest of the MFD.

--U+BazGySraz5kW0T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBKEcEACgkQJNaLcl1U
h9CUKwf8Dddm5o3uNnoGlJmNqjnySPlPK9PnA9yGfJpBKNBWHxiFoLk7T4AVDZR4
8Vr+BK16CggiOWZKnuqwg68iBFbL3+/Fr5I80mZ/8LLOtUjDEq5eepu4TWcs7Grh
piiZQ4eR+7URdquUnbhxtcIJATfaVcotkpa3Bu1aSUJ1WrHjLSwYDIfvSQbO3Y2X
UzAXf/4KmVVG9yCFwJNjawjBt4thuNkqhiU1fzZp3IbQusJpUbWDoLt7vjc2TW04
ORiwiZ3Ox9xEBkXnQX2Y0DwkYMj8Jf9jnfd84wbwgh5Hv5q8/94l2/w8fkDgCQAV
XdOHYNbRRxBD+Ha+9aPIhKO70hBiVw==
=8PFC
-----END PGP SIGNATURE-----

--U+BazGySraz5kW0T--
