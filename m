Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92022F8F0E
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 12:58:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EF4C1667;
	Tue, 12 Nov 2019 12:57:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EF4C1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573559927;
	bh=Qu0ZgdfYIKnMamEYTXlCrujr2rpvUDdutwyFMbZKnf0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ogbRiAU2DXZqRXA/gDgc9iKLZ1gBu3zQk+riyoYMe53AXrrR5lWAhst3O5IKk0nD7
	 4XN/tpcFmA2YlW25q/K6zuM9vYJxuUDcmJfZ1CjaYQMS+6gnzLKN6CdjrzYs3yqvKL
	 TvGIUarbU2WE8Cb2swU7jFimFMktp1y9pDLzZ69M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48116F8048F;
	Tue, 12 Nov 2019 12:57:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFF44F80483; Tue, 12 Nov 2019 12:57:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CBFAF80275
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 12:56:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CBFAF80275
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="rH9jGAi/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EcwNjLo8wOnJMMWVhETgrc4fOww9YZh1iHScHUx1/S0=; b=rH9jGAi/k+o/q6ui+psOjJImW
 Q2XADkVSO7oH+WMMZhZuDAASA6ExvKF6NZkiyIkFAOc2LMiH9nEGl4JK/Vgl2KaB2Ou0Us3quvZEm
 86kw5ZxQ96XqBT6AWzti0MnP35KPh1wWzQyb4BzxZZSkUv9ZolLQQh8r4a/lG4P+K4AUM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iUUn3-0007mZ-6i; Tue, 12 Nov 2019 11:56:57 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D3FAC274299F; Tue, 12 Nov 2019 11:56:55 +0000 (GMT)
Date: Tue, 12 Nov 2019 11:56:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Eason Yen <eason.yen@mediatek.com>
Message-ID: <20191112115655.GA5195@sirena.co.uk>
References: <1573532538-30602-1-git-send-email-eason.yen@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1573532538-30602-1-git-send-email-eason.yen@mediatek.com>
X-Cookie: As famous as the unknown soldier.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: matthias.bgg@gmail.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, jiaxin.yu@mediatek.com,
 chipeng.chang@mediatek.com
Subject: Re: [alsa-devel] [PATCH v1] ASoC: mediatek: common: refine
	mtk_afe_fe_hw_params
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
Content-Type: multipart/mixed; boundary="===============5825426365717287001=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5825426365717287001==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2019 at 12:22:17PM +0800, Eason Yen wrote:
> This patch is to refine mtk_afe_fe_hw_params by the following
> export functions:
> - mtk_memif_set_enable
> - mtk_memif_set_disable

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3KngQACgkQJNaLcl1U
h9Ds0gf+Jf7PnO4A7M+R3v1MzM3+quMhDl2WoVBFnODb7W1GxbQglVWntQckfuJz
i9KW1BERNtbmPkRmmhiODCwRjlG7eW25VRxAbkolCf+iclcy3AUR5qcjXcx2ixx6
66YGRHDwp6cRSnx5yQYvqiOWORq8Og+1Hz6PeURbDjAEPwdwUmXQDw1gGzfb7vN/
6krFkmtBfZpXQ/IbUteu4IN6dhbNTQkaxXnf3asAeKv7Wgf3f1RbWp7wldUAvBpa
SnTasgnRZMPQHbxqS5DP5Rnla2AtsgJUDx4mFFKzloK/jt7dMjXadopaxAQn2Krm
/UN2h4kGa+hKcDX4pKFgWZfkhLgOmA==
=vQlg
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--

--===============5825426365717287001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5825426365717287001==--
