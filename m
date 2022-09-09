Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 682F35B3DF0
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 19:28:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1AEE169D;
	Fri,  9 Sep 2022 19:27:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1AEE169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662744504;
	bh=kaILKnrlF7r0CddZpeC4K/EwWafqCO7cxKu3AIkoRvk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ntxxuAzaRQPzMzcmTOumqRkae5l85RozB2lapFSUztXt0MrhRS4kpQ3T8q7L8xkq5
	 kK5L+jlwMlzubpRWMsBX7IeO5OId2pV6ldCRvEZ9RDTnk950fl0eDsTZUucWT+qia2
	 O3ETCPDgDlCJI1AtvnaONKzCswn3ps45vVhsROyo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42B1EF8032B;
	Fri,  9 Sep 2022 19:27:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E647F8023A; Fri,  9 Sep 2022 19:27:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D32AF8011C
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 19:27:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D32AF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MlNRDRUs"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 628F662069;
 Fri,  9 Sep 2022 17:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF16C433D6;
 Fri,  9 Sep 2022 17:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662744437;
 bh=kaILKnrlF7r0CddZpeC4K/EwWafqCO7cxKu3AIkoRvk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MlNRDRUsnF9R/Sn0n+PILjmX+poyd4gIV3SkFm7omnR1WLiGY/PBDoOrhKBq7FaR2
 /Gi7AF9WQDTtPG1CpVWBGAqmhGqsdlCi215XYRoPp1rQ5mdSWB6OEpkpawsQzjH8sW
 k9/E/fu3x/tDoSCKMuFsd4baSLT2L+3Phzj9hz1TdfROw49cq71ZHHNBLIiXrAnu/w
 LhFYrtLXj3YKLJdd9eenk4+Ki8eESxY4zAobeFZnpxHJwnTX1DJT2F0Du0jRvTXjeK
 VNzqf1DcAG32jKHBZNOdW+CJ3S58bE1nO2fqXCE0jyxfIXVpyEZGBIijV2VWuIrZew
 YZG0P2Kh1ufkA==
Date: Fri, 9 Sep 2022 18:27:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH 00/10] Support for CS42L83 on Apple machines
Message-ID: <Yxt3bbs7TPLSKTaa@sirena.org.uk>
References: <20220909135334.98220-1-povik+lin@cutebit.org>
 <a7c2df88-766a-4657-8379-649a5ae93ac4@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="c7j6oBAWbbGfiDda"
Content-Disposition: inline
In-Reply-To: <a7c2df88-766a-4657-8379-649a5ae93ac4@opensource.cirrus.com>
X-Cookie: FORTH IF HONK THEN
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, devicetree@vger.kernel.org,
 - <patches@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 David Rhodes <david.rhodes@cirrus.com>, ChiYuan Huang <cy_huang@richtek.com>,
 Rob Herring <robh+dt@kernel.org>, asahi@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 James Schulman <james.schulman@cirrus.com>, Matt Flax <flatmax@flatmax.com>
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


--c7j6oBAWbbGfiDda
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 09, 2022 at 05:16:48PM +0100, Richard Fitzgerald wrote:

> Mark: I've no objection to you taking my patches from this chain instead
> of waiting for me to re-send them myself. I can rebase my remaining
> patches onto this chain. But I do have comments on patches #4 and #7.

> I've been very busy and don't have time right now to deal with
> re-sending my original patch chain.

OK, great - I guess applying stuff will make less work for you later.

--c7j6oBAWbbGfiDda
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMbd2wACgkQJNaLcl1U
h9B6LQf+MPHcw1mzNH++FkEdl0UnCVxCjYWkYqdl/1xPUX4v5Fml2caza/NofX7J
tXms945HN9eAO2JpxMSjZhr7xAwnr/M5s3mAudBceL0CplrJ5+L8vdEbEBlVUE0r
HUZKNmowpqUhuIGjzFanHy7jOVU7iOp0w9duhy4D4FPXMAwA7Y08wsDokPkyMWmd
emYKmXSa8/7IypBUKCDE0ltSnQgAUsqo/yLfjmZ7ocQvmCzQBpAuQYTgBqupfhQF
Lu5V2QUXug1xA/iWKqOXqXSxv9pY7yLX/+LLT5NijZaqtMZ0Xrt3qZzb75dF+QXT
ya9T308GWaZ7RcJWtIoPAfvVpw4qBA==
=S/yJ
-----END PGP SIGNATURE-----

--c7j6oBAWbbGfiDda--
