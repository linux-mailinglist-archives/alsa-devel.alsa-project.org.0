Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C466EAEB4
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 18:08:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2803AE8F;
	Fri, 21 Apr 2023 18:07:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2803AE8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682093322;
	bh=HBtnEN10dlxDAlEslSga5MfRXYbeXLnzwIotPTBvICg=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Tl0z7PRll6Ylm1K/SUtC925wE/MBl1pNHeYYtp8QVxD0gCEyG/7N6kiiRMbTRzYQb
	 b5rRVvnMdJQn5FOHM/AxrFtkkVF7LHPC294kcp//unh7uRX87EgMrwDLXRqmJszLG5
	 c7n2Zu1/gUp5t+pU09tZDQ77IqvxisRQ/Vga/4rs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB6CEF80548;
	Fri, 21 Apr 2023 18:06:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96A93F80549; Fri, 21 Apr 2023 18:06:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B828EF80155
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 18:06:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B828EF80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lHWv2Zqh
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 92BD261B50;
	Fri, 21 Apr 2023 16:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF7B4C4339B;
	Fri, 21 Apr 2023 16:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682093193;
	bh=HBtnEN10dlxDAlEslSga5MfRXYbeXLnzwIotPTBvICg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lHWv2ZqhEMVBo5WAIy8OItuM02p9xcRX/BfoCJJBmUa/8VoWJmejLiXSiMjQ+XHKM
	 c67XnmtEaZpZBT/g81BmFl9aFGY/BSz/E3XhkWWGCnyk316vQ2zZz26/RG667EI/1I
	 1aA4yw85krqaRNDubOiXSbpfJzn+yQLadXTs7tt4mS3juDKD6xCUXYqhe+wUKkkyxH
	 KuTUFciIb+cs1FaRR83wmtER9B2166wyhXx8PmUveD05U9gIO/fswjA/svBkFeEpeK
	 TFzN4kQTRqM8RxOa0WHTcGMIF8no8hii5+m8ezkuVH+Xfup35Mhz4Eq1Stc1pIKj1M
	 dLsZMmlaYgjGA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
In-Reply-To: <20230419-asoc-es8316-volatile-v1-1-2074ec93d8f1@kernel.org>
References: <20230419-asoc-es8316-volatile-v1-1-2074ec93d8f1@kernel.org>
Subject: Re: [PATCH] ASoC: es8316: Don't use ranges based register lookup
 for a single register
Message-Id: <168209319150.108546.8396846755495110996.b4-ty@kernel.org>
Date: Fri, 21 Apr 2023 17:06:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00e42
Message-ID-Hash: 2NRFDFQXKK547ZV6HGUEWOKDODRUDTFW
X-Message-ID-Hash: 2NRFDFQXKK547ZV6HGUEWOKDODRUDTFW
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2NRFDFQXKK547ZV6HGUEWOKDODRUDTFW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 19 Apr 2023 19:45:06 +0100, Mark Brown wrote:
> The es8316 driver uses a register range to specify the single volatile
> register it has. While the cost will be in the noise this is a bunch of
> overhead compared to just having a volatile_reg() callback so switch to
> the callback.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: es8316: Don't use ranges based register lookup for a single register
      commit: 2cc3fdcddc86644c070223c522e418416cb7b1a2

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

