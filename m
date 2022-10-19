Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7531F604903
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 16:19:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1FA394BA;
	Wed, 19 Oct 2022 16:18:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1FA394BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666189160;
	bh=tXQLFHlSeAsiNDD79FNLFbLupTj/kQwkiS+c6CLDdxc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YsMxbf/+F+9LDBatzi2p/hzH1Ciqllm84HQgTnfY7D7AP1U05ON1uBzZCT+HUwvV+
	 MC7ATMwIk6J9jWe4n4ttS+si3ct5K/Op0BZegTaCw2gFULVfKObnp9Ea10jOJczxT/
	 s6Nqbnoew8b6arcQgLKtRjR8FgqP61jY0vn15yos=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BB67F80087;
	Wed, 19 Oct 2022 16:18:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43980F80137; Wed, 19 Oct 2022 16:18:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06B08F80137
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 16:18:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06B08F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="X8D6Yji0"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6542AB81EDB;
 Wed, 19 Oct 2022 14:18:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD0EC433B5;
 Wed, 19 Oct 2022 14:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666189098;
 bh=tXQLFHlSeAsiNDD79FNLFbLupTj/kQwkiS+c6CLDdxc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=X8D6Yji0xKi0uN2/fiY2gyJXgxUWjRP9zukq1aZv6mquyJHy76r4IRk+RkzA1Zi6h
 aLQaKoxtoXZ0wOEX1NmvYEj3j50lE7F86UApVzcRFg4XH8fOdYX3Hs9Sgk66WY8yeO
 WTIpry2dZmkstskBCF1TpawbWkiDbsbPCUOnnFtC0g90L95cRZ20FKANGdwPw8SAa3
 10VYhed1qK/Zaou6iVLhDQAu2dcnhvpJ8Jn0aN9c2n+tvtfV1ldnaOTN9CcDDCe6dR
 HdTG6wSzmoAHPwqtM09020H8wqkilizlZJYtwHDH/eHLWrn0JsAmVd2OtibkuHYLNo
 s8z4d7O8XiQlA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20221018124008.6846-1-peter.ujfalusi@linux.intel.com>
References: <20221018124008.6846-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: SOF: Intel: Harden the IPC4 low level sequencing
Message-Id: <166618909642.493922.1501988258287823466.b4-ty@kernel.org>
Date: Wed, 19 Oct 2022 15:18:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
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

On Tue, 18 Oct 2022 15:40:04 +0300, Peter Ujfalusi wrote:
> The IPC4 use of doorbell registers leaves some corner cases not well defined
> and the 'correct sequences' are subjective in a sense.
> The DSP doorbell registers are used as separate and independent channels and
> the sequences for host -> DSP -> host (reply) can be racy.
> 
> For example:
> The ACKing of a received message can happen before the firmware sends the reply
> or it can as well happen after the reply has been sent and received by the host.
> Both can be considered 'correct sequences' but they need different handling.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: ipc4: Log the tx message before sending it
      commit: 2d91d5715f5f3b24456ede20dbbe967a1d2a0a3e
[2/4] ASoC: SOF: Intel: ipc4: Read the interrupt reason registers at the same time
      commit: c8ed7ce242db83ca2c4e9eab557a88adbae5ef6a
[3/4] ASoC: SOF: Intel: ipc4: Wait for channel to be free before sending a message
      commit: 483e4cdfb502e6bea6b0a226a3ff7c22e60153de
[4/4] ASoC: SOF: Intel: ipc4: Ack a received reply or notification separately
      commit: 010c050fe9ea263e3fc17493822117610a23f662

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
