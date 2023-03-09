Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 915F16B2A80
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 17:11:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 388FB1895;
	Thu,  9 Mar 2023 17:10:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 388FB1895
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678378304;
	bh=aUzkUq+3I5yZRqmUiGBuH7ztzS7vrzucy88h2XWwhhI=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lZkgKIEDAtu5wtO/tEs/EfsnIqZ0w0SPZIi6PFWGEV69cwd8JC5bfB1nKnKQclxrw
	 fb/XIj36N/brOSIiB3GknP6Y79cefevwMDcG2GbkojQJbM6M0OemKtpL07p2LvnD4l
	 f1n97YXu2FuXpUVSSktJTLsJwGdL3byrSziq1r2E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE50BF80482;
	Thu,  9 Mar 2023 17:10:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32452F80431; Thu,  9 Mar 2023 17:10:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9DC9EF80093
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 17:09:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DC9EF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YWb2Bgp4
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5B57161C15;
	Thu,  9 Mar 2023 16:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32366C433D2;
	Thu,  9 Mar 2023 16:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678378190;
	bh=aUzkUq+3I5yZRqmUiGBuH7ztzS7vrzucy88h2XWwhhI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YWb2Bgp4sXo8cn8XsCzXdYUYWpTZF6HSeBU63WV1S5RGeHIYsvoJw6sWCBZ9ExPgo
	 BpF7Ws0rXpvGbgdFVtdAmoH0NIjh5FBilbt5KKfDmOVquBWS872keI+eCHokrCsUoL
	 WA7971D8e/X9RqZnKDQhfeIzmM0UjszYdLFgpiSvIgfF9oY7QydEUtv3XY8niRFB9e
	 tOrCOhBfqjia5lbBY+NNy//rILcxd8ZnLM2FoQAlszAY9TE8qAEntasL6HdNnYmQ66
	 jyQJnL4DpxnjVRdq/qQqaLbLLwdRf937r5yKMvQlBnFCpLlHX9PSMPmxerTIhHU1gk
	 YCDHca+oLF1zg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230307140435.2808-1-peter.ujfalusi@linux.intel.com>
References: <20230307140435.2808-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 00/14] ASoC: SOF: Intel: hda: Introduce HDA DAI
 abstraction
Message-Id: <167837818893.37742.11505185906922545118.b4-ty@kernel.org>
Date: Thu, 09 Mar 2023 16:09:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: 6YUO7UZJHTVI7ONHJTQDDPASQTSFZQTP
X-Message-ID-Hash: 6YUO7UZJHTVI7ONHJTQDDPASQTSFZQTP
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6YUO7UZJHTVI7ONHJTQDDPASQTSFZQTP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 07 Mar 2023 16:04:21 +0200, Peter Ujfalusi wrote:
> This series introduces an abstraction of the HDA DAI handling.
> 
> The motivation is to simplify and make the code more flexible regarding to IPC
> versions, new features (ChainDMA (IPC4) and DSPless mode) and to pave the way for new
> platforms.
> 
> For the first look the series might feels a bit too intrusive but it introduces
> no functionality change (tested at each commit).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/14] ASoC: SOF: Intel: hda-dai: Remove BE DAI DRV ops for SSP DAI's
        commit: 274f8a3b4eb855bb14e38f6f12421ed32a2e670b
[02/14] ASoC: SOF: Intel: hda-dai: Remove hda_link_dma_params()
        commit: a8310c0093f4ebeb3a317b4b70e864b91739fc50
[03/14] ASoC: SOF: Intel: hda-dai: remove struct hda_pipe_params
        commit: 2a6afac248b08a0bcec72a6a605f11319738f6db
[04/14] ASoC: SOF: Intel: hda-dai: Modify the signature of hda_link_dma_cleanup()
        commit: 2be2caf481c7200b29116cea83cf8dd45c9e097f
[05/14] ASoC: SOF: Intel: hda-dai: Pass the CPU dai pointer
        commit: b436ed8dd071cae10ac3f94c541a783a094971ff
[06/14] ASoC: SOF: Intel: hda-dai: Use the dai argument in ipc4_hda_dai_trigger
        commit: be7f4f8d0bee110505750d85e6e11c59f8ceb65f
[07/14] ASoC: SOF: Intel: hda-dai: Introduce DAI widget ops
        commit: 2ae49c6fe060baf432472aba48743e72b8345c52
[08/14] ASoC: SOF: Intel: hda-dai: Define and set the HDA DAI widget DMA ops
        commit: 80afde34e8f9c2459f7cd37ea2d5f71751fedd69
[09/14] ASoC: SOF: Intel: hda-dai: Add setup_hext_stream/reset_hext_stream DMA ops
        commit: e2d6569aba39f4b98da8e56999a19dc901188e5e
[10/14] ASoC: SOF: Intel: hda-dai: Use the topology IPC dai_config op
        commit: e6ffb0d5eda751371d030bb8ae324493b2d1abc2
[11/14] ASoC: SOF: Intel: hda-dai: Define DAI widget DMA trigger ops for IPC4
        commit: 4b2ee4cd7103607b303a079c0469c06694be87e9
[12/14] ASoC: SOF: Intel: hda: Unify DAI drv ops for IPC3 and IPC4
        commit: 2b009fa0823c1510700fd17a0780ddd06a460fb4
[13/14] ASoC: SOF: Intel: hda: Remove hda_ctrl_dai_widget_setup/free()
        commit: a492da0ce6450d6fdea49ec89006d7692c0c1382
[14/14] ASoC: SOF: Intel: hda: remove redundant DAI config during hw_free
        commit: 8c29e78b8ecbec208bdd6d8b385ada71c1e730cd

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

