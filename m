Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F65E3D01EA
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jul 2021 20:50:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2A87169E;
	Tue, 20 Jul 2021 20:50:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2A87169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626807056;
	bh=ZgNgco34g0cjFukJMoXeTAIC0r9NhF6dPTG608EQ+00=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MrDzF+hyRxPSg8jaS3Lp9fKcnnZAcsjyg9wqd9pp0+cqlHqzfWffsefFwKbGX8bcc
	 7DxI1KZnMcEEQsBP85cwVv16J6eUFmFYV2p0hR3bXw2Omfyw1lRVNScw+VsVueIFkf
	 YM2pBoo+Buyb+oYJNrTNU69gdzPCJtsdSIzUI27A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76EC7F80227;
	Tue, 20 Jul 2021 20:48:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA319F804FB; Tue, 20 Jul 2021 20:48:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2ABE1F804F1
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 20:48:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2ABE1F804F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qHS0oXdj"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0BEEE610CC;
 Tue, 20 Jul 2021 18:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626806908;
 bh=ZgNgco34g0cjFukJMoXeTAIC0r9NhF6dPTG608EQ+00=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qHS0oXdj9YTwOcw7hZup4YWAKxbdnJheL6wvKwJZarUgjDg4fF9GAFWo9s+1l+yJs
 An3b95aFALXTMYiJGQ86tLyNfsdNzQvDr1nTDoCXB7v9/WeVh8hl+pYOVk5qTk/JrX
 RHGYTaocGQUW9/RJaZVQWZgvtxDovAJg2jWF91RYWE/XcCjSDeqzjHJFf8c9lCJJSa
 aCqCQo99HDu2GREv4yc3pPVCbw13LUmBxWc/FO+4BmiCcKBdI6JkP4yHzqW7/DUVfN
 E/2bL2fRumUjzDy/szhGbCG+1tqtW26BPYiPwJNEuzmWSFyVUIQkQbkDLLTfWYYph5
 LdFk7ZjO3lhwA==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: (subset) [PATCH 0/2] ASoC/soundwire: add quirks for Intel 'Bishop
 County' NUC M15
Date: Tue, 20 Jul 2021 19:48:18 +0100
Message-Id: <162680637204.10901.1832612641882359435.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210719233248.557923-1-pierre-louis.bossart@linux.intel.com>
References: <20210719233248.557923-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, Bard liao <yung-chuan.liao@linux.intel.com>
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

On Mon, 19 Jul 2021 18:32:46 -0500, Pierre-Louis Bossart wrote:
> The 'Bishop County' NUC Laptops designed by Intel rely on SoundWire
> peripherals. Quirks are required on the soundwire/ side to work-around
> ACPI issues (bad _ADR) and sound/soc/ side for jack detection.
> 
> The two patches are independent and can be merged in the two subsystem
> independently if desired. Both patches are however required in any
> backport.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] ASOC: Intel: sof_sdw: add quirk for Intel 'Bishop County' NUC M15
      commit: 1bd80ff2cfb38582e258baf681211a21d448984f

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
