Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 163666756F9
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 15:22:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D1F316FC;
	Fri, 20 Jan 2023 15:22:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D1F316FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674224578;
	bh=O2DLXPO6MhsyTB89fm7zdE+nWTN52RPQ1lrd1S6Urk4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=P2zdV+iQ76+TExmcFLuyVSihSMjPk5h4rHhDjF0LZ4V0srpdzGyB6yoTknvPOuT+1
	 aeolOp0ThxHM9tAlPZ+PLQaAFb0Udjs1g+AfnPTJBNRK1co17Ynl7Iab8Z8FroiqJN
	 7LEoZzkrCO2FjTRfBgH6ydJWqnU9JVQ5zNv+lRMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48892F80495;
	Fri, 20 Jan 2023 15:21:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE101F804A9; Fri, 20 Jan 2023 15:21:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 336CFF80495;
 Fri, 20 Jan 2023 15:21:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 336CFF80495
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jfjbZD97
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F0E1961F5F;
 Fri, 20 Jan 2023 14:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4F1C433AA;
 Fri, 20 Jan 2023 14:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674224485;
 bh=O2DLXPO6MhsyTB89fm7zdE+nWTN52RPQ1lrd1S6Urk4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jfjbZD97KEtplE21rjRbIcyoiwp5hrkruQsWya6xv6RQci0elOvNi5Ifmzbr2RVdF
 wURh1Rv2KBUZr2DXAwio5iDiaVARvDfl44X7swPAYttuY1syxPoz4mE5ivXgmXg96P
 0R9qM8eqjtymzsjW4SLibjSbBPk5RWE84xWr9czyfp11C46icQH1WBDzgKsT0zjrLb
 eb9kLXDf1H7z1qxlexKGQ6/7bX7x2Zn5laDebck6bsFRjI5rNv4dvDhh/0/inBxJpt
 W7B4Z2HKXOYDIT6cVRtN+3eSPjUtZ45o2hhL62wSJpDaXQAScJhgGFUufLSC96o7vh
 qHkWYq0vd7b1A==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Dan Carpenter <error27@gmail.com>
In-Reply-To: <Y8laruWOEwOC/dx9@kili>
References: <Y8laruWOEwOC/dx9@kili>
Subject: Re: [PATCH] ASoC: SOF: ipc4-mtrace: prevent underflow in
 sof_ipc4_priority_mask_dfs_write()
Message-Id: <167422448135.1273927.7280697250336650251.b4-ty@kernel.org>
Date: Fri, 20 Jan 2023 14:21:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-77e06
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
Cc: alsa-devel@alsa-project.org,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 kernel-janitors@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 cip-dev <cip-dev@lists.cip-project.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 sound-open-firmware@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 19 Jan 2023 17:58:54 +0300, Dan Carpenter wrote:
> The "id" comes from the user.  Change the type to unsigned to prevent
> an array underflow.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-mtrace: prevent underflow in sof_ipc4_priority_mask_dfs_write()
      commit: ea57680af47587397f5005d7758022441ed66d54

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

