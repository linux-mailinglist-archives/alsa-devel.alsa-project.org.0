Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4DA42A338
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 13:26:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20D54168B;
	Tue, 12 Oct 2021 13:25:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20D54168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634037996;
	bh=qnqPDkW3PEuRHrH7fEFlwj1INa9JZghbCmyes7XDZtc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dMdG+aAnm9yWwVaw3KJIvtONMfIMMsrA9KfeVObtnaObL8LmaedVVCdxGCkskBwk3
	 lcqnZS1Y/gLkhSUXIRk6mgJaLFHlsoehVMnlDUWIsCiJO6zED3uA74GwW7h/wBj6Fk
	 iE2kAJ9+RkSOi1ZlzY0ecEsFrOja3rJDpsY7Hgew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D0F5F80088;
	Tue, 12 Oct 2021 13:25:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94823F80212; Tue, 12 Oct 2021 13:25:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07F88F80088
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 13:25:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07F88F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Zra4gQuG"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B978C60F11;
 Tue, 12 Oct 2021 11:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634037910;
 bh=qnqPDkW3PEuRHrH7fEFlwj1INa9JZghbCmyes7XDZtc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zra4gQuG/UTWpwnl9rH1pLCnKl+1SHvoyjxNBszC96etvTcWQIgWJRIhV/y/P9uaS
 ndGwytiCrrBgq4S05SPN8ZM7EXc7cjzrsevWXuH/pLatNUmbEtwE+uq2R/bDpD7RnL
 beDQ698aGTzyvSFnE4MpbDRxnlLhfgbAudAzd6Cfhb3UltUHd2DMwrpIygoGavKCIj
 s4ESe4MP1ZP1G95uWg5ozLHN9TwgPHT9aCcvubtqsUy2EfrjZdAPU/330vuVbiahqA
 o8o+NKSFip7d6PvNALTSrPifquECuuBuk3ycixg/KpkkpcqoOmkf1EmL+MJS/YZPOr
 bR7kVXA5Qy75Q==
Date: Tue, 12 Oct 2021 12:25:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [RESEND PATCH] ASoC: wm8960: Fix clock configuration on slave mode
Message-ID: <YWVwk1kqyF+gzEC0@sirena.org.uk>
References: <1634036070-2671-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xmS7fg8H5aUGfp6g"
Content-Disposition: inline
In-Reply-To: <1634036070-2671-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Swim at your own risk.
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 kuninori.morimoto.gx@renesas.com, patches@opensource.cirrus.com,
 tiwai@suse.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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


--xmS7fg8H5aUGfp6g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 12, 2021 at 06:54:30PM +0800, Shengjiu Wang wrote:
> There is a noise issue for 8kHz sample rate on slave mode.
> Compared with master mode, the difference is the DACDIV
> setting, after correcting the DACDIV, the noise is gone.

Charles suggested some updates to the patch to improve the error
reporting here which you don't seem to have addressed.

--xmS7fg8H5aUGfp6g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFlcJIACgkQJNaLcl1U
h9Bj7Af6AoUC0r7+IN4MGFP2D+GI8ETZVSb6+NtZHAxw+TaFmQLwIhjzcEcDRtjf
hwLaEhsJNeks7PautGeGBzCpzO87FXDMcTh98x53l0nZDPX+OOYqPgicrRsPgPZ1
g1SdtDg4dlJCyj0Iymr0l8Famw7s2HlnLhufqrGigzdAT/ZDTL/tIc+G0YJR+p1q
Bmn2P1TVWvtIBBwVoVczqD9foLpX79Bz9l9PjFCQ3CG9HcAeceXI2mxc/xBaP00B
Eh7CU+QDvDe73E66/+9dTnZpoffnxK7bu5TwnXvLJ2RlDlwBAnF/f0G/1A82VVnB
2fuvTTKz2aFZG9lBtIvl0O3PhPI1MQ==
=F7Y8
-----END PGP SIGNATURE-----

--xmS7fg8H5aUGfp6g--
