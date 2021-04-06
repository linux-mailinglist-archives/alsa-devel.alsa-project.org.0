Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A9C3553CB
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 14:24:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7595E166D;
	Tue,  6 Apr 2021 14:23:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7595E166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617711865;
	bh=vd5jCoxHk7f4B8xal1DpWY1TWcSwMhBrMo4L51fVlFA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UsCGRoFz6mwdNGLhqLbvP2l1LjF9Z+mN99wb1nFWoajXQwSygNe+xWlh/WgCDSC3U
	 bAENfhWFSZtaDrMow6YPB0uUR1Piy0kqcfFmFU/LsG4KZ17/fV4geXvE+HXaMe1DlV
	 HOlB1AUUYwTfT7HoJJ4xg2tcVrpk+AxpvM/AsK3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21A55F80259;
	Tue,  6 Apr 2021 14:23:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72486F80258; Tue,  6 Apr 2021 14:23:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8560CF80169
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 14:23:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8560CF80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AHwRZ9Q6"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3CD5C6121E;
 Tue,  6 Apr 2021 12:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617711801;
 bh=vd5jCoxHk7f4B8xal1DpWY1TWcSwMhBrMo4L51fVlFA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AHwRZ9Q61nnLQEcnHxKaCgn37oW2WePhV1cpM8oOhE+aEputqvycnBL+nahuA5G+6
 nyLMVmGCjQaMPmRuRciyYYvEF1v1nQbuGooS4aHy5k3lP0Vt1US8iquMcaBJPPPpr7
 kse96gAF0I2Z4l5WgBLoM0aHEgWmn7MaF58QXuCcY9Ws6ynjvSO2+lMkUmmrasOZ0q
 BUW728KX8NfrUXLkSD5Chn5QchKCuUzifRJVMkVKgIoKLBtjWr4jiLF8UpXqFOH0LW
 RH4V2W6W3fSKD/ggdf3Emqg4epIQEdMnBrZ9pUkP86BPwFFYx/kEfOSFJu+5/9sVwW
 SAMvkY3bE/lxw==
Date: Tue, 6 Apr 2021 13:23:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiri Prchal <jiri.prchal@aksignal.cz>
Subject: Re: [PATCH 5/5] SOC Codecs: TLV320AIC3X add SPI: configuration and
 compile
Message-ID: <20210406122305.GI6443@sirena.org.uk>
References: <20210406105018.59463-1-jiri.prchal@aksignal.cz>
 <20210406105018.59463-6-jiri.prchal@aksignal.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="TKDEsImF70pdVIl+"
Content-Disposition: inline
In-Reply-To: <20210406105018.59463-6-jiri.prchal@aksignal.cz>
X-Cookie: BARBARA STANWYCK makes me nervous!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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


--TKDEsImF70pdVIl+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 06, 2021 at 12:50:18PM +0200, Jiri Prchal wrote:

>  config SND_SOC_TLV320AIC3X
>  	tristate "Texas Instruments TLV320AIC3x CODECs"
> +
> +config SND_SOC_TLV320AIC3X_I2C

The old single option should not be user selectable when there are bus
specific options so the help text should be removed from it.

--TKDEsImF70pdVIl+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBsUqgACgkQJNaLcl1U
h9DQfAgAgk1/FdNIU/tgSy8UBct4blhbWoKxfzoMiZI7NCO7TBlkYASN49cWhMxg
gCZAzlp88bL8kwCgBQhp/R3bkNo9/fnDdWh7eSZ5g/mEdRaXTOXGmzmeEyISk2zl
x9M5JFZUIbrlO+XCIS7411BattFX24i0vrGJsf1a4d2xWbnLcTfpklS0jVfBGjcR
APCXxG+x3vB4vNGXrmJOIcJUbE8tgdff0Ainw7uzuOlysNYS5Z9uXhTHAuBkp0ez
dyfU0Pvu4zTndDstXY5KMbpiJRuunEOlIaCEgPMy3kQYNN8shuNYS3jBgUSj3AID
pbMPqyN4IYQ2Lb++kbAaR3epcE9WPg==
=z2De
-----END PGP SIGNATURE-----

--TKDEsImF70pdVIl+--
