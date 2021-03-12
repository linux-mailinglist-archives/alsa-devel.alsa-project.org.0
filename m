Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8615533917D
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 16:37:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 246291760;
	Fri, 12 Mar 2021 16:36:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 246291760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615563457;
	bh=eEKFK3OThEMIo+ZId/9KGlssHgbryRe18XUiNaBF2R0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nIIDbXUciHwn0d/nhiFaR9wzxGteRHE51DXFmMmbQ9AxMHkicwCzGoi65bxkJKekH
	 7fRtfIb9SL1FwGZHbUxLGU+9iKhNomPj+SA+NTKCa7XpyzeMqFcQdZT+k/scDdIvAJ
	 c68/TsAzSZBvIAk1I459AE65PRJ9ZeMwOOs1Ow+U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77A05F801ED;
	Fri, 12 Mar 2021 16:36:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01899F801D8; Fri, 12 Mar 2021 16:36:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99414F800BF
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 16:36:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99414F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LOuteIOL"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E1E464F4D;
 Fri, 12 Mar 2021 15:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615563357;
 bh=eEKFK3OThEMIo+ZId/9KGlssHgbryRe18XUiNaBF2R0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LOuteIOL+nMhXruJzsVz5ttEqS4PASeXqgxlCS/YiPDV1m0y7FDOy1ccVYnuxsaCo
 JLM9RxNbLkT+5R7FJ5SPUoNK3j2+H4ZxHZpcGotcu+SqBReVshez0HaRTPbYaRIheC
 Mla9LwjsK9uL94ITTSzWRTXRB6Fv1Gf7xvKximTcc6yIQlIqjCUKmbjKRkHagTkmg2
 9tsVHVAiPHQ6uNhyLWMZOSzzw3v7tSvtSJhQ2fAgQt/V1+kVAi+n+A6l7ImDvNoRdI
 tv3Ec7Cz1npmA6x25QZFtEYSUy+E2rWZNHr0k0aEsSHLwd+QjVmZ5OryEqsfLzR/y2
 2XnMhmCwOidnA==
Date: Fri, 12 Mar 2021 15:34:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 3/7] ASoC: codecs: wcd938x: add basic driver
Message-ID: <20210312153443.GI5348@sirena.org.uk>
References: <20210311173416.25219-1-srinivas.kandagatla@linaro.org>
 <20210311173416.25219-4-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="16qp2B0xu0fRvRD7"
Content-Disposition: inline
In-Reply-To: <20210311173416.25219-4-srinivas.kandagatla@linaro.org>
X-Cookie: Lake Erie died for your sins.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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


--16qp2B0xu0fRvRD7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 11, 2021 at 05:34:12PM +0000, Srinivas Kandagatla wrote:

> +static int wcd9380_update_status(struct sdw_slave *slave,
> +				 enum sdw_slave_status status)
> +{
> +	return 0;
> +}
> +
> +static int wcd9380_port_prep(struct sdw_slave *slave,
> +			     struct sdw_prepare_ch *prepare_ch,
> +			     enum sdw_port_prep_ops state)
> +{
> +	return 0;
> +}

If these can legitimately be empty I'd expect the framework to support
them being omitted.

--16qp2B0xu0fRvRD7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBLihIACgkQJNaLcl1U
h9Ci5Af+PqSg4yirqEFMszFh/ZclR61rSGqEGOzB8LWC3qEET8W5UpRKUKtDdRHb
wXhbQkw5H6mbRHy/oqQVUaLXQm8U2Xt4CwyZSTCS3CHmYasfkk63kbhaccT1xxAf
UdPxODkq/8ykC7eM9aGWG1D5sqdGZg+hRlIVtMKAev5K9i5AOxWQAx5qSKwukA+9
taUkuvFN3xxxw2Lkiv1NTncSn+B/TXwfXcYAOF3GLkeJyRjvd/tfzX+gImSoL+kT
D/EPmg8APp36rkq7JAH1GGjrisac/FuEyecDFhFY1KyWrzyuD6yx0uJRkn5oYWK7
istKWxTEaCQjxtaj3iBkxKkFF23W7w==
=PrKP
-----END PGP SIGNATURE-----

--16qp2B0xu0fRvRD7--
