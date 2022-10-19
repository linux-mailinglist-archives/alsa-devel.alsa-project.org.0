Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97737604883
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 15:57:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D82CA93D;
	Wed, 19 Oct 2022 15:56:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D82CA93D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666187839;
	bh=BRa09hj2u6ZkE55Ymi7IsBlqgZa55YWVXK9zCgmuLG0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jj1p3DqTJ9JtHWo2JH9vlz6bsWygSXogfz0brmR09ZANtKRqnBiep/9sSfGhUYKww
	 aKAYN69tTDnl+jdR0f4zryEvfcCE31nFVHxeoZ7BSK6JRKDAuwcE4+c8tdPH7ysvrR
	 FHUmKS5p/sQEXf0gMrOsSSwhcnLVttdTVicfVDBI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A77A0F804E0;
	Wed, 19 Oct 2022 15:56:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CE35F804CB; Wed, 19 Oct 2022 15:56:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24EEBF80166
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 15:56:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24EEBF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="CH8WxFNA"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="r3hDaqSU"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 485FE3200583;
 Wed, 19 Oct 2022 09:56:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 19 Oct 2022 09:56:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1666187773; x=1666274173; bh=cv534Y9X3M
 sLZUwRgKake+FsB12WvMD2xvYqgNT0GGY=; b=CH8WxFNAKLvzBLWafK+AE+oxn/
 hDiYGVjwktkZC0Cukeo6hFIr+xZtXYPF2rxmximZXUOVWdJjSovLMpidzRJwtTCK
 Ux3nwFlnT7VZXJQB8XKNAaI++whglY1Vp0u118agCypBwvW+9/oOWpIqkjMaD+n2
 cQoRneTmg3S8Ew8WgUznXE8qerO/tOTfVi7FmRq0k4QgoCMdQzqgTTJXMMeIHJEi
 dHsYI46LilXlOsrGFjEr9bYCyWkgXJdgJ2yGKrTIsj9hFF10atf1l1ZlOZhjr5zW
 G8hP1kZ6bVb00KTfCPWlYGlPVeZyXxwP72HGDVuHw9ttZN/O/B1DG8XPu62w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1666187773; x=1666274173; bh=cv534Y9X3MsLZUwRgKake+FsB12W
 vMD2xvYqgNT0GGY=; b=r3hDaqSUczWv0Ym8M2DcOA4IrS5Y6KyuVNbof0MMPSXv
 CIEYk7gUl3u0QPUWSFu7LmqpMNoPGvth+zpnqEe7QCrU8EwMomDlpgcLodw5xAx5
 3R+ap8rlP2Jkzx2w7vfk+gjxJqoZagHLTwhmQod74c1N4TCYAJufJYOZNL2NopVi
 EXtzy1r/V9MAmbx7fDdzPMu9+WfLbbe+Hvmokd1l0oy03Zb3ijnyZK5VTXot51ST
 iqwLpJI5GrUF//ybtyyzsiW8xcJWdu6zsrlY9byZ+Gf4zJaXggKbaz+Kf34HbKNE
 7oZxUTeibRE1MQeXAaMazXPniUZyHuMoBZr4DXCzDg==
X-ME-Sender: <xms:_AFQY7xrxux5f9okZfIB_pyaz4grpIz7csVYLeRquiRDiVmB9jbamA>
 <xme:_AFQYzTjjLZImhKLNklhqFuOx4vrctq_VMTlA02q7k1jy_Nc8xr_KHWM04zhKgPIc
 vXbHRgrugQ_8boFYNE>
X-ME-Received: <xmr:_AFQY1XNbdEHwof-h18m3V3GFPxdPYBHqHf44G9njSJ8gaQc150EL-sjyzzi9_Q4Uk8HO9wvCCUxHeQInAzTRfBj_fPxhwXea6FJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelgedgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_AFQY1g3ehdkmRE5Ppg94zYolf4J0JS1yUgTYAh-wES-fcujLFIdJQ>
 <xmx:_AFQY9BkJl6fntU7cpae6NiYtmBlyEPFNiV-RW_XtHKgIsAQD4EVBg>
 <xmx:_AFQY-JokmUDdhPQ0aMLEIXnrfYgH6X2h_oNajyQwaRBM3FDkEYjIw>
 <xmx:_QFQYx7LL3PhCxJZmffMFtjuhD6kjIkVcHc30I6YSZcL8JGYKspIGQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Oct 2022 09:56:11 -0400 (EDT)
Date: Wed, 19 Oct 2022 15:56:10 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Zhang Qilong <zhangqilong3@huawei.com>
Subject: Re: [PATCH -next] ASoC: soc-component: using
 pm_runtime_resume_and_get instead of pm_runtime_get_sync
Message-ID: <20221019135610.ini2kkqltwasjpvu@houat>
References: <20220922145846.114312-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="srklwt7g2ipg5id7"
Content-Disposition: inline
In-Reply-To: <20220922145846.114312-1-zhangqilong3@huawei.com>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 tiwai@suse.com
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


--srklwt7g2ipg5id7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 22, 2022 at 10:58:46PM +0800, Zhang Qilong wrote:
> Using the newest pm_runtime_resume_and_get is more appropriate
> for simplifing code here.
>=20
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>  sound/soc/soc-component.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
> index e12f8244242b..659b9ade4158 100644
> --- a/sound/soc/soc-component.c
> +++ b/sound/soc/soc-component.c
> @@ -1213,11 +1213,9 @@ int snd_soc_pcm_component_pm_runtime_get(struct sn=
d_soc_pcm_runtime *rtd,
>  	int i;
> =20
>  	for_each_rtd_components(rtd, i, component) {
> -		int ret =3D pm_runtime_get_sync(component->dev);
> -		if (ret < 0 && ret !=3D -EACCES) {
> -			pm_runtime_put_noidle(component->dev);
> +		int ret =3D pm_runtime_resume_and_get(component->dev);
> +		if (ret < 0 && ret !=3D -EACCES)
>  			return soc_component_ret(component, ret);
> -		}
>  		/* mark stream if succeeded */
>  		soc_component_mark_push(component, stream, pm);

This creates an issue on the RaspberryPi4 on 6.1-rc1.

At boot time, we now have a bunch of:
[   35.536496] hdmi-audio-codec hdmi-audio-codec.1.auto: Runtime PM usage c=
ount underflow!

They were bisected back to that commit, and reverting it makes it go
away.

I think this is due to the fact that the function here used to call
pm_runtime_put_noidle() only if there was an error, and that error
wasn't EACCES. However, pm_runtime_resume_and_get() will call
pm_runtime_put_noidle() for any error.

Thus, if our __pm_runtime_resume() call return EACCES, we used to keep
the our reference but we will now drop it. So I guess we should just
revert it, possibly with a comment?

Maxime

--srklwt7g2ipg5id7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY1AB+QAKCRDj7w1vZxhR
xereAP9NVwJiOFFm8wJuRJiVQ30XTZ34Dz0/ENiTStY4UENKhQD+N2/2Xf3cHTy2
KtLVzixzH/aZnSHKslNMlqHjpqMvNAg=
=ssgj
-----END PGP SIGNATURE-----

--srklwt7g2ipg5id7--
