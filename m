Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FEF571E7E
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 17:12:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 199E191;
	Tue, 12 Jul 2022 17:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 199E191
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657638743;
	bh=zSFWr/8AMdztNTLu+DJURPNFrc33gkjjAiHEX3lpiSM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YEl9lxq0keCHBht5orXK679eKcTqRLF4PIHv0/pexLiK107Qr8cpRu6ts6+2EbrET
	 hv+mVcDQgbZFPdzy42/R8KY82KDbF0BPNbRW+PJVgmW6KyktvbWf/ZtnvNtHD7tvjT
	 akAsu0G/tWdR3y/k7Gl7fSZdIsK4scVtNQnO8pQY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59D23F800BD;
	Tue, 12 Jul 2022 17:10:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33B00F80506; Tue, 12 Jul 2022 17:10:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B65C7F8012B
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 17:10:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B65C7F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mDbZqMwV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ADF3F6156A;
 Tue, 12 Jul 2022 15:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73981C3411C;
 Tue, 12 Jul 2022 15:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657638647;
 bh=zSFWr/8AMdztNTLu+DJURPNFrc33gkjjAiHEX3lpiSM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mDbZqMwVSJWWWsNMUKWry4TfkVCwRSCRv48FobJdpienIbgAKjAjw1vWviBtmAwkh
 n/eO0/gJ03hAMWz6Z+6kdqpITV/VsiysUzDxzafbr4ifDYfavMIPyKY6LS+2JjC461
 eS/OEJ8BuevVh5fDWIf2/HrfdheaByPXlYnLmkHksMgKFKCIyc3EUQ0ZYEPyWpcFtY
 j/MKHyhmpcRhDyWFuh+u3H8Vwy0jG723tiJt08ZRaFMi/7Hch4pOfHNbhLQyV+F9lG
 JQaT4zN+wWWz8f75TgtbuxuJ/4+mbT4swWe5JaX0vW57d8fcpyM2+Nib3WrshwfFXl
 agDRPEIAxR1MQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220708200641.26923-1-pierre-louis.bossart@linux.intel.com>
References: <20220708200641.26923-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: soc-pcm: demote warnings on non-atomic BE connection
Message-Id: <165763864619.336976.6886641314043623582.b4-ty@kernel.org>
Date: Tue, 12 Jul 2022 16:10:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, peter.ujfalusi@linux.intel.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

On Fri, 8 Jul 2022 15:06:41 -0500, Pierre-Louis Bossart wrote:
> When an FE, typically non-atomic, is connected to an atomic BE, we
> force the BE as non-atomic. There's no reason to throw a warning, this
> is a perfectly fine configuration and a conversion that's required
> by-design.
> 
> This removes the unconditional warnings such as
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm: demote warnings on non-atomic BE connection
      commit: 4ccf0949cd364811217a0e61754ff7e52cb4f0e4

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
