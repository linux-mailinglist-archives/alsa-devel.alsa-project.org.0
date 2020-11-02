Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A09502A3155
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Nov 2020 18:20:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 240A41734;
	Mon,  2 Nov 2020 18:19:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 240A41734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604337609;
	bh=S9Ost0F6oyf1K0gMlJiyk7u6GV3N54pcPi2zPO/M92g=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dkrXIT1/V/ESkmNAPEKdOQYU2otAcdr2+nIyNMYtPSeiApPHl6Jt9Q8/gIvo9P2Ds
	 EORjSxbadGuQmCMDfv4ZnbtXyMvOcEaOPuqS9vfvRFb3NZRiD2xEaqLAyUFAh0ll0I
	 S38yLHQxfZVr2BZ3XqU4w2c60c1Z+os8WfySjo2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3B4AF8015A;
	Mon,  2 Nov 2020 18:18:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AA5EF80232; Mon,  2 Nov 2020 18:18:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6324BF8012B
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 18:18:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6324BF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bbk0Ud3n"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C5D9D20691;
 Mon,  2 Nov 2020 17:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604337490;
 bh=S9Ost0F6oyf1K0gMlJiyk7u6GV3N54pcPi2zPO/M92g=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=bbk0Ud3nLBDD0WRjUgP7/LxTe+2TK5ZSB6X7bmQd2j/P5DuZGtVjoWxepWmu4zmP4
 iCAbw0E+Invt8BvG/oomtyhPmvuw9Rrf+hME5DAsyYC9IM+V9bQSGxzCHejyWV7XZ+
 3aD9J29fiMGJbCjM/I0svy1sfXU9sLhy+NIqOT1I=
Date: Mon, 02 Nov 2020 17:18:01 +0000
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, andriy.shevchenko@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, amit.kucheria@linaro.org,
 rafael.j.wysocki@intel.com, cezary.rojewski@intel.com,
 liam.r.girdwood@linux.intel.com, "trix@redhat.com" <trix@redhat.com>,
 perex@perex.cz, yuehaibing@huawei.com, yang.jie@linux.intel.com
In-Reply-To: <20201101171943.2305030-1-trix@redhat.com>
References: <20201101171943.2305030-1-trix@redhat.com>
Subject: Re: [PATCH] ASoC: Intel: remove unneeded semicolon
Message-Id: <160433748157.18840.14013334012819577591.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Sun, 1 Nov 2020 09:19:43 -0800, trix@redhat.com wrote:
> A semicolon is not needed after a switch statement.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: remove unneeded semicolon
      commit: c1af06a28a0176ceb1fc71408b32aabf53db4470

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
