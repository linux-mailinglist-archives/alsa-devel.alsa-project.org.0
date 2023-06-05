Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD1C72264A
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 14:48:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B445823;
	Mon,  5 Jun 2023 14:47:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B445823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685969295;
	bh=YfGoSGL9f1bxiaV/tE9J6jAugp9YIwaqLS/mzYmvdec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BMlYKDxa9ysVebKZ1tO/WxBkVzxGVB2i9SZeV5FC7QsEtJXWLiUhyEdy/DROFizjs
	 In9v0iVbheIV+nSWzNgWbDOS0gB2OtvkwYRx05qFZNTzlrKSI5pIVka12nle7gseCC
	 HdyhhLeBvnBylSszVwLBY20Hv0rgOQSNGYUa16mc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06303F80494; Mon,  5 Jun 2023 14:47:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69F54F8016C;
	Mon,  5 Jun 2023 14:47:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D10FF80199; Mon,  5 Jun 2023 14:47:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55737F80130
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 14:47:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55737F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qIXw8Gyc
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 40E8262139;
	Mon,  5 Jun 2023 12:47:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 744A4C433D2;
	Mon,  5 Jun 2023 12:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685969232;
	bh=YfGoSGL9f1bxiaV/tE9J6jAugp9YIwaqLS/mzYmvdec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qIXw8Gyc0yrAwqnGZu0VmvnBA7Hmrnr8sWu+RVAhDW908i+wlMsOhnoLVOHPyjI1P
	 wBQ3/HS9cOs+/JNhh3a5iibUCEo2OwdLwCRyo1U9oGv7bmM06BQpgCTmYJf39K15Qf
	 YNKhi6Dat+88fize2tkJEt2/gbtP982y8so1F6GjX+8w4h5TMEp1cBbvI6bFxFZMGk
	 FUU4d1e7QS3uisJ3+gSyKv+eETjEuk4JVWP8BZoTQVeuvoeuzEy+eguKyDsWIy12Cu
	 hAL9joWYuANv2aWP2Dvy1QuLXLhrJdz2kIwf1qujt2gc7vzRarxsdRwek5WmRt6RjN
	 s5OqtNvu7MwSQ==
Date: Mon, 5 Jun 2023 13:47:08 +0100
From: Mark Brown <broonie@kernel.org>
To: YingKun Meng <mengyingkun@loongson.cn>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH 2/3] ASoC: loongson: Add Loongson Generic ASoC Sound Card
 Support
Message-ID: <aa8381b5-0a3b-4a64-8c92-333ad751956b@sirena.org.uk>
References: <20230605120934.2306548-1-mengyingkun@loongson.cn>
 <20230605120934.2306548-2-mengyingkun@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jMoQciNUS11hAL/M"
Content-Disposition: inline
In-Reply-To: <20230605120934.2306548-2-mengyingkun@loongson.cn>
X-Cookie: Biggest security gap -- an open mouth.
Message-ID-Hash: IFNLGER52RV7YRSNGCACZITCLFNWIS4H
X-Message-ID-Hash: IFNLGER52RV7YRSNGCACZITCLFNWIS4H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IFNLGER52RV7YRSNGCACZITCLFNWIS4H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--jMoQciNUS11hAL/M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 05, 2023 at 08:09:33PM +0800, YingKun Meng wrote:

> The driver supports the use of ACPI table to describe device resources.
> On loongson 7axxx platforms, the audio device is an ACPI device.

I'm not seeing any ACPI IDs added here, this is all DT other than this:

> +	if (has_acpi_companion(&pdev->dev)) {
> +		device_property_read_string(&pdev->dev, "codec-name",
> +						&codec_name);
> +		for (i = 0; i < card->num_links; i++)
> +			loongson_dai_links[i].codecs->name = codec_name;
> +
> +		device_property_read_string(&pdev->dev, "codec-dai-name",
> +						&codec_dai_name);
> +		for (i = 0; i < card->num_links; i++)
> +			loongson_dai_links[i].codecs->dai_name = codec_dai_name;
> +	} else {

which doesn't look *great* from an ACPI point of view TBH.  I thought
there were now some (semi?) standard ACPI bindings these days to support
referencing other devices better?

--jMoQciNUS11hAL/M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmR92UsACgkQJNaLcl1U
h9AfIgf+LWp5mvFSev7zoIBVC//Wc1pfEjLDt2S/xnOCplilBhXZxBjJMl0yfAXV
+JPXrf2vT2qhLlKhT+kF7YAKzpubykso0spCZBGbUe6cZTuqTcDpBJSSWsQxVyQs
tJcStKW7vEquU3DmOL4YbTJ1GiZx6lum5idsxmnbrzGF6X60a5l8CAg2gXh9WD2m
nhgW+Z0AMkIDeJd+1FxxytN4Is9XBlY+4vuMY5AUc9TSHB+uxCsvBLD8if2dIwST
1t1/AcK2bKJzl5fP6t7lYwJbz7cdt/TaheVgSkN8I7LamuOlEwzs9cidU7yKPpBI
Lk2NeacN6nFEFqLkf0R2PT/VJy7jVQ==
=naBq
-----END PGP SIGNATURE-----

--jMoQciNUS11hAL/M--
