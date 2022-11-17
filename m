Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0241862D936
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Nov 2022 12:17:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C2771664;
	Thu, 17 Nov 2022 12:16:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C2771664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668683838;
	bh=UbtlAzJPAbyCBLrCQIuiLM3R7RR+FqwYGLJqDQdHx3g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f2TjnD/l67JY0rhyuMmmXLJxBHxWTl0jqt2SlE5Gt/7iFVN6sQO8DyW83FzAsb18T
	 DP/NnF9yf6OVZo0fuzfWscTOuMJE1PITVzxTuvJnaCYpSIkOctIyxyHP45uO6rEDvv
	 IloVBVpoNqomRj+ZkhVDTqK8OGP5N+P8Df3LcdLQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CD83F8015B;
	Thu, 17 Nov 2022 12:16:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6A9EF8025A; Thu, 17 Nov 2022 12:16:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6025EF80087
 for <alsa-devel@alsa-project.org>; Thu, 17 Nov 2022 12:16:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6025EF80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cXmnZkeb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 47C1361156;
 Thu, 17 Nov 2022 11:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6984C433D6;
 Thu, 17 Nov 2022 11:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668683777;
 bh=UbtlAzJPAbyCBLrCQIuiLM3R7RR+FqwYGLJqDQdHx3g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cXmnZkebVq2Q5BVvaknrum0j1QucNUcaYYMQzMEgSvf/sFLfK8g9teVPmGo1U1I5D
 PaoJnYKybztP1/UWXNSwu97vgd2hTPB2YmHHH8tS0JTIA6+w6CwuOwI0msiFTlG8ZP
 PMu6mNQg0SruT8TZlzg37Chgh0U5Oujtw/Jf/svs+R68CuJAJus43sBEdxGpLAeSHp
 MDNmxmFB6TGsqDXwdhU6z3CSMi8dshDV/EuvEkej3MVF/zQz+gEFVuYoAZ9BfC3nwP
 146Zv+mEn9Rs7uP13a8sOO5UUp4ovzfejHKgP0Qfdlxni+iKlxmRpSKwEH+JBfVXSu
 AJLB4v8kYlTdg==
Date: Thu, 17 Nov 2022 11:16:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Subject: Re: [PATCH] ASoC: amd: acp: Fix possible UAF in acp_dma_open
Message-ID: <Y3YX/LsLzSU+jQ7A@sirena.org.uk>
References: <20221117061248.3018292-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wmfLO9kw4EF5zp/Z"
Content-Disposition: inline
In-Reply-To: <20221117061248.3018292-1-cuigaosheng1@huawei.com>
X-Cookie: Ego sum ens omnipotens.
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 error27@gmail.com, AjitKumar.Pandey@amd.com, venkataprasad.potturu@amd.com,
 tiwai@suse.com, lgirdwood@gmail.com, nathan@kernel.org,
 Vijendar.Mukunda@amd.com, Vsujithkumar.Reddy@amd.com
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


--wmfLO9kw4EF5zp/Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2022 at 02:12:48PM +0800, Gaosheng Cui wrote:
> Smatch report warning as follows:
>=20
> sound/soc/amd/acp/acp-platform.c:199 acp_dma_open() warn:
>   '&stream->list' not removed from list
>=20
> If snd_pcm_hw_constraint_integer() fails in acp_dma_open(),
> stream will be freed, but stream->list will not be removed from
> adata->stream_list, then list traversal may cause UAF.

Is it not better to only add the newly allocated stream to the
list once it's fully initialised?  Otherwise something could be
using a partially initialised item from the list.

--wmfLO9kw4EF5zp/Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN2F/wACgkQJNaLcl1U
h9By+gf+JZcE1iHvO34bBoUdksPwdDquk7sQ3MEu5fmyN99sv4k/PUIHJ4HI4B1z
G62ZgkCh9pj0imtl0xRroQ8qz50lGuDTaRvRyBbV7TWj8QDKNs6PfwsMk7vXtNnO
o1CW+JiKmtdpbPKxrUIBdmyW6N13F+7JScEZxmvfP+TSq2Q5Q1ByKeyY0Fntf9fc
M3+drrHP8m1jKxjje7zCRPCpbgxaK/AP/aFes+7+ASuETXUD3TTn4Bulkh2DHVfo
CdsWZl2I6lFvlLR9rEmtW9vI4Lu2+7lS3Ap4Uhh6KC+gKZ8ud7b5NST5ANvt9vrX
mZWYWvxAyzm/WJAl11GJNFTAby6HWw==
=F+xV
-----END PGP SIGNATURE-----

--wmfLO9kw4EF5zp/Z--
