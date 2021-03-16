Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBF833D47F
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Mar 2021 14:01:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A71B71897;
	Tue, 16 Mar 2021 14:00:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A71B71897
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615899705;
	bh=qwBm7m6FV8Asv3SjFX/QnnnbKfOuU9r79opiM9sj9mw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uW4mS7UB4npM20G3Vkzv488ob0qFKoar24F+EuSH18WN2mMYnG23nNiyyoUiWrod+
	 1gAj0k1GbsgeYTbxO/i/h+lxodM5qC4/1TzOG0MLTQd+FWRK2z4Kk4H2fnmCQ+hT6v
	 ApHGbrwGMe+S483UbtPZbgRcSh1guz127gJUNcck=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2A68F80137;
	Tue, 16 Mar 2021 14:00:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 108B9F80163; Tue, 16 Mar 2021 14:00:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB226F8013F
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 13:59:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB226F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aKEMIhQC"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F25F65054;
 Tue, 16 Mar 2021 12:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615899595;
 bh=qwBm7m6FV8Asv3SjFX/QnnnbKfOuU9r79opiM9sj9mw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aKEMIhQCaVn3lLwByE24nqImVHqNJUT+/8j9sbtM2chyG0jSLvPAZM8F4f8axyuJC
 jybxzpe172SfZXs7qpx2d8s4Qd5wugn26nfNH9T8evegc5LjBsgS2HufHzR6sTDVbG
 XE8PdCmwfF0CKowDN3d9zh5QtPEsWcllXIT3CrmHYj0QgSFwxguhxamKYdfrEhKFFt
 vDR7CBPirXnx8k3GpIkjLMNLO6/XIPxcQXLP0WO1rx+gJW9TtC8HNyXPboNaw2UziF
 4VETN9iyh3qPO+vDqK5V5c26AkvUZqHeW+EwMVuLTZ7pw5Q+9opRUb2vB2Dx5hS5N6
 UA0XsjjW8xtpw==
Date: Tue, 16 Mar 2021 12:58:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: remove reset code from dai_probe
Message-ID: <20210316125839.GA4309@sirena.org.uk>
References: <1615886826-30844-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline
In-Reply-To: <1615886826-30844-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Results vary by individual.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 nicoleotsuka@gmail.com, festevam@gmail.com, linux-kernel@vger.kernel.org
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


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2021 at 05:27:06PM +0800, Shengjiu Wang wrote:
> From: Viorel Suman <viorel.suman@nxp.com>
>=20
> SAI software reset is done in runtime resume,
> there is no need to do it in fsl_sai_dai_probe.

People can disable runtime PM in their configurations - do you not still
need a reset on probe in case there's no runtime PM?  It'd probably make
sense to factor the rest code out itno a function though.

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBQq34ACgkQJNaLcl1U
h9B1lQf0DcB6TePE9N4R6M55ENvpw+3OXeo/AocY7jVKhtvhyr3WBZe8nDwnwbMQ
m8jPvvIuRx2l6ozvCdpJkIWkjGLEdOG0q/+n7HGEV8EFPa20tQPSkWRt/3zPKaAD
oSJP/xemNE7Gt9DnZXM+kgI4NxgXXjbHGt06YUPy/h9SGjgpoaggkdI+zwGdWYJZ
BoJjaI5+cAnAXzp3RFnVmJGwIWER8vF/Mv4vIdbEz5lbamaVpG80yJEiyJOn8GmY
ZA5Wc/4wOBLOpdCCXklTQi7YU/nJpgCflBrsXtqT9WNUH1OIqYc4oqiMb9acw/G2
L23Zg+uzwL3ZBYsq5CyQU74jmCTa
=M0pT
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
