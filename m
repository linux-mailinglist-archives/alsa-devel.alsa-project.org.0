Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E211A60F649
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 13:35:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DB053120;
	Thu, 27 Oct 2022 13:34:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DB053120
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666870535;
	bh=/lGtmfeN/TmEpHyHYVIynz4HqcXAv4AdvMXrpZmakF8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UPm6/wQ/eFMduZv6Ec939/MOkZ3w0IoIWgOi7C4yG/Olu8SQ4bwMKF0Hh/HtQ4K7y
	 S3Qt9NTp03hdYjnSOq8mcPm+2TBLjsNsivDz5ER+hCDUJAnH+GLPAp42kHRjgXBzly
	 mDRpbCSvPRv9kgb7NR0a/iiE4EOAZVtNdrPs5/fg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9C41F8025A;
	Thu, 27 Oct 2022 13:34:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF7F1F8025A; Thu, 27 Oct 2022 13:34:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C638DF8016C
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 13:34:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C638DF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oOAbDtnb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CBA57622A2;
 Thu, 27 Oct 2022 11:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C73AAC433C1;
 Thu, 27 Oct 2022 11:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666870470;
 bh=/lGtmfeN/TmEpHyHYVIynz4HqcXAv4AdvMXrpZmakF8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oOAbDtnb9gZRKavF0vwl/sVi5LkB+y8vSRZD5z+JKAwQbVZiuI/gGs2YBCspB0Hn/
 WdZovUTm9Ye+wL19erhtyLCR8Fxxl//9MHDpUOqH9+BlkMSv5diTQxRpAoaPL1sjQc
 LsfB9QbCnekWKA9AR8SRv5wTYzfOIe7dzA2+4s69HZkrQ8nVVacqaU1slNngnJ7H36
 4/c1zzgFGIWuczyEF7AnRFeKtMzMuylh/vflDnugItZ8o9h/f/8p6WnSNeYnXmQr41
 LfKSqWFcRKWSrFFRDEs4559C3hvK93xD2bL+gc0f66ijObY0nNQOUgGPh4rNDTg9ip
 6rArbP1R2Kj/g==
Date: Thu, 27 Oct 2022 12:34:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhu Ning <zhuning0077@gmail.com>
Subject: Re: [PATCH] ASoC: sof_es8336: reduce pop noise on speaker
Message-ID: <Y1pswY8KNzt6eDjP@sirena.org.uk>
References: <20221027073807.3754-1-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ye6ERylLuD0yXhSX"
Content-Disposition: inline
In-Reply-To: <20221027073807.3754-1-zhuning0077@gmail.com>
X-Cookie: Forgive and forget.
Cc: Zhu Ning <zhuning@everest-semi.com>, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, yangxiaohua@everest-semi.com,
 tiwai@suse.com
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


--ye6ERylLuD0yXhSX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 27, 2022 at 03:38:07PM +0800, Zhu Ning wrote:

> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_STOP:
> +		if (priv->speaker_en == false)
> +			if (substream->stream == 0)
> +				gpiod_set_value_cansleep(priv->gpio_speakers, true);

What happens if the stream is very briefly started or the system is
heavily loaded and the delayed work hasn't run yet?  We should probably
cancel the work here just to be safe.

--ye6ERylLuD0yXhSX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNabMAACgkQJNaLcl1U
h9CW1gf+McGdM8+g+yNsz144e4rK4KCH6qQzgGa4TLqn+vYU7IbzphtEYfCgKYa2
ZT4enL9ffMRJpk0otWgrkl1EdoCw6iYk+bHBCGtVNNUOE1+KNJoddTh2Nh0aGTSm
jdmZ8h9ZjnB2n/fdppyKmGRwUKIlbQTBkeIqLHPovQVn7UqAHmollBUTFtjIfD1v
lOn1GJUnvG4gkqEywU4I3WNYfCnUPkPdfSowRa85kfLCkjbnW0Qv5VreA1Epjdyi
iUIkCMT8nSwsI6M8yBNuAZs8+KUcHqZTrbjNoAbJE53viOsmq99Ivd+Mc7ODYeTM
2kmM2v7aulPLLM+fVsFfAeqFNtkhuQ==
=ZFas
-----END PGP SIGNATURE-----

--ye6ERylLuD0yXhSX--
