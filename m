Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F5C7FA80A
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 18:33:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E98384D;
	Mon, 27 Nov 2023 18:33:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E98384D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701106435;
	bh=AUzvmO3oorsrFGT0LG/F8jk2nWSZYA0zZ/HJNmpOg+0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CFMb6he2zioOlmdpEcGHIMjtH9areHAf+kXONbLieyGcOQxu741cGYc1C+5OSnvHs
	 n0ki9VctGG69tBifRBE1IQ5AkIb+K/q24LV1mhWIwFe2SsWMT+IpMyZxRVgHdBztuS
	 kun1TFv0sZKBkyCZjHNFtVq/4Zo8C3Prx2PGyfps=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2051F80579; Mon, 27 Nov 2023 18:33:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FAF1F80579;
	Mon, 27 Nov 2023 18:33:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC5ECF80236; Mon, 27 Nov 2023 18:33:17 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 66131F800F5
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 18:33:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66131F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eTeXfdU0
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9FD9F6100C;
	Mon, 27 Nov 2023 17:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A8C1C433C7;
	Mon, 27 Nov 2023 17:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701106386;
	bh=AUzvmO3oorsrFGT0LG/F8jk2nWSZYA0zZ/HJNmpOg+0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eTeXfdU0YnbY3c+GAPMWOLR631M1d/YwU/ImBtoqQIBcYg0L/J85sh6qRyfvwqTdy
	 LFnRNsZxKPhNlXdI8D/gCt584KacWoPpUy323s6kWkttXxpP8929ZwybvK4aTwJxGR
	 NLJbdBSij46oLWljW1Tdyc3qYdS0Mx/Cx0SBJ+rdhak1WVKJEkZvplaiz5xAAYEG2I
	 wxyn/xIZB025CrNjHiRKJ5eO8TfSKLTXG3IjL1Hvwc1lK8UcH3Ob7iM05Gbkt1A742
	 3KXkClZorQ57pb434QXcgdiDqH6ch40LK94tLLgDAvqPjk+fgaiT/nuqBQMQ1iRuXL
	 DG1l63YvCfM8A==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
In-Reply-To: <20231127104313.16661-1-peter.ujfalusi@linux.intel.com>
References: <20231127104313.16661-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: Use existing helpers to change
 GPROCEN and PIE bits
Message-Id: <170110638256.2700573.9538150782140632834.b4-ty@kernel.org>
Date: Mon, 27 Nov 2023 17:33:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: ESBJ4MRM3ULKB7H5BJMFIWXWVQDMPTQN
X-Message-ID-Hash: ESBJ4MRM3ULKB7H5BJMFIWXWVQDMPTQN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ESBJ4MRM3ULKB7H5BJMFIWXWVQDMPTQN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 27 Nov 2023 12:43:13 +0200, Peter Ujfalusi wrote:
> Instead of directly changing the GPROCEN/PIE bits in PPCTL we should use
> the existing helper hda_dsp_ctrl_ppcap_enable() and
> hda_dsp_ctrl_ppcap_int_enable() helpers for clarity.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: Use existing helpers to change GPROCEN and PIE bits
      commit: 9b3cd8ebb19edd92300932b68fd6941eaf1852d0

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

