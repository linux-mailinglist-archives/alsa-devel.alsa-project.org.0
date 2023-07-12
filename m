Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F797750EB9
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 18:39:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E3F47F4;
	Wed, 12 Jul 2023 18:38:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E3F47F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689179983;
	bh=DQexuOyJUEJfGQ3HBfoUhZkBbrW+cFpy5QnqcROH1P8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xv8sYDtGs7ks9Ici8eKq47DhLF0SLdrIM44WQJ7Jqe1T10E8RJpjjh53O/4zfYUj2
	 6QZK0d/zcBGSuc168I0fMkszQp47kWLAVwVLL4kAtkSowGSXVJxABvFML3eH75n9ZB
	 8qZ3y3D2/iKKTiKJBPwShuLr3dOscSJinty5V5w0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73A3DF80535; Wed, 12 Jul 2023 18:38:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DD4AF80236;
	Wed, 12 Jul 2023 18:38:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7907F80249; Wed, 12 Jul 2023 18:38:21 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 12D2BF80153
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 18:38:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12D2BF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S4Qleozc
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DF71161804;
	Wed, 12 Jul 2023 16:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D290C433C7;
	Wed, 12 Jul 2023 16:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689179890;
	bh=DQexuOyJUEJfGQ3HBfoUhZkBbrW+cFpy5QnqcROH1P8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=S4QleozcAyIBCTdD1watgV7kBpQI7x6hlWAONqekBmjhg8yw7uiPqk5NHky5BjToB
	 4WcXIJSIMl+t4rTAJbNZTIOZgen+ikbkRbdrZPjegUliecOOunjxe/FcWFPp5wmYGH
	 OXNvs/gny7Bdb74wtiBYsVWUmCbeH5OY30IIjBLnJ3gvL0XcJza33lss/6dnWvp0jR
	 fWra+EhLUKMMP4FFRmWd5bMNqUr1u/9AtB9VJqw3k/wv3AOSTvZJqMbXttA/DLN4WF
	 p9KzcqYXRKxtffEWe11J/qUbqV0DUg1d/osdtet+CqAnjRuabYyE2ssg4s72i3lYzF
	 5E4fW8bIQlD1Q==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Brent Lu <brent.lu@intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Yong Zhi <yong.zhi@intel.com>, Uday M Bhat <uday.m.bhat@intel.com>,
 Gongjun Song <gongjun.song@intel.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Arnd Bergmann <arnd@arndb.de>, Terry Cheong <htcheong@chromium.org>,
 "Dharageswari . R" <dharageswari.r@intel.com>,
 Mac Chiang <mac.chiang@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, linux-kernel@vger.kernel.org
In-Reply-To: <20230712191423.443765-1-brent.lu@intel.com>
References: <20230712191423.443765-1-brent.lu@intel.com>
Subject: Re: [PATCH v4] ASoC: Intel: sof_rt5682: add jsl_rt5650 board
 config
Message-Id: <168917988590.102640.2782247586550802134.b4-ty@kernel.org>
Date: Wed, 12 Jul 2023 17:38:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: BYQJ2W6CGFNGSUH6BRINVU2QKAIBJCYG
X-Message-ID-Hash: BYQJ2W6CGFNGSUH6BRINVU2QKAIBJCYG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BYQJ2W6CGFNGSUH6BRINVU2QKAIBJCYG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Jul 2023 03:14:23 +0800, Brent Lu wrote:
> This configuration supports JSL boards which implement ALC5650 dual
> I2S interface codec. Two DAI links are added: AIF1 (on codec side) for
> headphone and AIF2 for speakers.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_rt5682: add jsl_rt5650 board config
      commit: 6657fcc91db9b01fcbc4f8de0659e10cabd7ce2f

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

