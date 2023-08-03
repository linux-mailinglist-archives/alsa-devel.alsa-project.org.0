Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF04776EF02
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 18:08:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 943F53E7;
	Thu,  3 Aug 2023 18:07:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 943F53E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691078896;
	bh=WFkWYTKMLYwXJPpiFwn6+nzj0asvIDnafBfv+uPqLzE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fU/sOq6arBHAtLsw70ClQUU0FUqmDZLqnp6ObWuDn5qdR0OZE4VIL2p+H9kGIT/Ta
	 zLMdPt++js0K1Y2leEhnHDGUGnmqtlHbL/pHQO4ggO06TYZPZywd2Yp/TX9pvwYw30
	 y882V4UB/VUbXwxQPpS0Sjt7Vd+VII7DESZ/5XOA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E88C7F80149; Thu,  3 Aug 2023 18:07:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 581B9F801D5;
	Thu,  3 Aug 2023 18:07:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDAB7F8025A; Thu,  3 Aug 2023 18:07:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0383DF80087
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 18:07:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0383DF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TbvhIzx8
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3CCE861DF3;
	Thu,  3 Aug 2023 16:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD9DC433C9;
	Thu,  3 Aug 2023 16:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691078820;
	bh=WFkWYTKMLYwXJPpiFwn6+nzj0asvIDnafBfv+uPqLzE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TbvhIzx8+/0bmePAnHF0GvFZvkFX+FRP23Raa41AAn/yCkE4TKXLDO6eH/276hAw4
	 q78+4Ed3RMhrsQnhqKYfKWlB6Kv3hzw5zl3VjZecchWrcdz23VSvV+VA+5WiLaY4iE
	 6YquXb7FRZMrg6r6uFVu52EanFnWxlFp1QUM97P1s6dSs4DDs+MGbDm+hbX7Va1wLo
	 IvSdDMVY27kkfqkUstUeyIFYHzRJJj/olO3VbbueAtgCp1IXIOSkKy9y4q/ayzLyix
	 9ndgi6B3ryHAopGe3aiBuJXS0ydfgjBxkJ/Vu3bkcs6nmb/iRyHZ62Wz9a4+xkNUol
	 Rz2sbDgka5+xg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>
In-Reply-To: <20230803083908.9DxbPvOK@linutronix.de>
References: <20230803083908.9DxbPvOK@linutronix.de>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Remove unused mutex.
Message-Id: <169107881835.86804.11585848310133291937.b4-ty@kernel.org>
Date: Thu, 03 Aug 2023 17:06:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: M7KEJSECYEFPKJXASL2TX2MZLBUDXVRC
X-Message-ID-Hash: M7KEJSECYEFPKJXASL2TX2MZLBUDXVRC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M7KEJSECYEFPKJXASL2TX2MZLBUDXVRC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 03 Aug 2023 10:39:08 +0200, Sebastian Andrzej Siewior wrote:
> The mutex mutex_request_dram has no user.
> 
> Remove mutex_request_dram.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: Remove unused mutex.
      commit: 248c74bf42c16262f95f26523683334686a26263

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

