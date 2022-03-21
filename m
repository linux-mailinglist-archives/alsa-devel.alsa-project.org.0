Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 299594E26C1
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Mar 2022 13:41:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB5411700;
	Mon, 21 Mar 2022 13:40:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB5411700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647866496;
	bh=OtOUioMyJ/XOAjmszxGkTlPQPSfW6e5iZh/o+i/MoI4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pJRqewyJaxvHrOMUtet6didJaMNJ0UcFI0PKWRoFJ2/O14Ome/4gtIEg3AfWEuMsw
	 Er8CT33W28todXfApHvyu4nwKSBUo+OyRox5ExXf3bQS5Hwr4enMmpEjCwJ3st/4qv
	 lDcp5ViCFHi2uItpUY6rFXPD6KH+YVYxcLb0PtjQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E86A6F80109;
	Mon, 21 Mar 2022 13:40:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD8D1F80116; Mon, 21 Mar 2022 13:40:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8359CF80116
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 13:40:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8359CF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fh9LQPyw"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7D5D860FD6;
 Mon, 21 Mar 2022 12:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84686C340E8;
 Mon, 21 Mar 2022 12:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647866417;
 bh=OtOUioMyJ/XOAjmszxGkTlPQPSfW6e5iZh/o+i/MoI4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fh9LQPyw5VUwxQwVgwO95Ky9N0xH+tk7cIdZ0p7Gk+2tVWkwSUrKFKGJHBaU1cjvn
 CHWlN032hJ/fjvhhbP1/djvgHtCYONKTg4F7nCsm9w2z0F1orL2P63ovO7SuXGf7nx
 FBtrnkMPw3nhZBIXeP9CgcOtM7bkYEg0IX34z6MJq27TUVlenl4lGbztSvbsfjMkbk
 aTJlHWJE071EYQbBrtE58yLwSwJAyd8eDZ3MGBHyu8NzvzKI7h0A6Xe17rv0lEQown
 H97So/X9MrmTPcXkV7VCTFFHtBWmE3Urh0fkglUj8LNuHc6DunLGZ8EN0T/KsdqO6K
 7v/caWA0aqXTw==
Date: Mon, 21 Mar 2022 12:40:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Raphael-Xu <13691752556@139.com>
Subject: Re: [PATCH v2 2/2] support either TAS2764 or TAS2780 device from TI
Message-ID: <YjhyLN0hwnatcdjt@sirena.org.uk>
References: <20220318094903.22026-1-13691752556@139.com>
 <20220318094903.22026-2-13691752556@139.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="JBJ1MKNrD2NfxFhW"
Content-Disposition: inline
In-Reply-To: <20220318094903.22026-2-13691752556@139.com>
X-Cookie: PIZZA!!
Cc: navada@ti.com, alsa-devel@alsa-project.org, shenghao-ding@ti.com,
 raphael-xu@ti.com
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


--JBJ1MKNrD2NfxFhW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 18, 2022 at 05:49:03PM +0800, Raphael-Xu wrote:
> Signed-off-by: Raphael-Xu <13691752556@139.com>
> ---
>  sound/soc/codecs/Kconfig                  |  13 +-
>  sound/soc/codecs/Makefile                 |   4 +-
>  sound/soc/codecs/tas2764.c                | 688 -----------------
>  sound/soc/codecs/tas27xx.c                | 861 ++++++++++++++++++++++
>  sound/soc/codecs/{tas2764.h => tas27xx.h} |  27 +-
>  5 files changed, 890 insertions(+), 703 deletions(-)

Can you please respin this with a separate patch *just* doing the file
renames?  git format-patch noticed that the header was a rename but it
didn't manage to figure that out for the main driver file which makes it
much harder to review what's actually changed underneath the rename.

--JBJ1MKNrD2NfxFhW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmI4cisACgkQJNaLcl1U
h9AELAf/XBDdNxK8EQUzD1mIwMR6gGA5m39Oxipshh37NrzmkSaCmqNKB2dbtf18
zNxqBO4T+erEYAnrl8DrOdocJYP9sigmlUEUBcqAXbY34X9LesPYBoDsHOnShEc1
WA+LruscQbmZER8usdt/L99qX5vyVeewTkO9ARE/r5wGIpDjN3dp6CuWo45cY1JZ
WUfd9DMXnr8E7O30I5kGhREVL+S+hK/I4fZTt4ZsaYWFYv1NtBc0L7LTZ6YFA7mF
OaqlpX8GJzx9Dtj3eDdyCxtUD37gyt2UECUgY4RFAwVn4KMITbc0o5Is5LVZF4Vt
d0jr8GB2zJzlp2KPAx8qNRNGVjhFCQ==
=oH7A
-----END PGP SIGNATURE-----

--JBJ1MKNrD2NfxFhW--
