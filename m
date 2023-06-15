Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F37D6730C6F
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jun 2023 02:58:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5CD7822;
	Thu, 15 Jun 2023 02:57:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5CD7822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686790691;
	bh=OKEogft+ftRPAL0ihwo9W+L1ntvp3tS05T85RJNv/Ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PuY3O7urPZq+jgmLJgja33ABBq4fNfR34rlKT5BQXepRwzoOr+JYH5Fxif/pNpI3a
	 YTXpdJVVKMVrodjFLEHYVJpBwhm+YCxBa7XDMK3PP0AFJnkYxd47Tti80/bqxzRh0R
	 uG65EHfl1Q/kShRo9kyGCcFcO4519c/T0UvzhCSQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0291F800ED; Thu, 15 Jun 2023 02:56:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB714F80130;
	Thu, 15 Jun 2023 02:56:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 356C2F80149; Thu, 15 Jun 2023 02:56:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B40AF80093
	for <alsa-devel@alsa-project.org>; Thu, 15 Jun 2023 02:56:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B40AF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TB16isRp
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 905B863ABD;
	Thu, 15 Jun 2023 00:56:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B087C433C8;
	Thu, 15 Jun 2023 00:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686790604;
	bh=OKEogft+ftRPAL0ihwo9W+L1ntvp3tS05T85RJNv/Ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TB16isRpH8eDTfmvhjnt5myNDmbXdjsVb3iuxd02Rf66m14OEUXzv1/uuSxRMhQ9+
	 YV3R7OzC+vUUau3qUk1PD0zMiGiCMLw0Xz1WScBGutMhaAL9/t5uk03AuWFTVcKlWQ
	 fXVbahDffF21ljddbldj8G3RjGvcSAD6OgPKOfIJF9V2KBfU4Izm4QdPr/jh9PJncM
	 4ki7qkwahsufDS9Aw3LlwphE5ZyY1QsBCkkXNqjhUCCeUF9T6kVRl2+WhrBvm3ICOp
	 GaWNqHWLXn9xXo3qaRVDzW2tESKt0sXLs4u5DDZ1qPOIgh+st+kyj2DOtgrW6QVABA
	 OEOelyRLHOjTA==
Date: Thu, 15 Jun 2023 01:56:35 +0100
From: Mark Brown <broonie@kernel.org>
To: yixuanjiang <yixuanjiang@google.com>
Cc: vkoul@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-compress: Fix deadlock in soc_compr_open_fe
Message-ID: <92159f51-2e17-4c6b-8fd4-0bde8b1dd38a@sirena.org.uk>
References: <20230613062350.271107-1-yixuanjiang@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yfBNAdUiVMRgFxH8"
Content-Disposition: inline
In-Reply-To: <20230613062350.271107-1-yixuanjiang@google.com>
X-Cookie: You are false data.
Message-ID-Hash: WWIMHYR6RHI6O72Y76CD62UZQL4WVYEK
X-Message-ID-Hash: WWIMHYR6RHI6O72Y76CD62UZQL4WVYEK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WWIMHYR6RHI6O72Y76CD62UZQL4WVYEK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--yfBNAdUiVMRgFxH8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 13, 2023 at 02:23:50PM +0800, yixuanjiang wrote:
> Modify the error handling flow by release lock.
> The require pcm_mutex will keep holding if open fail.

> +++ b/sound/soc/soc-compress.c
> @@ -166,6 +166,7 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
>  	snd_soc_dai_compr_shutdown(cpu_dai, cstream, 1);
>  out:
>  	dpcm_path_put(&list);
> +	mutex_unlock(&fe->card->pcm_mutex);
>  be_err:

This is really hard to follow due to the lack of any mutex_lock()s in
the function, I think because this is intended to undo
snd_soc_dpcm_mutex_lock(fe) but if that's the case why is it not using
snd_soc_dpcm_mutex_unlock(fe) like the success path does?  Given the use
of classes not doing that looks like it'll create lockdep issues.

I'd expect the unlock to match the lock.

--yfBNAdUiVMRgFxH8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSKYcMACgkQJNaLcl1U
h9AIFAf+LLNgL9osk++AWzcSBDBByXr2ksUuFuAjK9f/R7G+Slh2/w7hotCeNbFh
UxGQu0bkilmwhLUVwBbbyQhRCcXXJMXqDGBxbsVzJwwrq2Xw9IFlZx+Q2acg/Uce
j4XoOPvrnxNXIld5kAJmoHmVLrnwppge9wT1T/Bof9a5SqhcDOqjuYYv/Vbcta2+
KgPHAe6hRQ1SGjTyoP4fwYfTyikTtiBP9S32dMDGCzcxFGTFXovVMFNeXDgMwSRf
r8WH8jz8WD+dKuU3s39Wioe4AxWqDu7AsXOkU7zynAYlWDx8TvNOI0SVknZxpLf3
7ua6T/Hcp8DPaxgdmNjAkTTvG5Ferw==
=zGKJ
-----END PGP SIGNATURE-----

--yfBNAdUiVMRgFxH8--
