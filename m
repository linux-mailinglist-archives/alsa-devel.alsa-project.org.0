Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D88377D345
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 21:20:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFD2393A;
	Tue, 15 Aug 2023 21:19:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFD2393A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692127224;
	bh=gUvQfmxcGVeEKTlqYtZdiuzcahELzBbHAsRWq0JLUuc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o/YgVxiOzm48Sua0Iyidp4HG9/SlQVrHDybVJDmYURjDa11GC7mSD58cTtqzF6GGC
	 x20IIxI4MgB/T0IH6vfrnCs9gffucFiXwskqNH0j6SmGhkIqKMXxMCaZDZNiTisigJ
	 9WgRHsuNTG/sHfuHMoDkafIYHhUnnCITO3b4UoYA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19C82F805C0; Tue, 15 Aug 2023 21:18:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0FB3F805AE;
	Tue, 15 Aug 2023 21:18:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95EDBF80553; Tue, 15 Aug 2023 21:17:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C710FF80551
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 21:17:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C710FF80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=O8zDF1fq
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 88C91660A3;
	Tue, 15 Aug 2023 19:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE76C433C7;
	Tue, 15 Aug 2023 19:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692127071;
	bh=gUvQfmxcGVeEKTlqYtZdiuzcahELzBbHAsRWq0JLUuc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=O8zDF1fqxLFf0GbGS5LewfOXFPh0r8sdIf3xkF/cZoG0VrTgSGOpIQKU0TSlNkkre
	 v6yqH5Mv9UVE0Tmn6Rq55tXz/oX7HaY2OsywA2rYmXEfHzPlk9wKMxZzkBrBoU4+6p
	 B9tpcXS3T4wHpED4WklFLM758H8kLgYcjLGOmYnE+q1xUE5wcWC7lQoVYjzdr8dWW7
	 4X7IevlG8OmyXhzQbnpncePLFBbljtdJN76TBqrdnf57v+xV7JZ1O6ZajlqAVFvWJ7
	 +VkQHn5tmpaQrn1nEA3CRXTRTBoeWVwyreGcMciuJkkusRIaRvptMuwDIBXe1rhKDu
	 gt1NQ3SN7JNfA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, Chao Song <chao.song@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20230814231519.79051-1-pierre-louis.bossart@linux.intel.com>
References: <20230814231519.79051-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: Refactor code for HDA stream
 creation
Message-Id: <169212706930.68178.10530599536892993440.b4-ty@kernel.org>
Date: Tue, 15 Aug 2023 20:17:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: OA7HZAUC3MARRGCIUSTVEKG4GWXZ4XTT
X-Message-ID-Hash: OA7HZAUC3MARRGCIUSTVEKG4GWXZ4XTT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OA7HZAUC3MARRGCIUSTVEKG4GWXZ4XTT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 14 Aug 2023 18:15:19 -0500, Pierre-Louis Bossart wrote:
> Existing HDA stream creation is split into two
> for loops for capture and playback, but most of
> the code in the two for loops are duplicated.
> 
> This patch refactors HDA stream creation with a
> single for loop, thus remove code duplication.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: Refactor code for HDA stream creation
      commit: a942409c97ce12c2a4811b538568b1342d91e56c

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

