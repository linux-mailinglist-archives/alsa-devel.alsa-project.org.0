Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB88459E755
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 18:34:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 530C51685;
	Tue, 23 Aug 2022 18:33:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 530C51685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661272463;
	bh=iShwDF1LvUqQUhnFrVSrO45fBJAdBU9+ZEnxoDBD0qQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EqOOOX2FV2+FliRdmNeEJZo2T11j+8FRfVb7t++lPHqjSXuBp5qWBCn0/WvStwM5w
	 Gp7np/J9NoWZdCimfk5vEfT4e11QXyNmp+oJFzshB12/tMVflCCEZDT5qN6YGKYS9l
	 +mfbeUhcbxMIyXqvvarj3HOxwPLyeKkupcxpnYls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCF99F8027B;
	Tue, 23 Aug 2022 18:33:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FC5BF8014E; Tue, 23 Aug 2022 18:33:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C4BFF8014E
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 18:33:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C4BFF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VoAyWUMJ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 664B7B81CD5;
 Tue, 23 Aug 2022 16:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 759E9C433C1;
 Tue, 23 Aug 2022 16:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661272394;
 bh=iShwDF1LvUqQUhnFrVSrO45fBJAdBU9+ZEnxoDBD0qQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VoAyWUMJRbqFkLF/T1meoER25n/fOiimaZmsqj1bileYdAhvQYloc1k0nc7mYCS8x
 Phbhi4L7zV7v9ZJL1wwBeR+Eg1gYniZVwfGy3DuiB0NVRUE2czIXE72IUicW8XMyJG
 K5UplrltHjMJktACUBoQDTw3ys4Bxgg9VD0/CsJrpIYuf9meNklSmGKVnLIt3wRR4/
 CQgeegDmyUWFRgW5QDhY5S4VRXQg4GRJ1lHNsJjAzrhwp3MRRsL4yl8G+fGhNPRpww
 mv99AJ7VqUWhvIFzu+51uxqY8O2OJ0iULbDRzeoyhNy47L85sRQqPtCKc7phGR1/v2
 RJzgpsIpu9hiA==
Date: Tue, 23 Aug 2022 17:33:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: fix alh_group_ida max value
Message-ID: <YwUBRMqD3E1/TqyU@sirena.org.uk>
References: <20220822190211.170537-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RTZFQNjilJYdMnzE"
Content-Disposition: inline
In-Reply-To: <20220822190211.170537-1-pierre-louis.bossart@linux.intel.com>
X-Cookie: (null cookie
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 tiwai@suse.de, Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
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


--RTZFQNjilJYdMnzE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2022 at 09:02:11PM +0200, Pierre-Louis Bossart wrote:
> From: Bard Liao <yung-chuan.liao@linux.intel.com>
>=20
> group_id is from 0 ~ ALH_MULTI_GTW_COUNT - 1, not 0 ~
> ALH_MULTI_GTW_COUNT.
>=20
> Fixes: 0e357b5290532 ("ASoC: SOF: ipc4-topology: add SoundWire/ALH aggreg=
ation support"

This commit doesn't exist upstream, you probably meant
a150345aa758492e05d2934f318ce7c2566b1cfe.

--RTZFQNjilJYdMnzE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMFAUMACgkQJNaLcl1U
h9D1Zwf/Zy913HRjpypDBZxxeEPBFtPXyZITuwe876/TOsJBk5z+KFHURIQy8/37
2ifaFbyhjgFNbBdhiw07s1karXvSbsTKmktK1qm0wL7EuW90VRA2/s3PbpK3Vi3V
/GLHDlgn7e1diW/d60CpM4B1B1YRbCVbml8epCMe0oLaJKj5zdlhSJYmapgAcsjb
glv6hVvV/0FuZ5QxyesvFFqnJlcUd0DvbYXnW7DhNj92Pt/RrYHGWHdWcUGo8sF6
ktE5i2sKuhQjeBu7pbUh5I6Pay5S2P4/78RgvXNhvi8MmvoMjVzLAD0/wwlV+sh3
QjOxHPWMhLdqkqeqqDZDrnLkpPXPJg==
=G8jS
-----END PGP SIGNATURE-----

--RTZFQNjilJYdMnzE--
