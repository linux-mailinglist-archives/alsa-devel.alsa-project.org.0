Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4167CAD99
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Oct 2023 17:34:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B94A682A;
	Mon, 16 Oct 2023 17:33:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B94A682A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697470470;
	bh=PDwaCZiywX84dEhKOQHXwOCiGgsEuoporLHXK9SIazw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dyebAo1kD3YF+VArHxiDpzsfeq5IliXNyS9kAnA/pJJ70BjH5WeB/bEX/V+wwrTCb
	 Z7AuxH7sXvajb9JuYcKhqqApQeVXwCHHOor+JAb7I2iSvCjaD1YKKthSDiomLy0Q/I
	 /PnCiqeN1haCFbbflU1xHSfkTtQF5SzjAD+5Jl6c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CED0DF8055A; Mon, 16 Oct 2023 17:33:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B6E3F8024E;
	Mon, 16 Oct 2023 17:33:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24BAAF80536; Mon, 16 Oct 2023 17:33:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47610F80236
	for <alsa-devel@alsa-project.org>; Mon, 16 Oct 2023 17:33:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47610F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qhX7cbow
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 5C12DB816BF;
	Mon, 16 Oct 2023 15:33:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D12C433C9;
	Mon, 16 Oct 2023 15:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697470405;
	bh=PDwaCZiywX84dEhKOQHXwOCiGgsEuoporLHXK9SIazw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qhX7cbowvLlKsFMJHWwWLSy3xmBH/XiU2gkcAdVEnz0ymRwRKKen/DNdRtJKEcvL4
	 Tj+lnDpKIR9aunS5IZ3RtvxCWBRJv5te1fr77adHAjwNJ6M0pdockYgQVYLxES4Sjv
	 4RxURGl904yzUyu8qiqf3eO27TVSMSKW4+TBiGuibSsUZliMHgY/YvTvwL23fI1G1P
	 w94p3LUsXieJjANcQ9/ChdF23AiKgEk84H3MG9EIxCcIc+NHNsZ9c/b/+rsacD1j1v
	 Gaolsoe6j5a3ljw8k9gxHA29jkW5E/fo81Z+2kInnoU5PYB7dOEuSkN6ZdwlLeSb6M
	 yC0oEYPNJM6cw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de
In-Reply-To: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
References: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/23] ASoC: Intel: boards: updates for 6.7
Message-Id: <169747040474.42352.10858393300196087635.b4-ty@kernel.org>
Date: Mon, 16 Oct 2023 16:33:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: AYFFY5XTTL5TJ5T5AV37DXP3NQPEGFK7
X-Message-ID-Hash: AYFFY5XTTL5TJ5T5AV37DXP3NQPEGFK7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AYFFY5XTTL5TJ5T5AV37DXP3NQPEGFK7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 12 Oct 2023 15:08:03 -0400, Pierre-Louis Bossart wrote:
> A couple of new boards, one DMI quirk fix and a nice cleanup from
> Brent Lu to make all HDMI stuff common across drivers.
> 
> Balamurugan C (1):
>   ASoC: Intel: MTL: Add entry for HDMI-In capture support to non-I2S
>     codec boards.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/23] ASoC: Intel: sof_sdw: update HP Omen match
        commit: a5172ef251f03eb18bed9e3f9a5c093679f29e1b
[02/23] ASoC: Intel: soc-acpi-intel-rpl-match: add rt711-l0-rt1316-l12 support
        commit: 43e354dada62c0425db900f327a6e11babefcf5c
[03/23] ASoC: Intel: soc-acpi-intel-mtl-match: add rt713 rt1316 config
        commit: e70ca580e9c8d59bc8cf70cb15546da5aecff3a0
[04/23] ASoC: Intel: sof_sdw_rt_sdca_jack_common: add rt713 support
        commit: b6d6e5abf64562985fdbbdbdfe8088cde634d834
[05/23] ASoC: Intel: MTL: Add entry for HDMI-In capture support to non-I2S codec boards.
        commit: e5bc0a508881eed7a328dd4dd3efad733d90912c
[06/23] ASoC: Intel: sof_sdw_rt712_sdca: construct cards->components by name_prefix
        commit: 5124d08d0ea49c7f4dda989827d0959e58a22150
[07/23] ASoC: Intel: sof_cs42l42: remove hdac-hdmi support
        commit: 8e7377d66e6885c9256f82cb0c1f009d91e6efb8
[08/23] ASoC: Intel: sof_da7219: remove hdac-hdmi support
        commit: b6019b583066e5237f7e0fd11e63bb9896596dde
[09/23] ASoC: Intel: sof_nau8825: remove hdac-hdmi support
        commit: 3f95969ec478ffd0c40544b1611e82271926377a
[10/23] ASoC: Intel: sof_rt5682: remove hdac-hdmi support
        commit: 3de206a431deec55190e8bd434cff8cb9d2cfc31
[11/23] ASoC: Intel: sof_ssp_amp: remove hdac-hdmi support
        commit: 64b9f311865c72fa1b692db1500c8c07db9347b7
[12/23] ASoC: Intel: sof_hdmi: add common header for HDMI
        commit: 3ceb66edd6911b251f2406fa2044daa8d9f00d73
[13/23] ASoC: Intel: sof_cs42l42: use sof_hdmi_private to init HDMI
        commit: 9b61ac56dd0546d67babfa3babe134cb26895ab6
[14/23] ASoC: Intel: sof_da7219: use sof_hdmi_private to init HDMI
        commit: fa76fcad1d7fa43725814abba503b02871eefd5a
[15/23] ASoC: Intel: sof_nau8825: use sof_hdmi_private to init HDMI
        commit: 44267e97d0d8899deb8f0db1924b3461f88a2029
[16/23] ASoC: Intel: sof_rt5682: use sof_hdmi_private to init HDMI
        commit: d8fc817632c8bfb40ddb623d8e52fcc13eca78e4
[17/23] ASoC: Intel: sof_sdw: use sof_hdmi_private to init HDMI
        commit: 5cfe9ed22e4bb87d9d63383b12a3df025a54387d
[18/23] ASoC: Intel: sof_ssp_amp: use sof_hdmi_private to init HDMI
        commit: edb3fea37f37218010002a5b42daf1a6402f8d90
[19/23] ASoC: Intel: board_helpers: new module for common functions
        commit: 7368ae921b1c717bc1a208182995a3804da9f337
[20/23] ASoC: Intel: sof_cs42l42: use common module for HDMI link
        commit: c9314526ffe8daf70853e406ff96265baf9295a2
[21/23] ASoC: Intel: sof_nau8825: use common module for HDMI link
        commit: 498a4da506a286d9b75e07d375bd928c806d3416
[22/23] ASoC: Intel: sof_rt5682: use common module for HDMI link
        commit: 89cadbd8d8628a372aa8ffaf45b629b630111563
[23/23] ASoC: Intel: sof_ssp_amp: use common module for HDMI link
        commit: 3e1756f461edc995fc6f137b4f16d78a6d515385

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

