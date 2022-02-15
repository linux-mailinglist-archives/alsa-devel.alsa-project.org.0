Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2C34B6CCB
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Feb 2022 13:56:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C04CC17B5;
	Tue, 15 Feb 2022 13:55:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C04CC17B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644929767;
	bh=SQleo2xlXQWhTxSpmfgwhq3x/rAKEffiIU7ixrJ2MH8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mS7PTyjESFucaActzsiCdgL7fCXLfz8Is5/JYy5MMGRgIRMxwWFbuj1YYGO4r/yvc
	 A6vCxyd4rTyxEyk0P4MYIzpP8LCbkUu0j2HqnAn6uK5RzS654SPXOVCW0eNzTV+Goo
	 LowZuwXUADENuR1HqcneM3Tdv6PtWbWMUK6yqnog=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D900F80124;
	Tue, 15 Feb 2022 13:55:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 627ADF80132; Tue, 15 Feb 2022 13:54:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF410F80100
 for <alsa-devel@alsa-project.org>; Tue, 15 Feb 2022 13:54:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF410F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Iw+UDR0w"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 4DE7ECE1F1A;
 Tue, 15 Feb 2022 12:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFDECC340EB;
 Tue, 15 Feb 2022 12:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644929690;
 bh=SQleo2xlXQWhTxSpmfgwhq3x/rAKEffiIU7ixrJ2MH8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Iw+UDR0ws5T+eQlhqHc2gSURHyTJyK7DDQlfBbWOU8d7rh1IpoUEBwZiMg9N1zpBx
 y5o629uw3g+laYyt4slP0DThP+lOh5+GE/1vI5GiX+HaDNSkXqKJ0XHz3I/80W9udE
 DF4qLam+AuI9f68/oRmkXrlR3Ig9abt1Myl4o/QlfD8AnX03r/gmKL/wKZfKelQu5r
 CFLrw+GoBYWvS2O7xjrOtKeGop39oqSdiYXcGMh7zEAKsIatWgiqw242y/czJzxXuH
 dnozGW113Uh4UY4Z/waTYY3IYMUB65akRVQ8CJV53NBOKchfqTVv3zy3RZZVvJ1Xxc
 6lN3IDKvlt1jA==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 ranjani.sridharan@linux.intel.com
In-Reply-To: <20220214071330.22151-1-peter.ujfalusi@linux.intel.com>
References: <20220214071330.22151-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: SOF: Makefile: Fix randconfig sof-client build
 when SND_SOC_SOF=y
Message-Id: <164492968840.13815.4226647286187449899.b4-ty@kernel.org>
Date: Tue, 15 Feb 2022 12:54:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, fred.oh@linux.intel.com, daniel.baluta@nxp.com
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

On Mon, 14 Feb 2022 09:13:30 +0200, Peter Ujfalusi wrote:
> Intel's kernel test robot found the following randconfig combination:
> SND_SOC_SOF=y
> SND_SOC_SOF_CLIENT=m
> 
> In this the sof-client object is not going to be built into the snd-sof.o
> and we will have undefined references to the sof-client functions.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Makefile: Fix randconfig sof-client build when SND_SOC_SOF=y
      commit: 4965e38fa064056021254af4656b1089a42dc764

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
