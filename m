Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E0960E09A
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 14:26:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53C743CBF;
	Wed, 26 Oct 2022 14:26:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53C743CBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666787211;
	bh=A+whfoCaFetY1vtT6WlJoMJ4i5r7wnLO8PHUEzY3Stc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PlTvWS17TkijjGuhD+V0lVtqlTAApS+p8PheVj2vXway3liNTcNSqW6PyubDNFG6k
	 gplPV0/7WHeSsyJ+38ozK86CazLco4DVE/BmLLUXzirk5osIo24as4Qm5X/jfD5fYi
	 l56o4/8Q9e5OmbXydUHNNYvDw7BgCnhMFEg/NgG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EE6FF80100;
	Wed, 26 Oct 2022 14:25:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B8B2F80271; Wed, 26 Oct 2022 14:25:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF837F8016C
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 14:25:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF837F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="o/Bq2vQb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CECE2B82215;
 Wed, 26 Oct 2022 12:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7EF8C433D6;
 Wed, 26 Oct 2022 12:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666787146;
 bh=A+whfoCaFetY1vtT6WlJoMJ4i5r7wnLO8PHUEzY3Stc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o/Bq2vQbnuOvSTVGNxl7QsdwtUxRdyot1GJzSX65QKkfbc81j5sPS5yKb+nUVdB/w
 +Hri1yiBG0MVhxS5bGQ/Q0aOrvJav+c5+Zi10V1jqPo+pVb0pI52Tqu/1qzy7sdhLo
 zUeaeflH4Woj2fYk696WdQan4FMMhX1yVoJ21S6cdcItiuGpLdiYwPkhmmkCbhYw1Y
 ga89Lp+TrD6iKhvbHWwVCgEH8kOpCKALem/cYxw/fXG8EPBaQJz3N1wqP/+sKadBzM
 3SUrFzvxpl2DBlJ/MZtZfKgg9M11dBQx0ri1yjE7cXl9A2koNiiBpa7Yevaf5HuFme
 O5w9OHYUXzHYw==
Date: Wed, 26 Oct 2022 13:25:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA/ASoC: replace ternary operator with min()
Message-ID: <Y1knRM2jU8RhlFWn@sirena.org.uk>
References: <3d74bcaf.5.1840fa4d439.Coremail.wangkailong@jari.cn>
 <Y1gWbN2/Tbf1jeL6@sirena.org.uk> <87pmefp30l.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/5KUVHpwyY0+WZIc"
Content-Disposition: inline
In-Reply-To: <87pmefp30l.wl-tiwai@suse.de>
X-Cookie: Prunes give you a run for your money.
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 motolav@gmail.com, kai.vehmanen@linux.intel.com, linux-kernel@vger.kernel.org,
 cezary.rojewski@intel.com, lgirdwood@gmail.com, tiwai@suse.com,
 wangkailong@jari.cn, peter.ujfalusi@linux.intel.com, mkumard@nvidia.com
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


--/5KUVHpwyY0+WZIc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 26, 2022 at 07:28:26AM +0200, Takashi Iwai wrote:
> Mark Brown wrote:
> > On Tue, Oct 25, 2022 at 10:56:11PM +0800, wangkailong@jari.cn wrote:

> > > sound/soc/soc-ops.c:817: WARNING opportunity for min()

> > >  	kfree(uctl);
> > > -	return err < 0 ? err : 0;
> > > +	return min(err, 0);

> > I don't think this is a good warning, while I'm no big fan of the
> > ternery operator the new code is less clear about the intent than the
> > old code.

> Agreed.  That use of ternery is a standard idiom.

> If we have to eliminate the use of ternery inevitably, it'd be better
> to introduce a new macro for clarity instead.

It looks like it's more about identifying a pattern that could be min()
but not being able to detect the semantics of why we're comparing
numbers.

--/5KUVHpwyY0+WZIc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNZJ0MACgkQJNaLcl1U
h9Cwbwf/cqlYQWULu7hIA0A7lorD8guPrIuX+zs6vfL42K2W71v4HfBL55hL02ze
IFf6fLe1AQfEchrw3IgotczAWpAuV2MqC/3G6aIbNRvUbNYXAhqAYgv6EyhqBsgr
mQgrSSAJfuyvKz53WHelaZCq3+1RphQfoo9VvqHV8gaOUZbBG8uiAa8QR3pdL7aI
X5sR3++SzqL8P4MOgqyX4RuHtyky8FZrbfaQdgJTCTtVK1KivnaXJoCK8x+DRDVi
MyEceA1L5oBuDhIV50ck1cmartnxVSnDqYT3wVfRd9DrZ338QQ620a7CkDg8szrV
7wAi618RzollohwVIGPkuXsi7eIu0g==
=jtm0
-----END PGP SIGNATURE-----

--/5KUVHpwyY0+WZIc--
