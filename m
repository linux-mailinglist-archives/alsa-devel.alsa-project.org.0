Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F797847CA
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Aug 2023 18:35:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6631B84C;
	Tue, 22 Aug 2023 18:34:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6631B84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692722122;
	bh=87Mt00iuVTM5oBM4ntFY2pK6S9pr01eqEEsQVkUzh8E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QzxZIoBgymkdVbcjw2/r9ZNQ2/OZ2qXYBxhUnR1cLPGsOCaRe1TyEXM9pDCHsZ+J/
	 XIWJor95E85upLLphd+ekRsFjSE1+RJ//SgDJTzHtFzBGTwfgwWHHrwDHwcLOyGosD
	 n17pAWs9h8CIvkSzkfkHOHGqSYP00mZKAuOPEwU8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6E80F80567; Tue, 22 Aug 2023 18:33:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8A47F80553;
	Tue, 22 Aug 2023 18:33:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AC65F8022B; Tue, 22 Aug 2023 18:33:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59CF0F800BF
	for <alsa-devel@alsa-project.org>; Tue, 22 Aug 2023 18:33:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59CF0F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Nuh5uCsD
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1BDDC65CB0;
	Tue, 22 Aug 2023 16:33:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C34BC433C9;
	Tue, 22 Aug 2023 16:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692722003;
	bh=87Mt00iuVTM5oBM4ntFY2pK6S9pr01eqEEsQVkUzh8E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Nuh5uCsDO9R/DtXYTMX63zubV2lzP8jnU3eOXWGXARVvhis3XHzGU9x7HtJ4HTKQz
	 s8QDSv9q0d/jFxuY33aTr8+ya3Fes5dCMNaJxa7h/2oeTAR55HdjzkVUNurXWHuqxn
	 iQoGQNR+WOeszWXaJ4oQPStBGK22d3ZT//ugbZLS5/aaO35nqxJqCVPxYithan4bf3
	 rdChqRb414U0Hw5GU1pgmi1pTDUjdyEiTvY5DoFmKck7bIJ1owK4FKF+Ws38+GLFB5
	 F6omuXur0HQFYGVDP33l9Pe95XlTdcUurY65JIwp6CQRJJ14RuxJghyJp7H03H20sM
	 +dS9bv1VYmofg==
From: Mark Brown <broonie@kernel.org>
To: oder_chiou@realtek.com, Senhong Liu <liusenhong2022@email.szu.edu.cn>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230819133345.39961-1-liusenhong2022@email.szu.edu.cn>
References: <20230819133345.39961-1-liusenhong2022@email.szu.edu.cn>
Subject: Re: [PATCH] sound/soc/codecs/rt5640.c: fix typos
Message-Id: <169272200183.71502.12839834978316716379.b4-ty@kernel.org>
Date: Tue, 22 Aug 2023 17:33:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: SFF2XAK6ZPPXNSCOKCJ7BVLRKADW3OYP
X-Message-ID-Hash: SFF2XAK6ZPPXNSCOKCJ7BVLRKADW3OYP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SFF2XAK6ZPPXNSCOKCJ7BVLRKADW3OYP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 19 Aug 2023 06:33:45 -0700, Senhong Liu wrote:
> I noticed typos and i fixed them.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] sound/soc/codecs/rt5640.c: fix typos
      commit: 8e6657159131f90b746572f6a5bd622b3ccac82d

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

