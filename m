Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D866D3D2AE0
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 19:13:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B1B216FC;
	Thu, 22 Jul 2021 19:12:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B1B216FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626974028;
	bh=gSfEIL5aNzLMpA5veC35HnSYGi8S+58Fj29Haj8xiFM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iqL4ve0v5Dow7p5gEvmrV8YpJ7c5gkghb/FoQ1/cTd0Soecz+9pQBAGpGQSYuPhPC
	 QLpZyXeTUJH00dxoX/xW1jV6ZQBHXHGtjmmHCHgPFad1MoLQ1nqIOxEinuvBJMhmmo
	 TlX9HIM6byRhP28sWoUmEn8mJ1zWKBZReqZl1U50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DADEFF804FD;
	Thu, 22 Jul 2021 19:10:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CE7CF804E4; Thu, 22 Jul 2021 19:10:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9A1AF802E0
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 19:10:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9A1AF802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QAbvbzHv"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6DE56101E;
 Thu, 22 Jul 2021 17:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626973833;
 bh=gSfEIL5aNzLMpA5veC35HnSYGi8S+58Fj29Haj8xiFM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QAbvbzHvIKmhalZZcbGVGNVGTo3H2lwolnC32CmAkzT/yzN1vBIjAZ7Qn6qeuaO8r
 paDJ08f1cNyVSj3yrTFTyjRiI3x+uvooqMwWMZ2iNLtQnUfU1VpEy/6DmaVYUhVArn
 WhEw5ujAyMgCEfADIOkAId8WO/nQ5NSJJ66MtDm3Emo2APD8vf/56z8xguF68omowk
 nHg6m1btqmC5YOI2P7X2j+rAybc84NMRLPSw5vKLBlN+TkRqfyWU2FU/0rM/jFY0gc
 znQ/hhCnmIHOzT5vdJDdos/rz1smDoFF/O3HjFhySc+it81IKeKcN0Q/Tt7JxOkw89
 1ESYL6U+6eLAA==
From: Mark Brown <broonie@kernel.org>
To: derek.fang@realtek.com,
	lgirdwood@gmail.com
Subject: Re: [PATCH] ASoC: rt5682: Adjust headset volume button threshold
Date: Thu, 22 Jul 2021 18:10:03 +0100
Message-Id: <162697068326.1747.6369155628252463841.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210721133121.12333-1-derek.fang@realtek.com>
References: <20210721133121.12333-1-derek.fang@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 jacal_tseng@realtek.com, lars@metafoo.de, albertchen@realtek.com,
 Mark Brown <broonie@kernel.org>, shumingf@realtek.com, flove@realtek.com
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

On Wed, 21 Jul 2021 21:31:21 +0800, derek.fang@realtek.com wrote:
> Adjust the threshold of headset button volume+ to fix
> the wrong button detection issue with some brand headsets.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5682: Adjust headset volume button threshold
      commit: 6d20bf7c020f417fdef1810a22da17c126603472

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
