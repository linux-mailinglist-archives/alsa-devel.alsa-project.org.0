Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A4877775A
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 13:41:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69330822;
	Thu, 10 Aug 2023 13:40:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69330822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691667667;
	bh=PHQToYDN1jJ253CQ1B38WCDAhcL8w2XEWsk0JX64JF0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eohg7xkYxMX0cu40dNARS7jo6VOnc3qHNk+PBKvBYmrDYxcs2dGU5Jyin2HTzTf4s
	 gtmDTz6kjW5dS0ZHMbQRzFgi+54tLZWsUMe4sbFULs+6wmf5pCdZ3Kp2+Yd100oPs4
	 +OgEIcxkcHXuYNeP1qogPFkZ5xvScX1oZ8MXJ4i4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C28FF80549; Thu, 10 Aug 2023 13:39:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 908C5F80166;
	Thu, 10 Aug 2023 13:39:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B91AF8016E; Thu, 10 Aug 2023 13:39:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73FB0F800FB;
	Thu, 10 Aug 2023 13:39:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73FB0F800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iKw0G5u5
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7EFD965A37;
	Thu, 10 Aug 2023 11:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16513C433CA;
	Thu, 10 Aug 2023 11:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691667577;
	bh=PHQToYDN1jJ253CQ1B38WCDAhcL8w2XEWsk0JX64JF0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iKw0G5u57xT52/doYQByyteDSqEIXToTy58H40JTM9AKefIzbpdknnu96l1NY2FqZ
	 8f0fA4wFVZ/nsRmOJ9tdrTHQDSQ23sUonoZTfA24FDIPJeUpVoAxWcqkg/UqaQsowy
	 5QswTGSOgoCvVLQSHoM/m18QMSTfPLlncZSUMGJ5A7eUpvRG68PYipLvdIwgvTGriC
	 55f83nvabRzEMZLucdbIEt7Q0rZwsoQ0aaZN+IgC1EkZdHOzTVeauuYNa2gK+d0Xqh
	 sOKabj9U0LKI1TfsSjOwtkrMXxiWr79KIauyzNnoXD/YG26HoBiT+S9ZqgUdRkYpic
	 UvGxSqZT+jSIg==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
 Nathan Chancellor <nathan@kernel.org>
Cc: kai.vehmanen@linux.intel.com, ndesaulniers@google.com, trix@redhat.com,
 rander.wang@intel.com, sound-open-firmware@alsa-project.org,
 alsa-devel@alsa-project.org, llvm@lists.linux.dev, patches@lists.linux.dev
In-Reply-To: 
 <20230809-intel-hda-missing-chip-init-v1-1-61557ca6fa8a@kernel.org>
References: 
 <20230809-intel-hda-missing-chip-init-v1-1-61557ca6fa8a@kernel.org>
Subject: Re: [PATCH] ASoC: SOF: Intel: Initialize chip in
 hda_sdw_check_wakeen_irq()
Message-Id: <169166757481.31924.7230160819556948759.b4-ty@kernel.org>
Date: Thu, 10 Aug 2023 12:39:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: PGSRLWFXPVNF7Y6NWT4YXKCGLWQOIUQQ
X-Message-ID-Hash: PGSRLWFXPVNF7Y6NWT4YXKCGLWQOIUQQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PGSRLWFXPVNF7Y6NWT4YXKCGLWQOIUQQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 09 Aug 2023 11:12:07 -0700, Nathan Chancellor wrote:
> Clang warns (or errors with CONFIG_WERROR):
> 
>   sound/soc/sof/intel/hda.c:423:6: error: variable 'chip' is uninitialized when used here [-Werror,-Wuninitialized]
>     423 |         if (chip && chip->check_sdw_wakeen_irq)
>         |             ^~~~
>   sound/soc/sof/intel/hda.c:418:39: note: initialize the variable 'chip' to silence this warning
>     418 |         const struct sof_intel_dsp_desc *chip;
>         |                                              ^
>         |                                               = NULL
>   1 error generated.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: Initialize chip in hda_sdw_check_wakeen_irq()
      commit: 9c28423d3caae63e665e2b8d704fa41ac823b2a6

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

