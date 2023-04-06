Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A486D9E23
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 19:06:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB477F49;
	Thu,  6 Apr 2023 19:05:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB477F49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680800771;
	bh=N5sK912klgM/ER4FqKzjHt+WOW/x7tYhI9GbmghRsGU=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n8atpwKQVuUhc6jXsrk/d8J0QOmIgVhO2iP74wag02/CU26wZDauKjPgLT7mB4If4
	 rIwJYP8q4i2vB0Lyqyqf/0SMV5SPMIFw2R9kxm8JhvOTf8ad5noOtRZnk+aCS4CwuT
	 h0x2uIVQCasP+kDKV5DP+Xl8hM35X2Qn8C2DezJY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45B20F80448;
	Thu,  6 Apr 2023 19:04:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5BDAF80246; Thu,  6 Apr 2023 19:04:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E6FCF8013D
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 19:04:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E6FCF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pL0yTd04
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 83F8C60F00;
	Thu,  6 Apr 2023 17:04:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD74CC4339B;
	Thu,  6 Apr 2023 17:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680800658;
	bh=N5sK912klgM/ER4FqKzjHt+WOW/x7tYhI9GbmghRsGU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pL0yTd04/gErDoWvVDm9b7CP9sESV7p96kxrEO5iN4rj2cGckz0xez902l554JX3d
	 ysQfqcifYq+gpnd2vgdjCZpf+fE6gzJjwYJTsbkjHfC0fRLPIcHiRsprWOPXvGPHbY
	 H0mEuDouFt3zYYbe/D+Fky014DuNmtAYloAkxYyqG11sSKBA3EE0ImLoA6JAoHj5nw
	 Zrno0pNkXbYluDUKrmizMPxwfSTHJZFffObHY/kxrdhUgikw3SawhXhePUqrrKJ08P
	 8n3wBsfu8h8b/JRITlesueh8iBFCY5ZbS27wdWVaY0liRMeX+Nyt/fOE7SZexYc1n8
	 RlEBn0wPjE6kg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230406152937.15347-1-pierre-louis.bossart@linux.intel.com>
References: <20230406152937.15347-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: add __func__ in SoundWire
 lcount() error logs
Message-Id: <168080065763.124805.8466344785211173312.b4-ty@kernel.org>
Date: Thu, 06 Apr 2023 18:04:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: ZP6FNCLF3KTY4TWIETDMGQOVXB74X4X6
X-Message-ID-Hash: ZP6FNCLF3KTY4TWIETDMGQOVXB74X4X6
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZP6FNCLF3KTY4TWIETDMGQOVXB74X4X6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 06 Apr 2023 10:29:37 -0500, Pierre-Louis Bossart wrote:
> Make sure SoundWire lcount helpers have unique error logs, but a
> common pattern for reporting issues.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda: add __func__ in SoundWire lcount() error logs
      commit: e41e1f4ae47499061bec3446c927bdfd2210a329

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

