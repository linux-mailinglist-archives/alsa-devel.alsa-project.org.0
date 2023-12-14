Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B1F812E3C
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Dec 2023 12:11:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94317A4B;
	Thu, 14 Dec 2023 12:11:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94317A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702552312;
	bh=tSqtRyvgEQ0GCuf1DdZJacTJr0JiylSUmZyHxqPK9OI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vfT5u+zzNSumoUp1N26OEA0xzI9rpBDspobvPjb53GXwHTLZywOPJ3yW+i7dyfzgX
	 CtT+5QmN+5Rh+TRCGpqT9KDNgHQu4mj86qgcd2Dnv9Cn3PdLIy+DkW19jgmzGsfXX5
	 8tSo1AqgEGUyGnyVR1wCJ9+eEhWYoh7uPKzZGaPU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7915F80494; Thu, 14 Dec 2023 12:11:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26AE5F8055B;
	Thu, 14 Dec 2023 12:11:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D06F4F80166; Thu, 14 Dec 2023 12:11:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EBB42F8001F
	for <alsa-devel@alsa-project.org>; Thu, 14 Dec 2023 12:11:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBB42F8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cCNuWUbz
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1FCD4621D2;
	Thu, 14 Dec 2023 11:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A62FC433C7;
	Thu, 14 Dec 2023 11:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702552272;
	bh=tSqtRyvgEQ0GCuf1DdZJacTJr0JiylSUmZyHxqPK9OI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cCNuWUbzFvztyPbxIPZYloc3r2gvIGR44ZX/PAhyUzpsmaGnjfVBeXjODksVQkrRv
	 rJ/Fzh7Eq8MOLQm4BiJCnhEFzio5AMHGKVo0RC5Z/J1c5sTyEw9N/zHJpo//kjmBas
	 769lb6R6o5NjA0e7soNvl7yKKYl+CuiCTRe6RcQcCZ0Jjdjyys5t0TcCjU5Y+gSN03
	 0vjqS9t9E3gECuBpRZ1ivXEE180z0qnDCTsZIYVtH4dBGX7WiLwJ4yCN+OZ7Wx4Tan
	 QhydMSyC3NzfjdQMBgQVS6YcMD0QQf/2HQu/yGgkwhTTMR8ijYGFU+3tj2v8nsHzt/
	 edNavnPrdwnWQ==
Date: Thu, 14 Dec 2023 11:11:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Jianhua Lu <lujianhua000@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] ASoC: qcom: common: Add qcom_snd_tdm_hw_params
 function
Message-ID: <7b13b8b6-9048-48a3-b1a1-e62de88e8171@sirena.org.uk>
References: <20231213123556.20469-1-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pWlLgRFGMMJxpNhu"
Content-Disposition: inline
In-Reply-To: <20231213123556.20469-1-lujianhua000@gmail.com>
X-Cookie: Preserve the old, but know the new.
Message-ID-Hash: AZGKNYQYVHNU2N6FI4A7W2DATCTPRS7X
X-Message-ID-Hash: AZGKNYQYVHNU2N6FI4A7W2DATCTPRS7X
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AZGKNYQYVHNU2N6FI4A7W2DATCTPRS7X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--pWlLgRFGMMJxpNhu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 13, 2023 at 08:35:53PM +0800, Jianhua Lu wrote:

> Add qcom TDM setup function to support TDM ports for qcom platform.

> +int qcom_snd_tdm_hw_params(struct snd_pcm_substream *substream,
> +			   struct snd_pcm_hw_params *params)
> +{

...

> +		ret = snd_soc_dai_set_tdm_slot(cpu_dai, tx_mask, rx_mask, slots, slot_width);
> +		if (ret < 0) {

The expectation is that TDM is set up by the machine driver, not from
hw_params - if the TDM setup can be changed from within hw_params then
it's hard to see how it's going to interact well with other TDM users on
the bus.  More usually hw_params() would be influenced by the setup done
in set_tdm_slot().

--pWlLgRFGMMJxpNhu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmV64skACgkQJNaLcl1U
h9C9BAf9E/yW6RaCxOVG4VbZ+wP9jHD/RCqjvzrJAain8Y2xlAPZE7PaTuVOBmRh
276IS1kDHcPSzRkXkhKFm1KGpr9nOYR1wGrk9Fku5RQQbOwSjvlpOUSwgd5GpUMf
8PT/7ejXSbJKG0vQZc5hsnbwrPGZdn8X381WXdnexczXxna0Vx/fv1wbkPx4OlA5
Xv2LFN3bTEQDmczWtbGo+64Qe/OnJOudRmn/XWjTjjTY7ztP2M4rDpYN/Bd+fyq5
VCWAFEaXIFlgGti7V3UvDBV86hs3GOWHnDHuapeAxahhWEp1U/JU8/okkRsFy+kK
grHgwa1sQD7a7t9jN8Qc4OpT++24iA==
=krXQ
-----END PGP SIGNATURE-----

--pWlLgRFGMMJxpNhu--
