Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB5F90876B
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2024 11:28:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51E25B6A;
	Fri, 14 Jun 2024 11:28:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51E25B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718357327;
	bh=2tVQbTkd4UUy56SjjbpsW9cV+eBjwXncj+hCcFOXx6c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aBVYnyFHgTcZBFayef3VVeGEUeyz9wtwz8z3lr+Te4o0+7uinTPifHhJwEZqWxCAE
	 FeixMTU8Nag221m6y+1IZxKwGYWpaqp6Unv4U7DGN87NNYc2TNoacBuBPtHY9knmSd
	 jZU+dM4OT9lMswSauvT2sgU+QsVo0+FNksfiV1eY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41920F805AC; Fri, 14 Jun 2024 11:28:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF161F805AE;
	Fri, 14 Jun 2024 11:28:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2636F800ED; Fri, 14 Jun 2024 11:24:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C722F800ED
	for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2024 11:24:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C722F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Sy3zBBSo
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A5CD761DEF;
	Fri, 14 Jun 2024 09:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B764C2BD10;
	Fri, 14 Jun 2024 09:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718357091;
	bh=2tVQbTkd4UUy56SjjbpsW9cV+eBjwXncj+hCcFOXx6c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Sy3zBBSogsB/mbOpHKWvOxPqqgnPLeSZ9bTeo+Q59Zfue6bHCmY4JqWv1TZ6rFAMz
	 YpvXAsXql4SBuWwY3sYPd3G306fdTxMxBJXNn5KbKZpkJP5LyhOg9GDgWu53nj7YVJ
	 vCfwzUQrsS5kUkWalMPK6mjpSeZCYnxBKTuJEgMdYGi4wv7bj2zl0JrXCYZLqNjL9g
	 ustfKupCSMvBq6iUJWvTnmEAfbdEL/bX8R5b3kjpQqd5iyhv78kd0v5JgE1pm7t80l
	 noZ9fUnN5+7XHuskFew+7+AAWbZ/0lW0BufpZSLC96lcPBk8yQx8++hKRI9Lle7M5B
	 ZmAxXh3Pht8Vg==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <20240613090126.841189-1-amadeuszx.slawinski@linux.intel.com>
References: <20240613090126.841189-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: topology: Fix route memory corruption
Message-Id: <171835708812.262234.14840448418677880913.b4-ty@kernel.org>
Date: Fri, 14 Jun 2024 10:24:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14-dev-0bd45
Message-ID-Hash: 2YUE6RZFK7DEXXRG7OTTURVTYV4C2R3N
X-Message-ID-Hash: 2YUE6RZFK7DEXXRG7OTTURVTYV4C2R3N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2YUE6RZFK7DEXXRG7OTTURVTYV4C2R3N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Jun 2024 11:01:26 +0200, Amadeusz Sławiński wrote:
> It was reported that recent fix for memory corruption during topology
> load, causes corruption in other cases. Instead of being overeager with
> checking topology, assume that it is properly formatted and just
> duplicate strings.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: topology: Fix route memory corruption
      commit: b9dd212b14d27a53b63fc6621c452c0b3a01f61d

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

