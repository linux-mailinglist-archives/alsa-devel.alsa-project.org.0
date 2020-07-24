Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CACF922C438
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jul 2020 13:18:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DE68168A;
	Fri, 24 Jul 2020 13:17:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DE68168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595589521;
	bh=T2VXeJM1wfuguzqTshc8WPBH9EUOUw7OHVpjPji3pbg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K8DdQtpCTdHF5fM5+EhJtfvsbSEBfYRzgrJ7Gxn0ZVE2B/CR1ULEMqj34BArRs8T0
	 S3dEmQ9GJZcgV8ABT9ixF24wBjwy6+NgLagp+eibHEIx3Drvgzcif985di7MxXr4IW
	 9sGGEOU3l/BmXa7Cg05qQQX5BJvV/y5jeaNXXZ+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7237DF800DF;
	Fri, 24 Jul 2020 13:17:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EB38F8014C; Fri, 24 Jul 2020 13:16:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35532F800DF
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 13:16:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35532F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="h8mPxHGp"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A99822064B;
 Fri, 24 Jul 2020 11:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595589409;
 bh=T2VXeJM1wfuguzqTshc8WPBH9EUOUw7OHVpjPji3pbg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h8mPxHGpT68HtGqitdzMo0vmKDOOAVd8Hu2PEHBBxPoJigvR5zWAbpHrH01GaNEj+
 0UoUXiXrs5kOTm3D+zFdNBnvWTl+5Hp3t2GFKzlllgKXZR5emLniNqJEvyCjykPqzK
 aECx60roTkxz1rmS56xI09p02+SEKAbUuTepke/U=
Date: Fri, 24 Jul 2020 12:16:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH] ASoC: dapm: don't call pm_runtime_* on card device
Message-ID: <20200724111634.GB5664@sirena.org.uk>
References: <20200724070731.451377-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZfOjI3PrQbgiZnxM"
Content-Disposition: inline
In-Reply-To: <20200724070731.451377-1-tzungbi@google.com>
X-Cookie: You will wish you hadn't.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com
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


--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 24, 2020 at 03:07:31PM +0800, Tzung-Bi Shih wrote:

> Commit 4e872a46823c ("ASoC: dapm: Don't force card bias level to be
> updated") stops to force update bias_level on card.  If card doesn't
> provide set_bias_level callback, the snd_soc_dapm_set_bias_level()
> is equivalent to NOP for card device.

> As a result, dapm_pre_sequence_async() doesn't change the bias_level of
> card device correctly.  Thus, pm_runtime_get_sync() would be called in
> dapm_pre_sequence_async() without symmetric pm_runtime_put() in
> dapm_post_sequence_async().

> Don't call pm_runtime_* on card device.

Why is this a good fix, as opposed to only skipping the set_bias_level()
bit?

--ZfOjI3PrQbgiZnxM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8awxEACgkQJNaLcl1U
h9CQXAf/Sfi4sK7xoq2JX4A5reRctVEnDTg+jcYA4UsPbh6DdlqIcdnPM9ZDbU3l
OuEyPVSJHUI04bDnJgh8VWp977I++i4lLESNR1Rvx5/GvL1qfkK3ia5FRMsOG9ph
zEXXZ58gvwvMn2NeTRhJW0YOYqo7pfLhNx1LeHUvLfUYyGkLDPTdcL8yOZnrJPu3
3ZQ5lUr0pxmskOWuDzZDT5nzkv4uDHphvGoKHxbwAFUsUcbnmjTU0Ibik/mVl4me
CwGOUBhRxUuS6GtxkcD1kviyZkyt0gEg55FjgW4XH/6TIvI6qJsZvMpBRXbhSm+k
/hUMJ1llfzIa3L/qDxHmiuOv/cGZEA==
=0+jd
-----END PGP SIGNATURE-----

--ZfOjI3PrQbgiZnxM--
