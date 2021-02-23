Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D037322BA2
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 14:47:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 028941675;
	Tue, 23 Feb 2021 14:46:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 028941675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614088066;
	bh=iUWoW7ZqYFe8F7SwoDPBFKP/j1giKV2m0mOThiAczoA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u1nDon4L4IOx+c7RbGk7zqYGl3pnG/hO+OUJEnfvxjglArcn9w3xGAKj2dfddvIfW
	 uLKqi7pKWDaxv51xL5edAkcZcKH4M9pSqh75VyIanFVcwJUPl1oaV1lAYEt/7477q5
	 fS2iemJAswCLNZcsrV4R0iFG57CxNaKDGrSUxDm8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B2F3F8016D;
	Tue, 23 Feb 2021 14:46:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDA24F8016A; Tue, 23 Feb 2021 14:46:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 568CBF800B4
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 14:46:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 568CBF800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oi1n9wXf"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2FE9364D9A;
 Tue, 23 Feb 2021 13:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614087968;
 bh=iUWoW7ZqYFe8F7SwoDPBFKP/j1giKV2m0mOThiAczoA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oi1n9wXfUSBXyQUdXaOarx9J1Adksfh/bBDuunJx3eSfsyWG7PhYIQL1qYBl65HWU
 RGYXrDsl66HymzPfLoRKesHamHQ5bLJKC6Xy/5sZpql48EnFgwky8tYgVkzU4WB7jj
 S1AShLolSEE23eOzBMZ5PfleSPmZMOosKN7bMfBFuuvU4si/NLVfWlxAt29S0ScSzD
 KglMO+XzcwzoFp4IzekEGxcInooNPB0EzZIju+aP2UhdSVIm7oRvWk+BAbP28vgvBN
 Zne+zkxupMcYIe00zi3ygZ7AtJaD/YGs2f0eLPp1UuebZF2A1eWtykXir3iWaUZi/v
 saKtjSzXLHaEQ==
Date: Tue, 23 Feb 2021 13:45:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC 2/2] ASoC: rt5670: Add LED trigger support
Message-ID: <20210223134506.GF5116@sirena.org.uk>
References: <20210215142419.308651-1-hdegoede@redhat.com>
 <20210215142419.308651-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hwvH6HDNit2nSK4j"
Content-Disposition: inline
In-Reply-To: <20210215142419.308651-3-hdegoede@redhat.com>
X-Cookie: Kilroe hic erat!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <bard.liao@intel.com>
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


--hwvH6HDNit2nSK4j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 15, 2021 at 03:24:19PM +0100, Hans de Goede wrote:

> Add support for controlling a speaker and/or microphone mute LED through
> LED triggers using the new generic LED trigger module.

> -	SOC_DOUBLE_EXT("DAC1 Playback Switch", SND_SOC_NOPM, 0, 1, 1, 0,
> +	SOC_DOUBLE_EXT_ACCESS("DAC1 Playback Switch", SND_SOC_NOPM, 0, 1, 1, 0,
> +			SNDRV_CTL_ELEM_ACCESS_SPK_LED,
>  			rt5670_dac1_playback_switch_get, rt5670_dac1_playback_switch_put),

> -	SOC_DOUBLE("ADC Capture Switch", RT5670_STO1_ADC_DIG_VOL,
> -		RT5670_L_MUTE_SFT, RT5670_R_MUTE_SFT, 1, 1),
> +	SOC_DOUBLE_ACCESS("ADC Capture Switch", RT5670_STO1_ADC_DIG_VOL,
> +			  RT5670_L_MUTE_SFT, RT5670_R_MUTE_SFT, 1, 1,
> +			  SNDRV_CTL_ELEM_ACCESS_MIC_LED),

Why just these particular controls - what if a system has separate mutes
for speakers or something?

--hwvH6HDNit2nSK4j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA1BuEACgkQJNaLcl1U
h9AZ1Af+K5c94P6GgqTME3GcrB8BgmawUxVSXz9vzz2K902WKLquVFLh2x436cvc
pOdgw63EhM3TRkWH82enavVjpfleZk5ojdj5i43Fj+U87joHYwNeA1exCxEcT7Cj
wcdLjL3GZ5iDuOBiVFSZgZp8ZIrs3r3XPY5owFic81Kj/YnLZncSqHAa5vTdV56E
0/c4nJ1OT5gqKOmWza6jqU+SCWR71O2i8p8nHSp8mLcyfjfT6ceA3i6wGSH5/H3k
0QUNiHKK11SDanOvtfVrMF65KbQVE2osiqT+jU5Bj22qJFMFsFLKxAbZNSDHurkf
LKu9ePGh+4TvoUNXk0AxTHdclllQPA==
=9RnW
-----END PGP SIGNATURE-----

--hwvH6HDNit2nSK4j--
