Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA6892FCA7
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jul 2024 16:34:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EB5CAE8;
	Fri, 12 Jul 2024 16:34:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EB5CAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720794890;
	bh=gQcrFDGWggoe/ec5V49afFn7kmx2z7nIu9TGMMaHQNU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RptqYImvysd0plQRjBUVIWEzisMqXj2wnpsotpliiEuRx+z8fQuuYoSbsRQZd1JRC
	 4RBHIHY8SiQ0DqEzMbAH1w2QruYEgX1wIFXxnAgMUkcqycarVB0FsMJA5a2vv69GpZ
	 OZvZl+HNwfqUTmAupq7wBQRDRpOJjJegHvAFu0mk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E8BAF805AC; Fri, 12 Jul 2024 16:34:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87A97F805AE;
	Fri, 12 Jul 2024 16:34:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2069AF801F5; Fri, 12 Jul 2024 16:34:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F6CDF80074
	for <alsa-devel@alsa-project.org>; Fri, 12 Jul 2024 16:33:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F6CDF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PvT20OK/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7ED2C61976;
	Fri, 12 Jul 2024 14:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6BAEC32782;
	Fri, 12 Jul 2024 14:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720794836;
	bh=gQcrFDGWggoe/ec5V49afFn7kmx2z7nIu9TGMMaHQNU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PvT20OK/LujkSr3zquhW8ndmrLa4t0AyCFlAouH+u5qUV0T/+wbBZdJoOaOJuKUOf
	 4xTPxY0rc//GzMP1GafqCstvmgMWh8cBnEBd4Nret4j3BtekCML+ARJ30L4lerVMYQ
	 TZB5Xf+axxgkyW4vKKW+ktP4lLeIcKeq1VP5kqEmUWhAjlopTl+oZhkHjYub/yOS4c
	 7ecO/8T/xtRH08WFSwtC8GAXMT6qQ6R9FpfkuOStenSdu6PwkFXTI/C2VS3NCUSH6W
	 ducD/AsLjlJqKboNh9rDvns7ChSxNig8z79oVg2oDz9CWMFj/mSCa1taF5th9AiONW
	 PmErLVNm/5/Ew==
From: Mark Brown <broonie@kernel.org>
To: Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240710072756.99765-1-animeshagarwal28@gmail.com>
References: <20240710072756.99765-1-animeshagarwal28@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: cirrus,cs42xx8: Convert to dtschema
Message-Id: <172079483344.520799.13382073069252399762.b4-ty@kernel.org>
Date: Fri, 12 Jul 2024 15:33:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: VEYM7NLW2ULBBM5BJLEB2FWJ7AABQAYI
X-Message-ID-Hash: VEYM7NLW2ULBBM5BJLEB2FWJ7AABQAYI
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VEYM7NLW2ULBBM5BJLEB2FWJ7AABQAYI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 10 Jul 2024 12:57:52 +0530, Animesh Agarwal wrote:
> Convert the Cirrus Logic CS42448/CS42888 audio CODEC bindings to DT
> schema format. Set power supply properties to required only for CS42888.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: cirrus,cs42xx8: Convert to dtschema
      commit: e3fff693da9fa0337d98dab496db3a04c5227aae

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

