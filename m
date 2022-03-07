Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 086FB4CFFBD
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 14:15:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8688F1719;
	Mon,  7 Mar 2022 14:15:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8688F1719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646658951;
	bh=jK5tthGPa6NNlk/rKdqUQuBhZW7CjqSVqu7tpEhh/7s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IX1hMZ6+muSEGywx4iLtmxMUWuR+b61oQklTqFbkyhNX5tyBI7bPjRGUwe/nPoBnj
	 eHlFOYBuboEpSUzplMCgU3FITf++x5gaY9tewzAn6zId5ujkG5CqrifMZ6YbSVtQ1p
	 YV+ujGBXLIUYMJoaLoHiFu33plN7DEv235FRHe+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEDEBF80159;
	Mon,  7 Mar 2022 14:14:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E529F80132; Mon,  7 Mar 2022 14:14:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 409F5F800D1
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 14:14:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 409F5F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dKzcECX9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 100FCB81243;
 Mon,  7 Mar 2022 13:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2EF0C340E9;
 Mon,  7 Mar 2022 13:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646658876;
 bh=jK5tthGPa6NNlk/rKdqUQuBhZW7CjqSVqu7tpEhh/7s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dKzcECX9lMHtNjgh/SJ7YqhiXSzyOghF1D8Ddn28YStxnA5oZgphXDATXx1Z5x22I
 YpFb4cNHhjLlQ9OxOmrxza+hTnJynAuo5KMNXoLnPLsJeV1GE10mB1/TM/dDtZKzqX
 LNsf1vnJmga02E/9T1F73sCA3ybZrJPopvzH+qprr0SUg9Hxk/EPHoX1LNwBTv+LjT
 B9ZfRhDUyycrr8Rm4hxyWyxjoBojZX+YshrjSEOqo3CWArdjMlplkRryBGT4rRU/zI
 dbkIloO7e/RO/YPAH7Klxrgs5PX9kEMwDDS6VJ1HlVbfYYYLGJc4ZYjbWi6ft+i6Hd
 dhn4tiaFM70Dw==
Date: Mon, 7 Mar 2022 13:14:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Yang Li <yang.lee@linux.alibaba.com>
Subject: Re: [PATCH v2] ASoC: amd: Fix an ignored error return from
 platform_get_irq_byname()
Message-ID: <YiYFN7TL8ZpnAM2d@sirena.org.uk>
References: <20220304004543.11797-1-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vKS5jss5k13JvKxY"
Content-Disposition: inline
In-Reply-To: <20220304004543.11797-1-yang.lee@linux.alibaba.com>
X-Cookie: Store in a cool place.
Cc: alsa-devel@alsa-project.org, tangmeng@uniontech.com,
 Abaci Robot <abaci@linux.alibaba.com>, tiwai@suse.com, lgirdwood@gmail.com,
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


--vKS5jss5k13JvKxY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 04, 2022 at 08:45:43AM +0800, Yang Li wrote:
> The return from the call to platform_get_irq_byname() is int, it can be
> a negative error code, however this is being assigned to an unsigned
> int variable 'adata->i2s_irq', so assign the value to 'ret' concurrently
> to solve this problem without affecting other functions.

This doesn't apply against current code, please check and resend.

--vKS5jss5k13JvKxY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmImBTYACgkQJNaLcl1U
h9Ayawf/UAHZ/XEOH8Ig5XxzKsT6C8R6T0FSBLGJg3y7QBXcXluvNaQQs8kogFjZ
N4MyL9viPZ9zoWVptKZB3wgcJpFfzviuXKemILq0HqY2Vd0LL/79YxvLek/CJFS3
drf/lRSIafH0ZUBIkyhg+y6vf2YWDEJvIh2u/4DLhYGcMaPtq002I1iXg4ok9FMU
WlLWlT4k5y9n/Qhddm2Sq5d4zVCD9SgPf4Rmvi2wJH7xJOHrG6jwZ/dF61ok5SUQ
aqrcd1vDhpHLTAtPRSEIL0Zt0Q5WDdGgW2bBOyJANMeqwz7w93t8BJKrrRSNSpbL
3B1auFFO2XquDL01ePZWTm8Xtk351Q==
=dJZZ
-----END PGP SIGNATURE-----

--vKS5jss5k13JvKxY--
