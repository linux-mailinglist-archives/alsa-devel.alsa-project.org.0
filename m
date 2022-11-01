Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3BB614A32
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Nov 2022 13:01:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D744A1694;
	Tue,  1 Nov 2022 13:00:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D744A1694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667304060;
	bh=jI3M6UzfIboKViyV8lE8DP1ArWyfqMYLEAKwRxgA8cs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QoffDWamJlmEflu43ta5unTGXNsoyqdttx16rQTL1DEVjHk/Zkoa2v8VXCxm//XvV
	 LSCNk5RoxHLtpJZEIeJPhgFtXH2rnbJ8hh+OZsrZ0WrLWiyZwZpiqQXTsH8jsVGbM2
	 EIzGkCWFOWd5H4otfnDKvfGsLuy4RqTjrDwWNPPQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4788BF80155;
	Tue,  1 Nov 2022 13:00:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD1FCF80423; Tue,  1 Nov 2022 13:00:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46C9CF80155
 for <alsa-devel@alsa-project.org>; Tue,  1 Nov 2022 13:00:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46C9CF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UQh1xb6b"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 41D7660F15;
 Tue,  1 Nov 2022 11:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2FE0C433D6;
 Tue,  1 Nov 2022 11:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667303998;
 bh=jI3M6UzfIboKViyV8lE8DP1ArWyfqMYLEAKwRxgA8cs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UQh1xb6bRKd1oT8H+AXseJqihTis6xFU5MydRswg0siFwI4+f2ybLpRwleELOyBWj
 x3DUVnS7nJQtwmI28C0VUrIgqUA5zWggT8y/ngnplS4jQkxVDQ/HDogwTiVrMXSwrJ
 vLNHyuVYcf3PbYM7pXVUfBOcRxhZ529fxTptwl2iP6wOZzrn54Yst4I4DWX150BdRk
 zuypSH0IiJIZCcJToL9KW+EnYJLL7u7Q7OTE70hYw14pOxWLS/aHjt4lw64OQLA5e3
 ngrAAUKGd/cl2JAp0jtxep70DPBgZ6hFZxJK/ZW6xJw1q9TgpCgJh8hiFKU7X/9Jt6
 SDupTj1LkNBOg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221031195340.249868-1-pierre-louis.bossart@linux.intel.com>
References: <20221031195340.249868-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: fix compilation issue with readb/writeb helpers
Message-Id: <166730399752.87734.12063553774429368439.b4-ty@kernel.org>
Date: Tue, 01 Nov 2022 11:59:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: tiwai@suse.de, Nathan Chancellor <nathan@kernel.org>
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

On Mon, 31 Oct 2022 15:53:40 -0400, Pierre-Louis Bossart wrote:
> Replace them with read8/write8 to avoid compilation issue on ARM. In
> hindsight this is more consistent with the read64/write64 helpers
> already used in SOF.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: fix compilation issue with readb/writeb helpers
      commit: f8fbf0dc702bf15b8b0ea1731a353bdb7faee8fd

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
