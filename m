Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5437B5630
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 17:19:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 603E0E85;
	Mon,  2 Oct 2023 17:18:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 603E0E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696259975;
	bh=ER6oLVHxt79NWJRk4i6TQYMDnVPa/mQSBVn1tmMNCvk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pnBB7aQuSznAi0QJxRpMstPO3r3R3O4k+6hoo4WEiiJBw4cyM1m3FzTXu9LyPaeFW
	 Htf2TjjQtU1OF4JiUnoochouCOeYAZvSrboWNCIR20X89KZ9vtM9O7qWV3ONJOm5Ot
	 F0rRUiRcHv7LIOLXodkPEkS2zOu6KEoSLb+1Ji2Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFF61F8059F; Mon,  2 Oct 2023 17:18:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBC94F80553;
	Mon,  2 Oct 2023 17:18:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA5E3F8055C; Mon,  2 Oct 2023 17:18:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77C5DF80587
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 17:17:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77C5DF80587
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NxQuX+QI
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0A80B60F4B;
	Mon,  2 Oct 2023 15:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B693C433C8;
	Mon,  2 Oct 2023 15:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696259857;
	bh=ER6oLVHxt79NWJRk4i6TQYMDnVPa/mQSBVn1tmMNCvk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NxQuX+QICNK9ffUBus5qmweKQ0JZMHcxdvRWiiOil8fkQD3VXK9x+JEoOLi4NFTo2
	 ewJI1kBalKZbVTai3b5QD1rs202AWarmW5ZmYm/NP4UoNLOcuS2zmaD8IzLBb53GUk
	 bpeutcVFTgB1KxBNFjxVRIPHsWVgDN/C83drI2xrr0wb1KzpmZPSMuv8gD9H0dKBMD
	 6ixWQzbSVb5P5xKChC/JILDPZJvq+wHzjpC29cOI6GD74AITUhHjWKnVsKOOkqJxe4
	 r3PK+Nw/rvhYkCGNG7y7+QYUoZtpBh3ExDZu+/ZOG/ImJMQUiFd2vrFARfFXRBpYWw
	 zriimCuzJOerw==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
 lgirdwood@gmail.com, perex@perex.cz, pierre-louis.bossart@linux.intel.com,
 kevin-lu@ti.com, 13916275206@139.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
 mengdong.lin@intel.com, baojun.xu@ti.com, thomas.gfeller@q-drop.com,
 peeyush@ti.com, navada@ti.com, tiwai@suse.de
In-Reply-To: <20231002090434.1896-1-shenghao-ding@ti.com>
References: <20231002090434.1896-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2781: fixed compiling issue in m68k
Message-Id: <169625985375.65718.17717967920351925508.b4-ty@kernel.org>
Date: Mon, 02 Oct 2023 16:17:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 25LEOF5BX2MFVC36SAS2GWBU7OOO57F5
X-Message-ID-Hash: 25LEOF5BX2MFVC36SAS2GWBU7OOO57F5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/25LEOF5BX2MFVC36SAS2GWBU7OOO57F5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 02 Oct 2023 17:04:33 +0800, Shenghao Ding wrote:
> fixed m68k compiling issue: mapping table can save code field; storing the
> dev_idx as a member of block can reduce unnecessary  time and system
> resource comsumption of dev_idx mapping every time the block data writing
> to the dsp.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: fixed compiling issue in m68k
      commit: 4c556d1ea5a771a91f946964d931b4974a6b917e

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

