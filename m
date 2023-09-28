Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5EA7B202D
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 16:53:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA9CEDF1;
	Thu, 28 Sep 2023 16:52:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA9CEDF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695912784;
	bh=StfEneqPnMXWDqQdDqylaWm7UVtDGEIMdVg0t3atZ0Q=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=LfBsDAqFhEZatutCHfWvwRVJhRd/MP8porQylODhBVE3FuuPQhbn+/5PvJHQ723Jo
	 /YLPPG5vofOs0sz6EP8xL02AyZtKP6lxgd0Q+bTUygRwfQQ2moHjlFjzLlVJSlm4O/
	 WC0A1GifeascnFNjQVDrShCXyv6+DrdjdFI5qeBY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C92F0F8055A; Thu, 28 Sep 2023 16:51:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72329F801D5;
	Thu, 28 Sep 2023 16:51:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAD4BF8016A; Thu, 28 Sep 2023 16:51:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4D72F8016A
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 16:51:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4D72F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bgiOSo+n
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 6B8C4B81AA7;
	Thu, 28 Sep 2023 14:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24F26C433CD;
	Thu, 28 Sep 2023 14:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695912683;
	bh=StfEneqPnMXWDqQdDqylaWm7UVtDGEIMdVg0t3atZ0Q=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=bgiOSo+n1ZlOzg1fdq+N77rfK+/KqBoOiNPq5OiJKBIBqO98ZnNZRzf7kb32d2PVQ
	 lB55ahJVx53g7eFv6yYNPNIAG1nJ5J/G0bJZyDCzkQ4KA2DGFfNfVMt2X+dskZYt3F
	 0PicXLtYQyqZV6BEtbOCTV6iWiYzLwQmQJpyxvCugcPZpiKBsjpl0HK83Jie6BP4DS
	 MIsYPlghzipIGM2T3jKXqfGe8Hjg9dNXstIaRa93Q2UshQ8InG3aluEoyU0Epvg8Kv
	 uFUZokN9X0Vy39MXTXACBvle+zMI3ahdE11hWY+3e0LgUWFTeyfISfn+ZSmWpYRTnq
	 8bJrP9YHoSoRA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, perex@perex.cz,
 tiwai@suse.com, shumingf@realtek.com, rf@opensource.cirrus.com,
 herve.codina@bootlin.com, arnd@arndb.de, 13916275206@139.com,
 ryans.lee@analog.com, linus.walleij@linaro.org,
 ckeepax@opensource.cirrus.com, doug@schmorgal.com, fido_max@inbox.ru,
 harshit.m.mogalapalli@oracle.com, liweilei@awinic.com,
 yang.lee@linux.alibaba.com, u.kleine-koenig@pengutronix.de,
 yijiangtao@awinic.com, dan.carpenter@linaro.org, colin.i.king@gmail.com,
 trix@redhat.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, wangweidong.a@awinic.com
In-Reply-To: <20230927121634.94822-1-wangweidong.a@awinic.com>
References: <20230927121634.94822-1-wangweidong.a@awinic.com>
Subject: Re: [PATCH V5 0/8] ASoC: codecs: Add aw87390 amplifier driver
Message-Id: <169591268017.2776105.16111377066038628.b4-ty@kernel.org>
Date: Thu, 28 Sep 2023 16:51:20 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: 6ISG2PMOZVABQ23EWP5SKMWSR4WHV4K3
X-Message-ID-Hash: 6ISG2PMOZVABQ23EWP5SKMWSR4WHV4K3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6ISG2PMOZVABQ23EWP5SKMWSR4WHV4K3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 27 Sep 2023 20:16:26 +0800, wangweidong.a@awinic.com wrote:
> The awinic aw87390 is a new high efficiency, low noise,
> constant large volume, 6th Smart K audio amplifier.
> 
> Add a DT schema for describing awinic aw87390 audio amplifiers.
> They are controlled using I2C.
> 
> v4 -> v5: Adjust the order and context of the patch
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: dt-bindings: awinic,aw88395: Add properties for multiple PA support
      commit: b99d8d8adfda1f9220dd2ee9bdb96ba02dc62bd7
[2/8] ASoC: dt-bindings: Add schema for "awinic,aw87390"
      commit: 457b6587c112e162d3bec871c7b93359168d5c0a
[3/8] ASoC: codecs: Modify the code related to the property
      (no commit info)
[4/8] ASoC: codecs: Modify the transmission method of parameters
      commit: e83219c94abb4ad977f6b2b8be7d466ef0c2248f
[5/8] ASoC: codecs: Add code for bin parsing compatible with aw87390
      commit: b116c832c9e84843c64eed087271e29b3bc6c1b8
[6/8] ASoC: codecs: Modify the code related to the property
      (no commit info)
[7/8] ASoC: codecs: Modify the transmission mode of function parameters
      commit: f83287a72551833a6fe2fc96f334b26e6eba77e8
[8/8] ASoC: codecs: Add aw87390 amplifier driver
      commit: 37b4346ed8681660ae60de4facc3d499d8e5cf2a

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

