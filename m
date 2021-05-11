Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCB137A1FE
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 10:29:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1E301779;
	Tue, 11 May 2021 10:28:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1E301779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620721787;
	bh=AECHDAUflJLDwwR4tLVUe5XzW3T1O/WH4F7ZGT9GfnY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LwlWPmKXJI2pi+2qLQEbgnjbB8rvjIr8dZdpRHF2RK+1D9JOFmjt+qqLSkPsoJ633
	 fXW1hN1kZHNFc5TsucQTAfdnXgSS2FNxx/tuH2GFcoWYiMdVKhmqytWr+9pWmTQMz5
	 OVx0fqlBnLkbw5jQ3e1IF2JMoiqBmN5cMzvAWZrA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 557DAF8049C;
	Tue, 11 May 2021 10:27:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DB15F80424; Tue, 11 May 2021 10:27:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7075F8028D
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 10:27:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7075F8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VNBeHK30"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B4B0C61184;
 Tue, 11 May 2021 08:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620721649;
 bh=AECHDAUflJLDwwR4tLVUe5XzW3T1O/WH4F7ZGT9GfnY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VNBeHK30Gr++tWIdpWvplrm8p+E+a2K/2FyVun5fAkMjiU0COVl3bezFZL3z2CXgu
 k6Eqiut47AuwfSM6+5w80liQVSXjqnd3UJNVPS8LF8kOTCIddpk2Ii6sL3kVSuQw/p
 g2yjTXRIFPWijs7WfBLUrx3xyxlHEiqgpYqb0bpXpfIydLbWAUloCqhPPW/k3To34d
 rGJvd1TFSL8ed3b7sfOAsdvXVLB6SUCabBMB+rSIZtEKVQStEG/gQ81oLQfyaeYfcF
 bfIeMDTPXxE2fRByQvJYmjEW59sxwSh+ZfVxfnTw2hL540CVNxrICkk+vkB2MjqGWA
 Wzz5WnIL2aEhA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com,
	shumingf@realtek.com
Subject: Re: [PATCH] ASoC: rt711-sdca: fix the function number of SDCA control
 for feature unit 0x1E
Date: Tue, 11 May 2021 09:25:45 +0100
Message-Id: <162072058169.33157.7546936376555401657.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210504100424.8760-1-shumingf@realtek.com>
References: <20210504100424.8760-1-shumingf@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, Mark Brown <broonie@kernel.org>, derek.fang@realtek.com,
 flove@realtek.com, pierre-louis.bossart@intel.com
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

On Tue, 4 May 2021 18:04:24 +0800, shumingf@realtek.com wrote:
> The function number should be FUNC_NUM_MIC_ARRAY(0x2) for the feature unit 0x1E.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt711-sdca: fix the function number of SDCA control for feature unit 0x1E
      commit: 682ae59ca2876f83396ccc5674235da99beed06c

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
