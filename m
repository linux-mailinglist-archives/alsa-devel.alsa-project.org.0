Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9781EE28D
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jun 2020 12:35:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36BB6166F;
	Thu,  4 Jun 2020 12:35:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36BB6166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591266954;
	bh=ml0TSme6cwPJFcsMzPbSkhZNqOuWYZXZIbIdkDTqu0M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P0tuHlB99dVTK/VbcLAthl1n0ZhKimKcOJach7+h8wW31cvMGx+X3OjT9ux3whGM2
	 bNu7CgpYpMOEnIU92AUma0+F+OhPguZ3TjGg2nCOROxcxwrQdjwGtFMzCtDqD+Q+K8
	 3yQ5z3vKa+olblWPS8xdaZzQthLkxE4SrgCskOoI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 653EFF80260;
	Thu,  4 Jun 2020 12:34:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9608DF80254; Thu,  4 Jun 2020 12:34:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E77C4F8013C
 for <alsa-devel@alsa-project.org>; Thu,  4 Jun 2020 12:34:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E77C4F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ib7SHA56"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 835622074B;
 Thu,  4 Jun 2020 10:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591266841;
 bh=ml0TSme6cwPJFcsMzPbSkhZNqOuWYZXZIbIdkDTqu0M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ib7SHA56hnoNxXEB3RVG+tQ4oeiz2yi+hrv6ZKVV+AWSJx+cpfoz+WeKC4o4na5LR
 ZT4TZ+MzCY2GnYNX1KDwgvV+6vBj5/QnFBLwnHEmU5vxPKOwVWU+lfdl7dqqa317dq
 4k6cEBdwgIjmijZ6EdTn8Rk2Joecbln7Eg2V3q1g=
Date: Thu, 4 Jun 2020 11:33:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Xiaoming Ni <nixiaoming@huawei.com>
Subject: Re: [PATCH] ASoC: max98390: fix build warning detected by -Wformat
Message-ID: <20200604103358.GA6644@sirena.org.uk>
References: <1591260574-12717-1-git-send-email-nixiaoming@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline
In-Reply-To: <1591260574-12717-1-git-send-email-nixiaoming@huawei.com>
X-Cookie: VMS version 2.0 ==>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, steves.lee@maximintegrated.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 alex.huangjianhui@huawei.com, dylix.dailei@huawei.com
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


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 04, 2020 at 04:49:34PM +0800, Xiaoming Ni wrote:
> Fix build warning:
> 	sound/soc/codecs/max98390.c:781:3: warning: format '%ld' expects
> 	argument of type 'long int', but argument 4 has type 'size_t {aka
> 	const unsigned int}' [-Wformat=]

Thanks but this was already fixed.

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7YzhMACgkQJNaLcl1U
h9A53wf8DLWNHAYxxJtyck1M+jV6nQK+GVYUrVtteiTM0qIor6RzV2EFpLde1I1P
gWa5qE5gs36x9WZRwUVfqrRyxATRWNDBDXVGr1yi1Nr1uRiMxRa2OBH6AIUeeKVQ
Py5pUwDCLokOkWu5OoMraUubXIBC7mMTDO639djf4TLUdN3iVo7ZvNZuzYPWzLPd
siuQIuJR0slgTIRVrv4ILKKQnFUvfoGZ7E1n/h0327qhZsSDzofHO1E2b/h5vKuE
jJ7raMnK1kS6tzy0ekKYAOHb8xR+B7hBUDlPox83eAKbIKJk+6J/kFFtE6VOr+Jy
ypnhcWmJymrH7PP7xd7tbJfD0zCn5w==
=mHCk
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
