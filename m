Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 675D325598F
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 13:43:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4181186E;
	Fri, 28 Aug 2020 13:42:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4181186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598614996;
	bh=MaASZatezYnsnTvN/iW46PG9ZF1Yto7qOUQdDiuXixU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mssn87V/mYhXzH6Omp5IxsOYi6KFPhIMPfJ8t1hWxijeTWkA1TtVlLjN2B7oaOb8d
	 HurAT5mWoiZht03u9+U1mhR2p7y5zr9yztVFHi7SjRiGbih1MyQiX46tduh9IKRTzl
	 n0PtDa0tYV6zdAdctGLmCGknPrach+mnA6QqlUtY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29C80F80143;
	Fri, 28 Aug 2020 13:41:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B173DF8016F; Fri, 28 Aug 2020 13:41:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB5D6F80118
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 13:41:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB5D6F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OVA97ENb"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3F38720848;
 Fri, 28 Aug 2020 11:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598614881;
 bh=MaASZatezYnsnTvN/iW46PG9ZF1Yto7qOUQdDiuXixU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OVA97ENbEmvVyjMauH1f3r+66JwiKQn2O2Fd47hfs0vZvyoZFcfknGp1HRqlS5GTt
 8bSzu78t/p9MV81FpvdwLqFu4Hin/0UqELqSuNnvwodEq/N6q0gN3K7Ev+XL+5Xnod
 6DlkeKncryWwuMWIKcuUbd5DLKglazEJ6Cw9lZvU=
Date: Fri, 28 Aug 2020 12:40:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] ASoC: core: remove artificial component and DAI name
 constraint
Message-ID: <20200828114043.GE5566@sirena.org.uk>
References: <20200827205100.1479331-1-dmitry.baryshkov@linaro.org>
 <20200828105354.GD5566@sirena.org.uk>
 <190cb4fb-44d9-cb70-f3dc-f8285e6abebb@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3XA6nns4nE4KvaS/"
Content-Disposition: inline
In-Reply-To: <190cb4fb-44d9-cb70-f3dc-f8285e6abebb@linaro.org>
X-Cookie: Your fault -- core dumped
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
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


--3XA6nns4nE4KvaS/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 28, 2020 at 02:38:19PM +0300, Dmitry Baryshkov wrote:
> On 28/08/2020 13:53, Mark Brown wrote:

> > Are you sure the name doesn't get exposed to userspace through a field
> > that's 32 bytes long?

> Good question. From the first glance the only place where the names are
> exposed is the debugfs.

Yeah, I think so too - they don't end up in the PCM name which is the
what I was originally thinking of.

--3XA6nns4nE4KvaS/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9I7TsACgkQJNaLcl1U
h9C0VAf/eg+kSMciscSxBYLfNOj2EjEYr7RUncMXTiU6kwpHZCwRRg1rHLk5JWSx
ZswQAzrL9mBMYI6DCn5WwkoV+Jr246eQNAwwFcw9466y4aHIJbYlqu+toY1ZgCx7
XBJFeknoxx7ZywtLvJTC3c3ZibTw1yC8EEHCXqwcdpZp2j6iyvbIwg7z7cui41+R
y30daN0beFIxQsGqx1aom7lQJljluayOwayud/HLfz++52DyNYBSlTso69Urx1EL
SNuJeAXaC9nA0XrzzwtXUZLGAEitb2l4fenisZn2NHKhZaMRdzye5omyJCrh+FYC
VMVY1RJS2d1FGTmVbPIs7a/RnsHMCA==
=+l7o
-----END PGP SIGNATURE-----

--3XA6nns4nE4KvaS/--
