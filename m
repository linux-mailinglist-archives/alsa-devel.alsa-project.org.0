Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE5F54B2B7
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 16:04:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFCE11888;
	Tue, 14 Jun 2022 16:03:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFCE11888
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655215450;
	bh=FHCnyziaX5klZ1SMAXDE05CVQOC1U5SWC9Cy9gsAORk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oi4jongm4/R56/KJcHnQkhehrKX0WSGeCOP5jhFnevBNCSDkTgs5iER1VNQUBy/LS
	 GuU96nAZ5gnJkO+3Z7QyhU8+LEPHmJdp9mkntuklYihmsPnVPl/s/uzF2yFoNRP3P9
	 r3VIfLCofc5CGavb/WVn/MGvCexHaUHa9l4pn0s4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DEC1F800E1;
	Tue, 14 Jun 2022 16:03:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF139F80139; Tue, 14 Jun 2022 16:03:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95FB1F800E1
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 16:02:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95FB1F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="g3ul85OX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 50663B818CC;
 Tue, 14 Jun 2022 14:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEAC6C3411B;
 Tue, 14 Jun 2022 14:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655215375;
 bh=FHCnyziaX5klZ1SMAXDE05CVQOC1U5SWC9Cy9gsAORk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=g3ul85OX7/4DvR/l7wo5UeOT3dpvP1UvPvnPX+Mf9CJhWnyzwY3M/CkPxHQ/Pw9LS
 Z9J7uqoMVV8M4f0IAqM2myqxaHyCD4fySETI1HNlEiVMt3IMmkIYnbwQrkcQkFQ7at
 Kkv5awp7Fl6MNNEz/93ZjSoQ9M/yUuUnh6irSbySv5zTyq2Xruk9oxGlrouggBZhFF
 h1nJQo9T7MLwuCBnj5QGi5EFaJX3sbErvO5M4w8UX3cKLbcdPQIXEd2YRIfpOA3aIR
 bBV+ykTsTQTLlK2ZFrtvOsPIXQlcgOfhJRpzUZFJv6XYQjChMCjhPaGNPKMpecUbFJ
 vy4rgzmpafO0A==
From: Mark Brown <broonie@kernel.org>
To: yung-chuan.liao@linux.intel.com, tiwai@suse.de
In-Reply-To: <20220614092630.20144-1-yung-chuan.liao@linux.intel.com>
References: <20220614092630.20144-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: add SoundWire/ALH aggregation
 support
Message-Id: <165521537369.2978151.18235627112020761692.b4-ty@kernel.org>
Date: Tue, 14 Jun 2022 15:02:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com
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

On Tue, 14 Jun 2022 17:26:30 +0800, Bard Liao wrote:
> Some SoundWire hardware topologies rely on different amplifiers or
> capture devices connected on different links. These devices need to be
> 'aggregated', remain synchronized and be handled as a single logical
> device.
> 
> In the IPC3 solution, the aggregation for amplifiers was handled by a
> firmware 'demux' component. In the IPC4 solution, the demux component is
> not needed, the gateway component can handle multiple ALH/DMA transfers
> at the same time. This change makes the topology slightly more complicated
> in that only one ALH DAI will be connected in the topology with the
> gateway. The other DAIs that are part of the 'aggregated' dailink are not
> shown in the DAPM graph as connected to the gateway, but they will however
> be activated thanks to a feature in soc-dapm.c where events are forwarded
> to all DAIs in the dailink (see soc_dapm_stream_event).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-topology: add SoundWire/ALH aggregation support
      commit: a150345aa758492e05d2934f318ce7c2566b1cfe

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
