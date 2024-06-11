Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A93799038BE
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2024 12:20:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BE74E94;
	Tue, 11 Jun 2024 12:20:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BE74E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718101231;
	bh=ObekRkrSe+EOUnd7QDGCxutmXFSACDEnV0vZ5NWpVeI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QRhytEm4ee4zz+B3BUwO1ffG+D0B0AeiXlCt9Vp7IE6p0Hf0QKbOowfV08TEXijVI
	 +jIif8AtcC4R+wZBjfVidUUzwfpyIIT0E+dOwK5plZcucK1kaE8I36fdPdGlKHeMqV
	 S6bdiy/YQXe/6msUq24eBma1NRvU7tr4vTz8yobQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5976AF805EB; Tue, 11 Jun 2024 12:19:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7B63F805D3;
	Tue, 11 Jun 2024 12:19:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 305D1F80580; Tue, 11 Jun 2024 12:19:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F67BF80578
	for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2024 12:19:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F67BF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dLykSCqG
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 98D87CE16D3;
	Tue, 11 Jun 2024 10:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B92FC4AF49;
	Tue, 11 Jun 2024 10:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718101172;
	bh=ObekRkrSe+EOUnd7QDGCxutmXFSACDEnV0vZ5NWpVeI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dLykSCqGe3xH86nN9q+DmRwCYXkBbeYMSYAXpxblzRQi2rMOm9WqSqEpQm30HR3a6
	 iYFCVtn24t6yMkkTji0QPmi3aox9b7cTeTEPn8kVqKrcZOTg7BD14/nV63AF+RhBRX
	 +1c63asOGFAx9dnXj6xk3U+cOUYUzJ/yXfz5ZtuHlwATAdvak/ZqFXJ17mTWiWFebg
	 C7krFPmUAd77WPwTqCdRDsEAQYX6SbkVKcTFzgnAjcueI0ClQGYHpW4zP/fZZkRlLy
	 GkcmQl3X+aUrvRjn+PGqfV6652N/uSCNm/LnT6gjuSUcsr0frd2WPsxEVmqccbX7vl
	 GOtHzHWtXjDNw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, rafael@kernel.org,
 vkoul@kernel.org, andriy.shevchenko@linux.intel.com
In-Reply-To: <20240528192936.16180-1-pierre-louis.bossart@linux.intel.com>
References: <20240528192936.16180-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/3] ACPI/ALSA/soundwire: add
 acpi_get_local_u64_address() helper
Message-Id: <171810117047.177725.11786144644878657909.b4-ty@kernel.org>
Date: Tue, 11 Jun 2024 11:19:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-4c370
Message-ID-Hash: TZWLUCDZ3WEXC2HUKUFVXM3EFCHEDPUL
X-Message-ID-Hash: TZWLUCDZ3WEXC2HUKUFVXM3EFCHEDPUL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TZWLUCDZ3WEXC2HUKUFVXM3EFCHEDPUL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 28 May 2024 14:29:32 -0500, Pierre-Louis Bossart wrote:
> The acpi_get_local_address() helper assumes a 32-bit ADR is used. If
> we want to use this helper for SoundWire/SDCA ASoC codecs, we need an
> extension where the native 64-bits are used. This patchset suggests a
> new helper, acpi_get_local_address() may be renamed if desired in a
> folow-up patch.
> 
> The path of least resistance would be to merge this patchset in the
> ASoC tree, since I have additional changes for ASoC/SDCA (SoundWire
> Device Class) that depend on the new helper.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ACPI: utils: introduce acpi_get_local_u64_address()
      commit: 0b7e448119428e1dcb854abb5855f66966fb82dc
[2/3] soundwire: slave: simplify code with acpi_get_local_u64_address()
      commit: b6212f9bf489daf9716aed0e8c4dc6a807ce839f
[3/3] ALSA: hda: intel-sdw-acpi: use acpi_get_local_u64_address()
      commit: 9b7dc68eeba04d20f4a1733e791bc71355423612

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

