Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8555BEE43
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 22:11:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4FEF851;
	Tue, 20 Sep 2022 22:10:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4FEF851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663704703;
	bh=ju5UjKZq4kslVshB6alWMSvgvdnqmkZJiyboxP/Sff4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZC+Zzk/+zEIinerBaXAUMlBGQOzakkk+IwSSiZzBr/HBqIpQjbCVWQxFDc+IpazZc
	 INKRdli7rhurM+114eCljzoOWOzCFcGHNDh+cs5FIZVhhE+7jfJKYc+On3MP99iwW/
	 FYdJVxe51jCYL7a4KQ3ie++fSVo39ji2E4amxook=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 402FAF800C9;
	Tue, 20 Sep 2022 22:10:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 556C7F80155; Tue, 20 Sep 2022 22:10:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FEF3F8012B
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 22:10:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FEF3F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AkmXgPtv"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8CB8BB82142;
 Tue, 20 Sep 2022 20:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4404EC433D6;
 Tue, 20 Sep 2022 20:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663704636;
 bh=ju5UjKZq4kslVshB6alWMSvgvdnqmkZJiyboxP/Sff4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AkmXgPtvvY78KhUlfTn0PIrfzaeVyu1AFAHcFPR6PwkkUHJVYDvjk9Q4UqrXLjDFO
 F3ztkEnaFrersuDVY5Q6k216S3OusOXZZA/2fzUtwqcW6WW7govXwdPm0vj9TuWv9z
 kIwWao3nVwY+i+SwJH6B8+slOHB5WfNNp1eoLMeAN2R6QZ5+oyPzjhi7ojQWisIY7r
 +qAPl2OzyLaOGsHlmfz92zHo6UtJll7l3MXPPlMTv5v55jhODtrdHEJhAuxH5u2bRv
 SnGaRaFjftRcJFDIiFVFqHEDKb1DtJItSzyJyDIU1oVp8yvGxITdpZTkA4y2vgTnNF
 z0lMldD/JAv2w==
Date: Tue, 20 Sep 2022 21:10:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v2 1/2] ASoC: amd: yc: Add ASUS UM5302TA into DMI table
Message-ID: <YyoeIuQkI3SNkjD8@sirena.org.uk>
References: <20220920194621.19457-1-mario.limonciello@amd.com>
 <20220920194621.19457-2-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="t2Iu1/keNZTUJyRf"
Content-Disposition: inline
In-Reply-To: <20220920194621.19457-2-mario.limonciello@amd.com>
X-Cookie: One FISHWICH coming up!!
Cc: Travis Glenn Hansen <travisghansen@yahoo.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Xiaoyan Li <lxy.lixiaoyan@gmail.com>,
 Saba Kareem Syed <Syed.SabaKareem@amd.com>, Sebastian S <iam@decentr.al>
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


--t2Iu1/keNZTUJyRf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 20, 2022 at 02:46:20PM -0500, Mario Limonciello wrote:

>=20
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D216270
> Signed-off-by: Xiaoyan Li <lxy.lixiaoyan@gmail.com>
> Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

--t2Iu1/keNZTUJyRf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMqHh4ACgkQJNaLcl1U
h9CCjgf9Hx5OKV1Vuzb2J73P8H4hnThiRcynSMMsdSpg1Q52BrwFhqanX2gQT/F9
X85gdtbaO2rq1fnnmh286DILsbHJBTlnV08nqJIFwmuk+pc+e8mdCeDcwR3utvVp
N27JV7MqczefPADMQUdx9vXTDnkh6H7phv6/HAzgSCIxS+kNNOaorklmfaiw+94E
2qnKP1duYWlNRYqYYX5XkR9d7MM7f6Vo0/Flh5KpDGffrYl2GbblZwLSNKvpmXHn
5+fecbHM8tU6CSIo1VQfzPg4TqO7sh8RJ9WWaCAEaay+6gvb68G0Y900IM9BTkcJ
CS0LVbZF9tS+CV2GuPG7zUjfHy8jlQ==
=KOkl
-----END PGP SIGNATURE-----

--t2Iu1/keNZTUJyRf--
