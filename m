Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3033577D189
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 20:10:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB8A7827;
	Tue, 15 Aug 2023 20:09:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB8A7827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692123043;
	bh=Dwt2P3n6A9/tnC8wtKE1Ytw/tSXcGuR/aA4YHtP5ODA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B4L5mPYumJxmC8bw48fEihWIguvHiOaZIur/eDTitBWhvhhal+RJdQDyO7Qof/Yh+
	 rJGnVPzxbXC542TmG/UyEq1gSkPEz0ZWRWYhJ/Wlq5qaUD/tfuyiaxGoCp/VidgQdn
	 ekTuiRs4EM4WpaW9tHE5t/YZZ0o6SyKUtqjvy0xE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 406B6F80510; Tue, 15 Aug 2023 20:09:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55485F8016A;
	Tue, 15 Aug 2023 20:09:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21BAFF801EB; Tue, 15 Aug 2023 20:09:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1141F800EE
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 20:09:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1141F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MIoKTvSA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 32235648C0;
	Tue, 15 Aug 2023 18:09:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F0BDC433C8;
	Tue, 15 Aug 2023 18:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692122953;
	bh=Dwt2P3n6A9/tnC8wtKE1Ytw/tSXcGuR/aA4YHtP5ODA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MIoKTvSAb7bTlfsdn27WdD/DTNXriEamdH2ALNvemFqyCjWZSPiNUnxx8Ayg5MmNi
	 i19Y9b5JvDAxoG0xdsESY1AwN2+y3LrVHQw9Dhv3n9+r0tWlU9oUiC4is7RH4ODjMm
	 Rcb1XALpvM3YxX4l3sUECGMhxOkI5rPC3raDoMSB2E280jDOsK1yYoN39hAa6FSfWg
	 PGRllGia1ST/r2RrLkYBVT2esq2b6Ky3gjhVNR7mZ1Bwadsg9ktAR3YJbd9I9pKQOI
	 fqML16piMQ2WikNCSkrSSZFQpbbf6k1WHVIMkFIM8XUuPwzC97AXPJjRlkt2nfSHpx
	 W0B0R4XsIgQ/w==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Yong Zhi <yong.zhi@intel.com>,
 ye xingchen <ye.xingchen@zte.com.cn>,
 "balamurugan . c" <balamurugan.c@intel.com>,
 Libin Yang <libin.yang@intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, David Lin <CTLIN0@nuvoton.com>,
 Brent Lu <brent.lu@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Terry Cheong <htcheong@chromium.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Gongjun Song <gongjun.song@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 apoorv <apoorv@intel.com>, alsa-devel@alsa-project.org
In-Reply-To: 
 <20230804085648.3721416-1-ajye_huang@compal.corp-partner.google.com>
References: 
 <20230804085648.3721416-1-ajye_huang@compal.corp-partner.google.com>
Subject: Re: [PATCH v1] ASoC: Intel: Add rpl_nau8318_8825 driver
Message-Id: <169212294815.59295.2130257990585943471.b4-ty@kernel.org>
Date: Tue, 15 Aug 2023 19:09:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: MOWRJH6H35EJ3XCXU7Z72BQKNJDMMDHV
X-Message-ID-Hash: MOWRJH6H35EJ3XCXU7Z72BQKNJDMMDHV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MOWRJH6H35EJ3XCXU7Z72BQKNJDMMDHV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 04 Aug 2023 16:56:48 +0800, Ajye Huang wrote:
> Boards were using this in older kernels before adl and rpl ids were
> split. Add this back to maintain support.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: Add rpl_nau8318_8825 driver
      commit: 273bc8bf2227108ed2851bea71786a026e34ecbb

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

