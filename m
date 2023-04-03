Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB76A6D4B7C
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 17:10:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E517B820;
	Mon,  3 Apr 2023 17:09:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E517B820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680534610;
	bh=lf4upq3FdpRAqhv049TEQuv0s9Un/cwgAomIIpEaq0s=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cHaMMvdfuYuw3Yua1KL89x5loaFdci+rZpLA7y7+rvo9hJN1CYI7ZgxG4ecJvo1L0
	 D8xHiJW3tWLXVpQ8r9hNZBhKRlMVsn6iM3zckm51/S8zx4sXzrrcCdC2QwjjzVosDa
	 ZJl1wBI3WHptyTvJ6AM7AlV4XqogUcv3lHtLUerY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 716CFF80544;
	Mon,  3 Apr 2023 17:08:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27655F8015B; Mon,  3 Apr 2023 17:08:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1EAF0F8026D
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 17:07:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EAF0F8026D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iKoGuZuQ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 20D1361FE1;
	Mon,  3 Apr 2023 15:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4266C4339B;
	Mon,  3 Apr 2023 15:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680534470;
	bh=lf4upq3FdpRAqhv049TEQuv0s9Un/cwgAomIIpEaq0s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iKoGuZuQuiB2AATagOH6QT06cLYsL9IFURw0gD3/EwCcErabq2543tv9bsmViTDXB
	 Ntl5DHlpgqVlZXvPmNd4vL6bsf1c03/hKV9DR5mtxuPdMqGgIMY0cbn29J/u68TUef
	 KU+pa+ddaDhqh8/zSWnYh9K7fdhpkUmCXXPvN5+q3Ik+VlkvZ3T0iAOPFPAW1cTsxZ
	 F0cOEI5nr96DvY+HgbJsiOsz9gjO22nE/nfp5/3pr9d53mF7/3AMweg9QiIKo+9vGF
	 DxRzecYn4/dw3M9u13AIKY5euxw/Bn9SgPflEgvmIk6vs3ehdH6OhK1tAAWikPn7ij
	 i2LrEc+qA57WQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20230328131018.6820-1-rf@opensource.cirrus.com>
References: <20230328131018.6820-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH v2] firmware: cs_dsp: Add a debugfs entry containing
 control details
Message-Id: <168053446957.47553.1396193248539137592.b4-ty@kernel.org>
Date: Mon, 03 Apr 2023 16:07:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: TQCESYU74T6IKDEOWBJMJWZQUT37PESS
X-Message-ID-Hash: TQCESYU74T6IKDEOWBJMJWZQUT37PESS
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Simon Trimmer <simont@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TQCESYU74T6IKDEOWBJMJWZQUT37PESS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 28 Mar 2023 14:10:18 +0100, Richard Fitzgerald wrote:
> The file named 'controls' in the DSP's debugfs root contains a
> formatted table describing the controls defined within the loaded DSP
> firmware, it is of the form
> 
>   name: len region:offset addr fwname algid ctltype flags en dirty
> 
> Where flags is represented as a character for each flag if set, or '-',
> enabled is whether the control is enabled or disabled and dirty is
> whether the control value is set in the cache but not the hardware.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] firmware: cs_dsp: Add a debugfs entry containing control details
      commit: 7a3f924cee4bdfe85eda4e636213e79d3fda6182

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

