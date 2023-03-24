Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A36FB6C7FC1
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 15:20:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78CA6E91;
	Fri, 24 Mar 2023 15:19:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78CA6E91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679667624;
	bh=n3yZhCNRYqhUI8ezw2bTrABJGBLPd/F+0COzNNhNOqM=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qWA55IV7TwZkZJQoNTEJH13bMqucEzqPMgKHr9vslNTsGS69PvrowCHQDvOPDQkER
	 TujmbC1K4RT7zo5jFDCNTGmGKLoruriAx4JYgrNzsh/s7+kfHCSyLR6dX9UA+quUCD
	 8DZ1aB/v+hxTC7hfsZWPFPTRyAVvDqnTRS9F7ZUk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E66BF8027B;
	Fri, 24 Mar 2023 15:19:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BFEAF80482; Fri, 24 Mar 2023 15:19:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94D81F8024E
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 15:19:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94D81F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=X+1DcwJY
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D519862B16;
	Fri, 24 Mar 2023 14:19:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1256C4339B;
	Fri, 24 Mar 2023 14:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679667562;
	bh=n3yZhCNRYqhUI8ezw2bTrABJGBLPd/F+0COzNNhNOqM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=X+1DcwJYdUdwQ2TV+It548kHu30IyJ3QpkjIqawnIy37jcYZZwCm1kXtZIwxCk43M
	 mQewPzHgzBv2Oke6ftXP9R9LK4ozqncMoEPTqkOCU8TyvHWnovOOLaJfOdCP0nYfDP
	 YlKM54fBY14jceumH6pbq0OOj9KeGLb0dttBTSaxzfip6Rs9D9H2LfzvF6CEqmB4s6
	 7xQSccxpolZO7Pye/KG3uvBoULbyfObml+wXMzdmIEHXUwCmAyxDHrVSg3KjfEbFBe
	 9D6fqS0E7SBpy4zwdbsymb2JVUQBz5GKjx2ryyoT8hfckJA9Caa6ZtU5uqExVHeU86
	 R3ffq0DMAZl/g==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ilerjcvr.wl-kuninori.morimoto.gx@renesas.com>
References: <87ilerjcvr.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] ASoC: simple-card.c: add missing of_node_put()
Message-Id: <167966756150.2601012.15699243105545842344.b4-ty@kernel.org>
Date: Fri, 24 Mar 2023 14:19:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: KCEZHBZJNYGAS2ZD7BWVBDTMNBEU27N7
X-Message-ID-Hash: KCEZHBZJNYGAS2ZD7BWVBDTMNBEU27N7
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KCEZHBZJNYGAS2ZD7BWVBDTMNBEU27N7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 23 Mar 2023 22:56:08 +0000, Kuninori Morimoto wrote:
> It is missing of_node_put() for platform.
> This patch fixup it.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: simple-card.c: add missing of_node_put()
      commit: 92405802a7d6aa1953915af869192296d1792d18

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

