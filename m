Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B691830C7BF
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 18:32:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3A911787;
	Tue,  2 Feb 2021 18:31:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3A911787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612287164;
	bh=O8ORfPebUxsegzmZ5upgI8FYJs+6Qj2BQE4HaVbBXGw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AywnEZf1+YPnF0QneWW2feAPC6wvA+O7fzn5nNOFRrNZ3JQGc1c5cHWSfXjdwMT2k
	 FPFW6HSzOpTF2IPGnDN1VhamRaOjCmnS/sWwq+i3fVlvSY2uX6GvgJzrbDEBihb60R
	 VQCz+VYV+w4QJfSbdQ7FjokTxb/WDTpBzLIvhOic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26578F80109;
	Tue,  2 Feb 2021 18:31:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1995F8023C; Tue,  2 Feb 2021 18:31:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2840F800E1
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 18:30:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2840F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rFqU1F/u"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C524964F6A;
 Tue,  2 Feb 2021 17:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612287052;
 bh=O8ORfPebUxsegzmZ5upgI8FYJs+6Qj2BQE4HaVbBXGw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rFqU1F/uCCLHMtQk6FLV7GnA+IjQHWH+6wsISqx6jbng0uO23h9P7fbIBfAHwQ+rr
 7ahbAziDx4RAPQ7DmGn2tOvS/06gCM1t5Pz0AcM6/MlbMexfaEnzp4sqjMxYIlHih+
 hGbzH92uXrhAMZolNiiK6ce3S1TqBdZliMnT/xemJtfHUgqDOzKeX7twMHOp0/a1OH
 bDOeOjfbo/k1dDpmygzehhIFWd7qt0ydkkpgh8ZQ6QFAoxHHoPEcHq0IslQQNo2uCk
 4g0DT3wJ8f9cx+i4Erk8giFweb48m9GBgc3m1zisF2WKHPXIKT/shvByRrQiMeZvAO
 SlAaYi3Ki2YLA==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20210202163123.3942040-1-amadeuszx.slawinski@linux.intel.com>
References: <20210202163123.3942040-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: topology: KUnit: Convert from cpu to data format
Message-Id: <161228699993.35075.15148170146643689827.b4-ty@kernel.org>
Date: Tue, 02 Feb 2021 17:29:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>
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

On Tue, 2 Feb 2021 17:31:23 +0100, Amadeusz Sławiński wrote:
> When creating topology templates and overriding data in specific test
> cases it should be done with cpu_to_le32 macro, so we operate on correct
> data on all architectures, as topology parser use le32_to_cpu to parse
> data from structures.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: topology: KUnit: Convert from cpu to data format
      commit: be6be67e135e59fb176b1e2e9d47a7436fb161d1

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
