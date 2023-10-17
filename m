Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 794477CD0F9
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 01:42:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B42F3200;
	Wed, 18 Oct 2023 01:41:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B42F3200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697586147;
	bh=PZdgpkAaVuDpoTwI/pZyJZapPPLuDvDgBIRrvAyEbiQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lFkqMkK57hhUom6Pkpi+g1zNcGYnCB9uwlY9U7dDdsx51Y0Qgvj6F/BE4JJIPMMMv
	 zoq5Jge+hJFoei193DH7N8QNtiORa6xZgHesKeud/h2uJeuWe/LZCrlsMUk3VOvby7
	 PmBg13l95w6VDJTzERAlrdd+sVrK7zfSV9WANa6k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17B3EF80536; Wed, 18 Oct 2023 01:41:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FF25F8024E;
	Wed, 18 Oct 2023 01:41:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4BC4F8025F; Wed, 18 Oct 2023 01:41:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EAE0DF800C9
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 01:41:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAE0DF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bRY2AgSW
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 75016615FD;
	Tue, 17 Oct 2023 23:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FA1C433C7;
	Tue, 17 Oct 2023 23:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697586085;
	bh=PZdgpkAaVuDpoTwI/pZyJZapPPLuDvDgBIRrvAyEbiQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bRY2AgSWcAGt7Faxr0pff/R5TZ0PCaZdVM/Nnc9xLEZSgst8aYVWc9WYaPR45sYqW
	 0ionzrtvgbHwYnxQLiKq63XODvQ9aE3XVmwDjT/khPAzIiRR/EpTDuVddx0Ke0dNrH
	 gfjHTnldy/RVmFdal81wXF8SJVBjqfslXwXQqkhYnx7fg4hGSwgAfDjNRMqWaxZVOv
	 OvDC009YBkxtmxsGmpIPbmqUzme6LSSYws0XQwIHEzr+eCTdVi7osu/CTD6wa5fCJ0
	 7Q6XCNEp8FXXEUDhk6bgOBfOzuLT554oGX7bNQA1zlFaE57GKpz7x/hfYPyR3dtWSD
	 sAs2FkN+dt1AA==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231017170436.176615-1-colin.i.king@gmail.com>
References: <20231017170436.176615-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] ASoC: tas2781: make const read-only array
 magic_number static
Message-Id: <169758608220.3230119.5780419992173270730.b4-ty@kernel.org>
Date: Wed, 18 Oct 2023 00:41:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 2IFVVJ6XIF437LB7O67XT5UKNWII4RAD
X-Message-ID-Hash: 2IFVVJ6XIF437LB7O67XT5UKNWII4RAD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2IFVVJ6XIF437LB7O67XT5UKNWII4RAD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 17 Oct 2023 18:04:36 +0100, Colin Ian King wrote:
> Don't populate the const read-only array magic_number on the stack,
> instead make it static const.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: make const read-only array magic_number static
      commit: 9a4bf1f0be01582806e85322d18bf5c9f21d0b40

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

