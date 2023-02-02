Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 189F0688596
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 18:38:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 503FC1E8;
	Thu,  2 Feb 2023 18:37:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 503FC1E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675359483;
	bh=KP9QG+sF1vvAP8/fJTd2GxrPLXDXXes9zY/KqqcMzXQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IBdLgwrd8yCopA5djzOky9vWIZfzAZuxykIdCeU37ya8lvJbFtJMcVglrC4o8WG1E
	 ElnpjzhltmHn7Dl+tcj0GyYtuGWBRWTynUP4h2TldQ40ncrNHiJMHMrnme0NM3oxwx
	 X9c0tNZK129mzV2uJJ/kIqE5yeqEnifUUxfnwhfw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2A01F804DF;
	Thu,  2 Feb 2023 18:37:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF15CF804C2; Thu,  2 Feb 2023 18:37:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C6CFF80169;
 Thu,  2 Feb 2023 18:36:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C6CFF80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qJgdXMIO
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5F2ABB8275C;
 Thu,  2 Feb 2023 17:36:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0ADCC433EF;
 Thu,  2 Feb 2023 17:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675359411;
 bh=KP9QG+sF1vvAP8/fJTd2GxrPLXDXXes9zY/KqqcMzXQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qJgdXMIOKV+BIEjYZHCjYi0ndbfkZikCDfUjoKCzrcUQtarRubsV6+lKykcbbnMze
 VxEy0cBTDBiab9BBFXFMmmCQt3uwkdTEisKHs9+dyB19LF36i8XYUFj2hzji8lTpyj
 oqs3djFZfAM5aWSzGjHVYrH57LOMbwojMGRaMiLdv2qxuusATlJQoeem1+51QBMfhM
 GOjDGECr3IxaAoCyLItm9LK2egmjAGk1Fxus2MMqPDvaTWxE+8g8zuLZmhx+GZnzPK
 oJSSCA9/6HghTfGM29l62ITB32XMot5iUdf0+/AuGVKrO22mLbGnOlwxFSuky36Vn0
 OtzAo2eQePIag==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, 
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
In-Reply-To: <20230203123254.1898794-1-Vsujithkumar.Reddy@amd.com>
References: <20230203123254.1898794-1-Vsujithkumar.Reddy@amd.com>
Subject: Re: [PATCH] ASoC: SOF: amd: Fix for handling spurious interrupts
 from DSP
Message-Id: <167535940664.1002862.2489220522555148757.b4-ty@kernel.org>
Date: Thu, 02 Feb 2023 17:36:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
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
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Sunil-kumar.Dommati@amd.com,
 ssabakar@amd.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 venkataprasad.potturu@amd.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Vijendar.Mukunda@amd.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE \(SOF\) DRIVERS"
 <sound-open-firmware@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 03 Feb 2023 18:02:52 +0530, V sujith kumar Reddy wrote:
> As interrupts are Level-triggered,unless and until we deassert the register
> the interrupts are generated which causes spurious interrupts unhandled.
> 
> Now we deasserted the interrupt at top half which solved the below
> "nobody cared" warning.
> 
> warning reported in dmesg:
> 	irq 80: nobody cared (try booting with the "irqpoll" option)
> 	CPU: 5 PID: 2735 Comm: irq/80-AudioDSP
> 		Not tainted 5.15.86-15817-g4c19f3e06d49 #1 1bd3fd932cf58caacc95b0504d6ea1e3eab22289
> 	Hardware name: Google Skyrim/Skyrim, BIOS Google_Skyrim.15303.0.0 01/03/2023
> 	Call Trace:
> 	<IRQ>
> 	dump_stack_lvl+0x69/0x97
> 	 __report_bad_irq+0x3a/0xae
> 	note_interrupt+0x1a9/0x1e3
> 	handle_irq_event_percpu+0x4b/0x6e
> 	handle_irq_event+0x36/0x5b
> 	handle_fasteoi_irq+0xae/0x171
> 	 __common_interrupt+0x48/0xc4
> 	</IRQ>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: amd: Fix for handling spurious interrupts from DSP
      commit: 2e7c6652f9b86c01cbd4e988057a746a3a461969

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

