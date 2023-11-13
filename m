Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A191E7EA118
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 17:16:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D16FC886;
	Mon, 13 Nov 2023 17:15:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D16FC886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699892193;
	bh=P1HsCRngx2AULeZ5NjJzkJnUfB2/UHXYrbiKx+V3dsw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hj3tEfmIKW4GrNq0XJSTCekEtyqCtedmU9Dq/WHM+MHhPXGcVxOU0yzF4l5y9rMno
	 45WU30pldHjs517fcHH1r9YwQq+6xwo+IjXFLNiP9dIsy/w5NikUcqsLer1qbhj4f5
	 DPocAZM0L+cnTOzP+k5ie89OTh9HHg0N9DpkJ8nk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83F80F8055B; Mon, 13 Nov 2023 17:14:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6779F8055B;
	Mon, 13 Nov 2023 17:14:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EDD2F8055B; Mon, 13 Nov 2023 17:14:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9969DF800ED;
	Mon, 13 Nov 2023 17:14:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9969DF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZatGpOBL
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 995BF60FA4;
	Mon, 13 Nov 2023 16:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3FE3C433CA;
	Mon, 13 Nov 2023 16:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699892085;
	bh=P1HsCRngx2AULeZ5NjJzkJnUfB2/UHXYrbiKx+V3dsw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZatGpOBLjKNxznQDsZctXqsvFhBhjf8PWoirXtdiwxa9fifmlLOI2Vi5OS8HThuG/
	 o0pkOtnkwKY26BgyOTV/a2W/SrzsOPiD7t/43Pups9X3OC9Ez3lFdPnntPkKV+tMUX
	 mW/b5FCxuuoCJ3Md6Wn/MkEviUOTi373Z4cUuveMAruuicBtM2gTQQV/c0wE6Rmrsm
	 kGyLYCruxDIjr9xg4Xw60IfgcT8FQlxi9wbidKBiquR1IGgYJFkcz88Xg529QIQayz
	 SJMa4c9HrJsKNUL+GlWwDFhNcW5aTKNdFp+du6qqI3eEjFfsDa0V+Qdeeud+4Im8ON
	 A/SQ8kpg/rC4w==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com, lgirdwood@gmail.com,
 tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, Trevor Wu <trevor.wu@mediatek.com>
Cc: yc.hung@mediatek.com, sound-open-firmware@alsa-project.org,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231103095433.10475-1-trevor.wu@mediatek.com>
References: <20231103095433.10475-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: mediatek: remove unused variables
Message-Id: <169989208005.3289099.6135603822989118878.b4-ty@kernel.org>
Date: Mon, 13 Nov 2023 16:14:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: ESUUZSVT4MSLIIKZIYJGU2ICHZWSIF3A
X-Message-ID-Hash: ESUUZSVT4MSLIIKZIYJGU2ICHZWSIF3A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ESUUZSVT4MSLIIKZIYJGU2ICHZWSIF3A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 03 Nov 2023 17:54:29 +0800, Trevor Wu wrote:
> There are some variables that are no longer being used because they
> were declared for the deprecated memory layout. Currently, these code
> sections confuse the users. Therefore, this series removes the code
> that was implemented for those variables.
> 
> Trevor Wu (3):
>   ASoC: SOF: mediatek: mt8195: clean up unused code
>   ASoC: SOF: mediatek: mt8186: clean up unused code
>   ASoC: SOF: mediatek: remove unused variables
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: mediatek: mt8195: clean up unused code
      commit: ab475966455ce285c2c9978a3e3bfe97d75ff8d4
[2/3] ASoC: SOF: mediatek: mt8186: clean up unused code
      commit: a4de5a345cf76c6f294a906e11c2fb675a46fd3d
[3/3] ASoC: SOF: mediatek: remove unused variables
      commit: 82e340ca3f25dc3ddd20e88e3606ed9006f90f5d

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

