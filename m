Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA5340DDD7
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 17:20:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C733218A4;
	Thu, 16 Sep 2021 17:19:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C733218A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631805601;
	bh=h94j78FfQrKAiWUi8TyfanTMjWao/oP0AM/7HIqmosw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HcZYgmoOBQHvM4PhO5RRz3XUoKZF7H+gMMicl+yzJyUapDr/82L8KTftKNBPAEiG+
	 Q+Dfy5Q2YZWjU3bgkf0Gc2W+UNqBnGu91aEqGCloxVUi0gJu4LVChar7ksLrj2YWuz
	 X7bH3PIk3lUeuwnSk6VnjZ6XTR2IyHUz6CqWpbM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DD1EF80524;
	Thu, 16 Sep 2021 17:15:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A079BF80520; Thu, 16 Sep 2021 17:15:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17A31F80518
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 17:15:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17A31F80518
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aO0zqVd7"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 87E3260296;
 Thu, 16 Sep 2021 15:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631805344;
 bh=h94j78FfQrKAiWUi8TyfanTMjWao/oP0AM/7HIqmosw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aO0zqVd77Z2ASfduBri+Na2rD6TXhSAfeEwvCL/rBBC6XrilYo/gsyu8Sl+N38sCT
 ntwsW5ESer//gQ6AYBnoOsPh6CpPakfb9U3hZUnkDXTNOtc7BBV1oVRH1rnZmkQ1Ke
 mFY3+OzKyQP1p8i/kqPWkk+YnCbkuxwlHxUadYuFIGNkdPz6D/Pj9EKr2mpaYjU+hp
 lSQI0WO7wca09Txn/jiugTPDedCdvd51hKy6QJN6JrCZyo60YijjLIDTTC6ML9W9eg
 pMnHR8D3kXr2reQOe1e3qJGXZCtIzEBpOHOMnYG4Y1OQ3DTANpulXmhfilq/ug9cXu
 +vHfFdDX0BxuA==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: core: Move probe work related code under a
 single if () branch
Date: Thu, 16 Sep 2021 16:14:38 +0100
Message-Id: <163180495858.19842.9660160489318100704.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210916124902.24248-1-peter.ujfalusi@linux.intel.com>
References: <20210916124902.24248-1-peter.ujfalusi@linux.intel.com>
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

On Thu, 16 Sep 2021 15:49:02 +0300, Peter Ujfalusi wrote:
> Relocate the INIT_WORK() at the same place where we schedule the work to
> make the code simpler and easier to follow.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: core: Move probe work related code under a single if () branch
      commit: 3b4a673fa409b687add77f5bbf0a568b5b4ecee9

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
