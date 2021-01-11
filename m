Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 093E22F1AF4
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jan 2021 17:30:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A237716E8;
	Mon, 11 Jan 2021 17:30:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A237716E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610382654;
	bh=pL9LbAEO552/ioMUSEpOBHTHadGFWi3+0pPTeH/vdmA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W2mq/KEXCAs6NnhUN1gYQoMtvLS+CVjQzOHbWJJOywU9F/FsCcUvIsgxeDYbXnzXj
	 guJNVnvU6i0lyUAr69NWmONSFW/8qVUASARFfAeW8UebAPiK3+CpN6ZhGMIYowC0TU
	 lHf8JG56ojqrWlBDNx8dwl4NPT2v30RthD3oI+IY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9ACFF804C3;
	Mon, 11 Jan 2021 17:28:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E53FDF804C3; Mon, 11 Jan 2021 17:28:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA829F80113
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 17:28:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA829F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rj5k+dEo"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5235522B30;
 Mon, 11 Jan 2021 16:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610382502;
 bh=pL9LbAEO552/ioMUSEpOBHTHadGFWi3+0pPTeH/vdmA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rj5k+dEoewTdDpbc64H1k6vEUOsiUC0uZ20wgPCUfObDAvql6SLp/2Zqg8QJosuLp
 JVk01+ayB25AIprgiuL727CQrZxgcJxjARliJfF4Ui0OQdUxNxYmV/oIkOsmAbJZp+
 Is8HD9AqWC6X3s6baH4LdJkIgSGB+tLFK3KM1vPPx3NeW8Sg940odVX62Tt0fl9IhS
 3IkPfES6v+p23i2XBXNl+ve3CoQoaEpIFASmM0Xa8+N62qdefdoqKpW3iSblgDGiei
 ILuUhHPaG+Lghk8LKoZUYW5kFosgOO2YjyaSUbzNnS8eY+VeVNMEF7m3NMbSURTwxs
 ZsbOf8SJ621rQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, "shumingf@realtek.com" <shumingf@realtek.com>
In-Reply-To: <20210111092544.9064-1-shumingf@realtek.com>
References: <20210111092544.9064-1-shumingf@realtek.com>
Subject: Re: [PATCH 1/2] ASoC: rt5682: enable fast discharge for headset
 unplugging
Message-Id: <161038245911.32701.13271513923071069536.b4-ty@kernel.org>
Date: Mon, 11 Jan 2021 16:27:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, derek.fang@realtek.com,
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

On Mon, 11 Jan 2021 17:25:44 +0800, shumingf@realtek.com wrote:
> To avoid the pop noise, this patch enables the feature of fast discharge.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rt5682: enable fast discharge for headset unplugging
      commit: 5a15cd7fce20b1fd4aece6a0240e2b58cd6a225d

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
