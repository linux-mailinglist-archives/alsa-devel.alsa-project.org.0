Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DACD43FEEC
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Oct 2021 17:01:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBB001708;
	Fri, 29 Oct 2021 17:00:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBB001708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635519706;
	bh=n2h/nC12rdSPVR553OWXXumfpmssxFYCHqecE983xNQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WvNLMEvE8to42v2qkjo2ZpJSuTqoHvTkPtyo9ZU88YGjFFsr6bZI1+kfOWbJjC1r5
	 8lVZ6CqTrXG/MPRQJ/8B6esirBay0xGSYtwuC5DEv/bxcY2x1ndSIvhrFI6t0c0zL/
	 /kxjkK+0R0ToH/GibKnHlk+j3HTX57xt3ER5uw6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A42AF804F3;
	Fri, 29 Oct 2021 16:59:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E13CF804ED; Fri, 29 Oct 2021 16:59:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52AACF801EC
 for <alsa-devel@alsa-project.org>; Fri, 29 Oct 2021 16:59:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52AACF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EqJ8A6sN"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2AD68610C7;
 Fri, 29 Oct 2021 14:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635519545;
 bh=n2h/nC12rdSPVR553OWXXumfpmssxFYCHqecE983xNQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=EqJ8A6sNHdn/q1uh8TK/6DnZ/NEDRUXGj479dbUfkCvW0y0s5eH8R4CrPgpx3cTnn
 9rkpTwzWoDMd0WLN17k0mFmWdvRMV8MjeePw9HrqI4ux/u5fo/alCSCFr/lZLO+gUN
 LQPRHuSF40lUFP3jxVY+0POlT2Vsc+T4zPljaXP05oPCPkv5A8gzMwTCUAEcbBYorT
 LGJIBjDra7z5JIlJTT84djy0i4p4Xulf27MvcFBrlUdaSDjk+HOYD00gQXY4+ot6pK
 XxaIIAxz58oeihgCSwzUDVGM8TsRTfWdpH0/5S+kAiHe07Gtkyew/vD6lt9loihzME
 5QBhx6TJVkhkA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20211029011109.23633-1-yung-chuan.liao@linux.intel.com>
References: <20211029011109.23633-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: es8316: add support for ESSX8336 ACPI _HID
Message-Id: <163551954391.3555751.9625652606842158466.b4-ty@kernel.org>
Date: Fri, 29 Oct 2021 15:59:03 +0100
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

On Fri, 29 Oct 2021 09:11:09 +0800, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> The same codec seems to have different personalities. ESSX8316 was
> used for Baytrail/CherryTrail, ESSX8336 seems to be used for AppoloLake,
> GeminiLake, JasperLake and TigerLake devices.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: es8316: add support for ESSX8336 ACPI _HID
      commit: 986c5b0a1d1c5e9da70d40b88f2bb6f9601bbe41

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
