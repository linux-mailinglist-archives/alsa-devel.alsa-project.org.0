Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6BF95BBA1
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2024 18:18:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6071205;
	Thu, 22 Aug 2024 18:18:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6071205
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724343512;
	bh=0jV4HNlBojpwg5t591KVgj0+vc87DyltxVeA2SVlPg4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=npSRvGzv9lbWIRLHV8d52hlSAOTVLbAyyKneSQRhH55CuLGy/G6UdJYKCRUuYU49h
	 SgBrGhp/itKufBl/HWoKQXauKg3NrJIhQpN4+qDJd2sDaekWDDknP4eu4hUVU5j7nA
	 E3+AL3sK0fqJylU7ETjp66KAQdLprcG1cBWRA81U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF7AEF805AF; Thu, 22 Aug 2024 18:18:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DA17F805AF;
	Thu, 22 Aug 2024 18:18:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 796BBF80496; Thu, 22 Aug 2024 18:17:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7407F8025E
	for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2024 18:17:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7407F8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Zrr/gv6S
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A11261221;
	Thu, 22 Aug 2024 16:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 526DBC32782;
	Thu, 22 Aug 2024 16:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724343464;
	bh=0jV4HNlBojpwg5t591KVgj0+vc87DyltxVeA2SVlPg4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Zrr/gv6S/hcp8/n1jDcYwwuhQfblMjOBv4IDn/kjRp+l0w39sjOuBqvmllZIKvhJF
	 KOXlH0FH5JTZtDrkFa5pa9KeIrmHjHYr05S0JMIKdZHHdoGFiYtB1T5jpbW43/2lWp
	 ++6GmhuipNkdZhN3q+Z6halsntotfdnMnZYM9ZTdcMG2+JzmvuAOH7dLuybZE6KOEi
	 AQfeunyAeeq321PlfWOrfzofOMJ6C03FtLcxTUCwrI6MT84VgcJRMxMA3pdCJ5wRB+
	 lxLG4u2osnCeseCIjZ7JaQdASwI+OixvNB+kI8IzHL3urGpVZmIQPoNdl2IXGuc0hX
	 G661fTBvbt5HA==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
 pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
 zhourui@huaqin.com, alsa-devel@alsa-project.org, i-salazar@ti.com,
 liam.r.girdwood@intel.com, jaden-yue@ti.com,
 yung-chuan.liao@linux.intel.com, dipa@ti.com, yuhsuan@google.com,
 henry.lo@ti.com, tiwai@suse.de, baojun.xu@ti.com, Baojun.Xu@fpt.com,
 judyhsiao@google.com, navada@ti.com, cujomalainey@google.com, aanya@ti.com,
 nayeem.mahmud@ti.com, savyasanchi.shukla@netradyne.com,
 flaviopr@microsoft.com, jesse-ji@ti.com, darren.ye@mediatek.com,
 antheas.dk@gmail.com, Jerry2.Huang@lcfuturecenter.com, jim.shil@goertek.com
In-Reply-To: <20240822063205.662-1-shenghao-ding@ti.com>
References: <20240822063205.662-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2781: mark const variables
 tas2563_dvc_table as __maybe_unused
Message-Id: <172434344473.724373.6998680460380766855.b4-ty@kernel.org>
Date: Thu, 22 Aug 2024 17:17:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: VPODUBAAFFSMQNLRNMDQVSMPG6JHUJFK
X-Message-ID-Hash: VPODUBAAFFSMQNLRNMDQVSMPG6JHUJFK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VPODUBAAFFSMQNLRNMDQVSMPG6JHUJFK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 22 Aug 2024 14:32:02 +0800, Shenghao Ding wrote:
> In case of tas2781, tas2563_dvc_table will be unused,
> so mark it as __maybe_unused.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: mark const variables tas2563_dvc_table as __maybe_unused
      commit: 1a9e3b0af301413210319e6946fb4b0b1ad71ccc

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

