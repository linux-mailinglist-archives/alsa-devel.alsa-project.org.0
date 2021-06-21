Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4AB3AF585
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 20:49:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 261FF16AB;
	Mon, 21 Jun 2021 20:48:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 261FF16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624301358;
	bh=sLgWN4s8GNDPO25dfpT1/TNRtfd/uI79Qq9d1BCDPn0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q2KaHgwwnq2ntSNFZPevXlduZmKxbZ/OhFl7t0ND8yA2paEBs8atGd68n9tn6EKNs
	 OOUY452nYRH0Gd0dbg+FbV3hleUwH8jCfojpW97JyRoUQD4YXf6WiQZl6UH9rzci8X
	 ec8m1bbUMzQfFwedHAurNy4zMMStEgky5nh/r3L0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CAD5F804D6;
	Mon, 21 Jun 2021 20:47:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F04BAF80245; Mon, 21 Jun 2021 20:46:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52A26F8016D
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 20:46:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52A26F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="okFEYST2"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 548896124B;
 Mon, 21 Jun 2021 18:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624301214;
 bh=sLgWN4s8GNDPO25dfpT1/TNRtfd/uI79Qq9d1BCDPn0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=okFEYST20zwXUCNHRYwS5D1ZL6h6+goigd12M/UhFB8z0WGZvIYE2YfCUKswCfqAG
 G+fx5IkxaPouvVCVuUGYLTTr3x1y70Wkha5xwjuoT5abJebF41ydOjjJfPJfxCHJI8
 +dI8DnXosBpO7kDuF0rrFo//Xbx6ACEr3cMgT0plEDmpNo0IjQUATivQAPdxqTCEOV
 hxf9aX8MbNUknFshx9/+tJ+7Q6uKPJX56F7N4ol+13+LiUSxQlKhaTXLsx5JaxngBo
 896sqShMb4LaYG9GyYgySi89N2LuRxt1rO9LWTJQhR+Wi9iY/bH8t6N/IHXwALZ4ly
 Byu/hFZPltQ7w==
From: Mark Brown <broonie@kernel.org>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/2] ASoC: atmel-i2s: Set symmetric sample bits
Date: Mon, 21 Jun 2021 19:45:58 +0100
Message-Id: <162430055264.9224.7571690631298505549.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210618150741.401739-1-codrin.ciubotariu@microchip.com>
References: <20210618150741.401739-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alexandre.belloni@bootlin.com, tiwai@suse.com, nicolas.ferre@microchip.com,
 ludovic.desroches@microchip.com, Mark Brown <broonie@kernel.org>
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

On Fri, 18 Jun 2021 18:07:40 +0300, Codrin Ciubotariu wrote:
> The I2S needs to have the same sample bits for both capture and playback
> streams.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: atmel-i2s: Set symmetric sample bits
      commit: 489a830a25e1730aebf7ff53430c170db9a1771b
[2/2] ASoC: atmel-i2s: Fix usage of capture and playback at the same time
      commit: 3b7961a326f8a7e03f54a19f02fedae8d488b80f

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
