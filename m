Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFA840F9F2
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Sep 2021 16:07:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CB0D178E;
	Fri, 17 Sep 2021 16:06:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CB0D178E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631887634;
	bh=MTpLMOUJpUdYZaRUZceCeSZSzXGOhw2uDQR664Vwx/M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UrF6GFxQVnhLoZZO5PJ9w+9rFyqZLq6TeeA7Z1HSyJ6lzWKVVlu3CovMePCB/o7zz
	 3xvx3BU8x9FRD0IYpvJWBHF00DRDRfHldeYe1g+WgsjfUzvhsN8K9skz8rOT8K47ov
	 u/M0H79w+0VJ9+0orej61VVW3q4Wzgrh41Fe1824=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C5D2F804E4;
	Fri, 17 Sep 2021 16:04:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24A21F804AB; Fri, 17 Sep 2021 16:04:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7773BF802E8
 for <alsa-devel@alsa-project.org>; Fri, 17 Sep 2021 16:04:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7773BF802E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bihi7wZq"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A1FE961212;
 Fri, 17 Sep 2021 14:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631887486;
 bh=MTpLMOUJpUdYZaRUZceCeSZSzXGOhw2uDQR664Vwx/M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bihi7wZqwyVdsOTpXcao/a0TDvhoEcNfKBUxvaNvDj4nKfvjGOs/JwRIIQkIywnim
 9ol58SoT+XeNWxfm8Zn/ovDYn1Q6JG0WuaWZM1+Gu9e0lQUHZ+xuQhLz/uK/51Q2K3
 ptEPy9kELV2BKj9t+Ll/zo/XYRV/QkgAYlflKBLeMmuY2C4g/qQbPGrzQ//i+iRQQ7
 TFtiyyrY0noW0vRNgLp22uCZ8NNoNzeYnA1k5ETZg06+3EvukE4ZwmG27pp/mU/CxB
 5fzlR4NULyIX2fArZ2LZzk5Ec34yMV6mBtfXDgNeXIXx/L/E6HNjhCbrHk7Hnq2HO0
 U25tLinUvgQ1A==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: trace: Omit error print when waking up trace
 sleepers
Date: Fri, 17 Sep 2021 15:03:47 +0100
Message-Id: <163188719815.50326.1445752167706019571.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210917085108.25532-1-peter.ujfalusi@linux.intel.com>
References: <20210917085108.25532-1-peter.ujfalusi@linux.intel.com>
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

On Fri, 17 Sep 2021 11:51:08 +0300, Peter Ujfalusi wrote:
> Do not print error message from snd_sof_trace_notify_for_error() when
> possible sleeping trace work is woken up to flush the remaining debug
> information.
> 
> This action by itself is not an error, it is just an action we take when
> an error occurs to make sure that all information have been fed to the
> userspace (if we have trace in use).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: trace: Omit error print when waking up trace sleepers
      commit: cfacfefd382af3b42905108b54f02820dca225c4

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
