Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD583F72ED
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Aug 2021 12:24:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DAC0167D;
	Wed, 25 Aug 2021 12:23:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DAC0167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629887082;
	bh=aSw0cYg8pm1YpmSlIfShp0oFUe+o66pjQZD/ue8nx7U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oBUuvAXVWPfL03BhxkaD6YFcX04hQKnwk7dYheSXZ4DK5TUrH7CfKaaroovK7qo7W
	 xIPc1w7J6FW520gRm3NNDTfNnkC3jUuawPqfqhalPWb5nE/G7/BQ1Q4f6mutQlITe8
	 dcKm0WYBh336/co3TJOAYIHhxG2F7K4HcsApEApk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11E72F80240;
	Wed, 25 Aug 2021 12:23:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E015F8020D; Wed, 25 Aug 2021 12:23:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8405CF80171
 for <alsa-devel@alsa-project.org>; Wed, 25 Aug 2021 12:23:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8405CF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="a6pCHwq+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 988186120A;
 Wed, 25 Aug 2021 10:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629886996;
 bh=aSw0cYg8pm1YpmSlIfShp0oFUe+o66pjQZD/ue8nx7U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a6pCHwq+W37Vca+6PO7MFagSCJAHN1FyCXp2CbRoMMSY2CFXOwiPxIPsXTiPXKXpC
 9qTnfQ6cknl3Sn4UfcAeMTCwEvzkwrWMDQ/QKCCUzoc56NIzdJghGyfUzxSXEy5NMv
 JZ1G/81gDBZfh5MKewFvY82vbD1on2dOeBfAxwawW3GbpI68GRUCPhgi2WRqaCo4O9
 XUpOkT+rFAOKA1ja7mMji9/vtQQsT8WvkbPI1Jk5yFzCfLpeyXmOPbcl9AH+sny/pH
 WdvjU1HHWi/loFwSoxwPZGaxdd3oTCr4ErPGsKeR08YxfEt7jb8REj7Kw0pBPjnEct
 sqFBCsg7K6i1g==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, matthias.bgg@gmail.com, Trevor Wu <trevor.wu@mediatek.com>,
 robh+dt@kernel.org, lgirdwood@gmail.com
Subject: Re: [PATCH v5 00/11] ASoC: mediatek: Add support for MT8195 SoC
Date: Wed, 25 Aug 2021 11:22:39 +0100
Message-Id: <162988521424.7213.9083414971201440076.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210819084144.18483-1-trevor.wu@mediatek.com>
References: <20210819084144.18483-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, bicycle.tsai@mediatek.com, linux-kernel@vger.kernel.org,
 jiaxin.yu@mediatek.com, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, wenst@chromium.org, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org
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

On Thu, 19 Aug 2021 16:41:33 +0800, Trevor Wu wrote:
> This series of patches adds support for Mediatek AFE of MT8195 SoC.
> Patches are based on broonie tree "for-next" branch.
> 
> Changes since v4:
>   - removed sof related code
> 
> Changes since v3:
>   - fixed warnings found by kernel test robot
>   - removed unused critical section
>   - corrected the lock protected sections on etdm driver
>   - added DPTX and HDMITX audio support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: mediatek: mt8195: update mediatek common driver
        commit: cab2b9e5fc0e868ed8453ef4f433c795bda8bf84
[02/11] ASoC: mediatek: mt8195: support audsys clock control
        commit: d62ad762f67585acfb5e03f71b28a52dc4604cf2
[03/11] ASoC: mediatek: mt8195: support etdm in platform driver
        commit: 1de9a54acafba2f0e3ea2856ad0b22556d59ec45
[04/11] ASoC: mediatek: mt8195: support adda in platform driver
        commit: 3de3eba588bb7f6c39bf12de5761ff75c53b9961
[05/11] ASoC: mediatek: mt8195: support pcm in platform driver
        commit: 1f95c019115cc503c4c47fd7108675a56cdb29b4
[06/11] ASoC: mediatek: mt8195: add platform driver
        commit: 6746cc858259985a945a07075a19ec4d24352407
[07/11] dt-bindings: mediatek: mt8195: add audio afe document
        commit: b5bac34fcfb444e33f532e291ad1394ca05887e8
[08/11] ASoC: mediatek: mt8195: add machine driver with mt6359, rt1019 and rt5682
        commit: 40d605df0a7bf7723ed690f502f364c5320de440
[09/11] ASoC: mediatek: mt8195: add DPTX audio support
        commit: e581e3014cc4acee9025aa5704cf85a36a572b95
[10/11] ASoC: mediatek: mt8195: add HDMITX audio support
        commit: ef46cd42ecf00f0468df3ad1bf0f30db9634a04a
[11/11] dt-bindings: mediatek: mt8195: add mt8195-mt6359-rt1019-rt5682 document
        commit: 5f8c991e8950971cd1f81b61f79c83a511ad9fc8

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
