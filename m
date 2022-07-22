Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC3157E19E
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jul 2022 14:49:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B8B018B8;
	Fri, 22 Jul 2022 14:49:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B8B018B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658494194;
	bh=lcEC2kCCCKbO1yjbDbyfX8qWq8HYcFr/tlhbvJ8XuHI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cbTzxygNEyDVvU5q38h3TkbbaW+MEBBvVDQB7Qyp+gAd7ceYOXq49aC4HWEMYshG/
	 MNXGUkVYaupb8lPnDW/Pg/ic8s9zq9oRCrr6qbS5vemscUQqkxyhodlrpIDw49l5Xb
	 iobx8u4mUPSEmK185j4QK3ya1ZUbXpfdHn8NulG0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5805F802DB;
	Fri, 22 Jul 2022 14:48:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF4B5F80506; Fri, 22 Jul 2022 14:48:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0E69F8016D
 for <alsa-devel@alsa-project.org>; Fri, 22 Jul 2022 14:48:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0E69F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eraogMMy"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 14DDAB828EA;
 Fri, 22 Jul 2022 12:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A290C341CA;
 Fri, 22 Jul 2022 12:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658494096;
 bh=lcEC2kCCCKbO1yjbDbyfX8qWq8HYcFr/tlhbvJ8XuHI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=eraogMMyWRM05UkIcrgH2Jet2YLCblC54Gjgn/qqaLdS7jN8hg9jZcniK3hegC6C1
 7BZ5DTQkdoFXiFz6lJEyN0CU7h8u1Oa1CFB99AyF7P9MQxmTMB5NxZJjstbzSLf6IM
 2ZhzvN8uJEMVQvyLor6UuLx9Hex90dfZizAwCcIHjoziVUa1R++EHhfx3Zj3JHxk3X
 Pd5Gfx1KkKCWhhBXJCyhd7ItKCsFEl3TXaBpWrYFKyeR5UjCvuOJWHN5UsuleIJEPE
 xr60HY6gEax+/41XXSBlHHf6X0Bb0wgTVNHfSLAv4ABxWwaovdqR/qAI2qoN4ICzI6
 QRjgRs/oBuEGw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
In-Reply-To: <20220721062043.3016985-1-venkataprasad.potturu@amd.com>
References: <20220721062043.3016985-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH 1/5] ASoC: amd: acp: Modify local variables name to generic
Message-Id: <165849409334.139149.4436089052962761200.b4-ty@kernel.org>
Date: Fri, 22 Jul 2022 13:48:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-d952f
Cc: Sunil-kumar.Dommati@amd.com, Charles Keepax <ckeepax@opensource.cirrus.com>,
 ssabakar@amd.com, Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Basavaraj.Hiregoudar@amd.com,
 Vijendar.Mukunda@amd.com, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Yang Yingliang <yangyingliang@huawei.com>,
 vsujithkumar.reddy@amd.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 21 Jul 2022 11:50:33 +0530, Venkata Prasad Potturu wrote:
> Change local variables name to be generic in irq handler.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: amd: acp: Modify local variables name to generic
      commit: 93f53881473cbf6a364be36ccbb99568e04ffe59
[2/5] ASoC: amd: acp: Drop superfluous mmap callback
      commit: afde6727a9b66ff96e20d74ac392f3efdae1ceaf
[3/5] ASoC: amd: acp: Initialize list to store acp_stream during pcm_open
      (no commit info)
[4/5] ASoC: amd: acp: Modify const resource struct variable to generic
      commit: 96b008a1c2e9f455d982e9cfb7117a3a0fc8f550
[5/5] ASoC: amd: acp: Add error handling cases
      commit: c49f5e74a11e3909c424cada0f5d52345084933f

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
