Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F88546A0A
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 18:01:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FF521A40;
	Fri, 10 Jun 2022 18:00:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FF521A40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654876883;
	bh=pukN4eqMLDwAfADmCFrP37xeUN5VQo3/IDlxoegqoS4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZiumBe5gelffMH2QI+2lnBzWwN4OhcneBKBScrBcYJdBCZVAXFrl+vpjo6HqjUn4y
	 or6loTyPMv0aHzLxlyHe/EXArv3+AD+wISIckNOU0G1ikv0A7+CbFmh0QKwisaTwZH
	 KKYEKf0QEPwfFs9DJHH6QktZoo8wz1KLt6M0qKzI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BCBCF80538;
	Fri, 10 Jun 2022 17:59:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FC95F800E5; Fri, 10 Jun 2022 17:59:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B002F800DF
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 17:58:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B002F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fWJn0Otz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E21CFB83625;
 Fri, 10 Jun 2022 15:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C31C3411B;
 Fri, 10 Jun 2022 15:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654876731;
 bh=pukN4eqMLDwAfADmCFrP37xeUN5VQo3/IDlxoegqoS4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fWJn0OtzebIFM7/P7n1RM4dTqpyVVGYeGa4DzyvrCkYLaR18dVgExyfTy7Kb0gqTh
 cjjI6b8iuUr73n8KH8su64SNubqJUvFE2QhF7yKse8Y0daL8GjPwx29RGXweQZeIw9
 1upoWOtofQHmN8khipe5wS/6weMsfXq1CzEzNKbzk44velHJcNeFx6ty4GpqFdpUP/
 1300TIHC/zZOyHdzbg2t1Cq6GdvrFqNfXc+rYRnCIvR9sNcBty5DHMYxj5h+6fpw8d
 rshZg3sB234Du6DQjpUpWgol7FvQfEqhk6VpuTCKIGs6BRB+NeqDXk70EPTlLnGKRB
 ZlVNvhCFlqQDA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 peter.ujfalusi@linux.intel.com
In-Reply-To: <20220610080421.31453-1-peter.ujfalusi@linux.intel.com>
References: <20220610080421.31453-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: debug: Clarify the IPC timeout handling path
Message-Id: <165487672987.1755957.712485917798463422.b4-ty@kernel.org>
Date: Fri, 10 Jun 2022 16:58:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, daniel.baluta@nxp.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yc.hung@mediatek.com
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

On Fri, 10 Jun 2022 11:04:21 +0300, Peter Ujfalusi wrote:
> The dmesg log message of "Firmware exception" causes lots of confusion as
> the snd_sof_handle_fw_exception() is only called in case of an IPC tx
> timeout, where such a message does not make much sense.
> 
> To not limit the snd_sof_handle_fw_exception() handler to just one error
> case, add a parameter to allow the caller to specify a meaningful message
> to be printed.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: debug: Clarify the IPC timeout handling path
      commit: 145cb4e7a9ee12326f99948d8980ad258462b6c4

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
