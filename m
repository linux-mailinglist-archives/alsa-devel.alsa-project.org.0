Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFEF70C1E2
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 17:03:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2B6E84D;
	Mon, 22 May 2023 17:03:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2B6E84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684767833;
	bh=+EGBPqr4BsG1hnIwIe63izJEjMIoZqI3WyiFSk2ZJbs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n+8iwlCzvmJWRVFom3ia0J2NMkhj+8weaoqfhZI7lUf6jqQVS1olsQ0wqllLhk480
	 AH5YBFSV7r+fx2qAo4ES0DAKx/63sx6/ImUaUBa+4BCvFbTNIjUhIwPeKG9NbzUTMr
	 bXxqhlTMGS1nlKT4AJInXTqgNJJpJS26+RPiCG00=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70A73F805A0; Mon, 22 May 2023 17:01:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2474F80578;
	Mon, 22 May 2023 17:01:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A7C3F8026A; Mon, 22 May 2023 17:01:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F745F80053
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 17:01:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F745F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mfYbBo/y
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 09DA6623CB;
	Mon, 22 May 2023 15:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 553E5C4339B;
	Mon, 22 May 2023 15:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684767705;
	bh=+EGBPqr4BsG1hnIwIe63izJEjMIoZqI3WyiFSk2ZJbs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mfYbBo/yvc640WeK3Et4s1R6hhXPy0f0UeX2NdqDjSlfAE0HEyeg7lJ/12+x3Ipik
	 MsfzrQUgOTZ6zNauHztm4kN9Q0sdVK9QG8J91ZLLYYWq2oEWkhiXVZzphztEPPwPVO
	 rnenOFRDIoXavCfOAWMktBasaKp6I8m937pKWMvkV53EF2YXyl0BoEFla4TaY932nP
	 Ta6W5eOpVmi+nlA3CDROtfuCBLJttmv8IQ6mh8o3s6Wj91sbsBcqzW5ZBk7nectXDR
	 aObmuISYEh1mYwtR7OHePX6VlLrdiC235X6p8cyfbQxHpPnU4ZyV7/l79m+pQyuyYW
	 1ft1dno418n0A==
From: Mark Brown <broonie@kernel.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com
In-Reply-To: 
 <3debf3bb7ea504ee9ca2d8eb0f948a426681cbdd.1684594240.git.christophe.jaillet@wanadoo.fr>
References: 
 <3debf3bb7ea504ee9ca2d8eb0f948a426681cbdd.1684594240.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: cs42l51: Use the devm_clk_get_optional() helper
Message-Id: <168476770307.849172.5630485332717931835.b4-ty@kernel.org>
Date: Mon, 22 May 2023 16:01:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: YSS2DW3FQJRWIJNVAQIN67VZK4ZW3FCP
X-Message-ID-Hash: YSS2DW3FQJRWIJNVAQIN67VZK4ZW3FCP
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YSS2DW3FQJRWIJNVAQIN67VZK4ZW3FCP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 20 May 2023 16:50:54 +0200, Christophe JAILLET wrote:
> Use devm_clk_get_optional() instead of hand writing it.
> This saves some LoC and improves the semantic.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l51: Use the devm_clk_get_optional() helper
      commit: c0998e0142af8037e4a0ee84dd01cd20cbe0c76e

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

