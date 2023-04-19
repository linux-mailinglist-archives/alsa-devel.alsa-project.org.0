Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0CA6E7CDA
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 16:36:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E06C5EBD;
	Wed, 19 Apr 2023 16:35:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E06C5EBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681914978;
	bh=sBYbUiJ6GlCWj4lYqLlaskm6OAopEbc4bQC5luPU9Tg=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hUgBDdodrIHi1KWrujfzK0V8G5kKR2iIF8HoFRfrv37jqvmz020yALKb7bLs59Mq+
	 uzao8CKDSrKXo1BJICjdTZDkTnL/Lv33pBJwqEtGXNu1nMs/GtX3DUvbJO/rJiUB/7
	 2SQZL6lv2eHyaFr4dIf7BfRSkvMHfYL6JEpaN2RU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EC33F80149;
	Wed, 19 Apr 2023 16:35:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEFBCF80155; Wed, 19 Apr 2023 16:35:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86EFBF800D0
	for <alsa-devel@alsa-project.org>; Wed, 19 Apr 2023 16:35:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86EFBF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OKKeavw9
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F13DB60B88;
	Wed, 19 Apr 2023 14:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F2F1C433D2;
	Wed, 19 Apr 2023 14:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681914914;
	bh=sBYbUiJ6GlCWj4lYqLlaskm6OAopEbc4bQC5luPU9Tg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OKKeavw9KAKCyJMFID/gsexph94AvBnlqXJYcXH8ScMbhtZRBm/XzDjUamvrscn/t
	 lANg4Ig3Te4XIhTywIcanyOf0gdNLui07r9YSDxXwHHcizz7wYdUMimUisEQPCW/23
	 WUB3ETEuam2/O71qFvPHRLhTZpJpYqDEQxCDZiaaCGn3tPN954phonD8c/xtOLzIru
	 vs1kpvSYFr0JcIH5xwQRmgs7lkDCW4I9qVMuMupi6bq0UnxRcLK2urzhE69QvPoZ5u
	 stDFtMNvNMyomVbDSe/XFbJmTDRhtP6RaMFYB1M2xewMzPslHBcyl+kEtV/lmE+CLn
	 9a/JSMhue0uTA==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: 
 <c167c16a535049d56f817bbede9c9f6f0a0f4c68.1681626553.git.christophe.jaillet@wanadoo.fr>
References: 
 <c167c16a535049d56f817bbede9c9f6f0a0f4c68.1681626553.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: fsl: Simplify an error message
Message-Id: <168191491177.87831.11926959447891085887.b4-ty@kernel.org>
Date: Wed, 19 Apr 2023 15:35:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: NMFJQ22SAP5GTYMKPIQBIIDPIM3ZYOU4
X-Message-ID-Hash: NMFJQ22SAP5GTYMKPIQBIIDPIM3ZYOU4
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NMFJQ22SAP5GTYMKPIQBIIDPIM3ZYOU4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 16 Apr 2023 08:29:34 +0200, Christophe JAILLET wrote:
> dev_err_probe() already display the error code. There is no need to
> duplicate it explicitly in the error message.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: Simplify an error message
      commit: 574399f4c997ad71fab95dd875a9ff55424f9a3d

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

