Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3025C2484C1
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 14:32:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7B9B175B;
	Tue, 18 Aug 2020 14:31:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7B9B175B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597753965;
	bh=eHNv9FdwsK7uVxIPYmdOittfWJ5rJzEkrVPozM1SQu4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q8k6ZmC4Ps8pZV0F5kzl9cApmkTm0G/5VBFHmxQd7c51IbZQBr5oMu2a2BwG+BznK
	 pNS6LZym8J0RZKEBXaofoIyL5hK6b3E0GgXjS0hdLWArq12dXUzfJv+aVdPWKXjOQI
	 iWpCCklDpiqSZY3JO6HQ48WRUHymIY52Reljw92o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A266AF80114;
	Tue, 18 Aug 2020 14:31:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1599CF8023F; Tue, 18 Aug 2020 14:30:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01DECF80104
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 14:30:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01DECF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SKcxKtnJ"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5BDD72065D;
 Tue, 18 Aug 2020 12:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597753846;
 bh=eHNv9FdwsK7uVxIPYmdOittfWJ5rJzEkrVPozM1SQu4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SKcxKtnJrC7cXoPgNbvfatsTcUqQhXRNKGPXtOc0RgH4w9KY00FBZqzp1j8kQ2QZw
 ZzBaqCkEH4QbKmE2zV4HIk0defjdZ64vYVLhewYYIeqY7p994IAwXa/3ppqOTMNNGd
 nMguyU5y+4CN7DYElJUpDnrUftjA7P8DWV1/7Uv4=
Date: Tue, 18 Aug 2020 13:30:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [RFC PATCH v1 1/2] ASoC: rockchip-spdif: add description for
 rk3308
Message-ID: <20200818123015.GA5344@sirena.org.uk>
References: <20200815112437.6662-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <20200815112437.6662-1-jbx6244@gmail.com>
X-Cookie: Ma Bell is a mean mother!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, heiko@sntech.de,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, sugar.zhang@rock-chips.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
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


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 15, 2020 at 01:24:36PM +0200, Johan Jonker wrote:
> A test with the command below shows that the compatible string
>=20
> "rockchip,rk3308-spdif", "rockchip,rk3328-spdif"

This doesn't apply against current code, please check and resend.

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl87ydcACgkQJNaLcl1U
h9ATqAf+Kw1JpgjNUlPGU5ePMTxIX88Ulj71aDatZmH8W/yzzfj7Lq5d1Rd2SDTC
e7WeRvDuKmtoPbccucFH0aNFO3ev07yvSzgyQEzjlnvEIWiYO7RTxSQaqWfwGYJJ
NgJ22Gfro6WhWVyOE4Wj6SQ9lGk5AkdmBEIiExWBgudwa+m7rwnzY5zM3oaLWCnO
5zvlTV1yglKX5xuYjO38wOmmq2c1ZyWs8qriuXShJGQr9R96wZEvstrJlExGn/V/
gR5Y0HvcEnAkCGWj8vqoeeq+Ot8vwbIkF4LZoAJpKVSDW5NELwr6IX7aww6k9p7+
jsmCl584BsniWd/wfF6j7sQSETp0DA==
=ZzoW
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
