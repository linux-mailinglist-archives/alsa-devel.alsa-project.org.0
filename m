Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58588571BE6
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 16:03:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E51121664;
	Tue, 12 Jul 2022 16:02:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E51121664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657634618;
	bh=+zN1GNGCIL6+YVEG7IbxuOhZlEY06u/BIUm+9zyo8wI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kOK4bWheZTay2SK2PAActjVo7uaCy2L7TQ9V1iRpkkoq3VcEH21AO31zkIuTMVGMG
	 KDjfvk0QahT31v1vMKpLLeNYlu8BfCTgoMXAGavxJWnq6Q04hj1oGZyAfDRYMf8y8r
	 xKKYUg9P+dewrsGwMZj59CZdEPbsOrQZAhF022c4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BE8FF8012B;
	Tue, 12 Jul 2022 16:02:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B5BBF8012B; Tue, 12 Jul 2022 16:02:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A24EF8012B
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 16:02:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A24EF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="a6BSQCwx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ADF16B8181E;
 Tue, 12 Jul 2022 14:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29559C341C8;
 Tue, 12 Jul 2022 14:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657634547;
 bh=+zN1GNGCIL6+YVEG7IbxuOhZlEY06u/BIUm+9zyo8wI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a6BSQCwxx8ttq402GPYNi4QvOmYUM+e67eYC0xleIyy6mb0YpM3YZL3DUlSS9VVzN
 ggmi9qUpPLVy90FlUcBacN7u+Rg35MhmNgoKegrQkpPym8aQJq1LHUzhqNn18e+SGL
 n4mbTvpctfRbzJbqcpYH9/6hq1WL2Ahw+L0llxNRrwc3WXBkiYkxAUHZ+vbeTTWKp6
 99e8F1NpeXe65A8XT9Lzmv2a6ttfMz6vhdkyRHqqN7SDXjikl+UDqnRecik67fLHta
 h6HHglostPy8fy863cHS9y/sE9KUW5q/Wcy/aEcM+ZbDajXo+kIRprvr4Xr/0DBsG2
 rp7HxCGIeZGiw==
Date: Tue, 12 Jul 2022 15:02:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH 1/2] lib/string_helpers: Introduce strsplit_u32()
Message-ID: <Ys1+7P5zN4irxKW3@sirena.org.uk>
References: <CAHp75VckU2ZraLJ-frjWXjUu9pFW+-XmWgTbYqUXOUNAD-1HGA@mail.gmail.com>
 <6c8e4104-2239-a188-649d-585f059cabdd@intel.com>
 <YsgjdKEtE7pMDTnZ@smile.fi.intel.com>
 <a73b3ec0-5abb-ddfd-414b-b9807f05413e@linux.intel.com>
 <CAHp75Vd4D0KF7ik+aMOwv-+bofWja_tDe4YUmihQBF+RiHZTmA@mail.gmail.com>
 <e2fe6351-f9ee-48eb-ad7f-280249f7f3f7@intel.com>
 <CAHp75VfvN-iJTpgg6JeKhOqJLhtYSieo7d7SOCBoUu-81FtSqg@mail.gmail.com>
 <c19ed4a6-6a96-b4a4-0f5a-7ca1dba925d1@intel.com>
 <YsnoH64cKCT7gndw@smile.fi.intel.com>
 <2c6a4a61-e6c8-0487-8d29-dc3fbb90bbe2@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VOtkm5XuX2adiHc/"
Content-Disposition: inline
In-Reply-To: <2c6a4a61-e6c8-0487-8d29-dc3fbb90bbe2@intel.com>
X-Cookie: I like your SNOOPY POSTER!!
Cc: Andy Shevchenko <andy@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 amadeuszx.slawinski@linux.intel.com,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
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


--VOtkm5XuX2adiHc/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 12, 2022 at 03:51:04PM +0200, Cezary Rojewski wrote:

> Please correct me if I'm wrong, but there is no guarantee that int is always
> 32bits long. What is guaranteed though, is that int holds at least -/+
> 32,767. Also, values larger than INT_MAX are allowed in the IPC payload.

Right, int is just the natural size for an integer on the platform.

--VOtkm5XuX2adiHc/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLNfuwACgkQJNaLcl1U
h9C/QQf9FtMNLt7fY7kTHfnJjxoc2xRbWmtmteMI/X1xnpa0sAS30hZrAP5o49ri
tl19bcPCbpY15Ih/BJlE7TOW358K5CxVlICUZdZ088SVbKN+tTAig9DVnCk4cjoI
53fscUp8y/saZ3R0HnDZY+KQhoh9j60bMWs3ff3ciAHx6HXVOdJ6qgKbWgsnxo5A
viX6XmKmA0tPnn69FBCHz7ooJE9R8I+Wh1oWjL02rJMrWwARzqpyt8yubvHL1tSo
4EU+DCDtCYimR9nzs1/m4jdK3J2T7FpX2NQgO1NNDmRbcAqkiu4Gd0Ek+ydaIcym
uIOTy5RjhQb41oJUTlQvfqfdQ0tsMA==
=JOe6
-----END PGP SIGNATURE-----

--VOtkm5XuX2adiHc/--
