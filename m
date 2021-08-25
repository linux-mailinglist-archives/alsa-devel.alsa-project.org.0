Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 314913F7847
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Aug 2021 17:28:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B326C167B;
	Wed, 25 Aug 2021 17:28:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B326C167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629905330;
	bh=xX3sPL8wVgj4gfbIYo+gq9+nKEagcBN77P42+6QE7yw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RU+/Uh3IPSjnWrtQjLfvcA0liHPzeWLrm7Fbhx4XyrW4HhmHv8CMMA86LghYp1Xe4
	 ZMOYFEKBM/2pjYEJ1eb/ChKwcvq7PYVvW1wtLFXMw1r8JKF8UKe6Oqqq028c4yU3lJ
	 Pxsktwc//nUhVUuBmwLb3X1o5/f/QtrZTgnAuiiM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 107E4F80217;
	Wed, 25 Aug 2021 17:27:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D531F8020D; Wed, 25 Aug 2021 17:27:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06297F800AE
 for <alsa-devel@alsa-project.org>; Wed, 25 Aug 2021 17:27:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06297F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eZcH/c2t"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B1D461052;
 Wed, 25 Aug 2021 15:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629905243;
 bh=xX3sPL8wVgj4gfbIYo+gq9+nKEagcBN77P42+6QE7yw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=eZcH/c2t6WudeFRWe3BUtuTM2zU4VFwWjgQkOuWzKjGhOkI7CALQghxbDMbM1NMqu
 Q5RwQkd4z3Bz7whfRXtqh2s/w+yXQI4wh3HC4YosSir0CxNyBih2FmSYOnWfXFxm8S
 o19GvbyJTTEOmM52uLb+rOLsiHWlJk5WUYaPpIBNm450dlYT+u/eJVX5pQO/IsdrAx
 hWZB3Y0sPM5jaHxwPrONPQ4hN9lG9IKAJJIplpEernQ5dAzbDCm6R8K1OGOlWikVfg
 JxKu1UasX/imy5ACKysWsMbw83i1CSGCtHbnHpW86RXdJG9aAiIHagP92zmC1D528v
 AEtlg9cHNYgLg==
From: Mark Brown <broonie@kernel.org>
To: yang.jie@linux.intel.com, hdegoede@redhat.com,
 pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 liam.r.girdwood@linux.intel.com
In-Reply-To: <20210825122519.3364-1-peter.ujfalusi@linux.intel.com>
References: <20210825122519.3364-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: bytcr_rt5640: Make
 rt5640_jack_gpio/rt5640_jack2_gpio static
Message-Id: <162990401497.56501.11105326993788990504.b4-ty@kernel.org>
Date: Wed, 25 Aug 2021 16:06:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Wed, 25 Aug 2021 15:25:19 +0300, Peter Ujfalusi wrote:
> Marking the two jack gpio as static fixes the following Sparse errors:
> sound/soc/intel/boards/bytcr_rt5640.c:468:26: error: symbol 'rt5640_jack_gpio' was not declared. Should it be static?
> sound/soc/intel/boards/bytcr_rt5640.c:475:26: error: symbol 'rt5640_jack2_gpio' was not declared. Should it be static?
> 
> 
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: bytcr_rt5640: Make rt5640_jack_gpio/rt5640_jack2_gpio static
      commit: dc2d01c754c378a4748ac72c5516d45da7640123

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
