Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D08487417D2
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 20:12:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B5F73E8;
	Wed, 28 Jun 2023 20:11:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B5F73E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687975919;
	bh=S8iFMTRFi4myYQxAkEhyB53zlJci8Gm8CA/jvNuBY2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cLIYyNsJ2WRLNS8HHIQXmQrSchttbp2uTg+K/L1PqcihVfkVwBokGVE0JrRQLj8QH
	 rnHv52Q/KKhTxH2QKZ5qzX7c5UhK2R1Mbh+CdEZ5v3LPk7ajTvbfGzzHtCtMw93rgy
	 1nbCkMUdRqZnRkoxMPLKEyncttd5XXCIfbB09uIU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2EBCF80124; Wed, 28 Jun 2023 20:11:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7703FF80212;
	Wed, 28 Jun 2023 20:11:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7609FF80246; Wed, 28 Jun 2023 20:11:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0ABB6F80093
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 20:10:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0ABB6F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cPTY3bX1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 029C76137F;
	Wed, 28 Jun 2023 18:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A2AC433C8;
	Wed, 28 Jun 2023 18:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687975856;
	bh=S8iFMTRFi4myYQxAkEhyB53zlJci8Gm8CA/jvNuBY2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cPTY3bX1lk4GxRiSxlodx+ugOaPB3xpc1AmBC6B9gILVTJY8pSBfrCaCQ9rQ/Fv8y
	 pmWZm8dao4+74szOO2hgfa6SsbzICms/cgnhZ8JNoK166T+Y3D0SRev4qLf7OwAd54
	 0gnOc9wTbeW3k7JIfSTn6veo35Qq4EIvjub+CoAWLkstUS3XubjZjPClmKATV5psyB
	 DhUapJ8FeaXOPdB7oMzpfa7FY/vqDW8k4s+lWdD3/k2ecx6FuQ2WbgN4LqfDK+yAF8
	 Kh1wKQkKPg9Xyf/ZrdcT2SXk06B2HOxfY0qoj/8fOMtezSZUJnCR7NvTp8DnH2I8PS
	 TO9hWPdCw5uvA==
Date: Wed, 28 Jun 2023 19:10:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	krzysztof.kozlowski+dt@linaro.org, andersson@kernel.org,
	robh+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, johan+linaro@kernel.org,
	perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
	linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 2/3] ASoC: qcom: q6apm: add support for reading firmware
 name from DT
Message-ID: <c377aefe-2678-4ba7-96b3-2186e8f3f1b4@sirena.org.uk>
References: <20230628102621.15016-1-srinivas.kandagatla@linaro.org>
 <20230628102621.15016-3-srinivas.kandagatla@linaro.org>
 <f71c8d2b-d5f4-42bb-932f-5b9ec6117ffc@sirena.org.uk>
 <73dce263-bee6-554f-9eb6-af4aa7badab1@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="odJ0u5EEv+hukUFR"
Content-Disposition: inline
In-Reply-To: <73dce263-bee6-554f-9eb6-af4aa7badab1@linaro.org>
X-Cookie: HELLO, everybody, I'm a HUMAN!!
Message-ID-Hash: DYSNWAKXO3SMUSGGDZ7KC2TU6PMGCXUY
X-Message-ID-Hash: DYSNWAKXO3SMUSGGDZ7KC2TU6PMGCXUY
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DYSNWAKXO3SMUSGGDZ7KC2TU6PMGCXUY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--odJ0u5EEv+hukUFR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 28, 2023 at 07:57:38PM +0300, Dmitry Baryshkov wrote:
> On 28/06/2023 14:53, Mark Brown wrote:

> > Why not try a series of firmware names/locations generated using the
> > identifying information for the card/system?  That way we don't have to
> > put a filename in the ABI which has fun scaling issues.

> This is what was done by Srini in the initial (currently committed) version.
> Unfortunately this easily results in the audio topology being separated from
> the rest of the platform-specific firmware. For example, for the mentioned
> X13s we already have a subdir under /lib/firmware/qcom and several
> firmware-name DT properties pointing to the files in that subdir:

> $ grep firmware-name
> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> 		firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn";
> 	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn";
> 	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn";

> This is not unique to the X13s, other Qualcomm boards also use full paths.

If the goal here is to put all the firmwares for a given board in a
single place surely it would be better to factor this all out of the
individual drivers so that they ask some helper for a directory to use
for firmware?  Adding these device specific firmware node properties
doesn't seem to follow.

--odJ0u5EEv+hukUFR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmScd6kACgkQJNaLcl1U
h9CVewf/VRExNVrsgkLPa3cwHd22uiab7/9Pce7RpfyTmoA1zyYUbQvPZOsJgNZ+
0Q5a15Cw4YMXpdQIE37xVukcWttL5myFf8ycUSU45WAS5+YLuDa/RcuGFP5/IEZm
Lcq3wfX7zG0mxhE9Kj2E+k/rKieUPDbHGBfSikKrw8GL9jB8EZNG3tk7PXRLXpeJ
FAN+BRcSuZTjKInCR0ErUSgbMqNXHinbdxC8VCtwDZd7U6R0YT9xaKlVzMf+aK0K
+8ZptUCFFDR9THaCOXj3ujwF54WycL5Wo+9jIoPsVF92RTQcMwtzGmM48K6WY8tz
86G2gU01b89cvJ2vMPpdqZqR/UxLig==
=8mP1
-----END PGP SIGNATURE-----

--odJ0u5EEv+hukUFR--
