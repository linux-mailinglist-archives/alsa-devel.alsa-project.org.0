Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 022EA916646
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2024 13:34:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C2D686F;
	Tue, 25 Jun 2024 13:34:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C2D686F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719315284;
	bh=8hGDqALa72DGfTvkkhudJJF0q5sZIpRhO2CA+FW1mns=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ey6F+u+RatbB7AsTO1J4ZtQRYDRPBuzcC5IuHzY7gj3TYy/sXMoEwfNeWT1EKddMD
	 xT0T0Em6/r1m/zK9ZeAEaB+pYPgUyY2K5U5B1iDeHR9jyH653+woH4ceqLS6Og44HG
	 ru2H7pkiVNgBSe393zNDdK5ILjNcbhtHpXHfOdsE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10D5DF805BD; Tue, 25 Jun 2024 13:34:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53FEEF805B1;
	Tue, 25 Jun 2024 13:34:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64AB2F80495; Tue, 25 Jun 2024 13:34:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 24B80F80154
	for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2024 13:34:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24B80F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AEp6bcX6
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1D815611D7;
	Tue, 25 Jun 2024 11:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 418A2C32781;
	Tue, 25 Jun 2024 11:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719315237;
	bh=8hGDqALa72DGfTvkkhudJJF0q5sZIpRhO2CA+FW1mns=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AEp6bcX6PnlRu8gb8oZBfRc72mvhqpdoL2f8YzjfrqwAoT0jw9qcct/gKhCZC4ZhZ
	 sMj1G8gk2kLGERhyYTBOyUnMnh/B4M5Sp+FD4M8YTaP8YJBDsZdOsOUr9i0msrlg6j
	 QXj0zKRN81oBhepi1lKrcuuQki5DvARxHEWrhlMIICguL3pgkyFHCq07Nw6HJWt8Nn
	 KjeG2kc29LgX7bx8TBV53h+crl/sWjvjothoTE6nb7TuiM/A4iY7Aiq4AYsCwsTioi
	 ANncir6psWysfoln2gr6FJ8AZJ5qMLX58jhmD6cGkNGbDrZtqZqeS1jN+GLYz8SBVi
	 SGTBj6P2N8w4A==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
 pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
 zhourui@huaqin.com, alsa-devel@alsa-project.org, i-salazar@ti.com,
 linux-kernel@vger.kernel.org, j-chadha@ti.com, liam.r.girdwood@intel.com,
 jaden-yue@ti.com, yung-chuan.liao@linux.intel.com, dipa@ti.com,
 yuhsuan@google.com, henry.lo@ti.com, tiwai@suse.de, baojun.xu@ti.com,
 soyer@irl.hu, Baojun.Xu@fpt.com, judyhsiao@google.com, navada@ti.com,
 cujomalainey@google.com, aanya@ti.com, nayeem.mahmud@ti.com,
 savyasanchi.shukla@netradyne.com, flaviopr@microsoft.com, jesse-ji@ti.com,
 darren.ye@mediatek.com
In-Reply-To: <20240621132309.564-1-shenghao-ding@ti.com>
References: <20240621132309.564-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v1] ASoc: tas2781: Add name_prefix as the prefix name
 of firmwares and kcontrol to support corresponding TAS2563/TAS2781s
Message-Id: <171931523198.64144.6255900977380836517.b4-ty@kernel.org>
Date: Tue, 25 Jun 2024 12:33:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: Y7MKGKJPSXI5MBIIZXTCTEOVPGY24RH5
X-Message-ID-Hash: Y7MKGKJPSXI5MBIIZXTCTEOVPGY24RH5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y7MKGKJPSXI5MBIIZXTCTEOVPGY24RH5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 21 Jun 2024 21:23:07 +0800, Shenghao Ding wrote:
> Add name_prefix as the prefix name of firmwares and
> kcontrol to support corresponding TAS2563/TAS2781s.
> name_prefix is not mandatory.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoc: tas2781: Add name_prefix as the prefix name of firmwares and kcontrol to support corresponding TAS2563/TAS2781s
      commit: 00dd4d86ed908e70d912a96ad91d1248ff055b62

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

