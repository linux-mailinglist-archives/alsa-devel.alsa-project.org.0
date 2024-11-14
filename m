Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9109C9055
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2024 17:58:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C29B2345;
	Thu, 14 Nov 2024 17:58:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C29B2345
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731603529;
	bh=ohnmVR9ysF+4wUKfh7TejkUPhajwqhgwlqA+UcIUnJw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qvx++zZrYLOBw3eddoWVGecJNWPBX20YssulUmTvlkbXzTCtdy/s7M/i8yTpnsQSy
	 1j9Wl0/MVCb25XOF+XrNrjfE2lQBGNKP9OnpEHiuUyWDOoB8FSJcmWEh1PGl49/9DY
	 UKDd+ZdvrhNxdbK9zrBeWKUql0R62uAuiQFrY1CY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2006F805AC; Thu, 14 Nov 2024 17:58:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21BCBF805BB;
	Thu, 14 Nov 2024 17:58:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00A94F8058C; Thu, 14 Nov 2024 17:58:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11399F80587
	for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2024 17:58:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11399F80587
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cuXCcqlT
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7DF2F5C53A6;
	Thu, 14 Nov 2024 16:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6815C4CECD;
	Thu, 14 Nov 2024 16:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731603488;
	bh=ohnmVR9ysF+4wUKfh7TejkUPhajwqhgwlqA+UcIUnJw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cuXCcqlTuhRVQ5bAa1Pd6hhp43jcN5YAobMlK08lRnRrGIaiuzIyETxDDX353KjnZ
	 ZJdW+13bERYkIysxPdxK9M1UH5gGWJf2kkTTiBfRYL5TGz/TWE9savyZQyeCgCVX4f
	 XrcjJ2sET+Qh/HR83QpNOj65byKyXz03FHMEJhlrIEhr0kaJ0oITP/QikWqYMH6ZV0
	 nt5ht2kt2mJhylnMQOe7d24ptWl/ykxhjS7OJuRKZ+w0M4/i9AEKZgNqSEkkBPND6u
	 JUwfFTiQJnL4AdaZA33gORXJoHJ9YLGQgE1bOT2OFpwF4tyDosi++COf+oQV3t9Idf
	 3V/e7HcLPfOKw==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 mario.limonciello@amd.com
In-Reply-To: <20241113115223.3274868-1-Vijendar.Mukunda@amd.com>
References: <20241113115223.3274868-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 0/6] Add generic AMD Soundwire machine driver for
 Legacy(No
Message-Id: <173160348532.529304.6640656409978970343.b4-ty@kernel.org>
Date: Thu, 14 Nov 2024 16:58:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-355e8
Message-ID-Hash: HS24BPWSEMVYIGUUX6YZNA3Z4VY7UG27
X-Message-ID-Hash: HS24BPWSEMVYIGUUX6YZNA3Z4VY7UG27
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HS24BPWSEMVYIGUUX6YZNA3Z4VY7UG27/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 13 Nov 2024 17:22:17 +0530, Vijendar Mukunda wrote:
> This patch series add SoundWire machines for RT711, RT714, RT1316 and
> RT722 codecs for ACP 6.3 platform. Also, it adds a generic SoundWire
> machine driver code for legacy(No DSP) stack.
> 
> Vijendar Mukunda (6):
>   ASoC: amd: acp: add rt722 based soundwire machines
>   ASoC: amd: acp: add RT711, RT714 & RT1316 support for acp 6.3 platform
>   ASoC: amd: ps: add soundwire machines for acp6.3 platform
>   ASoC: amd: acp: move get_acp63_cpu_pin_id() to common file
>   ASoC: amd: acp: add soundwire machine driver for legacy stack
>   ASoC: amd: ps: fix the pcm device numbering for acp 6.3 platform
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: amd: acp: add rt722 based soundwire machines
      commit: 804aaa9df6c3bf9744205ae51cad084ee97567bc
[2/6] ASoC: amd: acp: add RT711, RT714 & RT1316 support for acp 6.3 platform
      commit: 7d3fe292efb637d1f748926390a3a4cc90c4c4e9
[3/6] ASoC: amd: ps: add soundwire machines for acp6.3 platform
      commit: 56d540befd5940dc34b4e22cc9b8ce9bb45946f7
[4/6] ASoC: amd: acp: move get_acp63_cpu_pin_id() to common file
      commit: 393347cc10ea24c9f93b45e8e2f90fcc48ab1d8e
[5/6] ASoC: amd: acp: add soundwire machine driver for legacy stack
      commit: 2981d9b0789c44b7375e7d599caf71bd843afc9e
[6/6] ASoC: amd: ps: fix the pcm device numbering for acp 6.3 platform
      commit: 76b5a3b2afdce1460dcd06221f7aa8eb2b807b1f

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

