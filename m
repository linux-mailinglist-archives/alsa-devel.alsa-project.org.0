Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3103762C003
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 14:49:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C316616A6;
	Wed, 16 Nov 2022 14:48:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C316616A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668606558;
	bh=K2ksH7kgxNtftqOEUOe6f5caubrVcfO05BhBII2jqsc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=olev72mfuQY3rsreFybhpkNTJ4x9tQqIwSLz+HTP5jldhTF8FdBFmQEUK/8vohBSp
	 WJMHC7ojSsK9cD7D5MM6ByU9XuLICqmDxgTdrSnM4IvK4k8DuubWsqYdO898xYp+4l
	 ZltR0TdRhCjm6g0q/gSu0Wgiq4g3WEcVZrutL+Jg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D02BF804A9;
	Wed, 16 Nov 2022 14:48:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5004DF8032D; Wed, 16 Nov 2022 14:48:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24178F80240
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 14:47:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24178F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mIpPGVTc"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 37320B81D89;
 Wed, 16 Nov 2022 13:47:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE03C433D7;
 Wed, 16 Nov 2022 13:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668606474;
 bh=K2ksH7kgxNtftqOEUOe6f5caubrVcfO05BhBII2jqsc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mIpPGVTcEqFR7RSoNwVbU0cjFV79KdkrnFXiRVhc/ko2MYBC2b98jTeKpPhAIWumz
 KzKm+MEAiECjwcJ5irj9Jn9p+0wSBF8vf6T/dMgwjdJ8dsZCVFigDTe0jbxP4L1Dlw
 4c92yhjUzw3lf3Hbx3mLcOsCQ3/6/VUX1L0RKDIz/eqGXciJ90dCDa0rskuZ5/FVyG
 hp72mL07eESU1d6kL5Wa3hyfXzsOprQRH8xvaLvliUn5A5JANfYSTUw9p6bXsmdc65
 PDhxpPd4iMdi+3pnzR8Nu3WjXWXsRhPDI0xCCHJTRPxHpbzW5WoxUhfeJQGm1pWqPx
 0zozz7UNdEJJQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
In-Reply-To: <20221116090318.5017-1-shumingf@realtek.com>
References: <20221116090318.5017-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt711-sdca: fix the latency time of clock stop
 prepare state machine transitions
Message-Id: <166860647256.422565.8017848589707015863.b4-ty@kernel.org>
Date: Wed, 16 Nov 2022 13:47:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, Vijendar.Mukunda@amd.com,
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

On Wed, 16 Nov 2022 17:03:18 +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> Due to the hardware behavior, it takes some time for CBJ detection/impedance sensing/de-bounce.
> The ClockStop_NotFinished flag will be raised until these functions are completed.
> In ClockStopMode0 mode case, the SdW controller might check this flag from D3 to D0 when the
> jack detection interrupt happened.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt711-sdca: fix the latency time of clock stop prepare state machine transitions
      commit: c7d7d4e7bb1290cc473610b0bb96d9fa606d00e7

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
