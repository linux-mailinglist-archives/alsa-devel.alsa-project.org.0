Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B9672CC8B
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 19:28:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F17F8827;
	Mon, 12 Jun 2023 19:27:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F17F8827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686590929;
	bh=uOab3yRuil+00P2CAkfmCzTH6J2kw0s08EsYP6TTYAk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NGZiiFa2iDsVdCgfjGoVNzhM0Hfpn/VDK4VTpXHqJS5YljBaGk6M5rqbQ/+3kMoUZ
	 TVwK291rJcP6WoOUzrWyD5i9+/tCv4zR60BWKkZaGGmEpN8nuwDODmK86tQzMU+ysQ
	 FPwlQhXend0h8ZcAZ/tCwaU5LxxhQfITcmPH66y0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41F4DF8055A; Mon, 12 Jun 2023 19:27:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AAEC8F80548;
	Mon, 12 Jun 2023 19:27:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F916F80155; Mon, 12 Jun 2023 19:27:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57A6CF800ED
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 19:26:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57A6CF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uc6TOR1Z
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9B32561D74;
	Mon, 12 Jun 2023 17:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B54EC433EF;
	Mon, 12 Jun 2023 17:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686590815;
	bh=uOab3yRuil+00P2CAkfmCzTH6J2kw0s08EsYP6TTYAk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uc6TOR1ZOtF/eV7k3z5Dz7S3LRRP6M71bjAOf/jvu9QnHwTu3ChJiD1zK5rr42j0I
	 qrP2x6chV4GO8+vtF513icXxVAQX6KNtCXrPFW6SoNHlF2TqSIyi9q+dbdIipqOwp7
	 Qgsg7rQ5S4Qkgm6EwvoaTG9tJRaw0oxOgzpDxnGEcmm8efIkSzp1Fcz3nuIbC+86sw
	 BFnBAJI1jxzyny2Ojju7yxIf/TweyBqTQKuGyZN3cYZJG4l+Y+wxkBlj4RBF+3tcOr
	 5yeFZrWRkavgnMxhDgiNfscvB8FsHp9RGX0uvMTLkMt+2IDZxG8EnP9cgtENUTGk2b
	 hl+TP+KjpP95w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Ricardo Ribalda Delgado <ribalda@chromium.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Dan Carpenter <dan.carpenter@linaro.org>, stable@kernel.org
In-Reply-To: <20230612-mt8173-fixup-v2-0-432aa99ce24d@chromium.org>
References: <20230612-mt8173-fixup-v2-0-432aa99ce24d@chromium.org>
Subject: Re: [PATCH v2 0/2] ASoC: mediatek: mt8173: Fix error paths
Message-Id: <168659081228.87413.14975958802523841979.b4-ty@kernel.org>
Date: Mon, 12 Jun 2023 18:26:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: 2KTVW7KYH77N2PLIWN4E4NIIALLLC2LV
X-Message-ID-Hash: 2KTVW7KYH77N2PLIWN4E4NIIALLLC2LV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2KTVW7KYH77N2PLIWN4E4NIIALLLC2LV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 12 Jun 2023 11:05:30 +0200, Ricardo Ribalda Delgado wrote:
> ASoC: mediatek: mt8173, presented a couple of error paths errors, lets
> fix them.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mediatek: mt8173: Fix snd_soc_component_initialize error path
      commit: a46d37012a5be1737393b8f82fd35665e4556eee
[2/2] ASoC: mediatek: mt8173: Fix irq error path
      commit: f9c058d14f4fe23ef523a7ff73734d51c151683c

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

