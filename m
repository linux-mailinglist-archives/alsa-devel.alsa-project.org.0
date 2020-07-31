Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 683E5234B62
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 20:58:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11856169B;
	Fri, 31 Jul 2020 20:57:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11856169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596221904;
	bh=PCVI7it4La+iAm7gLF858FWk5mugOv7XiT+zX461Eec=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GzX8ADw0CNmSeU5QTxZwAOIcUMTxQXKPvni0Abt/T41eN5gY2nu2yj4NgifSv0dwF
	 oq7nYD6mbHBa0r100CSZPt6aIDb/xAonuSI96RkjyxvnON4/fMkNV63coruVd12d1i
	 mRT6nZi4LP5cDBaSKUN7oDn5DaAZtH8XAScD6i98=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A2F1F802E0;
	Fri, 31 Jul 2020 20:55:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BB52F802DF; Fri, 31 Jul 2020 20:55:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53D75F802DB
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 20:55:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53D75F802DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="14qsg1bv"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1A4852076B;
 Fri, 31 Jul 2020 18:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596221711;
 bh=PCVI7it4La+iAm7gLF858FWk5mugOv7XiT+zX461Eec=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=14qsg1bvHyQrGBtkg+IFfouvo5V7ZnNYZYqAPL7/NgB1WEf71l+lp6A63xGiutdYx
 3UBXiqEQULvrO5duCdpKGMiBKoIq9/v4GjgR/CD+wrnXOwX3T8hsq08IQ+O2I3j7df
 GA6cIqt96HhvB6GzGwM4vR6XDpOC86ue0WmstkFM=
Date: Fri, 31 Jul 2020 19:54:51 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, tiwai@suse.com, nicoleotsuka@gmail.com,
 linux-kernel@vger.kernel.org, festevam@gmail.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 Xiubo.Lee@gmail.com, lgirdwood@gmail.com, perex@perex.cz, timur@kernel.org
In-Reply-To: <1596176895-28724-1-git-send-email-shengjiu.wang@nxp.com>
References: <1596176895-28724-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Fix value of FSL_SAI_CR1_RFW_MASK
Message-Id: <159622167150.22822.11843570099946716811.b4-ty@kernel.org>
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

On Fri, 31 Jul 2020 14:28:15 +0800, Shengjiu Wang wrote:
> The fifo_depth is 64 on i.MX8QM/i.MX8QXP, 128 on i.MX8MQ, 16 on
> i.MX7ULP.
> 
> Original FSL_SAI_CR1_RFW_MASK value 0x1F is not suitable for
> these platform, the FIFO watermark mask should be updated
> according to the fifo_depth.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Fix value of FSL_SAI_CR1_RFW_MASK
      commit: 5aef1ff2397d021f93d874b57dff032fdfac73de

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
