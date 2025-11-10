Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C49B7C49CB9
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Nov 2025 00:41:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 422A960228;
	Tue, 11 Nov 2025 00:41:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 422A960228
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762818088;
	bh=9B+SE1NBvAwJj+1rd+JsD2VDE6X24HWvD9uxanTA9WE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pGDcEbVhxlwXO4GOUgEF1oV+O9+JpxOFtfbPahhZj5O+7mEo0n3dA0fA/Zd2jxQw2
	 I5uEJA/7iBwHO6jVTM+fDV61scbZ6i020CxFnIz/ef4clcyCmExr0Qoe89hopoF52D
	 MHV1W8rbeRy86ZTB6xUiSdpNkNhuw+Yptr7llc74=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F0AFF805D6; Tue, 11 Nov 2025 00:40:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36C8BF805B6;
	Tue, 11 Nov 2025 00:40:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AE6BF80269; Tue, 11 Nov 2025 00:40:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE32EF80134
	for <alsa-devel@alsa-project.org>; Tue, 11 Nov 2025 00:40:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE32EF80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZiGop7J1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BC4C243394;
	Mon, 10 Nov 2025 23:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74307C4CEFB;
	Mon, 10 Nov 2025 23:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762818002;
	bh=9B+SE1NBvAwJj+1rd+JsD2VDE6X24HWvD9uxanTA9WE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZiGop7J1GtISl35MNsme9e3xC6UiUBM6j5LvlaFSCdC7fbe8Nk9rMOEOQUkcSZR7w
	 219GK6+L8xYWt3CCOIIEhRbqpcI/GtvN+cbtI2HTSlh1yQdTWe760AOlM4MgNyCQuE
	 2XxcEBd98tGETJ1fI2bVYcHd65MgltpMRl5Cvs1idNluw72wQrw37HLlQehf4+DBTH
	 HdP7zOWLX/LLll+pY0ed4dtjMRen9stXkRe3YN8ZxdOWDPdKe3/pPVTPRll92um9VY
	 bbAgpy4+2wJCglCtHjLyMrIEzua7S9pyHu6MjGNK6FXMs33DZH+9BJJow0MtlsEj+O
	 MCpSrVcp2aBVw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Niranjan H Y <niranjan.hy@ti.com>
Cc: ckeepax@opensource.cirrus.com, mstrozek@opensource.cirrus.com,
 yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.dev, navada@ti.com, shenghao-ding@ti.com,
 v-hampiholi@ti.com, baojun.xu@ti.com, dan.carpenter@linaro.org
In-Reply-To: <20251110152646.192-1-niranjan.hy@ti.com>
References: <20251110152646.192-1-niranjan.hy@ti.com>
Subject: Re: [PATCH v2] ASoC: SDCA: bug fix while parsing
 mipi-sdca-control-cn-list
Message-Id: <176281799748.170742.16863257175809066570.b4-ty@kernel.org>
Date: Mon, 10 Nov 2025 23:39:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3
Message-ID-Hash: XGPBXLBPPUAE7XCNCJFNP6MG2F4ZTVJ7
X-Message-ID-Hash: XGPBXLBPPUAE7XCNCJFNP6MG2F4ZTVJ7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XGPBXLBPPUAE7XCNCJFNP6MG2F4ZTVJ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 10 Nov 2025 20:56:46 +0530, Niranjan H Y wrote:
> "struct sdca_control" declares "values" field as integer array.
> But the memory allocated to it is of char array. This causes
> crash for sdca_parse_function API. This patch addresses the
> issue by allocating correct data size.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SDCA: bug fix while parsing mipi-sdca-control-cn-list
      commit: eb2d6774cc0d9d6ab8f924825695a85c14b2e0c2

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

