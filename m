Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52216380CD5
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 17:24:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C159E1775;
	Fri, 14 May 2021 17:24:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C159E1775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621005894;
	bh=p5zqoz8w803888+pXGNwIAiyWxv42TTRebNBM9Rqzro=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q/30KQCAkEHxRcx2nspsPkY7blORIgK8v3OGlI6yN3argpEqELSyJhQ02e2lw4whQ
	 xFqO/+AnN+ZC4vK7a6rfUY/LzUElH/7IEeyC3D13ehsuJD9/aKa6inzNl44OPIfxmQ
	 3hzx7jpZwL16VW2rLPPOwK/sENfg1kKXo48KaJQk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 215B6F8026B;
	Fri, 14 May 2021 17:23:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2812EF80240; Fri, 14 May 2021 17:23:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B60E1F8013A
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 17:23:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B60E1F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GBpDf/v5"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 269AF61458;
 Fri, 14 May 2021 15:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621005796;
 bh=p5zqoz8w803888+pXGNwIAiyWxv42TTRebNBM9Rqzro=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GBpDf/v5P9uU3MczNBadXP4klM6TBViTSsSzGF64zJ0sEVEg8hWI5//04vYv/4Z9t
 D1rwFrAvCfnQ9xCbs+hcPkY60/TJBGYFBFSeNPTRZCIwiLA4J+peE9wTz5tIt4SvIa
 0wuHlw8ZWk9VrUORGXmiMYdADjIpo93/Pl2HmT5FyxOLM/i5psTODAMT7SACbZc1VO
 9qAyjSR891GXQW6qwAj0i+cEJiody0A8cjhiOS2xCk1oOKxRX1eiq/SyPlVO03Xe8v
 7LZPUW5uai6/1pqrVXRl1S1cV4LfNYQxsPjqCAoGY2QN+98B2mp9NB646LHLvKMnXn
 v/rmm8RyagNyQ==
From: Mark Brown <broonie@kernel.org>
To: sathyanarayana.nujella@intel.com, brent.lu@intel.com, tiwai@suse.com,
 Zou Wei <zou_wei@huawei.com>, liam.r.girdwood@linux.intel.com,
 ranjani.sridharan@linux.intel.com, yang.jie@linux.intel.com,
 dharageswari.r@intel.com, kuninori.morimoto.gx@renesas.com,
 kai.vehmanen@linux.intel.com, perex@perex.cz, tzungbi@google.com,
 yong.zhi@intel.com, cezary.rojewski@intel.com, fred.oh@linux.intel.com
Subject: Re: [PATCH -next] ASoC: intel/boards: add missing MODULE_DEVICE_TABLE
Date: Fri, 14 May 2021 16:22:29 +0100
Message-Id: <162100559150.50429.5814132881880654217.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1620791647-16024-1-git-send-email-zou_wei@huawei.com>
References: <1620791647-16024-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
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

On Wed, 12 May 2021 11:54:07 +0800, Zou Wei wrote:
> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built
> as an external module.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: intel/boards: add missing MODULE_DEVICE_TABLE
      commit: a75e5cdf4dd1307bb1541edbb0c008f40896644c

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
