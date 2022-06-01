Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F7A53A9E7
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jun 2022 17:25:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0810A16FE;
	Wed,  1 Jun 2022 17:24:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0810A16FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654097120;
	bh=uA4jHwG3kHh3De4WxnvkKwLc9wuqwnI7qS74Mkddhko=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UlDHUc9gNducm2gwswhI+i0NCsNJStF4uEE3wRMSnj6EqufAFe2B2pEAz41wH+kM2
	 6Mb9HSl1zwE6tmBz+bZMjKcO61vbx4ufK7TOxcZoeS8cP5A2mWOT6y6JxuIeeWLrLV
	 NDizXPC20ROL7c/1huFPtmpiQCe835qfoXOY+PZc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C4B5F80089;
	Wed,  1 Jun 2022 17:24:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80649F80238; Wed,  1 Jun 2022 17:24:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81D08F800BD
 for <alsa-devel@alsa-project.org>; Wed,  1 Jun 2022 17:24:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81D08F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LDr2iW80"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9DDD8B81B58;
 Wed,  1 Jun 2022 15:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8D7C385B8;
 Wed,  1 Jun 2022 15:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654097052;
 bh=uA4jHwG3kHh3De4WxnvkKwLc9wuqwnI7qS74Mkddhko=;
 h=Date:From:To:Cc:Subject:From;
 b=LDr2iW80qbzoJdls+zE5q5FiQdhEqOGRV1azrbsGPXAEfQdiUJG9T2nS/UYehKNbV
 5JyGVRt+140GNhBHtbZ+a2PrxlA2WiFSLTy8DAC5Ob8/D6i7Nx05TFTAehQU+tvOcj
 erOZwxYGKoCXOVlTGt/RqVitcgoLx5qhvatfLKcuptJVDhR52Q8A/Yb0uWelkqzcaa
 Sjru/86iNw1Ia7PlhrqgzdMFRazFas61us4MnvDOHt01NZKBT4HuEi9gmAQYrZnF65
 77m0iFO7VRcYnO6KaaF3e//L6PkgCAZSmhE/FG41fKtZzI47e7xmIkvjDzrM61RufP
 pch0cn+c9yrwA==
Date: Wed, 1 Jun 2022 17:24:04 +0200
From: Mark Brown <broonie@kernel.org>
To: Tan =?utf-8?B?TmF5xLFy?= <tannayir@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Semantics for _SX controls
Message-ID: <YpeElAslQxfajbdq@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="G2CLlkTjXNNFSaNn"
Content-Disposition: inline
X-Cookie: May your camel be as swift as the wind.
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org
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


--G2CLlkTjXNNFSaNn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

The fixes for input validation have highlighed a bunch of
problems with the _SX controls.  These aren't widely used, it's
just some Cirrus Logic and Qualcomm CODECs plus the obsolte
ab8500 driver, but it has become apparent that at least some of
the drivers were relying on the lack of validation we used to
have to work.

