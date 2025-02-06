Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA39A2AD77
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2025 17:17:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A43E601D1;
	Thu,  6 Feb 2025 17:17:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A43E601D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738858640;
	bh=euxmex5Ih94Su5W7AxtxokAUGnR7WW9vhgfGMkBJxRg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UtUErONBg8nkFRslGI1AfOL01sa2ENCpGytE1QbNxZ/MVnoidoqrZlL3iJoGSXiqT
	 Dmv7D2HxpzFU1AdDCMTxyrHqqgUidpQtNj2cEAVNBeiMfRALwTVXKYlkp3jHsCD5cY
	 CUVgdjaUlexILB/uffpiMmuFZnAj3kvnleS86m5s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EA33F805B4; Thu,  6 Feb 2025 17:16:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0F1DF805B4;
	Thu,  6 Feb 2025 17:16:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0B4CF802DB; Thu,  6 Feb 2025 17:16:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1B3A2F800B8
	for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2025 17:16:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B3A2F800B8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Zc9QN+4p
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A986A5C5AEA;
	Thu,  6 Feb 2025 16:15:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8834C4CEE2;
	Thu,  6 Feb 2025 16:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738858583;
	bh=euxmex5Ih94Su5W7AxtxokAUGnR7WW9vhgfGMkBJxRg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Zc9QN+4pxtJlKGZB3SVGdd7JswBGW4oVcRp79dv8PjvxTBgCQHPOxMSo9xJC3PuSW
	 5Uqj7Rck13x7zXHZbWQPr3/HjRmrNPCFctqa/jT2UuWwSmEz1sRctcNOCGoB8iidzc
	 FIoMMXNyMm7USSQGau9ISKNYm/+mw6IRKs5eEpvDWH5ANJcM5YXl4hSLjs8q6fUEvs
	 e3kXHM4CXJRGPMgTmFcaZBOjGP4T/G0WmtqwqdeSbJkfAm7mXo7JqL9N02ffhNcFLD
	 yBU1aLmZbuNO5ptcrkcPw11VH94VQPXBLtyn08FuHjvFD3B5/BZdC7uflD8R5jd91R
	 Lnefz9Nz4Fsvg==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, 13916275206@139.com,
 13564923607@139.com, alsa-devel@alsa-project.org, tiwai@suse.de,
 baojun.xu@ti.com
In-Reply-To: <20250206123808.1590-1-shenghao-ding@ti.com>
References: <20250206123808.1590-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2781: drop a redundant code
Message-Id: <173885858154.298176.15998059453501823567.b4-ty@kernel.org>
Date: Thu, 06 Feb 2025 16:16:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
Message-ID-Hash: TXYIWHUOF5WLZH4MEGK2HAYKJ5JOCT7M
X-Message-ID-Hash: TXYIWHUOF5WLZH4MEGK2HAYKJ5JOCT7M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TXYIWHUOF5WLZH4MEGK2HAYKJ5JOCT7M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 06 Feb 2025 20:38:08 +0800, Shenghao Ding wrote:
> Report from internal ticket, priv->cali_data.data devm_kzalloc twice,
> drop the first one, it is the unnecessary one.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: drop a redundant code
      commit: 0b06000704f8ae72056ad777a67742b7799d6660

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

