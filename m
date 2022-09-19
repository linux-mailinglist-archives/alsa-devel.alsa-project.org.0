Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 274C45BD2C7
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 18:59:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4DB620C;
	Mon, 19 Sep 2022 18:58:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4DB620C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663606764;
	bh=C0nAMxyn3SgqoAnhU2dZuMQuHSZiA5Mv2JW2+3MF/KQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IxoH9uaasfmClvkw2X26XHtXIb17h+g59En3MJKPvdWpChmytXJUCviQzr6v20bMH
	 3Ov7eRy0kyYqnyuc7SZ19O9e8WrsZxw1UpRZtwSI5jXTH/MBgqRWcj6vDOzECgnYXH
	 V9g5cvuExLIQpFy5RmkdSdyZFMuHSrYncMZKArqw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1335CF8032B;
	Mon, 19 Sep 2022 18:58:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3ACFCF8023A; Mon, 19 Sep 2022 18:58:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F5DFF800E5
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 18:58:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F5DFF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="U3djGa8f"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DEE59B81D6D;
 Mon, 19 Sep 2022 16:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14CDC433C1;
 Mon, 19 Sep 2022 16:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663606696;
 bh=C0nAMxyn3SgqoAnhU2dZuMQuHSZiA5Mv2JW2+3MF/KQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U3djGa8f5Lt/G/69FO79jm3ixnOlkiKcpdKVHcpT7vD7SRRe5KNsx16jMSynu8TWv
 2Urmia4jSSbRhBKnuFIuZTMf6e/Twk+x9SRq/Rh1kO3kFG3mYJMzUh8ya4OtwN7ZMm
 phdTzdJl0HRxzC8UGfApRaJ6vBqVyMpqoIgH+JiDqiYQeLPp2YvqCrN/t7Kwx0gLFU
 a8fVVUkzJ3H9Mq3qQbQ8E+mATcJvep3ohCLv+RHPqTljemXvAf9brKBNJP3BL3GZ91
 zZS0S5N/p5qQZSaTwJQk6Ufyh7FwNx/ggy3UEEU/g3kjfJNmq8slgTSvnpvF9Qyf6R
 JnmSzoRrHEseQ==
Date: Mon, 19 Sep 2022 17:58:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Astrid Rost <astrid.rost@axis.com>
Subject: Re: [PATCH v2 0/3] ASoC: ts3a227e control debounce times
Message-ID: <YyifmJz1EUZQioDn@sirena.org.uk>
References: <20220915113955.22521-1-astrid.rost@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="MMQhPDbTWkSdlB9F"
Content-Disposition: inline
In-Reply-To: <20220915113955.22521-1-astrid.rost@axis.com>
X-Cookie: One FISHWICH coming up!!
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, kernel@axis.c,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dylan Reid <dgreid@chromium.org>, Astrid Rost <astridr@axis.com>
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


--MMQhPDbTWkSdlB9F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 15, 2022 at 01:39:52PM +0200, Astrid Rost wrote:
> From: Astrid Rost <astridr@axis.com>
>=20
> PATCH 1 - convert ts3a227e bindings to yaml.
> PATCH 2 - add ts3a227e bindings to support debounce times.
> PATCH 3 - add ts3a227e driver to support debounce times.

In general it's better to put new features before binding
conversions, the binding conversions can require more work than
simple feature additions.

--MMQhPDbTWkSdlB9F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMon5cACgkQJNaLcl1U
h9D+uQf/fWSnbD8A4X7r2Xjxroyy/LkMRBRP/NnctY6OgS+lLFESBrnRylKMMU4k
cVmMNqD/UGdJP+pPdrMk8kCd/vu3M9BCupUFraOaHstBiKwknFZCVlBvvi3cYRn5
35RP1kIdXSK1VJLyp3WIkpzolZ3qYZS2VZ6CFzWuVK7shRoV5Sdk7sYLTuGpbpZa
mwhwt+40/yD91RHNZOtUiBkgEYvbDdrSxgzVs4v5EiVRHpO3Sgf5zBhKBcKU+Er+
S9bHm9vEFlYOBEHUQLpugj0uGCza35sZ3QcifTwuDTJqLjkEbcW3Gi3mxT3Wmt9w
8JxRPlInIqZc4U7+PHQqobzOPCuhCw==
=yZTW
-----END PGP SIGNATURE-----

--MMQhPDbTWkSdlB9F--