For the Cirrus case 34198710f55b5f ("ASoC: Add info callback for
SX_TLV controls") says that the intended semantic is

    Currently every CODEC implementing these controls specifies the minimum
    as the non-zero value for the minimum and the maximum as the number of
    gain settings available.

which was from Charles at Cirrus so hopefully that's the semantic
used by Cirrus drivers.  However Tan Nayir pointed at some out of
tree patches from Qualcomm which change the info callback such
that max is instead the maximum register value that can be
written and reports that since we started validating written
values properly they can no longer set some valid values in some
controls on at least some Qualcomm devices (this was a wcd9340)
which clearly indicates that there's some problems that need
fixing.

This isn't helped by the fact that snd_soc_info_volsw_sx() is
implemented by calling snd_soc_info_volsw() and then applying an
offset to the maximum value which makes things harder to follow -
I think we should make snd_soc_info_volsw_sx() a standalone
function, and we probably need some fixes in some combination of
the shared functions and the drivers as well.

Can people please check how the values in the current drivers
correspond to what the actual bitfields in the registers have so
we can get a handle on what's going on here?  I've pasted a quick
grep for _SX controls below:

sound/soc/codecs/ab8500-codec.c:	SOC_SINGLE_XR_SX("ANC Warp Delay Shift",
sound/soc/codecs/ab8500-codec.c:	SOC_SINGLE_XR_SX("ANC FIR Output Shift",
sound/soc/codecs/ab8500-codec.c:	SOC_SINGLE_XR_SX("ANC IIR Output Shift",
sound/soc/codecs/ab8500-codec.c:	SOC_SINGLE_XR_SX("ANC Warp Delay",
sound/soc/codecs/cs35l33.c:	SOC_SINGLE_SX_TLV("DAC Volume", CS35L33_DIG_VOL_CTL,
sound/soc/codecs/cs35l34.c:	SOC_SINGLE_SX_TLV("Digital Volume", CS35L34_AMP_DIG_VOL,
sound/soc/codecs/cs35l35.c:	SOC_SINGLE_SX_TLV("Digital Audio Volume", CS35L35_AMP_DIG_VOL,
sound/soc/codecs/cs35l35.c:	SOC_SINGLE_SX_TLV("Digital Advisory Volume", CS35L35_ADV_DIG_VOL,
sound/soc/codecs/cs35l36.c:	SOC_SINGLE_SX_TLV("Digital PCM Volume", CS35L36_AMP_DIG_VOL_CTRL,
sound/soc/codecs/cs35l41.c:	SOC_SINGLE_SX_TLV("Digital PCM Volume", CS35L41_AMP_DIG_VOL_CTRL,
sound/soc/codecs/cs4265.c:	SOC_DOUBLE_R_SX_TLV("PGA Volume", CS4265_CHA_PGA_CTL,
sound/soc/codecs/cs42l51.c:	SOC_DOUBLE_R_SX_TLV("PCM Playback Volume",
sound/soc/codecs/cs42l51.c:	SOC_DOUBLE_R_SX_TLV("Analog Playback Volume",
sound/soc/codecs/cs42l51.c:	SOC_DOUBLE_R_SX_TLV("ADC Mixer Volume",
sound/soc/codecs/cs42l51.c:	SOC_DOUBLE_R_SX_TLV("ADC Attenuator Volume",
sound/soc/codecs/cs42l51.c:	SOC_DOUBLE_R_SX_TLV("PGA Volume",
sound/soc/codecs/cs42l52.c:	SOC_DOUBLE_R_SX_TLV("Master Volume", CS42L52_MASTERA_VOL,
sound/soc/codecs/cs42l52.c:	SOC_DOUBLE_R_SX_TLV("Headphone Volume", CS42L52_HPA_VOL,
sound/soc/codecs/cs42l52.c:	SOC_DOUBLE_R_SX_TLV("Speaker Volume", CS42L52_SPKA_VOL,
sound/soc/codecs/cs42l52.c:	SOC_DOUBLE_R_SX_TLV("Bypass Volume", CS42L52_PASSTHRUA_VOL,
sound/soc/codecs/cs42l52.c:	SOC_DOUBLE_R_SX_TLV("ADC Volume", CS42L52_ADCA_VOL,
sound/soc/codecs/cs42l52.c:	SOC_DOUBLE_R_SX_TLV("ADC Mixer Volume",
sound/soc/codecs/cs42l52.c:	SOC_DOUBLE_R_SX_TLV("PGA Volume", CS42L52_PGAA_CTL,
sound/soc/codecs/cs42l52.c:	SOC_DOUBLE_R_SX_TLV("PCM Mixer Volume",
sound/soc/codecs/cs42l52.c:	SOC_SINGLE_SX_TLV("Beep Volume", CS42L52_BEEP_VOL,
sound/soc/codecs/cs42l56.c:	SOC_DOUBLE_R_SX_TLV("Master Volume", CS42L56_MASTER_A_VOLUME,
sound/soc/codecs/cs42l56.c:	SOC_DOUBLE_R_SX_TLV("ADC Mixer Volume", CS42L56_ADCA_MIX_VOLUME,
sound/soc/codecs/cs42l56.c:	SOC_DOUBLE_R_SX_TLV("PCM Mixer Volume", CS42L56_PCMA_MIX_VOLUME,
sound/soc/codecs/cs42l56.c:	SOC_DOUBLE_R_SX_TLV("PGA Volume", CS42L56_PGAA_MUX_VOLUME,
sound/soc/codecs/cs42l56.c:	SOC_DOUBLE_R_SX_TLV("Headphone Volume", CS42L56_HPA_VOLUME,
sound/soc/codecs/cs42l56.c:	SOC_DOUBLE_R_SX_TLV("LineOut Volume", CS42L56_LOA_VOLUME,
sound/soc/codecs/cs42l56.c:	SOC_SINGLE_SX_TLV("Beep Volume", CS42L56_BEEP_FREQ_OFFTIME,
sound/soc/codecs/cs42l73.c:	SOC_DOUBLE_R_SX_TLV("Headphone Analog Playback Volume",
sound/soc/codecs/cs42l73.c:	SOC_DOUBLE_R_SX_TLV("LineOut Analog Playback Volume", CS42L73_LOAAVOL,
sound/soc/codecs/cs42l73.c:	SOC_DOUBLE_R_SX_TLV("Input PGA Analog Volume", CS42L73_MICAPREPGAAVOL,
sound/soc/codecs/cs42l73.c:	SOC_DOUBLE_R_SX_TLV("Input Path Digital Volume", CS42L73_IPADVOL,
sound/soc/codecs/cs42l73.c:	SOC_DOUBLE_R_SX_TLV("HL Digital Playback Volume",
sound/soc/codecs/cs42l73.c:	SOC_SINGLE_SX_TLV("Speakerphone Digital Volume",
sound/soc/codecs/cs42l73.c:	SOC_SINGLE_SX_TLV("Ear Speaker Digital Volume",
sound/soc/codecs/cs53l30.c:	SOC_SINGLE_SX_TLV("ADC1A PGA Volume",
sound/soc/codecs/cs53l30.c:	SOC_SINGLE_SX_TLV("ADC1B PGA Volume",
sound/soc/codecs/cs53l30.c:	SOC_SINGLE_SX_TLV("ADC2A PGA Volume",
sound/soc/codecs/cs53l30.c:	SOC_SINGLE_SX_TLV("ADC2B PGA Volume",
sound/soc/codecs/cs53l30.c:	SOC_SINGLE_SX_TLV("ADC1A Digital Volume",
sound/soc/codecs/cs53l30.c:	SOC_SINGLE_SX_TLV("ADC1B Digital Volume",
sound/soc/codecs/cs53l30.c:	SOC_SINGLE_SX_TLV("ADC2A Digital Volume",
sound/soc/codecs/cs53l30.c:	SOC_SINGLE_SX_TLV("ADC2B Digital Volume",
sound/soc/codecs/msm8916-wcd-digital.c:	SOC_SINGLE_SX_TLV("IIR1 INP1 Volume", LPASS_CDC_IIR1_GAIN_B1_CTL,
sound/soc/codecs/msm8916-wcd-digital.c:	SOC_SINGLE_SX_TLV("IIR1 INP2 Volume", LPASS_CDC_IIR1_GAIN_B2_CTL,
sound/soc/codecs/msm8916-wcd-digital.c:	SOC_SINGLE_SX_TLV("IIR1 INP3 Volume", LPASS_CDC_IIR1_GAIN_B3_CTL,
sound/soc/codecs/msm8916-wcd-digital.c:	SOC_SINGLE_SX_TLV("IIR1 INP4 Volume", LPASS_CDC_IIR1_GAIN_B4_CTL,
sound/soc/codecs/msm8916-wcd-digital.c:	SOC_SINGLE_SX_TLV("IIR2 INP1 Volume", LPASS_CDC_IIR2_GAIN_B1_CTL,
sound/soc/codecs/msm8916-wcd-digital.c:	SOC_SINGLE_SX_TLV("IIR2 INP2 Volume", LPASS_CDC_IIR2_GAIN_B2_CTL,
sound/soc/codecs/msm8916-wcd-digital.c:	SOC_SINGLE_SX_TLV("IIR2 INP3 Volume", LPASS_CDC_IIR2_GAIN_B3_CTL,
sound/soc/codecs/msm8916-wcd-digital.c:	SOC_SINGLE_SX_TLV("IIR2 INP4 Volume", LPASS_CDC_IIR2_GAIN_B4_CTL,
sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX0 Digital Volume", WCD9335_CDC_RX0_RX_VOL_CTL,
sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX1 Digital Volume", WCD9335_CDC_RX1_RX_VOL_CTL,
sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX2 Digital Volume", WCD9335_CDC_RX2_RX_VOL_CTL,
sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX3 Digital Volume", WCD9335_CDC_RX3_RX_VOL_CTL,
sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX4 Digital Volume", WCD9335_CDC_RX4_RX_VOL_CTL,
sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX5 Digital Volume", WCD9335_CDC_RX5_RX_VOL_CTL,
sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX6 Digital Volume", WCD9335_CDC_RX6_RX_VOL_CTL,
sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX7 Digital Volume", WCD9335_CDC_RX7_RX_VOL_CTL,
sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX8 Digital Volume", WCD9335_CDC_RX8_RX_VOL_CTL,
sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX0 Mix Digital Volume",
sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX1 Mix Digital Volume",
sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX2 Mix Digital Volume",
sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX3 Mix Digital Volume",
sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX4 Mix Digital Volume",
sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX5 Mix Digital Volume",
sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX6 Mix Digital Volume",
sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX7 Mix Digital Volume",
sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX8 Mix Digital Volume",

Thanks,
Mark

--G2CLlkTjXNNFSaNn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKXhJAACgkQJNaLcl1U
h9AF5gf9HY5wtlmLAYCQ//ChwvqmUDKXnXs2mzTFPfCDbZa9UHOilOH9Ngmq0XEd
9pKLpx8OmhhyLg/HRwiwpVIGCAUS/bf+Q/f1CKYngQrLo2L9J8MqkJvv0tnL/qCp
3Euo0Re8/nQ4hhSkxyxDzaFhDkq2a/bxh4kZYosytXbnR6fb8SDZBjtVNxWBxxtm
5IufTg766hvAd1IM3U+nPxO2xk/NQ45uUpUKgLQ71ts0EU13zt6LP50+L1c0tu7o
71ph2UaFIHwqkbja8HgTABz0FrPbVIQ2zXwl1xruP8wTdlkeNrhnkhTlzmz3+stX
RAy9q44G6MvgIkJGdJqHZRw/fdLJuw==
=F+2q
-----END PGP SIGNATURE-----

--G2CLlkTjXNNFSaNn--
