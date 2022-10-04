Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2EC5F47BE
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Oct 2022 18:38:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF0C01701;
	Tue,  4 Oct 2022 18:37:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF0C01701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664901499;
	bh=dgeSJBPiovnsZkOfe+VBSbXCEVLeqbAkvbk6rFkb1VQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vtM+JDR0F6wAbbizBbthdTimgIbKeR0b2HHT/p33IoLTRzehPYlDAXvmNGM/W3Z3H
	 eHEM7nvtiK07HpYXGOM8bx5U8351Jf+uD2w36pq0jZl6yDyL2kP+rRTUnLfugwVJEV
	 0n1HnyEoy5UsMUDunFJO5BlsZmEA2voFVVriWrtI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47D5EF801F5;
	Tue,  4 Oct 2022 18:37:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25AFEF801EC; Tue,  4 Oct 2022 18:37:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B001F8012A
 for <alsa-devel@alsa-project.org>; Tue,  4 Oct 2022 18:37:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B001F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jPrTwaV/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DA1DA612F4;
 Tue,  4 Oct 2022 16:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D84C433C1;
 Tue,  4 Oct 2022 16:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664901430;
 bh=dgeSJBPiovnsZkOfe+VBSbXCEVLeqbAkvbk6rFkb1VQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jPrTwaV/jyHEYPz6ihoarcc+8z9jNrOYWWNlHW8uaJncGdPeMNxTgtRYm++wo3AX/
 0LxYs05EjJ1UzYkXpSJ1QqtsrB9NUqCD6eD7/9kk4PGbiIvL72V/A+7weUPRtou/UK
 TpIaNCq4qcOBNzJz1r1SpsJ7eenXOwQP6XO8QLtEC2jy4qyIfDXiM2V1mKFDE3+57S
 46SAxksxjpPPZdZtct4BPA5vPgvORu6NQGRh4zc7L5kZnz3uwtuVZnexhIdmxXBSeJ
 nH+lqSz90B1JebgYi30HhQY/u/KgU+bmRwDW+i/Z+NsTxEwHOk6s+NfNFtUwOwyVew
 /rd3tbpLRo5yw==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com,
 zhangqilong3@huawei.com
In-Reply-To: <20221004115121.26180-1-peter.ujfalusi@linux.intel.com>
References: <20221004115121.26180-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] Revert "ASoC: soc-component: using
 pm_runtime_resume_and_get instead of pm_runtime_get_sync"
Message-Id: <166490142892.242658.3884003304267132569.b4-ty@kernel.org>
Date: Tue, 04 Oct 2022 17:37:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com
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

On Tue, 4 Oct 2022 14:51:21 +0300, Peter Ujfalusi wrote:
> From: Peter Ujfalusi <peter.ujfalusi@gmail.com>
> 
> This reverts commit 08fc2a7448afc1660ec2f1b5c437fcd14155a7ee.
> 
> The reverted commit causes the following warnigs:
> Runtime PM usage count underflow!
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] Revert "ASoC: soc-component: using pm_runtime_resume_and_get instead of pm_runtime_get_sync"
      commit: 0c72dbc96be870e4de8f9707c9a4c6d7a641381c

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
