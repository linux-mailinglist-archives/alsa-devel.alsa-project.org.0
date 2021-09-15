Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B84240C490
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 13:48:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D8271838;
	Wed, 15 Sep 2021 13:47:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D8271838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631706481;
	bh=FDTUJMQvwOQU3pHsc7a6sibrkLGcxASVeRN2766qIFk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l+hhOSFir2k31H0y2DoYeU/cHzg9fasT9Dv7XGF1mBUl+IYeDT0+txXm3n5yxVFlv
	 TebJYyzXPz57QeS53wsE9rv4jX8CbY3ZFQQlChnPHykdq/vP2AM+fy3ws/0LSuFL+O
	 DCLyUXZy+ElG3n4TwxlMOtFAf314M3yT0szljOjg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF2A5F800EF;
	Wed, 15 Sep 2021 13:46:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDCFDF8027C; Wed, 15 Sep 2021 13:46:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFB47F80117
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 13:46:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFB47F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="A9iHYkT+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B0416128B;
 Wed, 15 Sep 2021 11:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631706389;
 bh=FDTUJMQvwOQU3pHsc7a6sibrkLGcxASVeRN2766qIFk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A9iHYkT+QBLGVtL0IGgSYtHWYmPwsXMH98Ycw1Sdn6p6+ue7JsPmSHa0c9sjhLcge
 2tlLa+ubvgPJzqFuCUj1FFsDzEi9yzgbsKucdOpnGqMFwHFci/9n1yCEzhaeNKyLfG
 WANooGcR0zDqE/hzJ5Lsdj/mWpK7RIbqVsKoa3z6EJ+HoIsQcK0R0uRPaoLSlmLh4o
 VGTyTPzPOpIDvbK2eWr3h80Zo6Vd6OhDBBGg7LVgM2Zh8dL54DMzLEurBvCQPiT30J
 u1IWbJnM2L+gZnrTx5wH4rgtlV/B52nTDmLMlDfvXSQ3l7hYMTsL9lu7zbMBmB4vpe
 KeX98iJQuU6Gg==
Date: Wed, 15 Sep 2021 12:45:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Seven Lee <scott6986@gmail.com>
Subject: Re: [PATCH] ASoC: nau8821: Add driver for Nuvoton codec NAU88L21
Message-ID: <20210915114548.GB5389@sirena.org.uk>
References: <20210824041647.1732378-1-wtli@nuvoton.com>
 <1651f0ee-5667-c7ef-9cb0-a648e2ad7d02@linux.intel.com>
 <20210824173237.GM4393@sirena.org.uk>
 <cbc4985a-9a09-78e5-9023-708febc4c00f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="H1spWtNR+x+ondvy"
Content-Disposition: inline
In-Reply-To: <cbc4985a-9a09-78e5-9023-708febc4c00f@gmail.com>
X-Cookie: Absence makes the heart grow frantic.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Seven Lee <wtli@nuvoton.com>,
 KCHSU0@nuvoton.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 lgirdwood@gmail.com, YHCHuang@nuvoton.com, CTLIN0@nuvoton.com,
 dardar923@gmail.com, supercraig0719@gmail.com
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


--H1spWtNR+x+ondvy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 15, 2021 at 11:50:56AM +0800, Seven Lee wrote:
> On 2021/8/25 =E4=B8=8A=E5=8D=88 01:32, Mark Brown wrote:

> > I've been asking for documentation of what's going on with the locking
> > on every revision of this so far to no success.  As far as I can tell
> > the driver is doing something weird where it needs to take and release
> > the lock in different contexts which doesn't work with the kernel's
> > mutex implementation where you need to take and release the mutex in the
> > same context.

> Currently, we have deleted the semaphore and actual measurement. We plan =
to
> remove the semaphore after estimation and discussion. We estimate that the
> operation time of jack detection is less 100ms so that the risk is much
> smaller.

OK, that sounds good - we can always revisit later if needed.

--H1spWtNR+x+ondvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFB3OsACgkQJNaLcl1U
h9AMtQf+Nob2O4OpscjQDoA+5JP4Cf4EKH9DwSdGKK330o/lppdy8u+CGftv8scl
jfets9YtBeQ4Hn9ESbbeAHM/ZubbMKEPDn4BVF7SWoOxWsXupMnwTbDMKrNuRk7m
q528P1rOkjOiChUiiqEd2uoJAhDA/eNGngZnuqCN6YP4FQy5T+EIMOX5MIm3r1xX
qgm8A8qbdOFZ2EYVD8GG4Gop69DK58SpaQiuN+0ZMY0Iq8qHuUjdY0sFbACbvcGu
Hl7QauOhRkS99Jvo/+yVjwktP0d2FFgfM8f3F4pEM8/6ogdWs+4hT5f7p+XNu++R
ullFSzPHpooruHohI87YaFaa35f3Og==
=6Rso
-----END PGP SIGNATURE-----

--H1spWtNR+x+ondvy--
