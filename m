Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB300560212
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 16:07:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41AE1166C;
	Wed, 29 Jun 2022 16:06:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41AE1166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656511664;
	bh=1LQiXmBKTuoLLVX2WnRC35eSF4hNdTcSZ5mG47kAXVI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=skH6EXM/3Ljkrfd6OOo6GvVg3ZnwgFTaF4/UNgkZ2iz9itvKpSbio/4yk6FMDkVkr
	 CRhKac+9dDLtLQP/h2S7NtSomtQwOiPAZGQTQiEFase29AIAXyZlbX4ct+lwY/QEe3
	 mnK/qAH8EIpZrqMKZ9VV05ytgClcJY9LXJhHUsmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9D06F80539;
	Wed, 29 Jun 2022 16:06:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1081EF804E6; Wed, 29 Jun 2022 16:06:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76BD2F80158
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 16:05:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76BD2F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QgK/lOfl"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E404E61EB7;
 Wed, 29 Jun 2022 14:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9053C341C8;
 Wed, 29 Jun 2022 14:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656511557;
 bh=1LQiXmBKTuoLLVX2WnRC35eSF4hNdTcSZ5mG47kAXVI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=QgK/lOflsccYXb2DJBBYJq/7Mf7JKwqYiQmoWe1I31oqon7gn4CZzZRX7yz2bdzwb
 ezXucMoklN8+FlYHS7yTmoStl9c0pwLT0tSWEKF+/F2RuMRhmX64VcTIKw7/pr3SA3
 1ADgB/CajiR/y6sC8dAXfQ69+ShA57b62pv5wCaYcb1E+71giUjBRcC00lRLBwoLli
 O2QkbR71LCYwIdEC2Ih+b+O9NDpBl6AdpgDReTt9GQ3ZrD1BPx8SZdul65f4cuGNGQ
 HOXL6/IW/YID0a1TFb596BKRZQIfilw3s+6GnaW6EptvB8yInPJNX2YPilmilC9RXn
 yig/IWtz+Y7Kg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, shengjiu.wang@nxp.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <1656386005-29376-1-git-send-email-shengjiu.wang@nxp.com>
References: <1656386005-29376-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: fsl,
 micfil: Convert format to json-schema
Message-Id: <165651155548.1437597.5728269652830788201.b4-ty@kernel.org>
Date: Wed, 29 Jun 2022 15:05:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: shengjiu.wang@gmail.com
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

On Tue, 28 Jun 2022 11:13:25 +0800, Shengjiu Wang wrote:
> Convert the NXP MICFIL binding to DT schema format using json-schema.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: fsl,micfil: Convert format to json-schema
      commit: 02d91fe47100a29a79fcb8798e45c22591ca852d

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
