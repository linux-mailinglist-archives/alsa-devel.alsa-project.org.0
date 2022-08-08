Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9699058C948
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Aug 2022 15:20:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07C4E823;
	Mon,  8 Aug 2022 15:19:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07C4E823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659964845;
	bh=eQQG3w7iWYBgQ9L9vR2hhgfaLi4C3wIC0N0XBZUD6UE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E0asTQ/hdcOgqcmqheh6IW0jZDTLwlvehLdfDa8LM5waqcbYYZtYCsoGmjdrLLsZ+
	 6sYCJp0mYhog3ievdWTQZmgSG7rM6lpesZG8E7fIBvBMVmTaCS9HuooDCFWxlx3yAQ
	 gbaEeh6Lr1JR4Vx0cj9fyRQFd7hOPB2Cc88rtHDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74F44F800E8;
	Mon,  8 Aug 2022 15:19:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0E0BF8049C; Mon,  8 Aug 2022 15:19:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC410F800E8
 for <alsa-devel@alsa-project.org>; Mon,  8 Aug 2022 15:19:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC410F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UftdXnG9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7CF30611EB;
 Mon,  8 Aug 2022 13:19:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F938C433C1;
 Mon,  8 Aug 2022 13:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659964779;
 bh=eQQG3w7iWYBgQ9L9vR2hhgfaLi4C3wIC0N0XBZUD6UE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UftdXnG9yQF3+pvKzjJvBCeqiOXZSUFohihYVej2PXb3/xiFG3Z6cOmvOK4ckeDvE
 563QMLfc3HafHPMX6Rno/xPd7LFtf5DbGLqA+K8jsQipl7wsG0dXhGuGnSVGSr9Le0
 b1PeFCLNF0ChWt1MwA1WHL4DcOCvCTCSF8AN2cxQSNQx2NDLvjKrmFX40alsHxoCHs
 1vEKg/BKpo5y0cuWg+XtcetqGKvE4nVL7aB/12CRPAziXMko1tMNyCB+AhjQjxeoKk
 xsj8jrt1ZX6Ga1Sikf5jLlnLiZJpc5RmxaMfrbjLHVfeeviQJRsh3aYkdqv0kisOHx
 r31tSLiitOv2A==
Date: Mon, 8 Aug 2022 14:19:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: Intel: kbl_rt5663_max98927: Simplify clk_get() usage
Message-ID: <YvENZULMLWkeaCzO@sirena.org.uk>
References: <55e59c4792d64ff6336fcaa85ec15590553e9d63.1659903516.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="h+2uZ44m+eEzN7zj"
Content-Disposition: inline
In-Reply-To: <55e59c4792d64ff6336fcaa85ec15590553e9d63.1659903516.git.christophe.jaillet@wanadoo.fr>
X-Cookie: Flee at once, all is discovered.
Cc: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Harsha Priya <harshapriya.n@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 kernel-janitors@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, Vinod Koul <vkoul@kernel.org>,
 "Subhransu S. Prusty" <subhransu.s.prusty@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sriram Periyasamy <sriramx.periyasamy@intel.com>, linux-kernel@vger.kernel.org
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


--h+2uZ44m+eEzN7zj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 07, 2022 at 10:18:54PM +0200, Christophe JAILLET wrote:

> Not sure the Fixes tag is needed. The patch does not fix anything.

You just answered your own question there...

--h+2uZ44m+eEzN7zj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLxDWQACgkQJNaLcl1U
h9AHtgf+NLieJb/NpzO1CTPoNd4n2HBmtAu3jtpeGHaJIGGbQtSKBrjJpibSPV5e
4rDQjw2jC0NDP6aF66TIko2uT/53ELZXRszH/9+GTRkbgubnMPOymgnEJm7hulDY
PFgqQLdYkEhiOvUpwFL1J6QrXntpP5hB6DTKr83J95QdgkAaXp1uAshxLZ/2vbh3
2S9ruT+ROnnmLqkvlxdLEtOP9rYVLLoquDY+zTzWNhWhPC0jYcQNsgHsuHI9pKUm
xJdE0s9zbEtuaeaPnxlGhwmXPI1Z5kCG9l44YVd/+6BhaUitCqzXe0Dp7Qe5ZFR0
8W7LTCLphAQMB1vM65di6lrGZNOCTA==
=1XmB
-----END PGP SIGNATURE-----

--h+2uZ44m+eEzN7zj--
