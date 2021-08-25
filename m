Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 248D03F72F3
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Aug 2021 12:25:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 413531683;
	Wed, 25 Aug 2021 12:24:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 413531683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629887107;
	bh=I3aEAX98L/tGiOUO8s6Zg+dynK3AS2ijINI9SuNintQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PiAZoP+44wDQN1Jkw9cNr+o5zq3N9UbQ5/h/V0U+eP9dMWMwjOfuKSTx3PPbH2/Fj
	 KzcBtEPtu4hcRdyaYwaLDvwSLVgae6GVMwKuVXNsyMiaIC9qMdF4Z8M0yhxWlUv/eY
	 oFcRV1rJ6XtmPuZRNHxDULp1+b3veTGk6r3XYbKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3838EF802D2;
	Wed, 25 Aug 2021 12:23:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77F49F8020D; Wed, 25 Aug 2021 12:23:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F31F3F80217
 for <alsa-devel@alsa-project.org>; Wed, 25 Aug 2021 12:23:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F31F3F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jlRFb+te"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B69F61212;
 Wed, 25 Aug 2021 10:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629886998;
 bh=I3aEAX98L/tGiOUO8s6Zg+dynK3AS2ijINI9SuNintQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jlRFb+te1emOp3ybRDCDHoXOaIwF7g7tpYw+8XtjswRNTqehbpJATOlfzLi/BRyQJ
 4G/wwBmqqOADbmf49OkzY8Dz41iBd1MmVdCxM8en/fl33WFEzDCZG5S9rbjo4xMcj0
 BAi6L2atph0vZGDqLNv5D7VQl6ZX20RdwvOD9qLiW/9qS83k2hc42ZGeXLrbZiYzQi
 j82Sid8qnlNSZDVmCaLg1GP0XEQv25oinPoNvZ87weiWh/kSqO434Rs1NJL4CHRh5C
 9Wy4BfwGPMWAq0eTno2v4c19KdC9u+/rwDiohy7lBp8M1H0WzbPKY21v73Rv0oPbKW
 6EmJ5zNBb05lA==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: Put debugfs_remove_recursive back in
Date: Wed, 25 Aug 2021 11:22:40 +0100
Message-Id: <162988521424.7213.9451728533872560143.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210824101552.1119-1-ckeepax@opensource.cirrus.com>
References: <20210824101552.1119-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com,
 tanureal@opensource.cirrus.com
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

On Tue, 24 Aug 2021 11:15:52 +0100, Charles Keepax wrote:
> This patch reverts commit acbf58e53041 ("ASoC: wm_adsp: Let
> soc_cleanup_component_debugfs remove debugfs"), and adds an
> alternate solution to the issue. That patch removes the call to
> debugfs_remove_recursive, which cleans up the DSPs debugfs. The
> intention was to avoid an unbinding issue on an out of tree
> driver/platform.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm_adsp: Put debugfs_remove_recursive back in
      commit: e6d0b92ac00b53121a35b2a1ce8d393dc9179fdf

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
