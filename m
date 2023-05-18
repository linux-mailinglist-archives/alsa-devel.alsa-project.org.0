Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0608170775F
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 03:22:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1A1D1FE;
	Thu, 18 May 2023 03:21:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1A1D1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684372967;
	bh=39nlpA1RzHT8pYtCTp7PaqpEp2GiJkE0xxzjQjCCJt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fSa0H18thKk5+GOMInnu1h+VqeoPnEB1U+cl4/DUyd8nZdfL5CT1ZbGJizI2b5T9C
	 oUfKuxQGLL1/LqbbbZwAWufcDijy/Nuwdsbrso9Hqo73jZvEvJxtRJbIKDcImLFGgt
	 KayqNbQQD/KbpO0ePj0O0BGGoHokddULLVuICtz0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A224AF80548; Thu, 18 May 2023 03:21:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21A37F8025A;
	Thu, 18 May 2023 03:21:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 717DDF80272; Thu, 18 May 2023 03:21:46 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 864E1F80087
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 03:21:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 864E1F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VJbDv6aj
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 02BD360EE1;
	Thu, 18 May 2023 01:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C94C433D2;
	Thu, 18 May 2023 01:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684372899;
	bh=39nlpA1RzHT8pYtCTp7PaqpEp2GiJkE0xxzjQjCCJt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VJbDv6ajSYowXXmI2QVZPIBUIpSCiJJTwHk/4Ss/A8iw122GoQdaeokaN/PTTn7t/
	 1sgZd+F201kueh+PljtzEr7kDDM56tWWr7ZcVeWm+c9r+DM+PiiFGkAFgCdHmdhAA9
	 xXHpnXwImJJLQCxCoED4lwOAfwVloALt1s7fvDKzI3A0YGGhU7s+rR6lm7j2Hem/8f
	 JAaWakaOI5Ushi4/4/RBW51AZa+L6PZKX+IwCDh0xmFAgbWmFpVT5pu0iUfel5kDmj
	 UxdxUrhSxJDtD+vNIajcU9S2eDGjRtpJQqthQ1AhpX95qEEmEMXne1KWO4ehYz1U9H
	 5vq9YJX5uzd0Q==
Date: Thu, 18 May 2023 10:21:31 +0900
From: Mark Brown <broonie@kernel.org>
To: Min-Hua Chen <minhuadotchen@gmail.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, perex@perex.cz,
	peter.ujfalusi@gmail.com, tiwai@suse.com
Subject: Re: [PATCH] ALSA: ti: Use pcm_for_each_format() macro for PCM format
 iteration
Message-ID: <ZGV9m6KbuIMWOX13@finisterre.sirena.org.uk>
References: <ZGTltcv6hSlJWLnh@finisterre.sirena.org.uk>
 <20230517234215.3520-1-minhuadotchen@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YRHTtDTD+Ecy08wI"
Content-Disposition: inline
In-Reply-To: <20230517234215.3520-1-minhuadotchen@gmail.com>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: JDNT3P5UDCX3EE6QL47NDMWZFQSI6GIW
X-Message-ID-Hash: JDNT3P5UDCX3EE6QL47NDMWZFQSI6GIW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JDNT3P5UDCX3EE6QL47NDMWZFQSI6GIW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--YRHTtDTD+Ecy08wI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 07:42:15AM +0800, Min-Hua Chen wrote:

> Thanks for your comment. I think the subject should be changed to:=20
> "ASoC: ti: davinci-mcasp: Use pcm_for_each_format() macro".

Yes.

--YRHTtDTD+Ecy08wI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRlfZQACgkQJNaLcl1U
h9Daywf4/uVAMHN0cNVICkG/0mGaj3iO98U13izxrGtmT/G/SPp+zrr6oe5q3+jK
sAbxQPnNuGINxqmQtj9vQye1H1EK8gsEMdet7JGA+wMomX4xdrKDktSc5PH7/Elw
TmKKFTbQQZqxlYbx7EYuTbEVWrz8bxHz3oOYEXhZkAo34NIka4mlvZBp7mf5v2bM
eNmTjgcFBciliKvr4V0w/2Aaty/sNHxNT9MieZcAb0DoLQ9v74R86b4wZONwxur+
rI7cBtr2v0wL9A6uku7Kagmn3kkRYGpNkQzMWx+WqCfaaXN2bTQe7wgrMdHfnWrD
S7CSZIU4+oy1Lf+x48RQGVDs5L4b
=gxBk
-----END PGP SIGNATURE-----

--YRHTtDTD+Ecy08wI--
