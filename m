Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1146C5AD6B3
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Sep 2022 17:40:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EE1F1666;
	Mon,  5 Sep 2022 17:39:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EE1F1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662392439;
	bh=4u4jqbKnjxr0740mYmvnkQwNn7DrSy8Qxd94JXxLGcQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N7NGaxSaOxCaZDvO6ayQKpT6hJw8xgjPi8XT3HE7tafudLTNTKToqVmBfzmgs2ysQ
	 zdom+cA5FWeaah/gsWIawPWEpxZv47ZxIW3bX3vdbiDoCWqMPbcbQizs06s81Aj4kV
	 pCe5cq0fFXRAoVqc3wnNsRMMjnONxqLqRwab0tMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E200F80482;
	Mon,  5 Sep 2022 17:39:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4E36F8053B; Mon,  5 Sep 2022 17:39:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E11E4F80424
 for <alsa-devel@alsa-project.org>; Mon,  5 Sep 2022 17:38:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E11E4F80424
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OEgjefpB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B311B61329;
 Mon,  5 Sep 2022 15:38:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1622FC433D7;
 Mon,  5 Sep 2022 15:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662392331;
 bh=4u4jqbKnjxr0740mYmvnkQwNn7DrSy8Qxd94JXxLGcQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=OEgjefpByYac9OU8DroWmjFX+lWlkrXwKE8GdJel8JEq+Su4YUw7IzQVabm9lKlI8
 cxqLJhRxGZ6XpNMezUOBl2UgHwgOAxu5yg+px/ZXH6xqeq1uj86/84OBWY77fEm8T/
 VVy/rcG41Tft2jBwtjbFF1YzvyBbff50UABY5bUCzxMUb80Q7XBdC4u9XfHywfk1Av
 hcVTdMWqLMzeWx6qCyRKDTtg+c+NAsl4RW1mLsLUkeSzAyYpz3hWDkxRCnPpEDIaJT
 2Ot2+PfD4r/SYO9XXr3XSDbAugs0YDpnB1MF0ez46dbpG6zVM00/a6h4+aACEshauh
 8E/kc9yz+jX2g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Martin Povišer <povik+lin@cutebit.org>
In-Reply-To: <20220905074030.1293-1-povik+lin@cutebit.org>
References: <20220905074030.1293-1-povik+lin@cutebit.org>
Subject: Re: [PATCH] ASoC: apple: mca: Postpone requesting of DMA channels
Message-Id: <166239232981.736206.16201162567715763451.b4-ty@kernel.org>
Date: Mon, 05 Sep 2022 16:38:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, asahi@lists.linux.dev,
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

On Mon, 5 Sep 2022 09:40:30 +0200, Martin Povišer wrote:
> Move the requesting of DMA channels further down from 'probe' to
> 'pcm_new'. This is to spare the allocated DMA channel resources as we
> typically only ever use one or two of the clusters for PCM streaming.
> Before we would request DMA channels for all clusters.
> 
> (This is prompted by a change in the Audio DMA Controller driver, which
> will now be allocating cache SRAM to channels.)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: apple: mca: Postpone requesting of DMA channels
      commit: 4ec8179c212fb1530df4a1df6db75756c06da5f6

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
