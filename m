Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E716C69F1
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 14:51:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EB5DEC9;
	Thu, 23 Mar 2023 14:50:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EB5DEC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679579504;
	bh=OQKP1F3tlBZ6sra4wC2k5OiScd+cqQpojwW0mTkO2w0=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FVNbsD0a7R7Zy9dNcAYDHb1lzV4rEkRp/WJkaPZwxpvLmehjCE2w8yKWunAgo8/du
	 illu/THfwZLyedu9RfQbuhY6hauhRUQp0kpuZlpUn0lMOF4zEOxRld0slMsrMiQ4EV
	 DHlMDMqGqtlyRmDpZHk3JjuTuNJHw3xflsZuyyLw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E16DF804FE;
	Thu, 23 Mar 2023 14:50:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE2F7F80482; Thu, 23 Mar 2023 14:49:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0873F80254
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 14:49:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0873F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=objQDM4I
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A09AC626D2;
	Thu, 23 Mar 2023 13:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E95BC4339C;
	Thu, 23 Mar 2023 13:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679579395;
	bh=OQKP1F3tlBZ6sra4wC2k5OiScd+cqQpojwW0mTkO2w0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=objQDM4I4H0tKSfP320A6WpVFIaBHuuuFvIcfVTvw/Cp8dsU9Ey4A+r+oDKdqCFJx
	 k9luy3ZYSwo7cDqpQGIC27ikMX9TysDUTp0r8pDFleZrRi4Mp9WLsxQt4Q8fHCBMJ1
	 18cBkvPPTnm+owKXeC6LMJmSMGBGM68c9aw2QjYcpu73ZS0MJdmq8c5VRUPEAVC1+m
	 CgeDRaGB/C/+E+JofJ3M25i54Mf7F6iFB+Ti7q/VtQIv8+fMmJe4lbvpe6Tt3cbbcq
	 BxMnoDIF55oznIsPwKQQsw6cktnsbYQWX9dyEmbmpWpqxX5DxAMG18Bxu9m1luuHfl
	 uIgNfKXjuvefQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230321145651.9118-1-peter.ujfalusi@linux.intel.com>
References: <20230321145651.9118-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: SOF: ipc4-control: Return on error in
 sof_ipc4_widget_kcontrol_setup()
Message-Id: <167957939378.26985.6396240503012708805.b4-ty@kernel.org>
Date: Thu, 23 Mar 2023 13:49:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: HEPMMTPZVVRM57S6BJETVN2TGG2TJ5P5
X-Message-ID-Hash: HEPMMTPZVVRM57S6BJETVN2TGG2TJ5P5
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 error27@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HEPMMTPZVVRM57S6BJETVN2TGG2TJ5P5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 21 Mar 2023 16:56:51 +0200, Peter Ujfalusi wrote:
> The patch adding the bytes control support moved the error check outside
> of the list_for_each_entry() which was not correct as at the end of the
> list_for_each_entry() the scontrol will no longer point where the error
> happened, but it to the list head.
> 
> Restore the original logic and return on the first error with the error
> code.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-control: Return on error in sof_ipc4_widget_kcontrol_setup()
      commit: 1c12e032cc43256d75fdd22e60a7df85e8df4549

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

