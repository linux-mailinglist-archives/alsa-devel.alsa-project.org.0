Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4CA41DCEC
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 17:02:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70DC016EB;
	Thu, 30 Sep 2021 17:01:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70DC016EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633014164;
	bh=yWOZTx2GVCXqbJG7AYf+w0iFnRMBRhlqbinERr6BKqY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bx6bmrYcT37hotwfgwPe1/0QOTTNrtFSmCIEdDi4zk1RtAVkm/8bq8A94aPyBqUZc
	 x8MiLwbp3DidR4tlxvDgZeOkYqwjNIoxFGDTG8WN/263B4yQMelTwi8hTQNRVbBuJh
	 FOBHNTv3SxwIfzAfXgO7tBolgn4FLPrjdsrzAnTs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7DBFF804F1;
	Thu, 30 Sep 2021 17:00:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6379DF804DA; Thu, 30 Sep 2021 17:00:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D04AF800F3
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 17:00:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D04AF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XpIGnAKm"
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC77861A2A;
 Thu, 30 Sep 2021 15:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633014008;
 bh=yWOZTx2GVCXqbJG7AYf+w0iFnRMBRhlqbinERr6BKqY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XpIGnAKmRFNaLc2RnTLc2ZIAXcKb4mqCN95K54x456tpfpsM9ZeWzKzQyD0m+GzSC
 SkB5THevHWHddPCoP33iugoEEjOYDOfoVu9DRBlAwiErUViA5KlVavLG8yECWHIPdo
 4slzeSsrbikqLKb/4UdxcX6up9o4MQ9eIo/1CfWalLCOKgRbeAqSywPO0RpcazlcA8
 AQb2oPMPaZHQuLpiu9z3viq8rBeYLFDRaIQIZoA+vYk0/bCLMvRQJMJX//Yur7gm8D
 evs6EJZR7bLjDf3pAf4LtiLQx4exlfX3wTu9MvxJV1j3va9gt7oZMEw1GGzRjC9MMF
 1k5dGgZatR5og==
From: Mark Brown <broonie@kernel.org>
To: derek.fang@realtek.com,
	lgirdwood@gmail.com
Subject: Re: [PATCH 1/3] ASoC: rt5682s: Remove the volatile SW reset register
 from reg_default
Date: Thu, 30 Sep 2021 15:58:56 +0100
Message-Id: <163301248178.43045.15588263327224745864.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210930102928.28628-1-derek.fang@realtek.com>
References: <20210930102928.28628-1-derek.fang@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, Mark Brown <broonie@kernel.org>, shumingf@realtek.com,
 flove@realtek.com
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

On Thu, 30 Sep 2021 18:29:26 +0800, derek.fang@realtek.com wrote:
> From: Derek Fang <derek.fang@realtek.com>
> 
> This reg is for SW reset.
> It shouldn't have default value, so remove.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: rt5682s: Remove the volatile SW reset register from reg_default
      commit: 67e068ec4596dbaac5f45669ce8373dfe61a2411
[2/3] ASoC: rt5682s: Use dev_dbg instead of pr_debug
      commit: 087330c642a968be8b1b9f2df6fb87b217f17372
[3/3] ASoC: rt5682s: Revise the macro RT5682S_PLLB_SRC_MASK
      commit: 853cb0be0eb2dba3e016b4f1d9fdae91065930c6

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
