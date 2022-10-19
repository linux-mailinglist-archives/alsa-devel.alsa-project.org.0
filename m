Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBF06048B8
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 16:07:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2802A9A35;
	Wed, 19 Oct 2022 16:06:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2802A9A35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666188422;
	bh=853G42Z2pIvrRnv6JOQ60i581V5KE9T9pMfkrabtVOo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=irVqihA4sRu3WpqBdiYFDAgpBxs3zCNE+LcbzIBkuKx5klmbJIaGq1QPvfzzeBU+9
	 rAXzYZj5e1iB1u+NQ4k8v+MH7FNFL6X58ifQ+xfRTWGPixGIbiK78XiXzj4QmDHet9
	 xEB7kKAlQzm0X0b1Yh63gv5o5eXcZZ23o54x6rng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94FAEF80137;
	Wed, 19 Oct 2022 16:06:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77F85F804CC; Wed, 19 Oct 2022 16:06:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 042BFF80137
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 16:05:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 042BFF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="LCqDgwja"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ndbGKJi2"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 1A87B3200992;
 Wed, 19 Oct 2022 10:05:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 19 Oct 2022 10:05:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1666188353; x=1666274753; bh=xZOIV2vhVJ
 NQwMyW32F59sE4pTitmYd9yVTgdJzzhLQ=; b=LCqDgwjanJ4n5igDqWE5fdAl1s
 6E+aH0vVyHlGVJBn1rNpAPX7fHNKUJRRejtPrfdyG4tiU91uP7EHns/fbPoBcAAj
 sNk7YHAHPsM/27MKUS/eQBqv2mZvJZR7jD8mEaF3PksM2gYmPsPEbIcHZKJc77q9
 Lg/UTPD/HJVRM7RprC03+/YLH2fssNI5Gv/n4xL793zyxehduFULqr5NTRvrHefC
 GVbi1iUjpQsdfx3B8ip7mmSw4XeZiYFnIhPP04ylivnxmoFUy4IvnYzdbVtOv/qJ
 mKBkNNjA1pmN1G0xVMqMvlCI2JGIuJJXwlJiKEnLVbpQh3SbWa73cwROiXBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1666188353; x=1666274753; bh=xZOIV2vhVJNQwMyW32F59sE4pTit
 mYd9yVTgdJzzhLQ=; b=ndbGKJi2DdaJdxbGcsebWH/6CPwudzUjanwFhjrj3Sfx
 O7wKkOo/h4cBgHggME4B1hqHsyJCQsPdmBY2Yoge07gBJMbKiUFgGQaoxCt2Qx7V
 Q92jcAcvCWX10Ox0hW8PgoErmwPyq8UeTMBVHlOFZdpnpaVoKDdWCS5L4CLozlwt
 vD9BPIlDpheykCDFoIQ+EBlw8iqXO/uzBJLLo06jACJ6ov2hfs3kYFyJ99aIj6hn
 zuzxpJAWH0C9PgtkmmDYJt45h9Nc/QPJzcx0XoJQmXYViYATAM/6/7hzSYDl2bF0
 CZ5Xn/+5jmu3njq3oJp4nuaqTKl65MjOADE2epn+wA==
X-ME-Sender: <xms:QQRQYxDMRDYvrn05Q89OqLvRnFdi-kQWHoyU7JCSzEG0StUGtPkeMA>
 <xme:QQRQY_heVzEgMX8XTma5p8tRBArQd5AnKa9HGPlustkDHMPmWmou6iS084w2VYXpE
 M1z4SZwRYwZiTFVjKE>
X-ME-Received: <xmr:QQRQY8mXhhXUK4ichnsvKaTaTN0h20d-vKupBPGMornY1FiNVtuhULPMcIy1hnKP_oZCc3VCTc0X8gpTuetnzS-YwJxYpy0c1xtz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelgedgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:QQRQY7yi3JZliL8sPrAPm4VnuCB0-ydyNvHjr-mAuMlzQro_oItfBQ>
 <xmx:QQRQY2T2ub9KRf7vIQODeJ2QDFndItMVClWVD8OKroKqIbuEr9vSIg>
 <xmx:QQRQY-ZcohKRYzY-Q09JGoyrVj-cwLCySsnLCx-YyXhZ5GtUusnhNQ>
 <xmx:QQRQY9KIcduMeoWAFtAhbComA6RQ1IwZaJFPiL4SLIorZaoDYopgzA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Oct 2022 10:05:52 -0400 (EDT)
