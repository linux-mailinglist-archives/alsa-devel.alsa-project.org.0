Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91925699909
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 16:38:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2753CEEC;
	Thu, 16 Feb 2023 16:37:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2753CEEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676561907;
	bh=2+KPvuaCpQD+82YcuDgvuCuUe3Ns8wL0cUpK01igajg=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U/FObb5pAmiv0AFSbjWmTPw7IjS8L3cLC3OP342ke9vtgbUpDPY1WeXUcOzE72mpv
	 triKMfzFAeT50IMy6cxQZQ4hUqN7e8cO3PB27QM3a+uRC3IdoI3F2Lby7B64TwVvZw
	 bvD+u0yq6w7lbkQYqfDT6zesUKp49KyqUwvqqF4U=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 934EDF80171;
	Thu, 16 Feb 2023 16:37:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59B1FF80171; Thu, 16 Feb 2023 16:37:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2655F80083
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 16:37:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2655F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tXysuqPs
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 71F1CB82501;
	Thu, 16 Feb 2023 15:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0770C433EF;
	Thu, 16 Feb 2023 15:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676561844;
	bh=2+KPvuaCpQD+82YcuDgvuCuUe3Ns8wL0cUpK01igajg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tXysuqPsAs6J2ADpVDn3NaSd6flR4exuDGjBW74aRiQyJN2pDl4rAUOfH/nNfJQK1
	 XS2Ig7Ly2vqYyyQxyRF4CeuJy/EafnvwX+bSfYLBgPPYGg/emI9CZW4KTCNNUeyk6y
	 XAycS4nRkZK9QH2V1EHzJmuKkqVvI/qSH/Axr3GxXhwM8mU+tdhv7aMSbpcc6Jc/bS
	 rckyp9C6ogk8/r7+ZgfXlYZb2I9viKSb+UuKEG9jyANrOxLbuEpDvvTLi/c2O7sYoi
	 Wqv2Idj3cjcZpAwfRp7ec1J3vbVmx7MtqusrR/exBUnwjzsT3Hp35ovK2wrw2Z7VjN
	 XWPAJuRtj1cPg==
Date: Thu, 16 Feb 2023 15:37:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Lucas Tanure <lucas.tanure@collabora.com>
Subject: Re: [PATCH 8/9] ASoC: amd: vangogh: Centralize strings definition
Message-ID: <Y+5NsB/Z5P+rVGbX@sirena.org.uk>
References: <20230216103300.360016-1-lucas.tanure@collabora.com>
 <20230216103300.360016-9-lucas.tanure@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qdQDcYIyMx1V5VX8"
Content-Disposition: inline
In-Reply-To: <20230216103300.360016-9-lucas.tanure@collabora.com>
X-Cookie: Serving suggestion.
Message-ID-Hash: THPI5QXH5WGEFHDZHX4QQ3GREREPWD6V
X-Message-ID-Hash: THPI5QXH5WGEFHDZHX4QQ3GREREPWD6V
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/THPI5QXH5WGEFHDZHX4QQ3GREREPWD6V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--qdQDcYIyMx1V5VX8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 16, 2023 at 10:32:59AM +0000, Lucas Tanure wrote:

> Replace occurrences of strings by their definition, avoiding bugs where
> the string changed, but not all places have been modified

>  #define DRV_NAME			"acp5x_mach"
>  #define DUAL_CHANNEL			2
> -#define ACP5X_NUVOTON_CODEC_DAI		"nau8821-hifi"
>  #define VG_JUPITER			1
> -#define ACP5X_NUVOTON_BCLK		3072000
> -#define ACP5X_NAU8821_FREQ_OUT		12288000
> +#define NAU8821_BCLK			3072000
> +#define NAU8821_FREQ_OUT		12288000
> +#define NAU8821_DAI			"nau8821-hifi"
> +#define CS35L41_LNAME			"spi-VLV1776:00"
> +#define CS35L41_RNAME			"spi-VLV1776:01"
> +#define CS35L41_DAI			"cs35l41-pcm"

These changes don't obviously correspond to the description of
the patch.  It looks like there's at least some renaming and
reindentation of things not related to DAI names here.  TBH I'm
not sure the removal of namespacing is a good idea, it's probably
not *super* likely but we might run into collisions.

--qdQDcYIyMx1V5VX8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPuTbAACgkQJNaLcl1U
h9CM/wgAhRWIiQuG2HbuVN3no2Nu6aNxDlLnUyWqA56pB1z0yMBH8FUpGknpjCN2
gdXiAARXV9SzsasDJuDR7j1K7XDGV0HzQfmkRTsr7tFdvcmGqcX1VJpfPZHUaYLT
TbrM3xmhCxJl0b4q9SErRcVnXigBqliQdQKP059F3S6QqSn0TfMu6be5Dem5AhS1
BMuk64l4HKZkpn6zEJqmGzDv2gM+goq4gEZpo7MCwYdpSehUUT0xY1eR0T8/tUfr
HC50ADfLeWqb3iMCN0kuUVPh/8lEELOY5dxpUSzb+B8oZ+i6lrDJQWWjUXEDw0iE
b7W3A65dk2wwRFiL8K18FpSMdj3D9w==
=xmrC
-----END PGP SIGNATURE-----

--qdQDcYIyMx1V5VX8--
