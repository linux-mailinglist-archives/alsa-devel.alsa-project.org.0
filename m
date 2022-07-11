Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E585706D8
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jul 2022 17:20:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E00F984C;
	Mon, 11 Jul 2022 17:19:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E00F984C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657552835;
	bh=HcS94rMQbeE1GD4X4gyWO6+7fJXnws6fJO1WKZonS+s=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IzgG0m44fBuBf7DtfbceZqOIpe49GIN4NLVu4fTrY+VeNaPzhALY5wlJ1AbY95Bl7
	 bV2jmMElAKOR3Idilw/tIOrMQJnMLpRcA+Rti4s4fLBrTySOUWtPiHuc1gOjNA6nQC
	 ndI1FFK8aIk+MeuagTxqvxnFs17GkbKQpxoIp24Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A24AF8053D;
	Mon, 11 Jul 2022 17:19:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17D1CF80155; Mon, 11 Jul 2022 17:19:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AFAFF80155
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 17:18:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AFAFF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="q4+1vbE/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D8766615C7;
 Mon, 11 Jul 2022 15:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC8DC341CA;
 Mon, 11 Jul 2022 15:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657552733;
 bh=HcS94rMQbeE1GD4X4gyWO6+7fJXnws6fJO1WKZonS+s=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=q4+1vbE/J60lM+5JK/iym7JrbAI7T+k0p15uvW1UK7umjznkrUdYs5/Iki2xsegW1
 F+PWhJYDgqPyRZGnkVaTYkuRyJ83dMSmjcsD9kP1GxYs0bzj1F2EGNpC42RiZWU8Pc
 LSQNAkFSnaFMCc+rEjlTUVkoH7mPuY4tXidoInPyeo6NZ5xB62tEDazAvENdFG6k5F
 0z8SFY09Hn8nPJkAttW0BsY6lARv+T4+VHdiVzmuDot57wctgjUesGf/KDkLXbPVqM
 WSZAPSXr9J8PCLNglFfUogslAgZBP3QCZkVyqrqI5pHY8/e86G3vV4vDvjkUX0JC8c
 RnldhVZNCbTLA==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220708200516.26853-1-pierre-louis.bossart@linux.intel.com>
References: <20220708200516.26853-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: ipc4-topology: fix error and memory
 handling
Message-Id: <165755273236.520536.16836434773038280480.b4-ty@kernel.org>
Date: Mon, 11 Jul 2022 16:18:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de
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

On Fri, 8 Jul 2022 15:05:14 -0500, Pierre-Louis Bossart wrote:
> Two patches to improve error and memory handling. When IPC4 is used,
> some of the flows were incorrect.
> 
> Libin Yang (2):
>   ASoC: SOF: ipc4-topology: check dai->private in ipc_free()
>   ASoC: SOF: ipc4-topology: free memories allocated in
>     sof_ipc4_get_audio_fmt
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: ipc4-topology: check dai->private in ipc_free()
      commit: b737fd8cf196bc96e471304007c3cd9b78672069
[2/2] ASoC: SOF: ipc4-topology: free memories allocated in sof_ipc4_get_audio_fmt
      commit: dc4fc0ae94cf87f1017f158b6fa2b7536ef29b4e

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
