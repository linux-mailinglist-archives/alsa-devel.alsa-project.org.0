Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A634DB995
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 21:40:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33ADB1890;
	Wed, 16 Mar 2022 21:39:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33ADB1890
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647463225;
	bh=hPywN4Hc+VWnx8HZ9pRvRyevbb+miQ7224hVJAhUwEY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DyHzgL66S2+hCppCyOoHopEQuu2ub3zpcm8WQHbyC1euQbl1WOEst915yiFFC4Qrh
	 9HBbWLWB01cThAMIFWnO8UK348iqc8JUyKu11jbXgdGY52iV63fkPonlYxTvjIrMc2
	 +DvAXY7joAo1KAINsxXbQhCOuuO8lx6WWSqcCLWI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A60E9F8055B;
	Wed, 16 Mar 2022 21:36:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A78EEF8055B; Wed, 16 Mar 2022 21:36:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45B5CF80558
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 21:36:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45B5CF80558
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="q8KJtzSL"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BF02961452;
 Wed, 16 Mar 2022 20:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9DC2C340E9;
 Wed, 16 Mar 2022 20:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647462971;
 bh=hPywN4Hc+VWnx8HZ9pRvRyevbb+miQ7224hVJAhUwEY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=q8KJtzSLaYTDnj4b6Z96x655UGVx8qCbRjp8AveB2+kJ3G++9OjVeMuJvYRWVLet2
 ve9k1OfO2ICO8m70pSilaF1yFsTBK0/Al7LC61drC1NgC4yxd9rhvWirl4pndSbRrZ
 y53pDJkz+qp7oLwxNtbrzk//sJ3rVdUWdr9/iVcoVwuHMu0W/Zb7q30dYfR9bAkchG
 AiM4Og29jwnUDsrVTxBMp5LcVdAYm/OGTnGcBvgNXKRxmq4zONkTG6NCK+dim5cDcZ
 pSZU0MyAWqAJxbEQRdRYYVKXH5GdIIoV7EWkiy/uzWamaa09QL5tMygwIk69mojpX/
 NwBGaCUHZBtUQ==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, tiwai@suse.com, judyhsiao@chromium.org,
 perex@perex.cz, alsa-devel@alsa-project.org, agross@kernel.org,
 swboyd@chromium.org, robh+dt@kernel.org, srinivas.kandagatla@linaro.org,
 lgirdwood@gmail.com, Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
 linux-arm-msm@vger.kernel.org, bgoswami@codeaurora.org,
 linux-kernel@vger.kernel.org, quic_plai@quicinc.com, rohitkr@codeaurora.org,
 bjorn.andersson@linaro.org
In-Reply-To: <1647355531-4150-1-git-send-email-quic_srivasam@quicinc.com>
References: <1647355531-4150-1-git-send-email-quic_srivasam@quicinc.com>
Subject: Re: [PATCH] ASoC: codecs: Fix misplaced lpass_macro_pds_exit call
Message-Id: <164746296665.1220201.1306280283439888806.b4-ty@kernel.org>
Date: Wed, 16 Mar 2022 20:36:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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

On Tue, 15 Mar 2022 20:15:31 +0530, Srinivasa Rao Mandadapu wrote:
> Update power domains exit function calling from runtime resume
> to remove function which was wrongly placed and causing crash in
> device suspend and resume.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: Fix misplaced lpass_macro_pds_exit call
      commit: 1c19601ddceda1517511e4bad3d24619e765c78c

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
