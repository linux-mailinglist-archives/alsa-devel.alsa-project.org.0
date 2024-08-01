Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B90D944FAC
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 17:52:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31DAE302F;
	Thu,  1 Aug 2024 17:51:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31DAE302F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722527501;
	bh=iYGjz5wWkZLISFpAMKzEMaWl3XZXYXtSgVK6ZPtOqfo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HXVoKnNx+pvYwva820JV7plpfUKBYCllEUIb3/wG2vqRm776d1969aBYsRru6c+ea
	 eCIxyIzpdZUh5681wlEF+bscWQJ4aQgoBNDI6tXsKGqxYpLNhVJiCp7Fp1TDcOdWEe
	 p55BElyzg7wBgkb+36u5/cmMi7FChuRcKRqkeUTc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2082F805BA; Thu,  1 Aug 2024 17:51:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ACC7F805AD;
	Thu,  1 Aug 2024 17:51:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6C95F8026A; Thu,  1 Aug 2024 17:49:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1FFE9F800E3
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 17:49:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FFE9F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gHcJRw2x
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E8A466288B;
	Thu,  1 Aug 2024 15:49:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21BFBC32786;
	Thu,  1 Aug 2024 15:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722527369;
	bh=iYGjz5wWkZLISFpAMKzEMaWl3XZXYXtSgVK6ZPtOqfo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gHcJRw2xPH0gryYCy/wSQKC5yz/HiOiyUMBvNQjEuoaPhKNE//VtDIpMZV/q8BsY3
	 EtdIir+JZc1XY8oKZobi9pDDMTpaTouGNu9YBVCwYWFjbVmHmbldt/GhcxIQbXgA8m
	 wrpZZ+/wtVt/c9P8pKw2fwDQW4N71MdTQBcYJMlbTLZXLvLY90Taii0MvQaoUi9HgE
	 a51VKmqpOME10flRlTCCA8i+xbI9sCajDeufPtvS26fzM1HLxfMr86EqzUCileJopj
	 21Ge7N3E0vLXaDyNuywyJUmV/6jU3ltVv9anXsQHVm5HCfeYfmxP/hq65GD6HN9+wB
	 hIgV8pMgDU+qg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, cujomalainey@chromium.org
Cc: Wojciech Macek <wmacek@google.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <20240731212153.921327-1-cujomalainey@chromium.org>
References: <20240731212153.921327-1-cujomalainey@chromium.org>
Subject: Re: [PATCH] ASoC: SOF: Remove libraries from topology lookups
Message-Id: <172252736584.96807.18418907013816022925.b4-ty@kernel.org>
Date: Thu, 01 Aug 2024 16:49:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: 2FQYJZSDBHT6WUH22FDUVUEPIY2CH36S
X-Message-ID-Hash: 2FQYJZSDBHT6WUH22FDUVUEPIY2CH36S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2FQYJZSDBHT6WUH22FDUVUEPIY2CH36S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 31 Jul 2024 14:21:44 -0700, cujomalainey@chromium.org wrote:
> Default firmware shipped in open source are not licensed for 3P
> libraries, therefore topologies should not reference them.
> 
> If a OS wants to use 3P (that they have licensed) then they should use
> the appropriate topology override mechanisms.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Remove libraries from topology lookups
      commit: 7354eb7f1558466e92e926802d36e69e42938ea9

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

