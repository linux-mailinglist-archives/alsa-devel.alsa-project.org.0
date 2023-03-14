Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9546B98B3
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Mar 2023 16:13:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BB25139D;
	Tue, 14 Mar 2023 16:12:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BB25139D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678806824;
	bh=cqjWnOQ2KjM5yIxe8EWcq8OyhFIRiQZoz8xrOP744I8=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=um5T8AHblHwXOD7En/BzqqPCeFKJJid7o+iQUPISbNR/Qv9CZHNr4qgW0iL0tIIxt
	 ueeG1VsjGwStGEEXoxxA0cWSjWUzaPPZZ9JEI1+BTYt7BRJDHShULkVgKgowE0CW60
	 3Jo5+ho7BGguoaX0gXZGJtEk/L4XVOTyyJenl0NQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99B27F8051B;
	Tue, 14 Mar 2023 16:12:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5E6BF804FE; Tue, 14 Mar 2023 16:12:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3520F80482
	for <alsa-devel@alsa-project.org>; Tue, 14 Mar 2023 16:12:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3520F80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cErnzGrh
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B084F617BB;
	Tue, 14 Mar 2023 15:12:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 895CBC4339C;
	Tue, 14 Mar 2023 15:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678806744;
	bh=cqjWnOQ2KjM5yIxe8EWcq8OyhFIRiQZoz8xrOP744I8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cErnzGrh5bhjwuO7mbxX2JFxDvGKX/mJEdHSPVv+oqoFOoa1eVTiTXmRY27DaIF1a
	 fwExtMnygsL3hr2zg44cHSSeDD7xVOTvUK50C2YbdI0BLuJhvp6f7TmF8dcvea0HSM
	 TkId1w7cTSIL/dVTqcW3GWQtjZeXlVgB01REZ7/aMDCg/rBzd3MzlH3GPihn2Ciz7N
	 W3kewyy0T1FhdGL73E9qYeY+427DB8uiVA9qn5Xm59OU1987UHtKUX3cX18gj8ZlEY
	 82qpaL0az+co7L4vcQYGl0HIVKUHh2mz1OmSD081GGDk6+1JBY1ZsP/xhydrOyIFBn
	 KkeMXxFB8AdDg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230313110344.16644-1-peter.ujfalusi@linux.intel.com>
References: <20230313110344.16644-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/7] ASoC: SOF: ipc4: Add support for bytes control
Message-Id: <167880674218.43040.7241130817496445123.b4-ty@kernel.org>
Date: Tue, 14 Mar 2023 15:12:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: D6D6DYJBUGIQOBW2ID54X2SBPBDYIE4F
X-Message-ID-Hash: D6D6DYJBUGIQOBW2ID54X2SBPBDYIE4F
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, libin.yang@intel.com,
 jaska.uimonen@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D6D6DYJBUGIQOBW2ID54X2SBPBDYIE4F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 13 Mar 2023 13:03:37 +0200, Peter Ujfalusi wrote:
> This series will add support for bytes control and topology types.
> With IPC4 only the binary payload is sent to the firmware via LARGE_CONFIG
> message (which does similar multi-part message handling as the IPC3 control
> message did).
> 
> The bytes payload itself is not checked by the kernel but user space expected to
> wrap it in sof_abi_hdr struct in order to get the target information of the
> binary data.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: SOF: ipc3-control: Rename snd_sof_refresh_control()
      commit: 3eac8de3f51b3567c4ba6139736b59027da56285
[2/7] ASoC: SOF: ipc3-control: Merge functions to handle bytes_ext get variants
      commit: 76fc628aebdb452e3c620d9ff5c5e9448d316754
[3/7] ASoC: SOF: uapi: header: Convert sof_abi_hdr comments to kernel style
      commit: 2e4ef6f4798c1d2951dd7bb3ae5f0d41ec3d31e8
[4/7] ASoC: SOF: uapi: header: Update sof_abi_hdr doc for IPC4 use
      commit: ea4a4e82f625ae451175a2a74779776b006d25a1
[5/7] ASoC: SOF: ipc4-control: set_volume_data only applies to VOLSW family
      commit: dc47ef4f8f6426cd625eb4057e174541e7c23ccd
[6/7] ASoC: SOF: ipc4-topology: Add support for TPLG_CTL_BYTES
      commit: a382082ff74b036944cbc5b6ad29b65f633acd3a
[7/7] ASoC: SOF: ipc4-control: Add support for bytes control get and put
      commit: a062c8899fede2ab5660a817e9b602d3fa280a99

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

