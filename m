Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBC26ABFD0
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 13:47:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CD011102;
	Mon,  6 Mar 2023 13:46:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CD011102
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678106857;
	bh=M8Fca/wf+XTVeBzks1jMo/X3kmYpve3MqRuDj/MCnQU=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Osdusj/VlNis0aVJ961yg3vSDvpRNEJgri8sdWbdivODQSqMIewkrSHS4YoOTkNZ9
	 XNMOyssdEki4fUqgHN5UE+NjnD6PzjE9QHUSWyuMMfBy0/U1D5ktX+9PjR2aeDzZSk
	 ndmzFZSzE5okxrnDp3dcv0jMw26zmmXIP5Hatt9k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EB1EF804B1;
	Mon,  6 Mar 2023 13:45:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A67E6F8042F; Mon,  6 Mar 2023 13:45:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 365CDF8007E
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 13:45:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 365CDF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KPylVtAD
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9776660DD0;
	Mon,  6 Mar 2023 12:45:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 418D6C433D2;
	Mon,  6 Mar 2023 12:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678106742;
	bh=M8Fca/wf+XTVeBzks1jMo/X3kmYpve3MqRuDj/MCnQU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KPylVtADQ1OYdqau4QxjVz4PV+nPFGoLT2985BYcf3qLeTde/xndLjzM5TxKQG8uk
	 TNmw8pj/OSGD1Ia7mcO7tNV9/Z82FUGqIW9IApA/dDYEwm2XFhFyVVahX3V+DOFvzR
	 yjkd5/++N4bASwz0AQuh2dWqjtIM28sUkdjkCZEz8PD4HZBAfyPcwhbDrHCzQEb6Ag
	 amSo41Zz/YPl5y152vW2ZIlfWWfyXIJQCNNZeG6w8aBY3T+FyM9h38rB0QTMsklFr6
	 jHnsvLsAeqRP/VSEkJINesGZ8PJdVHdImGZpHAsLPvUQolV76la4ftSGipf9ukyV+1
	 ci9v03mAwtM4g==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20230303093410.357621-1-luca.ceresoli@bootlin.com>
References: <20230303093410.357621-1-luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] ASoC: clarify that SND_SOC_IMX_SGTL5000 is the old
 driver
Message-Id: <167810673999.45838.8887941994878388460.b4-ty@kernel.org>
Date: Mon, 06 Mar 2023 12:45:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: PYJ7RM7I6LZI5RZ2UTP62TDNX574G5E2
X-Message-ID-Hash: PYJ7RM7I6LZI5RZ2UTP62TDNX574G5E2
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Viorel Suman <viorel.suman@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PYJ7RM7I6LZI5RZ2UTP62TDNX574G5E2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 03 Mar 2023 10:34:10 +0100, Luca Ceresoli wrote:
> Both SND_SOC_IMX_SGTL5000 and SND_SOC_FSL_ASOC_CARD implement the
> fsl,imx-audio-sgtl5000 compatible string, which is confusing. It took a
> little research to find out that the latter is much newer and it is
> supposed to be the preferred choice since several years.
> 
> Add a clarification note to avoid wasting time for future readers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: clarify that SND_SOC_IMX_SGTL5000 is the old driver
      commit: 03d0f97fdb45c99cf6f808832db8bd5534e22374

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

