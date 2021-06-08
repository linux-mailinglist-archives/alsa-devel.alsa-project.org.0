Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A52339F859
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:01:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D9FD16E2;
	Tue,  8 Jun 2021 16:00:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D9FD16E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623160887;
	bh=R9hf4ZVc2SpqzMLGCW7d9b+1S3+YNbGXeQifqiTAfl8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bmc69uvSJHmqfBFWM3SpQssajC+1GMyeUTGSr26rw47AzPNvaUePh5fdAD5OPenBJ
	 3GtcxQ3hB5h3z14k6hEnxUZpryuBZdfbBDq7mBCa0qFPJQp3Gd9Lt0yDB934GWM+p8
	 sNNTc3wzU8k1WZG0FJaXiO+P7O0x/Knes7ye0W90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E8EEF800FD;
	Tue,  8 Jun 2021 15:59:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6378F80218; Tue,  8 Jun 2021 15:59:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 048EAF8019B
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 15:59:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 048EAF8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="W+E6tajR"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A8E3761351;
 Tue,  8 Jun 2021 13:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623160788;
 bh=R9hf4ZVc2SpqzMLGCW7d9b+1S3+YNbGXeQifqiTAfl8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W+E6tajR6HcynJTDe6jhyeDxhcUbz8PDUe3m5Bn9ZjdTNnhwanFV1QRuBhKvUr2Kh
 2kJgKdlH3nUWAIshi2RnUvWItkIPJXX8IveiO4q2KfiUKy2R3OOnaG67XMmQc0+nXW
 Jb9Jh2d/kBCoYyqFQaWdjn6xuv8GUNKhsmSCNMhtKWevAhZebfAorUaDk/XgzkId3d
 gaD194pzsnyh4fBBGXy4V64rUv6RqBx7vf1jBylXqcM3+PxEib0lf9zt29S7pFmpbh
 C1eMYMALyAoOfmOwADs2ekTxbgD2YlDoghwECRM3/EbFSnlm9GFxnk/jDKgJ0t/u3t
 oZu3mR8iOA4rQ==
Date: Tue, 8 Jun 2021 14:59:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v8 6/9] ASoC: codecs: wcd938x: add basic controls
Message-ID: <20210608135933.GE4200@sirena.org.uk>
References: <20210601113158.16085-1-srinivas.kandagatla@linaro.org>
 <20210601113158.16085-7-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="HnQK338I3UIa/qiP"
Content-Disposition: inline
In-Reply-To: <20210601113158.16085-7-srinivas.kandagatla@linaro.org>
X-Cookie: Auction:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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


--HnQK338I3UIa/qiP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 01, 2021 at 12:31:55PM +0100, Srinivas Kandagatla wrote:

> +static int wcd938x_rx_hph_mode_put(struct snd_kcontrol *kcontrol,
> +				   struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
> +	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
> +
> +	wcd938x->hph_mode = ucontrol->value.enumerated.item[0];
> +
> +	return 0;
> +}

_put() should return true if it made a change, the same bug is present
in a lot of other drivers too.

> +static const struct snd_kcontrol_new wcd9380_snd_controls[] = {
> +	SOC_ENUM_EXT("RX HPH Mode", rx_hph_mode_mux_enum_wcd9380,
> +		     wcd938x_rx_hph_mode_get, wcd938x_rx_hph_mode_put),
> +	SOC_ENUM_EXT("TX0 MODE", tx_mode_mux_enum_wcd9380[0],
> +		     wcd938x_tx_mode_get, wcd938x_tx_mode_put),
> +	SOC_ENUM_EXT("TX1 MODE", tx_mode_mux_enum_wcd9380[1],
> +		     wcd938x_tx_mode_get, wcd938x_tx_mode_put),
> +	SOC_ENUM_EXT("TX2 MODE", tx_mode_mux_enum_wcd9380[2],
> +		     wcd938x_tx_mode_get, wcd938x_tx_mode_put),
> +	SOC_ENUM_EXT("TX3 MODE", tx_mode_mux_enum_wcd9380[3],
> +		     wcd938x_tx_mode_get, wcd938x_tx_mode_put),
> +};

Please don't use this pattern of indexing into arrays by absolute
number, it's error prone and hard to read.  Just declare static
variables for the enums and reference them individually.

--HnQK338I3UIa/qiP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmC/d8QACgkQJNaLcl1U
h9BaYgf/X23DLW+LGGdVIwyniq5WCdfl7Dc/btd+vAgkelUwclvB6Pl1Zw66kuVZ
0Vl+eDcoldYEFDznPWS+TOyWkSs5MGmttYtMmmf9EEznvLJvHiNnbKgmXXas2VQm
m3eu6nCCy5ZKoG0kNmsvjS8HUtMAtu3+oTS5KO4AZThEK/o0ujnztR9szPXkHP/0
pIRsfKiuDjNLis5fWeb1OAc0Pu+2mujfiII48rj0BTHzLLaPKHxiblt5t8T472TT
38wnhKbCQvQimxd5owse/dM31lcTVx0HCEGnlOIE/rSjiCgJrOfnszN4IMZLgzST
aQAeTfaRDEGkYFWDHuS/1W+9HW02aQ==
=hi4X
-----END PGP SIGNATURE-----

--HnQK338I3UIa/qiP--
