Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BBD321C73
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Feb 2021 17:10:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 137AD1667;
	Mon, 22 Feb 2021 17:10:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 137AD1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614010251;
	bh=n3N6IdcyLq//ZyjojbWT0VuSMCmzZBMWV5924CcfNY8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VGRhdeQR5CkWRqN/E+rpvqzuMvjT1mDUKI0eQYjbTuVqMnlEnSTIUFwr7dTziQ/VT
	 uwzmuRswXZChQKr0EcSlbrf3BcCSYNHVQ162gkjWUXNrTqN2rR1urSMOuWo9A7lyv3
	 6QNro6goKTjuzfkxFumaoyu07su2SLv7V2TaeSE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2144F800CE;
	Mon, 22 Feb 2021 17:08:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92C0AF80279; Mon, 22 Feb 2021 17:08:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FA4FF800CE
 for <alsa-devel@alsa-project.org>; Mon, 22 Feb 2021 17:08:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FA4FF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Jf0J6TRR"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11C9364E61;
 Mon, 22 Feb 2021 16:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614010109;
 bh=n3N6IdcyLq//ZyjojbWT0VuSMCmzZBMWV5924CcfNY8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Jf0J6TRRUjZyBZPhEsnSDlhSEUdxjgfuJIswK0EZr3YVZuWh38nQSZekbVH3JiCJb
 +6FSXgBQPAhjnOHG1JiONd9511U0cA8JllJILdFZVrIIGtWdqn11iFnhdYqxGZrc3u
 wc8JMKTLjal9hEN9rBiHHJfQMb8RoKE3mNNz61er8mRGYcrCXJ5ZxKi8kiy4eypq8n
 lxEB1f9DX3ib+YBx93U16xZ+VijHvnInxLKeS7rn2GlqJiD9l4KiSaAqsS4Bl11Mmm
 0SQCgDJ7nb7cl8tsDTPgaw1fsZzBJXeobdrdqEUp/QXi0y34il7XMJNOoadnV/H1U3
 7jF66vzFV/aFw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20210219230918.5058-1-pierre-louis.bossart@linux.intel.com>
References: <20210219230918.5058-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: (subset) [PATCH 0/6] ASoC: samsung: remove cppcheck warnings
Message-Id: <161401004266.2538.5738460015320431431.b4-ty@kernel.org>
Date: Mon, 22 Feb 2021 16:07:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Krzysztof Kozlowski <krzk@kernel.org>
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

On Fri, 19 Feb 2021 17:09:12 -0600, Pierre-Louis Bossart wrote:
> No functional changes except for patch 2 and 3 where missing error
> checks were added for consistency.
> 
> Pierre-Louis Bossart (6):
>   ASoC: samsung: i2s: remove unassigned variable
>   ASoC: samsung: s3c24xx_simtec: add missing error check
>   ASoC: samsung: smdk_wm8994: add missing return
>   ASoC: samsung: snow: remove useless test
>   ASoC: samsung: tm2_wm5110: check of_parse return value
>   ASoC: samsung: tm2_wm5510: remove shadowing variable
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[5/6] ASoC: samsung: tm2_wm5110: check of_parse return value
      commit: 75fa6833aef349fce1b315eaa96c9611a227014b

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
