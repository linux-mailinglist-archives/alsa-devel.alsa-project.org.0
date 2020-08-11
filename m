Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCC6241A79
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 13:39:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39A6F165E;
	Tue, 11 Aug 2020 13:38:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39A6F165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597145950;
	bh=pabIEVAMTF/3OKJcoU8QXk8F1wPRUPXAtuWQ7FyMlY8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WxMNc/2lL7IoZgiw1GYMJ9uOgPVcxLRzAiJLkrTjIfUtu0EajSPNRJPjXiPORcVui
	 WvzQEGxgGaqWY6QOchh3gQdNDEzdwxpbk7nRasZIKH2hfQ0qlLzVe4+KnvFI8nSDP0
	 I7IdsbieouaTAm7KUcMaDGCfNJyHj8Af/m5H94aU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79C06F80118;
	Tue, 11 Aug 2020 13:37:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9600FF8015B; Tue, 11 Aug 2020 13:37:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5542BF80118
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 13:37:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5542BF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dPtG/27m"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0784720658;
 Tue, 11 Aug 2020 11:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597145838;
 bh=pabIEVAMTF/3OKJcoU8QXk8F1wPRUPXAtuWQ7FyMlY8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dPtG/27mwTyMjiqB6Ix66kBFsmfWoGXluzFcB8mTVpqz5Z8gB59a2rR0yApTfPJvv
 QgkETSj4IHiCIAUrMUDn4DagymABY5ve3lhhIELlNp3dTaz70bKFbpqyJkdz+gY/oM
 svOQ4bj5BNgRg9T2/epEqhIy9shMFwpzi43vafgc=
Date: Tue, 11 Aug 2020 12:36:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH 1/2] ASoC: q6afe-dai: add dummy register read function
Message-ID: <20200811113650.GE6967@sirena.org.uk>
References: <20200811102552.26975-1-srinivas.kandagatla@linaro.org>
 <20200811110409.GA1481@gerhold.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2qXFWqzzG3v1+95a"
Content-Disposition: inline
In-Reply-To: <20200811110409.GA1481@gerhold.net>
X-Cookie: Gravity is a myth, the Earth sucks.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, john.stultz@linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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


--2qXFWqzzG3v1+95a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 11, 2020 at 01:04:09PM +0200, Stephan Gerhold wrote:

> Actually q6afe-dai does not seem to make use of the register number.
> The DAPM widgets all look like

>   SND_SOC_DAPM_AIF_IN("HDMI_RX",  NULL,   0,    0,     0,      0),
>                   /* (wname,    stname, wchan, wreg, wshift, winvert)

> Wouldn't it be better to replace wreg = 0 with SND_SOC_NOPM in this case
> so the read/write won't happen at all?

Yes, if they are not used at all then that's what _NOPM is for.

--2qXFWqzzG3v1+95a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8ygtIACgkQJNaLcl1U
h9C1+Qf/Zi3SBLYwM5XlNdV0qZrjHIdl874SJUA3RStfvXzku/zmsSZvClLF6V0o
9i+L+UmiKOKzpz9H0rBrLfTn/6edzmlnpmAL9RdrREPxEsSCgxvTb2by+6IZ5VNr
caaeQAy+5cJrZi7zieISKvHvgLBRWdvYyMKsYdHFORrWVYoUhDofotCxyPh3kWpJ
xAU9K9pzOp1rZFDW97OBAiutpPUOHF2HebdGXBZywpCoEmLmsZTb3IDl9eUlVV39
5szE2ERrU3B+iCHObbBTqvN7oz9IfzNMSJ51tmrUSjNxBXNStPO6FVJGrTkkb01o
DbxYaWhpMEbjBgsaJcyFKOKTC2V4hg==
=3ufd
-----END PGP SIGNATURE-----

--2qXFWqzzG3v1+95a--
