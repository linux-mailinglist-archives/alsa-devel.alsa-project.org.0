Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 389057BBDF3
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 19:46:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E6FE1DD;
	Fri,  6 Oct 2023 19:45:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E6FE1DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696614404;
	bh=TDpf7Zays0i5xYa3D0s7/h7z4/kVQ5biiVskG163g/U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IgPAn5FXQbjPifrSSJEoGfDKp9jB0wiJGHPzFylJlmCKl4o0NjEsro0Io8IKBoW8x
	 NR5dU7aZd9f2SptguTcOOVvfB7ZXWEmsqed6I3BvAwDuJZXJ6+C43uozyyV04SWm9W
	 /YAKYMc1FDFfFH6rI7oxs7EcAKsF3ZdPUAP1+Myo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFEDBF80551; Fri,  6 Oct 2023 19:45:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43BA1F80310;
	Fri,  6 Oct 2023 19:45:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF0F2F80549; Fri,  6 Oct 2023 19:45:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D53A9F80166
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 19:45:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D53A9F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CSxq9UX2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 018C4B829C4;
	Fri,  6 Oct 2023 17:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C95ECC433C7;
	Fri,  6 Oct 2023 17:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696614337;
	bh=TDpf7Zays0i5xYa3D0s7/h7z4/kVQ5biiVskG163g/U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CSxq9UX2iLHEdtldpALXjKuaDKmV/VgD99oBHuLy94opX0uR2JFsKXsjIlLZgKnh3
	 2GCRX3VnNDmUuJ20VzRQX1CDCnTT5q2wRy84Q1VR1GK84X4H/AXj2yJQQH47yYiSDQ
	 LveK7A5Q8jC2SWgnP1ApFQOSM5KynFvlwIdGR90PPtJdvXFdd8QWZpAeZkeFLGuwkh
	 Tf+FdFIAydQ2JNi4CRyaK78XMffFZZgbw/Qq25+KX9YX3WUgXiu8z+2a3oH7RBuGKn
	 JRZNxKdUTOrvc6qTCHbIGrkB+QvUACh7Kqo1VJMqKyfhpfTL7Ojqum8eorfsibZB29
	 vn+7q7nUV78Hw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
In-Reply-To: <20231006084454.19170-1-peter.ujfalusi@linux.intel.com>
References: <20231006084454.19170-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: ipc4: Take priority into cosideration
 when sorting pipelines
Message-Id: <169661433550.222574.4025409220042329587.b4-ty@kernel.org>
Date: Fri, 06 Oct 2023 18:45:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: FE6PWVTJHIIF7RSO7EWPJTMLVODRWPW5
X-Message-ID-Hash: FE6PWVTJHIIF7RSO7EWPJTMLVODRWPW5
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FE6PWVTJHIIF7RSO7EWPJTMLVODRWPW5/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 06 Oct 2023 11:44:52 +0300, Peter Ujfalusi wrote:
> Add pipeline priority support for IPC4: Add support for parsing pipeline
> priorities from the topology. This will be used to break the tie between
> pipelines to set the trigger order when multiple pipelines are triggered
> simultaneously.
> 
> Regards,
> Peter
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: IPC4: get pipeline priority from topology
      commit: ae67b6371d0432e3fe25993189e89f814ec1e4d0
[2/2] ASoC: SOF: IPC4: sort pipeline based on priority
      commit: 4df7d6a61f2c0e0920f4f4caa02e41797974a487

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

