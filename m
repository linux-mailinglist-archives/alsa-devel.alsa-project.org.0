Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 731D45CFB9
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2019 14:46:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00692168B;
	Tue,  2 Jul 2019 14:45:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00692168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562071561;
	bh=Y+TaWOlmvCb8773fB4wYsqAbdgfTkc1rLevmGNWmdPA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K8ie/krmZ6g3bh10vwvMqBa9ksKSDDIC0lnLsA7Ye81+3YOCqWCyBf8fEt08ZoH6v
	 s7k3zzu+wc5wNFQ9l3R6XozjMb+zA5wV02gt56LpGoxThUlkRZ3vfMAWve4RM+SFFx
	 CWit2PD8wIEJEDEsyrIbqSs3OxB+P44wQ6rD7rHQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F27BF800C9;
	Tue,  2 Jul 2019 14:44:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9B94F800C9; Tue,  2 Jul 2019 14:44:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7722AF800C5
 for <alsa-devel@alsa-project.org>; Tue,  2 Jul 2019 14:44:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7722AF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="oxBrZJYi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/OljjII14hgBENMW8FAzyvXP95o1KEcEr5Xb+Z+aPf4=; b=oxBrZJYisARAdU+xqwyVsUinU
 99NYAOGwpAMvM7Dwirlqf8geIFZr6xcH5Yt6Sjf9lq0W1gJrJJ+ZBQmQA5CKchPIjZiuAKIxDvm/I
 9zoz2fssocRZ+MyEmA+WSCuLRgFXYyskIqKuWKg/5RfODWVO22e2I+SUdRD22KLP6/UBg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hiI8p-0002L0-RV; Tue, 02 Jul 2019 12:44:11 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 3EFBD440046; Tue,  2 Jul 2019 13:44:11 +0100 (BST)
Date: Tue, 2 Jul 2019 13:44:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190702124411.GK2793@sirena.org.uk>
References: <87blyitky2.wl-kuninori.morimoto.gx@renesas.com>
 <87y31ms69i.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
In-Reply-To: <87y31ms69i.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: This sentence no verb.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v2 09/23] ASoC: cirrus: ep93xx-i2s.c: use
 devm_snd_soc_register_component()
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
Content-Type: multipart/mixed; boundary="===============5732111350196391826=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5732111350196391826==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FCF9ydJxlAJsfRTu"
Content-Disposition: inline


--FCF9ydJxlAJsfRTu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2019 at 01:09:00PM +0900, Kuninori Morimoto wrote:

>  	struct ep93xx_i2s_info *info =3D dev_get_drvdata(&pdev->dev);
> =20
> -	snd_soc_unregister_component(&pdev->dev);
>  	clk_put(info->lrclk);
>  	clk_put(info->sclk);
>  	clk_put(info->mclk);

I'll apply this one since it already has issues with the platform
registration and the fix is to convert to devm_clk_get().

--FCF9ydJxlAJsfRTu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0bUZoACgkQJNaLcl1U
h9D+DggAgWrCFFBp3NxiHojErntwwBwloDDDPecWb4kVX1Kii3yAo3OPrUvagN5r
8WysZNlXYIawLm8W6x0LM8BPXafVIWlxp3EZ99DeazTAZGHAep/Xs9GIOxa+COs1
llsR4P2wBUADqJpIGR/zXGrtPXjAvlXisQkijxTWMfw+g+jLLfnAPO3HY4NkH2O/
anPgWMo0p4cSk+M7C+H0ZiGKHUTHP5h97GiMinHoLJrNYLlnqXfEWcBqJNOMMHrZ
/0YH25XzwDA0YxFb/WL7kHzsPVDYUni0azkQlhcdD7VwZA3WtRYoufvvHuhVqKRp
MCcic3N/2f3mZmcrFcz6RlkAAdKocg==
=Wlo3
-----END PGP SIGNATURE-----

--FCF9ydJxlAJsfRTu--

--===============5732111350196391826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5732111350196391826==--
