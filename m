Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19092916BBB
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2024 17:05:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4195FE67;
	Tue, 25 Jun 2024 17:05:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4195FE67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719327917;
	bh=mdZiK8d9QoIIdJ0nYm+jl/RjMRCkckvuLLtabM4OezU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G+R8o9n8Ftr1IQLFEei7SzxhktaDeDYNsH/79oq78eeC85XSRi2kbqZyGL21pM9IQ
	 35bZGZoB3GZ+ZwNNEbrFhwEeb7l9SrdYUSXUuNT+cfBNeQhi3DPSLNQK3Qc2aOGmWK
	 JFt7slyn1aVMANPYa9BH0pJAaXgUk2RnBs3Yx+GE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C74EBF80612; Tue, 25 Jun 2024 17:04:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C469F805D9;
	Tue, 25 Jun 2024 17:04:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B0B2F8049C; Tue, 25 Jun 2024 16:54:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C6F5F8013D
	for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2024 16:54:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C6F5F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CRRmEy0O
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EACD06125D;
	Tue, 25 Jun 2024 14:54:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59CF7C32781;
	Tue, 25 Jun 2024 14:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719327246;
	bh=mdZiK8d9QoIIdJ0nYm+jl/RjMRCkckvuLLtabM4OezU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CRRmEy0OG5O/5UcinGwWCC1am/MuTzcmoS4kWAa/isyivL5B9Zw0VO34h9X5ZhF93
	 mDtQfKVruBtOiwUH30uK17u58xvaFacqawac6qhia0Jkq59+Gj91W2oBjwDlo1QBTP
	 uVnaBFzirNKu8sypqRjyAHgb0BnwtMrpUO21S7VALFYNsZx/BKk8JAIPlYpbJx5FmB
	 byuK7+/Ch2wck/CRR0rVVKOM74ebOrQukn4AIL52Po++rk4Ss6kP6s5kp4AkwI10G0
	 VjalAGTD2gf9YDyDcTpceFQV9i0QXWCqcuMD8ekU3Ut0ihG5kvtrSjNf7oko+I+UW8
	 FH+pWE/eCdQuQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240624121119.91552-1-pierre-louis.bossart@linux.intel.com>
References: <20240624121119.91552-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: Intel: boards: updates for 6.11 - part2
Message-Id: <171932724503.283378.14511701134846780263.b4-ty@kernel.org>
Date: Tue, 25 Jun 2024 15:54:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: USUVSGX5H7V6RF2F4ET7FSGS7NOU2YWM
X-Message-ID-Hash: USUVSGX5H7V6RF2F4ET7FSGS7NOU2YWM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/USUVSGX5H7V6RF2F4ET7FSGS7NOU2YWM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 24 Jun 2024 14:11:15 +0200, Pierre-Louis Bossart wrote:
> Minor additions and cleanups this time.
> 
> Bard Liao (1):
>   ASoC: Intel: sof_sdw: select PINCTRL_CS42L43 and SPI_CS42L43
> 
> Brent Lu (1):
>   ASoC: Intel: maxim-common: add max_98373_get_tx_mask function
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: Intel: sof_sdw: fix jack detection on ADL-N variant RVP
      commit: 65c90df918205bc84f5448550cde76a54dae5f52
[2/4] ASoC: Intel: maxim-common: add max_98373_get_tx_mask function
      commit: e364ffceab9252c06388727250d7583d6e0aea87
[3/4] ASoC: Intel: sof_sdw: add quirk for Dell SKU 0B8C
      commit: 92d5b5930e7d55ca07b483490d6298eee828bbe4
[4/4] ASoC: Intel: sof_sdw: select PINCTRL_CS42L43 and SPI_CS42L43
      commit: c073f0757663c104271c8749f7e6b19b29c7b8ac

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

