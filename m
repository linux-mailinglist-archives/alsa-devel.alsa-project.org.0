Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 206A57298F3
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 14:04:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 373BF3E;
	Fri,  9 Jun 2023 14:03:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 373BF3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686312265;
	bh=NGGxlKuQ91mS1ctq8IAbKwyJduKLClii+OA9Iz1bpi4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BZsoP7GSH9gdPMp4d1ixo5QzHungSFNNEbuJq9hLICVO4E0XhngU9XMJiVyJBKSqx
	 k9tx83kVjvjOvfPqYODm8WCqcG9srX2bc6+RVSua9cMJLVIKTpIlL1n2oLYZkCOL6R
	 ED35l+F0fM72UrougGGwhn+Si0CK9581dY5Mm7j0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51BA5F800ED; Fri,  9 Jun 2023 14:03:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CCB25F80199;
	Fri,  9 Jun 2023 14:03:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E564CF80254; Fri,  9 Jun 2023 14:03:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4EF3DF80130
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 14:03:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EF3DF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dq6pDqp1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 82B4165749;
	Fri,  9 Jun 2023 12:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC60C433EF;
	Fri,  9 Jun 2023 12:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686312196;
	bh=NGGxlKuQ91mS1ctq8IAbKwyJduKLClii+OA9Iz1bpi4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dq6pDqp1SBU72UrxEXz0l2ZSSiDsVEXGKNjtZcn+1RRrQ6hru/N9GUSmKGNZi9BmB
	 zCsuJEKj6HaP3FC3pQvrNqBXqPF2h4DxujyMBnOG4B3qUrnf9FxZ0gkcSszaqr7+a2
	 v2DCo4sFhJ30GTmL6BUcvf0XawYH87jm0L/Nc6bi4EOLU08h79zHUuKPfE+GZ9PfRK
	 QyrI/CmXBrgldD0XS76dkOdUOqEKH+vMcVh8c7MqOPhfxsBFWU6/3bou4Ittd8hZxU
	 uBn7cawMUdwUwgxT8EhLRpqeAXQ3t94wzoTgHjkbGxs8cSI5rq6m/d3of6xJj4lUBw
	 qZSV+gkx1S5zQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, cujomalainey@chromium.org
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20230608221822.2825786-1-cujomalainey@chromium.org>
References: <20230608221822.2825786-1-cujomalainey@chromium.org>
Subject: Re: [PATCH 1/2] ASoC: SOF: Refactor rx function for fuzzing
Message-Id: <168631219449.40482.11890865852608851986.b4-ty@kernel.org>
Date: Fri, 09 Jun 2023 13:03:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: XMMIUUV27JLEQ25KAH3A7Q75HBLSYSFV
X-Message-ID-Hash: XMMIUUV27JLEQ25KAH3A7Q75HBLSYSFV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XMMIUUV27JLEQ25KAH3A7Q75HBLSYSFV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 08 Jun 2023 15:18:15 -0700, cujomalainey@chromium.org wrote:
> Refactor the function so reading the data is done outside the work
> function so fuzzing can pass data directly into the work callbacks.
> 
> Also expose the inner function outside the module so we can call it from
> the injector.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: Refactor rx function for fuzzing
      commit: 12c41c779fad54714ce4901757374f6006a88644
[2/2] ASoC: SOF: Add IPC3 Kernel Injector
      commit: 70dad53ddff0778c4920a1ee9eb1cfea539d4e91

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

