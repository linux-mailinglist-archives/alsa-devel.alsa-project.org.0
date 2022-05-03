Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6846B517FE0
	for <lists+alsa-devel@lfdr.de>; Tue,  3 May 2022 10:40:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5010843;
	Tue,  3 May 2022 10:39:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5010843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651567210;
	bh=eIQQvCZEwukJEi8q99oHoh3BgDr4V6rwzByFYGTPUNk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UoVldDG/MNNXImZBvAfOX6Cp6IOIhCJKt1OWyx7E7YOXNmrtX8feVn+Tl6pZYa5Zn
	 kEET0Io1WjI2hvJe9G132fPPXb3yPoBWV39TWgRaNt8AjQrUDxXxNPghnBBXNjTcB5
	 1qfYwa9AJghlWR0mAEVy7r62IjQWHVeKdrC2/XbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E22BF8025E;
	Tue,  3 May 2022 10:39:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 175E1F80129; Tue,  3 May 2022 10:39:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58750F80129
 for <alsa-devel@alsa-project.org>; Tue,  3 May 2022 10:39:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58750F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="CDf/p+7u"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="c0gNCcsB"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id A79C732009F3;
 Tue,  3 May 2022 04:38:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 03 May 2022 04:38:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1651567137; x=1651653537; bh=BzAECZIEHC
 c0MWNfVYa4bChSwxuC5HSH+DCEkLNcaNM=; b=CDf/p+7ulMxSnPaS/Fsq4RY9u7
 EFFOSKyyilt4W7gLiMnXK8IasANlvZdhrEElFG2IpdqxqtTOiea5ajZ0smItnWjz
 HBXQhSIfA678dmO750PHfFXv7GPB645kWm2wFthLuOA+6MB/rV3kaauqahsFqLK7
 dAfonHkIt9TSkkd+958T4ZM7R0ti0NXJ7qvQ1BhC9qwcM4DuLjTuEvG5IFn2iv93
 Moko+fQZgstF76TS4xEBFThoxBuZKsV1eOI9RR3kcwwyRc8H3msu7HTld4oba/7e
 8u7L0+ZHi1YGbJ13tdOfg/eXkp3lvkCThEQRJAXEZpjXAskeR/4yYwLbQfPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651567137; x=
 1651653537; bh=BzAECZIEHCc0MWNfVYa4bChSwxuC5HSH+DCEkLNcaNM=; b=c
 0gNCcsBOndSK74KDP3QyeWMqPZMnZzbKJ+ts34mmKlHpEgovc8zgwu0fjx8c325R
 o7JYWern9ApalkHN9+cGgWkN/lcz5B0IuGUCwG0601MYl7+kJP0kYS7Pl5vkqOMY
 5Bn2Ww8zIUmjsQnGBMRbJFPqGyvBMj56T/9zVBRvrg8L++i35i1+6X9BaBcGl9ns
 7cOtDUH9stxSAlV6zDI12azeUng5Q8yP7W+GVAqzRwci0tmu+sWVoM7xTcTooYLA
 bTOQqjgEb0CXp9hxumDL3YdYjGB+0ACj5U+qzDIx+unjH3hHb+IjBM0goQORxZvO
 DXU9ld1colPzuDwx1HlUA==
X-ME-Sender: <xms:H-pwYvdDq3Zazof8DVN0DqZEWW2gHPMb7Uf9tqbAdWDs4MozIF5kdQ>
 <xme:H-pwYlP2pYetacNmvUdxYdTl2uP1M_-yXU2v7LPtJRIKM8N73DnTyh1SUUJAknAYQ
 Yq5IhokigyF8sx8VVc>
X-ME-Received: <xmr:H-pwYojL3OKgZkTpuh-tktW3b5Uws5yGPC0BTyDczMDESLhvFEGp5JVs9sz2GCM6JMma0IEND4383q-p4UGZs7MfYV-eZTo1IPmNn0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgddtiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffh
 vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:H-pwYg9FIs0ySLv8K8nMSOoiMaCq9HC5fQIdAe0XKmek8m3lhHMjJw>
 <xmx:H-pwYrulugmwWxw_jEBgeqsixVvYmH0bWiKk0xBRUWsaXAtloGKWDA>
 <xmx:H-pwYvEuqUhkzJFQjIdx4OUH2sVeP-PG6J0LS9TZ8NZ_zsaELThMRA>
 <xmx:IepwYhCm9cSYl5sG7umuIA0n7KsIHZgXOgKDSGvFUdnLskqj95Wzdw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 May 2022 04:38:54 -0400 (EDT)
