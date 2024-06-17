Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DD590B396
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 17:12:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0735DEE;
	Mon, 17 Jun 2024 17:12:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0735DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718637154;
	bh=c2l65HkG5wWoE4gvFa3Xd9MQQwsOzngmzKfqDFLx+BU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AO0zC5zHtNXpO1pLznGEZl87w4k20kmYOLLeB+t7lasz/zmI6yvk+ratz7yqr5SGi
	 zrI2kxrX2Bi3kbmIVVpMREWF1IT6L2mwAgGzRwkp70IWfAJBmVIGInduZgxfgboiBI
	 aqRn0Y/xNQ0yRZ+8fOF913W7Gn+h0yrfmChrm6mU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B139F805B4; Mon, 17 Jun 2024 17:12:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88F01F805B0;
	Mon, 17 Jun 2024 17:12:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9EC0F8023A; Mon, 17 Jun 2024 17:11:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 276A0F8016E
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 17:11:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 276A0F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ApXnwqAB
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 46D2E61316;
	Mon, 17 Jun 2024 15:11:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B13C2BD10;
	Mon, 17 Jun 2024 15:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718637109;
	bh=c2l65HkG5wWoE4gvFa3Xd9MQQwsOzngmzKfqDFLx+BU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ApXnwqABH87245LT9xnbQPQulb1S2YrlrNw7q/uLmCi2Dzp7mAGeCUmerFoG3pEGB
	 3foWtSFA1S1QOLSndaMhXqEgiKtxK1q5cCa9xuurOvQ5pzvA2TAv4YU2bBECg182Zm
	 gr9pP7KEe5LKKE8QUboNs0oI94DDUuDt0FSBYiqVHw6N6zWw4FKvANg6pKTxtCmzwS
	 Ths7xKFjeSv6ZK8zUBs/Lz1bRfLad9yM+OXtjDsDDe2+sksYfImWbHjBxXFkO2Nj61
	 6zF/7j/XYkPAxnoDOU/10YoSqEEbDG3VriZq6hM30T9tdTaBhQrNuYq+gZv8y/oVSk
	 XkCohegN1aLww==
Date: Mon, 17 Jun 2024 16:11:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/6] ASoC: Few constifications (mostly arguments)
Message-ID: <c170d555-068a-4927-b997-df74cc88386f@sirena.org.uk>
References: 
 <20240617-n-asoc-const-auto-selectable-formats-v1-0-8004f346ee38@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1J3/j5gC6/pQaKDG"
Content-Disposition: inline
In-Reply-To: 
 <20240617-n-asoc-const-auto-selectable-formats-v1-0-8004f346ee38@linaro.org>
X-Cookie: Life is the urge to ecstasy.
Message-ID-Hash: T6DGF6SLIGEOPPP45L35CV73C7ILYNWT
X-Message-ID-Hash: T6DGF6SLIGEOPPP45L35CV73C7ILYNWT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T6DGF6SLIGEOPPP45L35CV73C7ILYNWT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--1J3/j5gC6/pQaKDG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 03:03:18PM +0200, Krzysztof Kozlowski wrote:
> Make few pointers in ASoC functions as pointers to const, so the code is
> clearer to read, a bit safer and allows further constifications (e.g.
> placing some data as rodata).
>=20
> Best regards,
> Krzysztof
>=20
> ---
> Krzysztof Kozlowski (6):
>       ASoC: Constify of_phandle_args in snd_soc_dai_driver
>       ASoC: Constify of_phandle_args in snd_soc_dai_link_component
>       ASoC: Constify passed data to core function
>       ASoC: Constify DAI passed to get_channel_map
>       ASoC: Constify return of snd_soc_dai_get_pcm_stream()
>       ALSA: Cleanup trailing white-spaces

Why is this random ALSA patch which seems off topic for the rest of the
series mixed in here?

--1J3/j5gC6/pQaKDG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZwUi0ACgkQJNaLcl1U
h9BMQAf/bJSvIQSVTUNlyDYtm4cJXPIGSd0VJpZ6L3QlT+3fER4Uvg30WJxer5l4
ezqeVpZ1pszgFgRbXW2fnP3gZTj1rHGdJNn4A7A8fPZQ6wSmpIwmXA3I+Bq1SNha
00ei+bcuvA22oRcvewGoITM9Z3fKQj84xGuyD5yTW0xQM6T06b/d+C+HuRMwxBNI
Vg5TL6LTAW+Xr4mQOQYAzWXVwrZ9sDL/4P4M+BVUJZp3N8SjMclxtF9uL5NZaaKp
LoViWMYrRW6WV13dnalrsdHNZ7dcH39OG0wITHq/Ci3vJgHXtskc+xHYexXecqPW
XKWaaMZjFh5IPXIZWLkmGN7UY75I9Q==
=NmAB
-----END PGP SIGNATURE-----

--1J3/j5gC6/pQaKDG--
