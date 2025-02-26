Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6BCA45E0E
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2025 13:00:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3635602B4;
	Wed, 26 Feb 2025 13:00:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3635602B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740571228;
	bh=6dTjEjzwITJxc+ijuTdiYBOJS1zgFDmOcRqRR+TbFlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jIhBZfEiOeUO4QtvMhDJbPnF2ITZDALeIjX+4jqRauMA2Ziify7zkasiddOqHFJYU
	 tEk9cxHGQcJrznNrmqYZqb0QPAQR5s8aD386dIYBnuzwKRg3WcwN4mlJKywFw5Euyw
	 Ty7M3LSbW2qvYVove6R8CKda9hjm6yLANXj7cm/M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B7ABF805BD; Wed, 26 Feb 2025 13:00:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AAC14F805B2;
	Wed, 26 Feb 2025 13:00:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DDE2F8016E; Wed, 26 Feb 2025 12:59:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74F8AF800E5
	for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2025 12:59:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74F8AF800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pM9ENW+c
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 620AA612BD;
	Wed, 26 Feb 2025 11:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12778C4CED6;
	Wed, 26 Feb 2025 11:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740571169;
	bh=6dTjEjzwITJxc+ijuTdiYBOJS1zgFDmOcRqRR+TbFlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pM9ENW+cL91DrXo/Ih3BWT9GJ3gzprZipP8pZHlatkd2D7kjzxdzzsiRokFhRWOJJ
	 J00EeMUzvYLQC4qAPMBqm8j9W25PLP/1SqsexGT3mEbiaOfwMXAMzIkHTJJm0gvUSq
	 /uIQmhkK1GVD07qy+QO0L4yCuCnxycbN02kWmygl+iaJLzduk/YTKBeUZntPVxJrCg
	 ezz1Kzcba48A7pcU6rcCQtLwVJd7wzEDe8U+CfxAUxS0MxbMrcUGxwcvRVB30nBEuq
	 u5+bfQSYCrQYIw8VvNvhvoFQHpUqBrnmwN7UKutfHR3zzLGMLz8AY+jTgnek3iGKxT
	 AMnpZw6VQFu8g==
Date: Wed, 26 Feb 2025 11:59:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com, yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: Add Everest ES8389 audio CODEC
Message-ID: <121dfc8e-56b1-4653-9490-4e70e5bbef6e@sirena.org.uk>
References: <20250226104949.16303-1-zhangyi@everest-semi.com>
 <20250226104949.16303-3-zhangyi@everest-semi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7N6MJBqn3QPaTryX"
Content-Disposition: inline
In-Reply-To: <20250226104949.16303-3-zhangyi@everest-semi.com>
X-Cookie: I've been there.
Message-ID-Hash: GXXG2PLQU2MKPD33LJKCIARIIDLYTVJD
X-Message-ID-Hash: GXXG2PLQU2MKPD33LJKCIARIIDLYTVJD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GXXG2PLQU2MKPD33LJKCIARIIDLYTVJD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--7N6MJBqn3QPaTryX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 26, 2025 at 06:49:49PM +0800, Zhang Yi wrote:

> +- everest,adc-slot:
> +- everest,dac-slot:

We have the set_tdm_slot() operation for this.

> +- everest,dmic-enabled
> + The property selects the PDM interface of ES8389

Is this a choice between PDM and something else?

--7N6MJBqn3QPaTryX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAme/AhwACgkQJNaLcl1U
h9DdWQf+ItjisOtDd+HmfnnPsYcEKDmvANin0VKHniMHv2dzCsPy6C99UcJO33Id
HkPGtRvaAs95rY2TxfBH+d9uPoNfd+S5BLCd5qDLtVtTsLQsT7IgmFWJELfAVoZ/
ezkQO7yOFgtUBhea/h5hB5sFN6T0YWAF0oGiP4YVkaQa93jQc4eosXZYx9M1fYdm
p5VGL30R0MzZljtYT+CPT5vuin15sLnjwFwuXTGrchVzXPzSJJjsAqpEp+2mXS+i
ORiHUxSrVGA95mBFvUVsWBf0IR6x0sq2kYTvQQY1MLDoJuF4V8pIYA5n8lGXMNIJ
55/4pizovQjVPlNfwF4wSXh5053UfA==
=0jmK
-----END PGP SIGNATURE-----

--7N6MJBqn3QPaTryX--
