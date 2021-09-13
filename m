Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6755C4089AF
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 12:59:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3A2982B;
	Mon, 13 Sep 2021 12:58:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3A2982B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631530783;
	bh=2KGjzRkhbhP3VIW4u4UJ4cViUftuJZeptn3YbqX4Bcg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iVPwQi5Hsq6Qdr0xfEeaT32lnIwRH9l+iF/OLxi0tT2wZmjxdNUKe7TphCuhpHIxO
	 usUtLPdhXotVJui5HsYuUni31Oo/T1F+9nFFWxOSE8dQTsxXktEDKp33QktVJJPhwU
	 2gvwG49cbSNwxhv0lQnJZEng+MYVlBLhT3WA1yUE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09D69F80533;
	Mon, 13 Sep 2021 12:55:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 494BBF80516; Mon, 13 Sep 2021 12:55:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D34CFF8050F
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 12:55:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D34CFF8050F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eShpaZtr"
Received: by mail.kernel.org (Postfix) with ESMTPSA id F31746103B;
 Mon, 13 Sep 2021 10:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631530509;
 bh=2KGjzRkhbhP3VIW4u4UJ4cViUftuJZeptn3YbqX4Bcg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eShpaZtr7dutg6P7jE+NptiBCOGU3qUeMoKryK3KDYvvnI2IGIEpU+PhdZHTYlQzJ
 3uH9JXuzmpXsqEI2R1pT608bzUw3IYf/ucJbM2Axxv0u0SPETKuZzp6mYL3lilfv2F
 x7J/7qYqFTCHGZR1GIq4snF6kLcREe/l2apFEAZBjuaiNFlqGUPkYGbMe8MZ5s5Dhp
 Ou9KcerI0zoKx98kosXehQxeNyEgT3LpVrTv5FIAApzE8xYJSABHrU8XxFkiZWXfpW
 k3KQXa9iSAmPw7crjdW8oLST2IHth3RYYdC+fVwSZYsSiy6sKkMNtkdqvszUYTYGzx
 qlYyJwO+QxlMQ==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	lgirdwood@gmail.com
Subject: Re: [PATCH] ASoC: soc-topology: Move template info print
 soc_tplg_dapm_widget_create()
Date: Mon, 13 Sep 2021 11:53:26 +0100
Message-Id: <163152996582.45703.11168947241384960645.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210902112301.22657-1-peter.ujfalusi@linux.intel.com>
References: <20210902112301.22657-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 Mark Brown <broonie@kernel.org>, jaska.uimonen@linux.intel.com
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

On Thu, 2 Sep 2021 14:23:01 +0300, Peter Ujfalusi wrote:
> A DAPM widget now can have different types of controls, it is no longer
> correct to print the type as it is just the type of the first control.
> 
> Move it after the loop where we create the controls and print the number
> of the control types.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-topology: Move template info print soc_tplg_dapm_widget_create()
      commit: 8facf84bcf575e3217a15cefcc867db15dca4781

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
