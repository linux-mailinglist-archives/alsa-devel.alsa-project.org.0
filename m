Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5043B40F9F3
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Sep 2021 16:07:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D784C17C9;
	Fri, 17 Sep 2021 16:06:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D784C17C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631887644;
	bh=bQqiugnvn36bhgNyzY9DndQI1XZDPEvtmfjE+gBo+no=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NWxiiVythDrX3vqarLC0vi+/zr2abwb/qgWJ6gnOG9aAdfQe0ZDe1lbhkxDxD1W11
	 +NHyLmlc2cBPlGKHzHJZ9KfFRs6moQ5j8sPYPDp1G+9Zqjt9JIp2e/H1nqHsNnYorS
	 v/oLaMDUf7TffOSZC8/OLf5D3vvGwyoVrPM6hezw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F749F804F1;
	Fri, 17 Sep 2021 16:05:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0478BF804AB; Fri, 17 Sep 2021 16:04:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F315F80152
 for <alsa-devel@alsa-project.org>; Fri, 17 Sep 2021 16:04:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F315F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hAR5JyL1"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 24DA160E08;
 Fri, 17 Sep 2021 14:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631887483;
 bh=bQqiugnvn36bhgNyzY9DndQI1XZDPEvtmfjE+gBo+no=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hAR5JyL1dC+Jc8PECyZqpXnExbAFCwNkrY4MhL2PjWu51TUJCJ3DAYtcMCyVT36I+
 J0OsjFmU0DigFl7zPak/4Ir1d9r5aJRuDSOjGMCMcAMwxBkbNnZpvXsv0FMBP8zyz1
 dzwr8WJwOMA3jf4y5ktXmGVnx/793Emw1ifxVddL9NPpkQsof/XqY/JPiwQOBoYudr
 DVOi/arBHGbrziCb9lqT2mw/Z7t5kVdMINLD/ByUwF3S/Nt6Fj9/YnkHcWHpArh97l
 +QQ9L2Z43dBUUueEa+frcjQCuejMTof29m2nb1ctLJeg4ZzS0pma9Cbq3htkqWFJvp
 s95Nf1ePqxZnw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc: Remove redundant error check from
 sof_ipc_tx_message_unlocked
Date: Fri, 17 Sep 2021 15:03:46 +0100
Message-Id: <163188719814.50326.122105528091641243.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210916125725.25934-1-peter.ujfalusi@linux.intel.com>
References: <20210916125725.25934-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 daniel.baluta@nxp.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

On Thu, 16 Sep 2021 15:57:25 +0300, Peter Ujfalusi wrote:
> If the snd_sof_dsp_send_msg() failed then we have already returned from
> sof_ipc_tx_message_unlocked() with the error message.
> 
> There is no need to check if ret is really 0 after this and we can return
> directly the return value from tx_wait_done()
> 
> At the same time make the remaining checks for error (ret) to match.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc: Remove redundant error check from sof_ipc_tx_message_unlocked
      commit: f6b0c731a01fc581fcc4fb227e2d3ad9e0cb31d6

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