Date: Tue, 3 May 2022 10:38:52 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sugar Zhang <sugar.zhang@rock-chips.com>
Subject: Re: [PATCH v2] ASoC: hdmi-codec: Add option for ELD bypass
Message-ID: <20220503083852.be2aihvkd3gestdw@houat>
References: <20220430134006.v2.1.Ide2a04ad0c123cc6990a63632e6f9bb7d7f9be13@changeid>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vsmb6pic4bsb7zjz"
Content-Disposition: inline
In-Reply-To: <20220430134006.v2.1.Ide2a04ad0c123cc6990a63632e6f9bb7d7f9be13@changeid>
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org,
 Dmitry Osipenko <digetx@gmail.com>
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


--vsmb6pic4bsb7zjz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Apr 30, 2022 at 01:41:18PM +0800, Sugar Zhang wrote:
> This patch allow users to enable "ELD Bypass" who don't
> care anything from EDID Link Data.
>=20
> Currently, this driver gets ELD(from EDID) to constraint
> channels and rates.
>=20
> Unfortunately, EDID is not always valid, maybe caused by
> the fragile HDMI port or cable, in this situation, the max
> features are limited to 48kHz stereo.
>=20
> So, add this option to allow user to select the manual way
> to output audio as expected. such as multi-channels LPCM(7.1),
> or HBR bitstream for these sink devices.
>=20
> Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>

I think some more documentation is needed there to describe how it's
going to be used.

Like, you mention that it's relevant when the EDID is not valid. But if
the EDID is valid, is bypass still allowed or not?

> ---
>=20
> Changes in v2:
> - Use MACRO SOC_SINGLE_BOOL_EXT to simplify code.
>   Fix event_missing checked by mixer-test.
>   Add suffix "Switch" for "ELD Bypass".
>=20
>  sound/soc/codecs/hdmi-codec.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
>=20
> diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
> index b07607a..be46fbd 100644
> --- a/sound/soc/codecs/hdmi-codec.c
> +++ b/sound/soc/codecs/hdmi-codec.c
> @@ -275,6 +275,7 @@ struct hdmi_codec_priv {
>  	unsigned int chmap_idx;
>  	struct mutex lock;
>  	bool busy;
> +	bool eld_bypass;
>  	struct snd_soc_jack *jack;
>  	unsigned int jack_status;
>  	u8 iec_status[AES_IEC958_STATUS_SIZE];
> @@ -427,6 +428,31 @@ static int hdmi_codec_iec958_mask_get(struct snd_kco=
ntrol *kcontrol,
>  	return 0;
>  }
> =20
> +static int hdmi_codec_eld_bypass_get(struct snd_kcontrol *kcontrol,
> +				     struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	struct hdmi_codec_priv *hcp =3D snd_soc_component_get_drvdata(component=
);
> +
> +	ucontrol->value.integer.value[0] =3D hcp->eld_bypass;
> +
> +	return 0;
> +}
> +
> +static int hdmi_codec_eld_bypass_put(struct snd_kcontrol *kcontrol,
> +				     struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	struct hdmi_codec_priv *hcp =3D snd_soc_component_get_drvdata(component=
);
> +
> +	if (hcp->eld_bypass =3D=3D ucontrol->value.integer.value[0])
> +		return 0;
> +
> +	hcp->eld_bypass =3D ucontrol->value.integer.value[0];
> +
> +	return 1;
> +}

If the ELD bypass is set, how does it affect the hdmi_codec_params being
passed to the codec?

Also, what is being returned to the userspace by hdmi_eld_ctl_get once
the bypass is enabled?

And shouldn't we call get_eld when we remove the bypass?

Maxime

--vsmb6pic4bsb7zjz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYnDqHAAKCRDj7w1vZxhR
xYFvAQC7m4KBlm36tbwsjZTfWnJesyZYJ5lan8/tRFKlZRiidwD/QD7WXOeCP25C
zFR2E3NRujtrrAzaMkv3nHKGNcZWsQw=
=QLIB
-----END PGP SIGNATURE-----

--vsmb6pic4bsb7zjz--
