Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 634FB63C2E7
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 15:43:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E492A1696;
	Tue, 29 Nov 2022 15:42:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E492A1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669733029;
	bh=C5ZoA8u7CjRfuYRa/p8LS+BgNNm4KfyQQxeH4LtrxiQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LvDPB2gkXyqS0JnTfHo3uzPsNnm+nH+kIhjI0NoycX4/124AI2iQk7Mt9cfBjY1Ck
	 j44lzG31ROjIexj8cURDzfj6aFhhb6sPLa0NQv02XJkE+cexgtKEubvZ1+BCqyIN74
	 u5K7oYP3N0agPk9GTNT+uYg9lu2/Dcj8KNXe8ICU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB980F80482;
	Tue, 29 Nov 2022 15:42:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F6A3F801F7; Tue, 29 Nov 2022 15:42:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10747F800B6;
 Tue, 29 Nov 2022 15:42:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10747F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Xf6SFudo"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8967F61778;
 Tue, 29 Nov 2022 14:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1A62C433D6;
 Tue, 29 Nov 2022 14:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669732958;
 bh=C5ZoA8u7CjRfuYRa/p8LS+BgNNm4KfyQQxeH4LtrxiQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Xf6SFudoEy7GIMULtvUWMiRkg5KY9wX+mngk6qerxcWP0globLzzXMje0gTEe0tGe
 C2s26B6VLRa2VUvzzeIZ6D5dk3zsVxBr3KmsrEkARFx0fHibTjWbtGsBJnY4OFDYCa
 61x3aNeTr6xkiR+N/01Z/U6yOdp4YJkdcS972Rn0jDqS3wigEGPiyDptnDJFXqQUCo
 lTcV9pRKjjgc3NmmmEOanZRc/RDCAiwU7HUeXrxiufLoU2Ihu0V9I4N/d25UTc/I1e
 k7aKv8P4h8CuQW/IiCvDtysCUenKjwqrnL0BO6ut8z26MseykaXXFJgkISlV0xrCfB
 iqr2TTRCWqb0A==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 V sujith kumar Reddy <vsujithkumar.reddy@amd.corp-partner.google.com>
In-Reply-To: <20221129100102.826781-1-vsujithkumar.reddy@amd.corp-partner.google.com>
References: <20221129100102.826781-1-vsujithkumar.reddy@amd.corp-partner.google.com>
Subject: Re: [PATCH v2 1/1] ASoC: SOF: Add DAI configuration support for AMD
 platforms.
Message-Id: <166973295442.182170.11091349433910086035.b4-ty@kernel.org>
Date: Tue, 29 Nov 2022 14:42:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, venkataprasad.potturu@amd.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, open list <linux-kernel@vger.kernel.org>,
 Rander Wang <rander.wang@intel.com>, Chao Song <chao.song@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Vijendar.Mukunda@amd.com, V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE \(SOF\) DRIVERS"
 <sound-open-firmware@alsa-project.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 ssabakar@amd.com
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

On Tue, 29 Nov 2022 15:30:59 +0530, V sujith kumar Reddy wrote:
> From: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
> 
> Add support for configuring sp and hs DAI from topology.
> 
> Signed-off-by: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
> 
> Changes since v1
>     -- Apply on latest broonie-git for-next
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Add DAI configuration support for AMD platforms.
      commit: 75af41991955205fa0958feb587ce22b35aaa7b0

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
