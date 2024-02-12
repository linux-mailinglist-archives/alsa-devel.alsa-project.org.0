Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48063851814
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 16:33:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8143CDEE;
	Mon, 12 Feb 2024 16:33:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8143CDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707752014;
	bh=CEnaQkbIC01m+BDlqGh2/E5132Uf2zj3DyvAOzpwVB8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TLbKyX9eveAqXlUMm1iJW3ER45NpmUCUYeyIz3/ZDLiaOjI7cGDIClRA413nRAWui
	 47+v3NG6EuKC4L2MV1Tpj8geVpQ7u9ZB8X89QjgWlxe2P0Ki4/5nfDKcttnZ/IGZF/
	 O9HFYAjar6RDq66+aj6Tzku6O19LAFIPQjLxUJes=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AB89F80567; Mon, 12 Feb 2024 16:33:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8A35F805A0;
	Mon, 12 Feb 2024 16:33:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC86AF80238; Mon, 12 Feb 2024 16:32:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7E05F800EE
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 16:32:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7E05F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SN+yINO3
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 313A260BAF;
	Mon, 12 Feb 2024 15:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3898C43394;
	Mon, 12 Feb 2024 15:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707751971;
	bh=CEnaQkbIC01m+BDlqGh2/E5132Uf2zj3DyvAOzpwVB8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SN+yINO3ijbKdKKhVIlQKBVuz3xSlwVIiv6QonaLPlO2pjOGeesOWZEBUjCjaCGKy
	 cS4qPgvGedEg6ayQRCL3HRW76ERVUVxIVVtZHQuayy32k6uk2YHfNfeQZtFVEe28io
	 7Jl65kgQiCWY5BzJss60dkrEEjFEIjZmuJ5e0IQwE/bYNVmTBePOnKC+0t9FGMd4G0
	 Iw8Av1dpBcGT11W4hvnwh8TUgDDCePwXi7rMuHpg0BqDaTy3wtu7XvI3EHObiGPokQ
	 nqAAQSYhJ8aV/MQZAPlDGNIA/olILNAsRASi/GhuAHwA7kiwfxc9ZO1picQ7i/5ony
	 BUkoP29mFrisQ==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org
In-Reply-To: <20240211212736.179605-1-hdegoede@redhat.com>
References: <20240211212736.179605-1-hdegoede@redhat.com>
Subject: Re: [PATCH 1/2] ASoC: rt5645: Make LattePanda board DMI match more
 precise
Message-Id: <170775196940.45969.9762988105906188343.b4-ty@kernel.org>
Date: Mon, 12 Feb 2024 15:32:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: SPAP74M5WAMCIJ5UGUOOYH7I5RZQA4CS
X-Message-ID-Hash: SPAP74M5WAMCIJ5UGUOOYH7I5RZQA4CS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SPAP74M5WAMCIJ5UGUOOYH7I5RZQA4CS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 11 Feb 2024 22:27:35 +0100, Hans de Goede wrote:
> The DMI strings used for the LattePanda board DMI quirks are very generic.
> 
> Using the dmidecode database from https://linux-hardware.org/ shows
> that the chosen DMI strings also match the following 2 laptops
> which also have a rt5645 codec:
> 
> Insignia NS-P11W7100 https://linux-hardware.org/?computer=E092FFF8BA04
> Insignia NS-P10W8100 https://linux-hardware.org/?computer=AFB6C0BF7934
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rt5645: Make LattePanda board DMI match more precise
      commit: 551539a8606e28cb2a130f8ef3e9834235b456c4
[2/2] ASoC: rt5645: Add DMI quirk for inverted jack-detect on MeeGoPad T8
      commit: d6755a53b8dde434220a164c756190345772843a

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

