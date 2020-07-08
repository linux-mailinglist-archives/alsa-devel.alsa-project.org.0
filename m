Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25098218662
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 13:50:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADBAC168C;
	Wed,  8 Jul 2020 13:49:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADBAC168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594209006;
	bh=Mikt6dUStYo9h3djKflu6fJbRkEddgBrZjz+eRq73m8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HSCVFU3WmtrT7dFO1sEMOcpwT8It0oii0ChQHjDeModHOhmgOWupRQtO7Y+GZKYf2
	 fHgG/CHUEeWx5AJ4jy80VSxiMYTreNlzkAwHPlwXSmdu5z64+FJ4sZRFyr+NrCiS51
	 mPsWdBAXdKEv2bjeCf/Rj9PJJpX/wYaee68RMAjY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 908A9F80150;
	Wed,  8 Jul 2020 13:48:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08B8AF8015A; Wed,  8 Jul 2020 13:48:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 202FEF800AE
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 13:48:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 202FEF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oz8QvN/A"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DE81A20658;
 Wed,  8 Jul 2020 11:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594208891;
 bh=Mikt6dUStYo9h3djKflu6fJbRkEddgBrZjz+eRq73m8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oz8QvN/AvNuq1sY+wtIu0xPpChWhEkH4e5vrIhG5r0V3IPACDtPsTuWR5Pyb8HeWw
 8Q49ONi1JGB/ZVPhM/oGH6IM4vq/WO7cFXloh43VjyOjs8PnhJms0N2FKDvcTKXoWi
 fMUwg/eiS/R3QfCbd/YzY9UlvxHckYcKBu80cM1M=
Date: Wed, 8 Jul 2020 12:48:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 6/6] ASoC: Intel: sdw_max98373: add card_late_probe
 support
Message-ID: <20200708114805.GJ4655@sirena.org.uk>
References: <20200707205740.114927-1-pierre-louis.bossart@linux.intel.com>
 <20200707205740.114927-7-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="WRT3RXLOp/bBMgTI"
Content-Disposition: inline
In-Reply-To: <20200707205740.114927-7-pierre-louis.bossart@linux.intel.com>
X-Cookie: Oh Dad!  We're ALL Devo!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 randerwang <rander.wang@linux.intel.com>
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


--WRT3RXLOp/bBMgTI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 07, 2020 at 03:57:40PM -0500, Pierre-Louis Bossart wrote:
> From: randerwang <rander.wang@linux.intel.com>
>=20
> Disable Left and Right Spk pin after boot so that sof can
> get suspended. Please check patch: ASoC: Intel: Boards:
> tgl_max98373: add dai_trigger function

A commit ID would have been useful here.

--WRT3RXLOp/bBMgTI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8FsnUACgkQJNaLcl1U
h9AfEQf8D4aglFihp2T34Ag+1GJFNh9z9rLGYqIYm7ikvngOlgbf0qtNNXanlc1C
BDf31mQ7YbD/ZAmnoWA4SIoDE+JZ0zq4abVw3+HX+Q5O89EhyD1cO7WRzZeWr4HR
6F7zZlds0Up0drkLWZDGT7zqb43Y5D2P+SjZH6M3goMFg0ZcYBvWCkOjQYIxfd1m
IA6VjWj/JJKYKU/hAD2+QqrodtTSpkTOqEBmK1XhgJVv+hILBAXdjNLDpY/ITZSR
EWi4+s5su9JeVqSXeWMFf5iDqJ+KvW7mVjf/bzxmMVsthxjcmA+zUwqTt6+4Zv0G
YsNRgmrYHdCecZGEvyQFfDy9lWb0ow==
=j/+A
-----END PGP SIGNATURE-----

--WRT3RXLOp/bBMgTI--
