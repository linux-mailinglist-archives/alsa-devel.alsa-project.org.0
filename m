Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F2599E96
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 20:20:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A32D1658;
	Thu, 22 Aug 2019 20:19:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A32D1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566498041;
	bh=pxl/7nVWfnk3fmWMyE4xdL//g1F8ZesGSVrlh63gBOQ=;
	h=Resent-From:Resent-Date:Resent-To:Date:From:To:References:
	 In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=j/5hGiWT4MJybtndpHQhPx1L+m7BMU2wplFpgvjpP7tKXpKhqdRRaPW7ttWTYh8zt
	 12uPYIr/nAm3Hm29nRlnZSnsIS90qaJkuIyRQTXS6oJtwZIMGu1iw3Kkd7ZS0rEfws
	 JsyW/qyjJKhA6ZcRIOV88ebDCTcPyBW0jH2zfM4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C4D9F8036E;
	Thu, 22 Aug 2019 20:18:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DC6BF8036E; Thu, 22 Aug 2019 20:18:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68E7BF80112
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 20:18:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68E7BF80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Tdnjd9jL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Resent-To:
 Resent-Message-ID:Resent-Date:Resent-From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Sender:
 Resent-Cc:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JgsoxlnDZ9pqIJzaaaku9cx3zI+9gdOtGPqPmCgzH10=; b=T
 dnjd9jLkYWXbA9j0qQQb9VK7p6nQz7tnuwbMjMP5F+iBMoqx2BQLos+U3tYHzoOMrEkTPws7ega8i
 BbYamUK5QBm72Bc2vuyR+inqOZguEX+HfYXsgfdp86k+6vBzOxizxGmMPW6rY1xRTcdSUH+QL/SFW
 BbFDFaldfXVzvqIk=;
Received: from 92.40.26.78.threembb.co.uk ([92.40.26.78]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i0rfc-0007c7-W6; Thu, 22 Aug 2019 18:18:49 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 183DED02CB0; Thu, 22 Aug 2019 19:18:47 +0100 (BST)
Resent-From: Mark Brown <broonie@sirena.co.uk>
Resent-Date: Thu, 22 Aug 2019 19:18:47 +0100
Resent-Message-ID: <20190822181847.GD23391@sirena.co.uk>
Resent-To: Jiaxin Yu <jiaxin.yu@mediatek.com>, lgirdwood@gmail.com,
 perex@perex.cz, tzungbi@google.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com,
 ck.hu@medaitek.com
Date: Thu, 22 Aug 2019 17:13:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Message-ID: <20190822161335.GA23391@sirena.co.uk>
References: <1566478261-13464-1-git-send-email-jiaxin.yu@mediatek.com>
 <1566478261-13464-3-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1566478261-13464-3-git-send-email-jiaxin.yu@mediatek.com>
X-Cookie: Don't SANFORIZE me!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, ck.hu@medaitek.com, lgirdwood@gmail.com,
 tzungbi@google.com, linux-mediatek@lists.infradead.org, eason.yen@mediatek.com
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: mediatek: mt8183: fix tdm out
	issue
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
Content-Type: multipart/mixed; boundary="===============8513170161956652947=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8513170161956652947==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 22, 2019 at 08:51:01PM +0800, Jiaxin Yu wrote:
> This patch fix two tdm out issues.
> 1. TDM out support S16_LE/S24_LE/S32_LE formats .When output S32_LE, we
>    need set hd_align so that memif can output MSB 24bits correctly.
> 2. Fix TDM out hw_params as SNDRV_PCM_FORMAT_S32_LE.
> 3. Fix TDM out data is valid on rising edge.

These should really be split up into separate patches, each
fixing a single issue.  Ideally the changelog should describe
how the issue is fixed like that for 1 does.

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1evy0ACgkQJNaLcl1U
h9CZ3gf9E5RTE4sV5sm2rd7vBY7Z3ZWn19T1laGFpztTqI44AkYc8yA/L9dnts7b
ERliT5kmt7nrnpBLnr76jxaEwHtegzBiEJwU099BRikGNHvrcL4kZLS7wkWluw++
yPgkcGzZyNW+Nqa+AA27xzVbjoWJT3ZfDTQMmaF82/VPsPn/1fQ6fS0d4W0ugDiV
GoEP+2UHDZLB9CSZP+l4KnqaEG+A4yJrDoauxX38aw8JpUrpduXEXpGd4t2TTYRN
LFh4r985iErQR1K3IOCzzSpxf9eOa0WyvPdpmId3+MoWNVdcxRcKnMzj53fmBxgZ
kD8P3Y919BFO6vCHunpaD0l+qS5Gfw==
=URP9
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--

--===============8513170161956652947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8513170161956652947==--
