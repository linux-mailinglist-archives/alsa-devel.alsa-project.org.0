Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB133500A3
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 14:48:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C0181682;
	Wed, 31 Mar 2021 14:47:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C0181682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617194899;
	bh=5dsan0ndrXUIqy53+oo57Q3YAilOJBB0JkfIOMsN35Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ry7tnATlxdprwYDbT9KOUftfw2r4eTWG/uml4+/XnikUGfvm3MREzEFe/qSlFUjjN
	 4m0DnB86H2x4wZAPql6ssrjYahukQTHyctVKr82dy8t7QH86Z0iEeTe9u51rjCmnUo
	 Eze6m3YqD/koZ06WNVxqvIeVJ7kHQhaZU1s7YUhY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0350FF8014E;
	Wed, 31 Mar 2021 14:46:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C69CF80166; Wed, 31 Mar 2021 14:46:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21F3FF8013C
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 14:46:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21F3FF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WvD7Ur3a"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D00861959;
 Wed, 31 Mar 2021 12:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617194804;
 bh=5dsan0ndrXUIqy53+oo57Q3YAilOJBB0JkfIOMsN35Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WvD7Ur3aG34dAIIV3x8Ep36vwkt/PVipw5fzhcrVagpmzfdHtQ5KPdiRpnXTXa5Ee
 N5HeHEcnaATBhnNfgGxMWUCZ70xxa/KdLbUFjYitonL9zuz/uVGMOSqlelQ9JDjFrC
 x1p8JELeQoinINo/caQyDTmEwpFu3tV2MfWy4e8U7/CbXFG9vqmfulRtsQo4vAR1Qh
 9lh3OdN5jNUTdB9DevHlGLf8pchl9vlJokB5uQRh/YJc7yukmRhRUZeyY1k8g33jmy
 nmmqwNVchp1S37LWivGJ25psBmGv5mjOCsj0Z7J5jcZ8HQVmhp+8ZiILsJseIqfxHE
 ocSrHbIR5GNAQ==
Date: Wed, 31 Mar 2021 13:46:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: Re: [PATCH -next] ASoC: cs35l35: Remove unused including
 <linux/version.h>
Message-ID: <20210331124632.GA13402@sirena.org.uk>
References: <20210326061331.3234485-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline
In-Reply-To: <20210326061331.3234485-1-zhengyongjun3@huawei.com>
X-Cookie: Never trust an operating system.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Hulk Robot <hulkci@huawei.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, linux-kernel@vger.kernel.org
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


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 26, 2021 at 02:13:31PM +0800, Zheng Yongjun wrote:
> Remove including <linux/version.h> that don't need it.

This doesn't apply against current code, please check and resend:

Applying: ASoC: cs35l35: Remove unused including <linux/version.h>
Using index info to reconstruct a base tree...
error: patch failed: sound/soc/codecs/cs35l35.c:9
error: sound/soc/codecs/cs35l35.c: patch does not apply
error: Did you hand edit your patch?
It does not apply to blobs recorded in its index.
Patch failed at 0006 ASoC: cs35l35: Remove unused including <linux/version.h>

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBkbycACgkQJNaLcl1U
h9BQPAf2LsQP1f+PG5zYRfgPSGavlopGgeKfjprn3O75A5oiJlzvm6qtBoDQfd36
3Ie6NJeYqSbZxPeoparIMdoehrOPqfLiZloLHr1kubQqxSzIuesasZv5vsoGMh3F
NQkJ96QANzEC3TxzldAoZ+hjoISN1K9rLjk+Wo/fNIVhV3gHadQ3Sfc/aUO+aFuk
Yhl4JpCOLjv5C9im4PIsc2LtTZRnMIXxDUb77gldP++BpWbwE2TGP3yApoxEIUnP
yowqZe/4ISSFsto4+zLw2PudWRRhCNyFb6IbZxi/qYGswR+0XvtuCWAB7WDxd38U
eo6yb5SZPwIDWiPka5SyHKJGLLcX
=RbL7
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
