Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E47202A9624
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 13:22:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DE211691;
	Fri,  6 Nov 2020 13:21:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DE211691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604665325;
	bh=rLaHZxkEJ3Zmxvf7Vr/Cg2Fpa7pJbEhWMmYIrGjNiDk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eeXj1D/Z6I6v8DDX4fU4rcQIB0yNcHhnWLWrhdbXobvlZa2Xh1wLzVSlh/ud3Sdew
	 sJP7Eg6MiXybkcXeuMdr/l+f3r2twoGoWwwpgg567z2QEuv+jaXAh/dPMQDgvM9Q+i
	 CW5p2UvC0RSje8iLmse6x70q6MsL5lgt3TkdxBLA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0763F800BA;
	Fri,  6 Nov 2020 13:20:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADE1AF80232; Fri,  6 Nov 2020 13:20:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AD2FF80127
 for <alsa-devel@alsa-project.org>; Fri,  6 Nov 2020 13:20:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AD2FF80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PRCZ2+/c"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 572EC20715;
 Fri,  6 Nov 2020 12:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604665225;
 bh=rLaHZxkEJ3Zmxvf7Vr/Cg2Fpa7pJbEhWMmYIrGjNiDk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PRCZ2+/cofyw6fph+5dlIP29UiohmyXjfx6p9tNxQNp5k/ZV/y34+S5VB2DEHoG70
 sFFdWNb3uc4gS+3Y1lPvkzhicINNnzDiJp+2xjQdsIrwwtQ57qCzowH3Wl+ikTDQOU
 v0OScxZ0Nii410PVCbhI+keeL8HMGaPGBC+RZRFE=
Date: Fri, 6 Nov 2020 12:20:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, perex@perex.cz,
 Xiubo.Lee@gmail.com, festevam@gmail.com, robh+dt@kernel.org,
 nicoleotsuka@gmail.com, timur@kernel.org, tiwai@suse.com,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: fsl_aud2htx: Add binding doc
 for aud2htx module
Message-ID: <20201106122013.GB49612@sirena.org.uk>
References: <1604281947-26874-1-git-send-email-shengjiu.wang@nxp.com>
 <160466365499.22812.9217467877032314221.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="KFztAG8eRSV9hGtP"
Content-Disposition: inline
In-Reply-To: <160466365499.22812.9217467877032314221.b4-ty@kernel.org>
X-Cookie: When does later become never?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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


--KFztAG8eRSV9hGtP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2020 at 11:54:23AM +0000, Mark Brown wrote:
> On Mon, 2 Nov 2020 09:52:26 +0800, Shengjiu Wang wrote:
> > AUD2HTX (Audio Subsystem TO HDMI TX Subsystem) is a new
> > IP module found on i.MX8MP.
>=20
> Applied to
>=20
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-=
next

Sorry, looks like me queueing this raced with the review comments coming
in.  I think the review commments are small enough that it'll be OK to
fix incrementally?

--KFztAG8eRSV9hGtP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+lP30ACgkQJNaLcl1U
h9BMbAf/YYxCzCGH2GbmfLoYjyffvTAUGO8REEj9IgCKa9pyWNJowu4KCdjlXYvJ
ZeGTKytpKJqcqogSuKAWzQceby4N7aRa/Lzm12q/0GSP+TvoG9YnAr4J9w+IjxWx
GW/TwSJlPQCfFKGcRN+JYhkTQ35l7TsApa/8snkWdCwcS004xJ2AhEqzySXZojY7
zno2JFvQsaGgpXXCoRrO4rAJLlR/t74o8iobg19mbTbOWUa+h8Ul+UHANvnqOSml
QORlFFFTjaFDovqs09Q9n4mGXiMCGJJU8v5FRaVtMNafoiYjM4V3uwIrt6fjt81k
lP3Hz9pwhUC+SLgRLapwIPKTYo6ZlA==
=bxj9
-----END PGP SIGNATURE-----

--KFztAG8eRSV9hGtP--
