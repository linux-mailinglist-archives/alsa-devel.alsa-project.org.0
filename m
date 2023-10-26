Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B21C7D875C
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 19:12:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3737A4D;
	Thu, 26 Oct 2023 19:11:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3737A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698340328;
	bh=ROnw1ETWO4+Yv1/hxOfoQDoHWSLEjD5hUrVjntw2Wrw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g/eBs/tvSrXIfMJVM44caRHhaiLbfsEb9rAJo1hopFRlYRUIPyD8fT80ANifwNNiw
	 L7SggtugzJIvRJgvAkUGgZXwrSJxDBABynnjPQFRstmDE6Oj0ppBCwlWis8ytpjmtW
	 daRd4PPLKomJYJL59uVwoiiL9zHEwDMli8nVy4Uc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5232EF80570; Thu, 26 Oct 2023 19:10:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A766F8055A;
	Thu, 26 Oct 2023 19:10:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFC72F8020D; Thu, 26 Oct 2023 19:10:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9AB64F8014B
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 19:10:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AB64F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ClZmVxbv
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BD99163577;
	Thu, 26 Oct 2023 17:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34BABC433C9;
	Thu, 26 Oct 2023 17:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698340210;
	bh=ROnw1ETWO4+Yv1/hxOfoQDoHWSLEjD5hUrVjntw2Wrw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ClZmVxbvE+B4s+7adpXdDoRAPsNb1okxaPWY//VHBJasUjQbrA/uGvHzj5RYWA5LZ
	 YCz77XQAXruIi66kheT5l4mt9xwOqhaxtZhL3qyvskb0e5gAjaYM8ashxxnu+j8hl3
	 Id+FQrDNQL29iCFmeHJfXtfNyA5OqwdedPUUwlqHFts/+XbENfKdZfMAU/yIMlrPF9
	 wlYJHTttLIqTunptdM3CKGWJJT41wEUfVlRcnjc1MR+DWC4/CoRT53hLxBw+D4HLaX
	 YkkEZrWjWp7g760nXERxANyELR1JWw1pGSaNtedeHKMzefNVUybZQa/c6G8v8tbLzW
	 8QwH/lgjz3qbQ==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <20231025143513.291753-1-hdegoede@redhat.com>
References: <20231025143513.291753-1-hdegoede@redhat.com>
Subject: Re: [PATCH v2 0/4] ASoC: Intel: bytcr_wm5102: add various quirks
Message-Id: <169834020778.149939.14152329417197878922.b4-ty@kernel.org>
Date: Thu, 26 Oct 2023 18:10:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: MGKLLTUT27DUMOD2IYBWM5VZG26IPFNJ
X-Message-ID-Hash: MGKLLTUT27DUMOD2IYBWM5VZG26IPFNJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MGKLLTUT27DUMOD2IYBWM5VZG26IPFNJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 25 Oct 2023 16:35:09 +0200, Hans de Goede wrote:
> As requested here is a v2 of my series to add various quirks
> to the bytcr_wm5102 Intel board driver to make it more flexible.
> 
> Changes in v2:
> - Dropped 2 already merged patches
> - Rebased on top of broonie/sound/for-6.7
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: Intel: bytcr_wm5102: Add BYT_WM5102_SSP2 quirk
      commit: 95504218c688d286fb6bfd5f4dd394b74c80832f
[2/4] ASoC: Intel: bytcr_wm5102: Add BYT_WM5102_MCLK_19_2MHZ quirk
      commit: bce4b014cc215afd1eca06977dbe91a1eb63551c
[3/4] ASoC: Intel: bytcr_wm5102: Add BYT_WM5102_OUT_MAP quirk
      commit: c556d202bef1b74dbfa0369bf221ccd83dfa7a59
[4/4] ASoC: Intel: bytcr_wm5102: Add BYT_WM5102_IN_MAP quirk
      commit: 8619fd0e9026c10841e162ec403f4223fe1f3846

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

