Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCBF4CA5A5
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 14:13:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E5331F54;
	Wed,  2 Mar 2022 14:12:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E5331F54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646226786;
	bh=HH6BcwYmzPzwuwKnKZ0uOj8l/hGrP7oWeQFG40wMCR8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BociKT73vmIP9nBr4DLPMWlRr/Y3s7BFedXNc/+pqubUFFprLY2NCwl2ORKg3meNz
	 uo49vqKiu7Ry+jXDT4wdB1JNZzl5GL3dRc/bP3Ntc0bL7PC/pI+peoLoXJEfhoAJuX
	 bs7pRtDoYxp7S4x7yjmMQKfSkcqTujT2aeHlK2os=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DA41F80054;
	Wed,  2 Mar 2022 14:11:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED58CF80167; Wed,  2 Mar 2022 14:11:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB9DEF80167
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 14:11:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB9DEF80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AB7b86DM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CD588B81FE8;
 Wed,  2 Mar 2022 13:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC00C004E1;
 Wed,  2 Mar 2022 13:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646226710;
 bh=HH6BcwYmzPzwuwKnKZ0uOj8l/hGrP7oWeQFG40wMCR8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AB7b86DM0maYg6oUioxF6IsG2D78ibFRMHYQtGUaAThypyBCQPiC+Yp1QLmd+aY59
 DjhpLzgknEwstFtzZ0YaONUO+7jHKxBuq8W5uu0ARQ9Ydurr0U0bNTQuf4CVo7bCjN
 2iaPBE9uxEHmwAic4FL23lJ8dv6GDxuHvYsZwUWQIu+c8f/G7jsGYtv6BVXwnkvNfM
 jgmiFmKQqDRzh6dVA73NJdN78+GKEGGpX9/O+sy7DUMvIsayh9hGBCacVX0lty/xNu
 wX46l6xR5x+rwCV1nT71gXlkMNHpnqdFsEgTCNyagrgauxogT5yrFjdEY98Xg3du4n
 XgnoLG0mdvpBw==
Date: Wed, 2 Mar 2022 13:11:45 +0000
From: Mark Brown <broonie@kernel.org>
To: "Yang.Lee" <yang.lee@linux.alibaba.com>
Subject: Re: =?utf-8?B?5Zue5aSN77yaW1BBVENIIC1uZXh0?=
 =?utf-8?Q?=5D_ASoC=3A_amd?= =?utf-8?Q?=3A?= Fix an ignored error return from
 platform_get_irq_byname()
Message-ID: <Yh9tEYtfKTBIICQS@sirena.org.uk>
References: <20220301064920.37788-1-yang.lee@linux.alibaba.com>
 <Yh4UGGuspsc/gAyY@sirena.org.uk>
 <53306907-c963-4740-9a90-c1249ba0dff4.yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="X6e1+/WO22PbXzdY"
Content-Disposition: inline
In-Reply-To: <53306907-c963-4740-9a90-c1249ba0dff4.yang.lee@linux.alibaba.com>
X-Cookie: The sheep died in the wool.
Cc: alsa-devel <alsa-devel@alsa-project.org>, tangmeng <tangmeng@uniontech.com>,
 Abaci Robot <abaci@linux.alibaba.com>, tiwai <tiwai@suse.com>,
 lgirdwood <lgirdwood@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>
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


--X6e1+/WO22PbXzdY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 02, 2022 at 09:17:21AM +0800, Yang.Lee wrote:

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

> The function dev_err_probe() is called in function platform_get_irq_byname() to print the error code.

That doesn't seem at all relevant to the error code being returned which
is what the review feedback was about:

> > If an error code is being returned we should report that error code
> > rather than squashing it down to -ENODEV.

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--X6e1+/WO22PbXzdY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIfbRAACgkQJNaLcl1U
h9BNxwf9EbCJYEIUuEHT4sfAEoL+oFQovgYwW1G0unYzJ5kgO0t0NXEDRVx7Yo/S
O63wumrjLCGoIgofpYa0xJ2WtnBAe5LchcLCdFo5GrwLvrgMHtup4lAWo8ZfiJc6
DynyIUycZcdmlz9XqPIvsaZ8sUNHV83BtpwtgLT5QtJtmhQwqaLnYDdWJh2A3CE9
R4DkZejr7792OHDjHsoEUB93DqcPjUhvY6tDbQvcwEBNnv48YOS+lw9V7vGRKQFa
pQZrOeo5OeV29WOJPFo1LbL4WExvAXOpQoCr17YXrfP3LeQ061gsFLvCAfvZOH34
YjL5Td+BT4IYahRiNjh8i90DKi1VeA==
=qTYQ
-----END PGP SIGNATURE-----

--X6e1+/WO22PbXzdY--
