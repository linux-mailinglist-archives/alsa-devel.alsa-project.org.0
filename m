Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B82C258F83
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 15:53:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00E4D173F;
	Tue,  1 Sep 2020 15:52:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00E4D173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598968413;
	bh=nrvJQoLEDTfHtV5/hqRrKSb9nbwD9I5lVDWOWJimEmI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qSW5/yiAS5n/VSSMKZpLyXGhOyGBpWSmeAzFbJMFsVl+cuQnM6zwHPpjqu7J9js4n
	 SyAkocwgIlhi+J7urfhDVX+9arMzLa+0wd2XOt0MFhQ979IEX0q33PneKaQNJVVSn7
	 RD2leBND2QkVGFAStE8pfbH3blaeqijXlJBvbo74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DBFDF801EB;
	Tue,  1 Sep 2020 15:51:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AED0FF80217; Tue,  1 Sep 2020 15:51:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA47DF801EB
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 15:51:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA47DF801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="euK5FvAz"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2A50B206EF;
 Tue,  1 Sep 2020 13:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598968300;
 bh=nrvJQoLEDTfHtV5/hqRrKSb9nbwD9I5lVDWOWJimEmI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=euK5FvAzP0U9LLXo6k3cibYxOhvnPhJzMmFD5V5WK37i7kx0+scO3zaUhu59r0g7N
 DCGpV09HeIjVCF7LNIG0bCXuOmbT4981klzdy/j8oWWi673cH/jx8jvNy+Xn9XiI/H
 hZVVA+gJ1YSnx39tGOLE+KM4ZPU5gdypkgUfGQX0=
Date: Tue, 1 Sep 2020 14:51:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v4 1/3] ASoC: codecs: soundwire: remove port_ready[]
 usage from codecs.
Message-ID: <20200901135101.GE6262@sirena.org.uk>
References: <20200831134318.11443-1-yung-chuan.liao@linux.intel.com>
 <20200831134318.11443-2-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BQPnanjtCNWHyqYD"
Content-Disposition: inline
In-Reply-To: <20200831134318.11443-2-yung-chuan.liao@linux.intel.com>
X-Cookie: Equal bytes for women.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, vkoul@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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


--BQPnanjtCNWHyqYD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2020 at 09:43:16PM +0800, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>=20
> port_ready will be changed to a fixed array in sdw.h and all initializati=
on
> work will be done at soundwire side in the following patch. So remove them
> from codec drivers.

Acked-by: Mark Brown <broonie@kernel.org>

--BQPnanjtCNWHyqYD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9OUcQACgkQJNaLcl1U
h9B9KQf+PTnsPHfR61V3yh7tnlhzRn3zxze90AINjkpdZ8g3HBYdzKji7+yeL8tr
Z9QkHaZZrv37x6qox0xa3F7V0w1g8n0+QKBoksLFlTtGqdQMexnYuyPOaWH4SkHF
aYQJ64ovRqq9bGCqcU6bNSp6ri4cjqh9SDmmj1t77BNZkGqLHS0pmO+FH5Pfzzo7
cJ0W3NzCGL+CfUFqcS2KHZbnOfpWNa+Evvue6TlSv4V4hYjfKMtg9GLr/tnoSLih
SXxLXhSrkuHYNSqyelgflTGBtVopDsUmMxEhUo1lDWcfpwcXZuvv6EnlbjeWKrH3
ArsXUOk2Uqj9OWEpDZAktI1ybnGdHw==
=xVih
-----END PGP SIGNATURE-----

--BQPnanjtCNWHyqYD--