Date: Wed, 19 Oct 2022 16:05:50 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH -next] ASoC: soc-component: using
 pm_runtime_resume_and_get instead of pm_runtime_get_sync
Message-ID: <20221019140550.qycscl5j6pgnvqyi@houat>
References: <20220922145846.114312-1-zhangqilong3@huawei.com>
 <20221019135610.ini2kkqltwasjpvu@houat>
 <364a7284-5a5e-a283-d68d-17a108587950@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3ra7yirwcpjqzoul"
Content-Disposition: inline
In-Reply-To: <364a7284-5a5e-a283-d68d-17a108587950@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Zhang Qilong <zhangqilong3@huawei.com>,
 lgirdwood@gmail.com, tiwai@suse.com, broonie@kernel.org,
 =?utf-8?B?UMOpdGVy?= Ujfalusi <peter.ujfalusi@linux.intel.com>
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


--3ra7yirwcpjqzoul
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2022 at 08:59:58AM -0500, Pierre-Louis Bossart wrote:
> On 10/19/22 08:56, Maxime Ripard wrote:
> > On Thu, Sep 22, 2022 at 10:58:46PM +0800, Zhang Qilong wrote:
> >> Using the newest pm_runtime_resume_and_get is more appropriate
> >> for simplifing code here.
> >>
> >> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> >> ---
> >>  sound/soc/soc-component.c | 6 ++----
> >>  1 file changed, 2 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
> >> index e12f8244242b..659b9ade4158 100644
> >> --- a/sound/soc/soc-component.c
> >> +++ b/sound/soc/soc-component.c
> >> @@ -1213,11 +1213,9 @@ int snd_soc_pcm_component_pm_runtime_get(struct=
 snd_soc_pcm_runtime *rtd,
> >>  	int i;
> >> =20
> >>  	for_each_rtd_components(rtd, i, component) {
> >> -		int ret =3D pm_runtime_get_sync(component->dev);
> >> -		if (ret < 0 && ret !=3D -EACCES) {
> >> -			pm_runtime_put_noidle(component->dev);
> >> +		int ret =3D pm_runtime_resume_and_get(component->dev);
> >> +		if (ret < 0 && ret !=3D -EACCES)
> >>  			return soc_component_ret(component, ret);
> >> -		}
> >>  		/* mark stream if succeeded */
> >>  		soc_component_mark_push(component, stream, pm);
> >=20
> > This creates an issue on the RaspberryPi4 on 6.1-rc1.
> >=20
> > At boot time, we now have a bunch of:
> > [   35.536496] hdmi-audio-codec hdmi-audio-codec.1.auto: Runtime PM usa=
ge count underflow!
> >=20
> > They were bisected back to that commit, and reverting it makes it go
> > away.
> >=20
> > I think this is due to the fact that the function here used to call
> > pm_runtime_put_noidle() only if there was an error, and that error
> > wasn't EACCES. However, pm_runtime_resume_and_get() will call
> > pm_runtime_put_noidle() for any error.
> >=20
> > Thus, if our __pm_runtime_resume() call return EACCES, we used to keep
> > the our reference but we will now drop it. So I guess we should just
> > revert it, possibly with a comment?
>=20
> This is already reverted, see patch from Peter:
>=20
> [PATCH] Revert "ASoC: soc-component: using pm_runtime_resume_and_get
> instead of pm_runtime_get_sync"

I missed it, thanks for the pointer

Maxime

--3ra7yirwcpjqzoul
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY1AEPgAKCRDj7w1vZxhR
xa8HAP4pH7rS9zkbwdHWaaKIjtMFcLP1xGyuOpiG1AZqcRMvRwEAjCrg9rAIyePL
DhQ4ElDtt1P1zyddCNyFb92Rf7hgHgk=
=OlzY
-----END PGP SIGNATURE-----

--3ra7yirwcpjqzoul--
