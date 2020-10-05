Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E55C2834E1
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 13:26:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B42E71800;
	Mon,  5 Oct 2020 13:25:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B42E71800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601897173;
	bh=Pr+7bLL9hVGivqoadSQ3QtTvScoYMD74Kgi0cUQlw8k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YRE/Gcaq9dMk8dzv/b74ggiSHqoKPMHTpgkmA6DDRcyeIBfqt9VVx6SxSo1ZTkYJJ
	 DI/06H2+nn6KwOsOaP2F5jnPhLAegoNvCnyWPTKu73jo72CV/wXDw07rHFEhPbNdwi
	 TfUqOEIwO/3K+PNvS1w5oRnI01TlgIzzUIUmQxDg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1AA9F800C9;
	Mon,  5 Oct 2020 13:24:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 563C6F8025A; Mon,  5 Oct 2020 13:24:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82612F80121
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 13:24:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82612F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="VAfQeAFQ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="MUyRZIUt"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id B830D5C012B;
 Mon,  5 Oct 2020 07:24:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 05 Oct 2020 07:24:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=SMknaWd59JlI04yMEv6mOREluuD
 TBiqnWDc4DKpb+8s=; b=VAfQeAFQ7OVvpzTG+XmyFZCtakGWjOMKd2f9izr+Eyw
 qM00vQkDnaw0njDu6uRN+qmQiWPcwmOQ2LW0Qnw5JBs9duHFItKWaCYUF7pMRuEb
 9vQskD+ZuNKHcaLmokKIO+QmkrgmxppYHm1m0l3txVDc6yNjfNAMZN2Mv/2jD5iP
 rDIXcxP5fSdUFOfzY0ZoTArNYz3gPqfw5msBpSHMEjhWwSeG4cNkSMbTXmaLAIS7
 g2LaQNokdvmExks+QXh42U5RZ7j/GlRm16MB/pmXb4j4+s1cdXY4bumoTjrWA5gf
 K7PlXjuwoW+HjoIjgzmYmQUhE0nXWok9CRpCqMUaBHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=SMknaW
 d59JlI04yMEv6mOREluuDTBiqnWDc4DKpb+8s=; b=MUyRZIUt8ao9kblC67YX9K
 8gvP++l1QAF/HVA4FoQQXZ5FFKpzgPfnKueotZPW9fHDH+QNuxJCiqfn3NQJVdKX
 j+9BwRZl9uB7ceIm9PbvE6ioLGVCUgtJxbt6KR+RWtXJAngX0VvIhYnsNXl+QVqX
 +qipy7re+Gv4WQmEk+jVuMLdUh3rgTMY0wWPh1cWdYgWjTx/YXlRwC4s84GZHS1d
 653B2cVAdZJcuaR3tVEuq7RB72CUlxFoRI5svtlt5zN6AvD7nprm9TpVjJXEfaSG
 WbdDz9kvRCfWHl7ysEdkSGafokb0TkWt4MQaiT+DRPkH3qiKRuZsHr+dtBwWYGpQ
 ==
X-ME-Sender: <xms:ZAJ7X4icet7ZnCxkzu8BFlfbAEciFTbv8-Eq2aTlU_MI24aVFDNPVA>
 <xme:ZAJ7XxDyLGjvMFnH9MbMIjoaWtree5FTGyCtJE-F0VcGbz-oADKpZK8600BsxlViy
 8aPYRaGkH6KfyKbVFE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgedvgdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ZAJ7XwHJvbranP5vvhrbxJpPf62w6i55EOiSPehvHiX5f9CvUmW9mQ>
 <xmx:ZAJ7X5TnNHXeKG0BO_CkvQhBfgGEJ6kZGVw25R7B_vS-LmcOLPAsOw>
 <xmx:ZAJ7X1xWSYBMqma-n4rL5_awc45s8Ju6sYJPoaYSEu913GR7BIA4ww>
 <xmx:ZQJ7X0wg926je3ase2E0YmQwkQ2C41HPK6uQEqXo6-MkX7cwxF1OJg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B86B6328005A;
 Mon,  5 Oct 2020 07:24:19 -0400 (EDT)
Date: Mon, 5 Oct 2020 13:24:18 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 09/25] ASoC: sun8i-codec: Prepare to extend the DAI driver
Message-ID: <20201005112418.gxxwrjnfnukmdvgy@gilmour.lan>
References: <20201001021148.15852-1-samuel@sholland.org>
 <20201001021148.15852-10-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="w4bavsivf5xoegl7"
Content-Disposition: inline
In-Reply-To: <20201001021148.15852-10-samuel@sholland.org>
Cc: Ondrej Jirman <megous@megous.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
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


--w4bavsivf5xoegl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 30, 2020 at 09:11:32PM -0500, Samuel Holland wrote:
> In preparation for adding additional DAIs to this component, convert the
> DAI driver definition to an array. Since this changes all of the lines
> in the definition anyway, let's move it closer to the ops function
> definitions, instead of on the far side of the DAPM arrays. And while
> moving the DAI driver ops, rename the set_fmt hook to match the usual
> naming scheme.
>=20
> Give the existing DAI an explicit ID and more meaningful stream names,
> so it will remain unique as more DAIs are added. The AIF widget streams
> must be updated to match.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  sound/soc/sunxi/sun8i-codec.c | 76 +++++++++++++++++++----------------
>  1 file changed, 42 insertions(+), 34 deletions(-)
>=20
> diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
> index 7590c4b04d14..346f699c2e86 100644
> --- a/sound/soc/sunxi/sun8i-codec.c
> +++ b/sound/soc/sunxi/sun8i-codec.c
> @@ -90,16 +90,21 @@
>  #define SUN8I_SYSCLK_CTL_AIF2CLK_SRC_MASK	GENMASK(5, 4)
>  #define SUN8I_SYS_SR_CTRL_AIF1_FS_MASK		GENMASK(15, 12)
>  #define SUN8I_SYS_SR_CTRL_AIF2_FS_MASK		GENMASK(11, 8)
>  #define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK	GENMASK(12, 9)
>  #define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV_MASK	GENMASK(8, 6)
>  #define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_MASK	GENMASK(5, 4)
>  #define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT_MASK	GENMASK(3, 2)
> =20
> +enum {
> +	AIF1,
> +	NAIFS
> +};
> +

It's a bit of a nitpick, but we should have less generic names for the
enums here, maybe prefix it with sun8i_codec like the rest of the driver?

Once fixed,
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--w4bavsivf5xoegl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3sCYQAKCRDj7w1vZxhR
xbqiAQC0ysaCPi3YH7Tsq2y/aLzL91Nsz8t9RHusgPVOQAD11gEAiPFKoJZh1uw1
Mnq8t+XP9zAHc6QsdYz3rCgLjHsdiAU=
=mtg+
-----END PGP SIGNATURE-----

--w4bavsivf5xoegl7--
