Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5569689191E
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Mar 2024 13:35:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF0CD2CA4;
	Fri, 29 Mar 2024 13:35:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF0CD2CA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711715746;
	bh=RohNcsAhkui5AAi6xno0D/2X6go3eTFnCBjnGqNXUIY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EQdOM2JC+V17qeqmKhhhqaZzg92+FNoXti5MOAI9nVaKkaCg/m358RgFTbTaoDqSk
	 NrnXpG2RrcSx8ZdDohZ/sI4ZuHnGuIJOrmthQJZIGR7PfXprGm4yIsN6KPd1yB61j8
	 1HgIQc9gltbYVPWCx7AVypRarUbbueVSbvuFkWc8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C34BBF80612; Fri, 29 Mar 2024 13:34:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4558AF80614;
	Fri, 29 Mar 2024 13:34:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56DEFF805D8; Fri, 29 Mar 2024 13:34:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8CA5F80236
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 13:34:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8CA5F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KPWNlPf4
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 843DD6192E;
	Fri, 29 Mar 2024 12:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BEEFC433C7;
	Fri, 29 Mar 2024 12:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711715650;
	bh=RohNcsAhkui5AAi6xno0D/2X6go3eTFnCBjnGqNXUIY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KPWNlPf4DD+7KgZIoXPUG64PoVVaagbuPiFPkn9ZMepVV5t1NXaOqDOYfcpNyIvMl
	 5IdJ6TYrcYLYZLi2Vh3ESyojBpb6pGkrQtrW4gkki1oht+H48OBZD7o/bLGZJw6GKr
	 P2/hMWe7pirGqtDrBxgWEu6jW/2zGzAFd32y3KxcBvSwJnPwCBnjAiL4ZmIpc/DRY+
	 R/5FizujxuidhpXkVebK8JporWrria0GxF7omins3hLuNefkSf2Gl9janBDrCuA1o0
	 ETpmBpd4sF+pXz7mf0LC0Pn23PnpRT9LJdbCat8vJx5vcwVn+dPR6XLMRZVCYZM2fv
	 +m7evwHqhj3zQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240325221817.206465-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221817.206465-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/6] ASoC: rt-sdw: fix locking and improve error logs
Message-Id: <171171564910.7557.17157942559028240962.b4-ty@kernel.org>
Date: Fri, 29 Mar 2024 12:34:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: D4OE44XXFF42IUBEWQMDTZS4JGPMS4FK
X-Message-ID-Hash: D4OE44XXFF42IUBEWQMDTZS4JGPMS4FK
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 25 Mar 2024 17:18:11 -0500, Pierre-Louis Bossart wrote:
> Fix a set of problematic locking sequences and update error messages,
> tested on SOF/SoundWire platforms.
> 
> Pierre-Louis Bossart (6):
>   ASoC: rt5682-sdw: fix locking sequence
>   ASoC: rt711-sdca: fix locking sequence
>   ASoC: rt711-sdw: fix locking sequence
>   ASoC: rt712-sdca-sdw: fix locking sequence
>   ASoC: rt722-sdca-sdw: fix locking sequence
>   ASoC: rt-sdw*: add __func__ to all error logs
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: rt5682-sdw: fix locking sequence
      commit: 310a5caa4e861616a27a83c3e8bda17d65026fa8
[2/6] ASoC: rt711-sdca: fix locking sequence
      commit: ee287771644394d071e6a331951ee8079b64f9a7
[3/6] ASoC: rt711-sdw: fix locking sequence
      commit: aae86cfd8790bcc7693a5a0894df58de5cb5128c
[4/6] ASoC: rt712-sdca-sdw: fix locking sequence
      commit: c8b2e5c1b959d100990e4f0cbad38e7d047bb97c
[5/6] ASoC: rt722-sdca-sdw: fix locking sequence
      commit: adb354bbc231b23d3a05163ce35c1d598512ff64
[6/6] ASoC: rt-sdw*: add __func__ to all error logs
      commit: f892e66fcabc6161cd38c0fc86e769208174b840

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

