Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A974F45EF4C
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 14:40:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 224261926;
	Fri, 26 Nov 2021 14:40:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 224261926
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637934056;
	bh=NC4SpiZ2SHdTDSCTPOpq9t5x7oRVWD4HdHwzbrrZNBQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vNfK4CTKi9iWOzxvy5VDDD9OM9arvw2K1jzh8NauLUs0+PemOESAPKtEfdrAD/657
	 YzlJ3kkwiPqJm0XeSG8qXU3lEbyI6fBd/UUkzWkKYxDYezoss90P4UsWtbXA0Z0L74
	 4C+gHASsUxSJW+GnDofpl+DTLoHUT6C+TDbSFUgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 634D1F80245;
	Fri, 26 Nov 2021 14:39:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1A97F80132; Fri, 26 Nov 2021 14:39:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 655BBF80132
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 14:39:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 655BBF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LnzuaG0a"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7F24BB827E9;
 Fri, 26 Nov 2021 13:39:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83BD4C93056;
 Fri, 26 Nov 2021 13:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637933969;
 bh=NC4SpiZ2SHdTDSCTPOpq9t5x7oRVWD4HdHwzbrrZNBQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LnzuaG0aGkSbR11VcYAhw+LABMdgP93Eb79e+hjZKIh/WOMreVmEeXBxIpXzyXXms
 BGTLlweG4pPZYKxUtGXROXQClLNB3esFBYx+eQUBYRgyA+GVObOOdBCjD7dSj5mcJE
 oniJJGSEqxtsYfCiu0YgPTAJynNzUVpcc9YGmdWQlSkk8msyd9OQBHV3w33o4UKcCV
 jzbckwgg1rO5e+AqN+wuVvV+czHcDglgU85iBbjs2zjRz/DimZWx3G+/ktXeSrGYZt
 OOPazXpd42BZegLzm3RZaaaFs4EGjXET5mb2im3HE7FwmRUy3g0d+h+saTXQhBRYtT
 808fo/59GQffQ==
Date: Fri, 26 Nov 2021 13:39:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: Re: [PATCH v6 10/10] ASoC: qcom: SC7280: Update config for building
 codec dma drivers
Message-ID: <YaDjiip57q5hDe+l@sirena.org.uk>
References: <1637928282-2819-1-git-send-email-srivasam@codeaurora.org>
 <1637928282-2819-11-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="8VdVWGcSreCkYakr"
Content-Disposition: inline
In-Reply-To: <1637928282-2819-11-git-send-email-srivasam@codeaurora.org>
X-Cookie: You fill a much-needed gap.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Venkata Prasad Potturu <potturu@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, bjorn.andersson@linaro.org,
 agross@kernel.org, rohitkr@codeaurora.org, swboyd@chromium.org,
 judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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


--8VdVWGcSreCkYakr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 26, 2021 at 05:34:42PM +0530, Srinivasa Rao Mandadapu wrote:

> This patch set depends on:
>     -- https://patchwork.kernel.org/project/alsa-devel/list/?series=582321

To repeat yet again:

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--8VdVWGcSreCkYakr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGg44kACgkQJNaLcl1U
h9B2PAf9HFtpuSJkMDBV0v+tqGL4HutQce5WtAopOh7XBAr+9F4S0Zc/wjf7/rEo
XsZ5s26AzXEBFCam543O95L/8xOKJoRBTCpzNI9shL0I9Us7v3OrnpKmtlmFfguz
pdHWM/ynf7GukdQkiKCjFdvb7ecDnIhcUotEmrod4v0JlHbTa8oTNHAm3xW1sOVV
aJN9QVOLSErb033mTnfCRakno8KqclFjBFrYE9Kr5mQTGHwduq36zTDrVM268eyX
LH+vhF0mKVUkfuTZKQbY/8NpnLbmBSnQ6Uf4LjBs1itPiv9cWJGuE/lPqB8GNecj
VIfGGvzQFpOlGDGmYRb4RAyPvuOJAg==
=eXdC
-----END PGP SIGNATURE-----

--8VdVWGcSreCkYakr--
