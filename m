Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EF26FC2DF
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 11:34:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D11CC110D;
	Tue,  9 May 2023 11:34:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D11CC110D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683624894;
	bh=zAT0fgZQPXHZLdoOc0Id5s1trwVmxzumIctkxFw5v04=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AWKP/u+JmnrbhA55eUd+JHCu9acwj0Dc9NQq9bpoYWZGc+11hKh9dhmsYWTcPgbR8
	 8rDnSZqExN9X39QPGa1WsBsQnsG+wJfcS5Fku74Dblf9ZTkvDlcHPZz34HnHxLzQQN
	 rR3AzojzUZNdRvs+p5nTSrOjK3VC0kBmye/u1v3U=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8EC6F80542;
	Tue,  9 May 2023 11:33:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8264F8032D; Tue,  9 May 2023 11:33:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9BE8BF80087
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 11:33:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BE8BF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aiK285SU
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7D122632A7;
	Tue,  9 May 2023 09:33:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE2CC4339B;
	Tue,  9 May 2023 09:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683624779;
	bh=zAT0fgZQPXHZLdoOc0Id5s1trwVmxzumIctkxFw5v04=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aiK285SUHsjEJXsiIuM44hYZoinYd1VRD7OGzqM0hzV+PedzQXbmZphBZzE8dnorO
	 OgunbGL4hqDlBdvTo5UsP0/JFTfRnSttTDz0Te5M0cQ9vw7aZGrXhAY69A56Q3KJys
	 rl3U5zXCGgIgfZHDQvswW/06K7O5oBAcDdikK3rUqTOhfo7c83p9YjU6jgn4bkuWWs
	 AMrp4vK2x21jkg8/hUgDHveWsg8Qgf11Dqz7um4eJPjAHaaDGSTTJ3zeLpsjtElNvM
	 iEgvoSLHtxjeLgWY0lcVG32FWqcfqAWCI2hEhovw8gw+XeWkKiiDZ1qJVKRVpbJwde
	 W2yF7zKupU2/Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Jack Yu <jack.yu@realtek.com>
In-Reply-To: <20230421030116.26245-1-jack.yu@realtek.com>
References: <20230421030116.26245-1-jack.yu@realtek.com>
Subject: Re: [PATCH v3] ASoC: rt722-sdca: Add RT722 SDCA driver
Message-Id: <168362477729.305930.12941740250385198889.b4-ty@kernel.org>
Date: Tue, 09 May 2023 18:32:57 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: QJSSRFECG4OA64GIRMDWHHZEBIQIEPUQ
X-Message-ID-Hash: QJSSRFECG4OA64GIRMDWHHZEBIQIEPUQ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, shumingf@realtek.com, derek.fang@realtek.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QJSSRFECG4OA64GIRMDWHHZEBIQIEPUQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 21 Apr 2023 11:01:16 +0800, Jack Yu wrote:
> This is the initial codec driver for rt722-sdca.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt722-sdca: Add RT722 SDCA driver
      commit: 7f5d6036ca0059f749414380e19bfc346961353c

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

