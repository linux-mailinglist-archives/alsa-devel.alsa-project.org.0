Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C787DA3CA
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Oct 2023 00:55:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BC9C1E3;
	Sat, 28 Oct 2023 00:55:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BC9C1E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698447355;
	bh=wWVqTphYSgMZ/+ta//p33X1HYKf6U7khb+plIGgPt7A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vOW+ykopna641E5g4EEP2fLAyoaPFFEFLYdhNMRxTvSsZLJ6QiyjiQnyGZAdSDm9j
	 OD4B+2SzHLyaNn3RmuXQEWkxJDJ6TUykNeTshSVAxIAICvCk0JHCJOkzZCw7/xToOO
	 ohe+XoZ+rFJJZbx87+LEwx9gICKFTA00YiPIUe+4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87FE2F8024E; Sat, 28 Oct 2023 00:55:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B70EF80165;
	Sat, 28 Oct 2023 00:55:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A153F80224; Sat, 28 Oct 2023 00:54:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65D4CF80152
	for <alsa-devel@alsa-project.org>; Sat, 28 Oct 2023 00:54:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65D4CF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gn52L1Y1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 915B2B81A37;
	Fri, 27 Oct 2023 22:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE671C433C7;
	Fri, 27 Oct 2023 22:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698447289;
	bh=wWVqTphYSgMZ/+ta//p33X1HYKf6U7khb+plIGgPt7A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gn52L1Y1QH7NexYb40VnResNfHYmaCdgaXUUyllsBBbd2jWJqwUd9AobbhDxBovHF
	 uFQYPRDDcQUMjNlQQgFBRtMfptV4futGvZlgD5VnNKft5WIRx/X9icknZYauTvzN/2
	 hH2/TvTlfsJlVke1/bj9WIkPDfycEca06geoQ6/I2B7OllLbWGd7Rg65HXxu7l60VB
	 thZP43Z8UIMBIJd0xBl4jUiV1jeyYykFqVKkD+Vgz//jtHorfIiXSYMnBzsWrs4c39
	 /eqbZpnaceu68HB2aEYZlGgoQWkDFioG59gJ0CxqKrf7n6diPXXlF6qIvVxs461xje
	 +veStwNNdDvuA==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 =?utf-8?q?=C5=81ukasz_Majczak?= <lma@chromium.org>
In-Reply-To: <20231027110537.2103712-1-amadeuszx.slawinski@linux.intel.com>
References: <20231027110537.2103712-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: avs: Add support for rt5514 codec
Message-Id: <169844728737.3013518.16736299523992907038.b4-ty@kernel.org>
Date: Fri, 27 Oct 2023 23:54:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: DZECO3PSZ5W6LYGJXYCRQ73WG4ACPVQH
X-Message-ID-Hash: DZECO3PSZ5W6LYGJXYCRQ73WG4ACPVQH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DZECO3PSZ5W6LYGJXYCRQ73WG4ACPVQH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 27 Oct 2023 13:05:35 +0200, Amadeusz Sławiński wrote:
> There are machines which use codec rt5514 as DMIC, add support for them.
> 
> Amadeusz Sławiński (2):
>   ASoC: Intel: avs: Add rt5514 machine board
>   ASoC: Intel: avs: Add rt5514 machine board
> 
>  sound/soc/intel/avs/board_selection.c |   9 ++
>  sound/soc/intel/avs/boards/Kconfig    |  10 ++
>  sound/soc/intel/avs/boards/Makefile   |   2 +
>  sound/soc/intel/avs/boards/rt5514.c   | 187 ++++++++++++++++++++++++++
>  4 files changed, 208 insertions(+)
>  create mode 100644 sound/soc/intel/avs/boards/rt5514.c
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: avs: Add rt5514 machine board
      commit: d933333694a7e63b0893d23f65b104430a1d6cf6
[2/2] ASoC: Intel: avs: Add rt5514 machine board
      commit: d933333694a7e63b0893d23f65b104430a1d6cf6

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

