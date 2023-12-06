Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB73807A14
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 22:05:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 722B0AE9;
	Wed,  6 Dec 2023 22:05:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 722B0AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701896752;
	bh=3b1rBW7w13tMlent75Aip+Ve9vistS1muRoXTNQTFvk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ONwQTMztv1SecUewCimAZvUukZ2smsG2kqFVeDndwcZy8xUUsayHabo5UT/mE4tii
	 n6cH8+ZSWklZc2SbBz9GSaQx8M64YyvW/PT7rrFnTiRcbmt4Nkpk+hA0t1fU6HlI6I
	 wmGcPglTG8IV1a6kO/vkb63frVxpzUU+75v8ujxM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25DB5F805AA; Wed,  6 Dec 2023 22:05:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D4D1F805AF;
	Wed,  6 Dec 2023 22:05:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1DAEF80166; Wed,  6 Dec 2023 22:05:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3309CF8024E
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 22:04:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3309CF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=vQglDxau
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C847CCE20DE;
	Wed,  6 Dec 2023 21:04:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AAE1C433C8;
	Wed,  6 Dec 2023 21:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701896681;
	bh=3b1rBW7w13tMlent75Aip+Ve9vistS1muRoXTNQTFvk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=vQglDxau9ZDy2AFbOsEnCKp5/VCVL62MVj6z39nPac5B5CPQHn1fMejfKZ06wrw0/
	 AickRhoCzPrmvgLUE5h23/IV3qhKmEGmswCPQZGhZk31BPGqQYtDzd+0j1tzlFuDlR
	 3A3CYOgO7YJ0ZntBNC8UfW80VFVpnJZnpz2JCq73NzS8vGIdINqsfzAyaKuPnWIFGn
	 SQBj6/IKFUsTSPOPxdL5o2ADwPFWyB6eET2aDxmsNjimDDfWXWSFgDLBnZJ2qGg8zS
	 0ZuRrfL8znyQUTOQALjVtT+hia5wj+bqemvNERT3ot2b0mjxRYwApHoaXRCPTZYTm+
	 DCjWewhrhDOJQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, cujomalainey@chromium.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Trevor Wu <trevor.wu@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>
In-Reply-To: <20231205220131.2585913-1-cujomalainey@chromium.org>
References: <20231205220131.2585913-1-cujomalainey@chromium.org>
Subject: Re: [PATCH] ASoC: SOF: mediatek: mt8186: Revert Add Google Steelix
 topology compatible
Message-Id: <170189667789.80064.8079452528877340900.b4-ty@kernel.org>
Date: Wed, 06 Dec 2023 21:04:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: JTH5IGU3B7OGZHE4F4F7K2JCUES3EHPP
X-Message-ID-Hash: JTH5IGU3B7OGZHE4F4F7K2JCUES3EHPP
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JTH5IGU3B7OGZHE4F4F7K2JCUES3EHPP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 05 Dec 2023 14:01:18 -0800, cujomalainey@chromium.org wrote:
> This reverts commit 505c83212da5bfca95109421b8f5d9f8c6cdfef2.
> 
> This is not an official topology from the SOF project. Topologies are
> named based on the card configuration and are NOT board specific.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: mt8186: Revert Add Google Steelix topology compatible
      commit: d20d36755a605a21e737b6b16c566658589b1811

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

