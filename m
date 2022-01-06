Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5369148645C
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jan 2022 13:27:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F177B18BE;
	Thu,  6 Jan 2022 13:26:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F177B18BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641472054;
	bh=eoXEe4tEgRFOFZkA8tNjwaC8KkXqn0bsIoatokhWNrI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G5KC0duMYqElI/Y5T3sejuS0Ri4Tu8wq3iffltXtvvdCUhfgebDCLWe2OUSHBDW1n
	 Du7+uF195qHxxfrgf/nqsPKDUHbcNuRq0BU34c/6H85QyHEQ+BLaOefIffBl0tyegB
	 EfZuUDFbrFvONCOZ3REYwY/Fb9wLC9886SR7qtLY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67998F80158;
	Thu,  6 Jan 2022 13:26:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E160DF80155; Thu,  6 Jan 2022 13:26:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37037F800AE
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 13:26:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37037F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZM3RWDxa"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1F3A861B00;
 Thu,  6 Jan 2022 12:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB3EBC36AE3;
 Thu,  6 Jan 2022 12:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641471975;
 bh=eoXEe4tEgRFOFZkA8tNjwaC8KkXqn0bsIoatokhWNrI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZM3RWDxaQw9ikub9MdtCr5Q0OeD06I+22dQWH8SfeymUBr6x3qZ8Z4AsQv6FYBsCW
 bwFoE9CDZ9yxV4mzVr8goaTE+eOo20nXIqaHFt2Gv6pSHRTiUuFn+dEP/U6D/9U07l
 6BMs68pEvPSGxnpy19Lf0VWEpf8HpFij1LGikzevLNvtSsL+Jn2E1WYLJNdNFQadQo
 IGJ+iOqxSVEdNdCHi8I+ITIkVvudiNaRouLmeP/rnELofeGkHvcZrx/hnPTPKg7raB
 3GaXuoLXxXoaTLjyoDr72o3t6v6djDsUvEnfamQlYpPbMjGD/5tRAFZbN9C7zC3QhP
 sjt0nQNbNQxXw==
Date: Thu, 6 Jan 2022 12:26:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Robert Hancock <robert.hancock@calian.com>
Subject: Re: [PATCH 2/5] ASoC: xilinx: xlnx_formatter_pcm: Handle sysclk
 setting
Message-ID: <Ydbf4ga5jTluJ3HQ@sirena.org.uk>
References: <20220105225146.3517039-1-robert.hancock@calian.com>
 <20220105225146.3517039-3-robert.hancock@calian.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9nvxX3Y+jViq4eKN"
Content-Disposition: inline
In-Reply-To: <20220105225146.3517039-3-robert.hancock@calian.com>
X-Cookie: I think we're in trouble.
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 michal.simek@xilinx.com, maruthi.srinivas.bayyavarapu@xilinx.com,
 tiwai@suse.com
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


--9nvxX3Y+jViq4eKN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 05, 2022 at 04:51:43PM -0600, Robert Hancock wrote:

>  	struct clk *axi_clk;
> +	unsigned int last_sysclk;

Typically this would just be called sysclk - calling it last_sysclk
makes things a bit confusing.  It's being used as though it were the
current sysclk and that's what set_sysclk() is supposed to be for.

> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
> +	    adata->last_sysclk) {
> +		unsigned int mclk_fs = DIV_ROUND_CLOSEST(adata->last_sysclk, params_rate(params));
> +
> +		writel(mclk_fs, stream_data->mmio + XLNX_AUD_FS_MULTIPLIER);
> +	}
> +

Does the IP actually cope properly with inexact ratios, especially if
the actual clock rate is lower than mclk_fs would suggest?  It's more
common to be able to tolerate a higher clock than specified.

It's interesting that this is only for playback.

--9nvxX3Y+jViq4eKN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHW3+EACgkQJNaLcl1U
h9DZhwf/WBF/E4A6WkEY/8m7A+FTnfjrLtlgbZfBNQgLwvYLAfSJ9D5FMrEaERsP
Hf0dRGU9tsiKslaI7TC7B+oq/OW4BQ8cMdCbZQSp+FU8NYtZ/ncBkttECT676rpB
u75J4ZYf1PrAyTlxMZETnuO4y2fTdFeeB9d3/8LRubq6rTst1eNNlCbDuAWQ8L1A
1JhgNZZe63XIjusY4xYdrHOlMzIftHzI43f5n8P/XhZY3p12O51N4yxqUOdwVV8A
UyIlS+lqoHHwzdFnJPOIFL3bzZHDR4I8//MAUfgGjK3PYaIqfsgnTCjGHO/4KWOh
6FMSgpXNWVLjb4TOCHJQQ3lrbUR4Fw==
=NiEh
-----END PGP SIGNATURE-----

--9nvxX3Y+jViq4eKN--
