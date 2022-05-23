Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A835315A0
	for <lists+alsa-devel@lfdr.de>; Mon, 23 May 2022 20:58:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 458C416C7;
	Mon, 23 May 2022 20:57:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 458C416C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653332303;
	bh=879aFF9uyZobIk3fQF2c9wXlxyMRKkOB5AS/hxoLmCQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TfKQAo9yHi/ZFBWMR+EMzRikIordnLMKWyXN4AUBvci0oJ0syiCpPbBUDxUcvP9mj
	 yt+7EDoiACG6RnmZ90b5fBSWQ3f6OqVyFGEwLAMveSqSKwXUXiR2DuRRlpEnBPXyf8
	 8677WkhMlkAh+MNAVSzkLDmQNrGjms2Mc8klrpIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEEAAF800CB;
	Mon, 23 May 2022 20:57:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 887CBF80236; Mon, 23 May 2022 20:57:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B7A2F800CB
 for <alsa-devel@alsa-project.org>; Mon, 23 May 2022 20:57:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B7A2F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OZ0Fz27l"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BDE2D61167;
 Mon, 23 May 2022 18:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC736C385AA;
 Mon, 23 May 2022 18:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653332232;
 bh=879aFF9uyZobIk3fQF2c9wXlxyMRKkOB5AS/hxoLmCQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OZ0Fz27lmYi9vc0z6gjxUs4iDf1yXVgq8phBOCOq/XLnnMfEpeUbbvfwLGQGlQr0P
 rpTAzxje0YupT/MeWjRDu5yO+t1hNCJFleqS/kkt//Uifpodnl+djn3OIO7BDxGnYF
 PKusv/w5+29LXPpNTkM47qlY6AV4SL4JATD7mmwtgOx5HXOpkiz81PZhtnk7FDfGTA
 eIyhEMm4qCOibkpCj7t9twTy7XWrNWlPD77CFocHB8qI3fgz1QSy6WollY478qtPIk
 tZDshiU96Q4nQy3fo/6aYmk0Z217b3JKakNw8oMEIdXG0w2vWmhDveIt9Qup27f5lX
 UPBQ3tMFudFow==
Date: Mon, 23 May 2022 19:57:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Olivier MOYSAN <olivier.moysan@foss.st.com>
Subject: Re: [PATCH] ASoC: stm32: sai: Use of_device_get_match_data() to
 simplify code
Message-ID: <YovZAf4S0XphBsco@sirena.org.uk>
References: <20220519124235.21100-1-tangbin@cmss.chinamobile.com>
 <69d5cef3-57c0-9bc7-a83b-a85ef1c4cf29@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="D+p6NkMZHcHp/pjf"
Content-Disposition: inline
In-Reply-To: <69d5cef3-57c0-9bc7-a83b-a85ef1c4cf29@foss.st.com>
X-Cookie: Sales tax applies.
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 Tang Bin <tangbin@cmss.chinamobile.com>, tiwai@suse.com,
 mcoquelin.stm32@gmail.com, arnaud.pouliquen@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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


--D+p6NkMZHcHp/pjf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 23, 2022 at 03:28:48PM +0200, Olivier MOYSAN wrote:

> The current patch requires a change in the driver.
> Either changing STM_SAI_x_ID enums, or replacing data by a struct.
> For instance:
> struct stm32_sai_comp_data {
> 	unsigned int id;
> }
> struct stm32_sai_comp_data stm32_sai_comp_data_a = {
> 	.id = STM_SAI_A_ID;
> }
> struct of_device_id stm32_sai_sub_ids[] = {
> 	.data = &stm32_sai_comp_data_a},
> }

Either approach works for me (or a revert for that matter).

--D+p6NkMZHcHp/pjf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKL2QAACgkQJNaLcl1U
h9DuAwf7B4DIzNtZ0XzfzZJZ+4+f3o1jf4181qlohJddMInl8qu8NI3UjsBmG/6V
kbnPnNFNA8Dt0Y4M/1Qgsux2KKSf71TBiU4F0u1sLUWdmfmevcRSb3dDryoOxnhe
y1ztzF3lErZxTRTpbK0fhud5x3CQuOpHVtY0NsOmB3nAtOcebC7Y+NsV7duG68zR
FWHJUlYGhm0+D3EambBVFiT6hYxgMNk239MLMBCSLbpCaZTCj+9q0RCzYmG8F17Y
pzmwNKfe1F9xoWVWBgxz/EA5o2/jebc75dUdjLfz+y0eCGaHEYnugd6/cFSWLeQr
CZYC5j7tJ4vB8J7WFGhYwA+xMvoL8w==
=UNvf
-----END PGP SIGNATURE-----

--D+p6NkMZHcHp/pjf--
