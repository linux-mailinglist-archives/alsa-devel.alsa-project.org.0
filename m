Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A41F738B8CE
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 23:10:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47AC916AA;
	Thu, 20 May 2021 23:10:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47AC916AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621545055;
	bh=LG9V/TQafsoAsE88DwTNEoOzd9py69hLE9jxEkJQCPU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j0JhdQ01kSA3HL1IApQVJvpDaxNkHdet9yNoAJsrRp0PIDUUb5IiCp+OMvXmRMlFN
	 /RIm5S3TIAKhqpedgIz/N9lM8411mAVq4vqcbgs1qxK9dsYHagiBs8WfF2xNwoABwV
	 2+nxr029+N0efz6ZonAADiOAl2oZaMrHwNucv1To=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BCDAF800C8;
	Thu, 20 May 2021 23:08:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB16EF80482; Thu, 20 May 2021 23:08:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 363F4F800C8
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 23:08:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 363F4F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EbMNMGWo"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 865D561353;
 Thu, 20 May 2021 21:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621544907;
 bh=LG9V/TQafsoAsE88DwTNEoOzd9py69hLE9jxEkJQCPU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EbMNMGWokIwMGVWGnzQ6B+yMcpTNPUl9VU02RDoGJAUjKWfdRVyoIus65bfiMQnbL
 L1micb+F1YUSYQHmtXAt84+JpWWAT8CmSMPTIw4YdENcJ9zrsL2t0s0w7wzHWP/o70
 7KwKB+7x1U4vOs/vG5TpIuoFRxXWQmihTEnUFAk2gQd8nvU5VA7Z/iFoBJSy9OnxTa
 Ez6fNGw1yupI+1xIpvwgYzUbkIM8b+E10bDeOW6ucfcXROjM0IhsL8lPQyBi5kj58T
 PvncV6jUEBkpvh2Yi9TbRV6Hr8XAbSOnKrjLqzkRvDz9/ozc6UiQBSMisTnlNNOFfg
 ZMdvDdS0F5v2w==
From: Mark Brown <broonie@kernel.org>
To: linux-imx@nxp.com, perex@perex.cz, linux-arm-kernel@lists.infradead.org,
 nicoleotsuka@gmail.com, festevam@gmail.com, shawnguo@kernel.org,
 Xiubo.Lee@gmail.com, alsa-devel@alsa-project.org, timur@kernel.org,
 s.hauer@pengutronix.de, Shengjiu Wang <shengjiu.wang@nxp.com>,
 robh+dt@kernel.org, kernel@pengutronix.de, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: imx-card: Add binding doc for
 imx sound card
Date: Thu, 20 May 2021 22:08:06 +0100
Message-Id: <162154465460.5161.5323165215525240615.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1621247488-21412-1-git-send-email-shengjiu.wang@nxp.com>
References: <1621247488-21412-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On Mon, 17 May 2021 18:31:27 +0800, Shengjiu Wang wrote:
> Imx-card is a new added machine driver for supporting
> ak4458/ak5558/ak5552/ak4497 codec on i.MX platforms. But these
> DAC/ADCs are not only supported codecs. This machine driver is
> designed to be a more common machine driver for i.MX platform,
> it can support widely cpu dai interface and codec dai interface.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: imx-card: Add binding doc for imx sound card
      commit: 623cd9cfcac522647e3624e48bf0661a39e8502a
[2/2] ASoC: imx-card: Add imx-card machine driver
      commit: aa736700f42fa0813e286ca2f9274ffaa25163b9

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
