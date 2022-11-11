Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87699626041
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 18:16:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 119821699;
	Fri, 11 Nov 2022 18:16:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 119821699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668187019;
	bh=ZDvUaUkUACTSqX8y/03oHEIAlZS1OaPuEXsqc1Oc5ts=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KxSa4GTR3Bkk5sgTi7EF41ICoCgAsarFWJgimkpkrc+wngs1u1W0ydnF2/rV90MFy
	 Dd6T1FXthTJwbi1ZPm3EI0qjSRDGBjRP35UDz8VynTAiDHyVHlSzrDVltzH3V73ImX
	 4SPKrZHxqAmOpyQSb68sPWXMZl8KoKIdoJ6jkQdQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B0A7F8055C;
	Fri, 11 Nov 2022 18:15:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49EF9F8055B; Fri, 11 Nov 2022 18:15:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D78EFF804B1
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 18:15:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D78EFF804B1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="I4qEfqF3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6EE7C62068;
 Fri, 11 Nov 2022 17:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A39FC43470;
 Fri, 11 Nov 2022 17:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668186906;
 bh=ZDvUaUkUACTSqX8y/03oHEIAlZS1OaPuEXsqc1Oc5ts=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=I4qEfqF3e1WT1PqytGqAGMFnqX7jwEQBzvpJ/lXGJQgXbQYXHaf8JSGDT6FG1D2bf
 ActtO7PR7Pr8fNSYjXSSw3ySz8Wh5Lf5eeKWdz+aLVBMuUGea0kyOpHmlW8kzj9KUB
 GQ1ojsT6ZiNEqffHEjB9V1Jj+1+0+XzbivMO3WuiUGqbXWFGPv7MuUCgJFXuHdGl3O
 /dA4RPgSxUqDto3QVrEYsRl8v4LQ64eWw+XYUV+v88QeNNoaPhb4RaO1l3zwTrX6QW
 8MBpnarhZgzjrHKuuTrjQ7EZBKXnPn6itthcQCIIA0MWIPo9iHa8FCiQyv8H2HBt6i
 sY4nNHp25vlLQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
In-Reply-To: <20221109091317.17240-1-shumingf@realtek.com>
References: <20221109091317.17240-1-shumingf@realtek.com>
Subject: Re: [PATCH 4/4] ASoC: Intel: sof_sdw_rt1316: add BQ params for the
 Dell models
Message-Id: <166818690320.487154.1426963342850542329.b4-ty@kernel.org>
Date: Fri, 11 Nov 2022 17:15:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, jauliang@realtek.com, jfmiranda@gmail.com,
 derek.fang@realtek.com, flove@realtek.com, pierre-louis.bossart@intel.com
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

On Wed, 9 Nov 2022 17:13:17 +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> The Dell SKU 0B00/0B01/0AFE/0AFF model needs the BQ params for the tweeter/woofer.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[4/4] ASoC: Intel: sof_sdw_rt1316: add BQ params for the Dell models
      commit: cf6946d95005add8437f874e0952ec4f28fe5c02

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
