Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A337659181
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Dec 2022 21:26:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64D597F4;
	Thu, 29 Dec 2022 21:25:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64D597F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672345592;
	bh=N/o94YEt8tE0HvVCN7MrD6twr+9nAJ1Qbw3h//lCd7E=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jN30I1Avj9svDQjZCfRxLoJBNeOpEMsrw/+wSkANBNPaNNe8c3apEj3nmhlNoJ7FQ
	 Aiu+j7K4mfoOeZw41OoWdC/+komlcFO0/PocczYrlFTSH+HR8rvWH/Z0ayng//dtCm
	 XuDbejTow+Q9KS2i2f1R9avkWmEAvVnzVgQMp4F8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E95EDF80524;
	Thu, 29 Dec 2022 21:25:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAC3BF804E7; Thu, 29 Dec 2022 21:24:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59D95F804E4
 for <alsa-devel@alsa-project.org>; Thu, 29 Dec 2022 21:24:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59D95F804E4
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qB+QQnXY
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BAA1E61908;
 Thu, 29 Dec 2022 20:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FAD9C433EF;
 Thu, 29 Dec 2022 20:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672345495;
 bh=N/o94YEt8tE0HvVCN7MrD6twr+9nAJ1Qbw3h//lCd7E=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qB+QQnXYSXB8UINx2KICWxiYMZn2Dwdnda0PUnCvEUMBQSD7AdiEay6V9HH7mLxIY
 6DAl6szs7To9OwwByZ9U96h78eAkY6IV51j6H7Zej0RLzs7/PsERMPN0/tKs3YzR8p
 Pq+Tfs70LiYcqzzNuCOpOPP00pakJamWrhBrBXHoiS1CnS+Z9oyEMTeB97DKkVZNP3
 zbk3K4l7dhnS7sQQZ74ChEazB/vY1olz3hhMAvq7fW32N+M2EzhUZlw2FJ+Z/CXeaz
 sR9waNTq3/9vE9QaSOQ5Nlf0PHMxCeprh2CHgZD8GkNNM3IXY9HHqeubJdJet9k6el
 y4VQRBNNlIS7Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, cy_huang <u0084500@gmail.com>
In-Reply-To: <1672301033-3675-1-git-send-email-u0084500@gmail.com>
References: <1672301033-3675-1-git-send-email-u0084500@gmail.com>
Subject: Re: [PATCH] ASoC: rt9120: Make dev PM runtime bind AsoC component PM
Message-Id: <167234549276.88546.3985652949744191629.b4-ty@kernel.org>
Date: Thu, 29 Dec 2022 20:24:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-69c4d
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, cy_huang@richtek.com,
 jeff_chang@richtek.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 29 Dec 2022 16:03:53 +0800, cy_huang wrote:
> RT9120 uses PM runtime autosuspend to decrease the frequently on/off
> spent time. This exists one case, when pcm is closed and dev PM is
> waiting for autosuspend time expired to enter runtime suspend state.
> At the mean time, system is going to enter suspend, dev PM runtime
> suspend won't be called. It makes the rt9120 suspend consumption
> current not as expected.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt9120: Make dev PM runtime bind AsoC component PM
      commit: 7161bd540eebebae2bbe8c79de25d8caf12dbf78

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
