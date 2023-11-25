Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CDF7F8A46
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Nov 2023 12:42:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36FE3E85;
	Sat, 25 Nov 2023 12:42:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36FE3E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700912544;
	bh=VR4ONSoi1dmZbqcHJA4iDAY9ZBVgqaWvZJaqGayNkjg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sPXevqkOGD0xL5u81iNG4obOfalgXA6ReQuWsezMajyJSL2Dn6myVN3hTB6SFFBNT
	 PwhyV4AoB9P8OtFLz8jgu3INNK07yD9Tz688WAueCGwAKmL4wNon4JU4Sm/d7LlDMv
	 gfOIuCh/qJMPquGcHEfeO5mgUP5eIf4DtCx2HjZc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 216C2F805AD; Sat, 25 Nov 2023 12:41:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C159F805AF;
	Sat, 25 Nov 2023 12:41:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CE69F802E8; Sat, 25 Nov 2023 12:37:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2480F80254
	for <alsa-devel@alsa-project.org>; Sat, 25 Nov 2023 12:37:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2480F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VqhQgZDj
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D4CF6608C3;
	Sat, 25 Nov 2023 11:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998F7C433C8;
	Sat, 25 Nov 2023 11:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700912235;
	bh=VR4ONSoi1dmZbqcHJA4iDAY9ZBVgqaWvZJaqGayNkjg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VqhQgZDjeKId25XdzOcwQiqFcpFDswmnOr7Be++RTCecGNzuXGiZBEq9f/+NdVNFV
	 GylX8ra562wzhxOBQXwVc/9qxyktIX+UTp4VXLbDY2n35JKMFiBxm0xtDqQ9ttOoCa
	 nVWq7yusIC5PxxUlPAGPNGKYFKC87Nrhyd3kG5bh/fnkvcQBeLhB4eO7YaCQ2VMxVe
	 NxWU+brVpsYBYpAA0sS+G1LLkBvlRaeXKXIgV7HWbPM9SaFX26MT6yxJI0suJSe3WA
	 RHAZKByUIOMpuqu2eEz/HLyQdJHvayNG1JQgX5MX3k+7bS7exVWCFrDGebenqX6mBX
	 Nk19bULOYD56A==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, seppo.ingalsuo@linux.intel.com
In-Reply-To: <20231124150853.18648-1-peter.ujfalusi@linux.intel.com>
References: <20231124150853.18648-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: SOF: ipc4: Add support for control change
 notification
Message-Id: <170091223327.2632109.13826831302853487867.b4-ty@kernel.org>
Date: Sat, 25 Nov 2023 11:37:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: KIMISFQFISDZ6DRAQWF4YA7X33UI4DDU
X-Message-ID-Hash: KIMISFQFISDZ6DRAQWF4YA7X33UI4DDU
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 24 Nov 2023 17:08:49 +0200, Peter Ujfalusi wrote:
> This series adds support for handling control (switch/enum) change notifications
> sent by the firmware.
> The use case is similar to what is already used by IPC3 version: the firmware
> can update the value of an enum or switch and sends notification to the kernel,
> which in turn will notify the user space of a change.
> 
> Regards,
> Peter
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: ipc4-topology: Helper to find an swidget by module/instance id
      commit: 5980bda0a998a6ee6afd83b97a482a40c1c68076
[2/4] ASoC: SOF: ipc4: Add data struct for module notification message from firmware
      commit: 1a307538c9cc274b3191b9a1380bbceece262626
[3/4] ASoC: SOF: ipc4-control: Implement control update for switch/enum controls
      commit: f5eb9945cf9c17eb016aa64c7de13875f259ea07
[4/4] ASoC: SOF: ipc4: Handle ALSA kcontrol change notification from firmware
      commit: 0ff23d460718641c80c8054425256391dca1ac7d

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

