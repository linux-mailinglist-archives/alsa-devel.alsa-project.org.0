Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 695816B2A87
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 17:11:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7392118A6;
	Thu,  9 Mar 2023 17:10:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7392118A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678378306;
	bh=ArVCExQpw/D1wBqu7rbyyKBt7Q44nH0MhVAz9mk1mTw=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X0wldMRH7OXZBx1z9rhYr8BPLVIBLDHA48DsW5QTynefNL/F3ihyJy9OwlAE6zLZh
	 8N5bZWeEc8U94CiQlq3vM9HUcKRZ/GLkjlP10n9O87L7ew4trha2cIP5e7Os1QYzgW
	 WbYY4m0AmZ5u3bztAEUgQF9tIhDeR+1rQFscitoM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D899BF80527;
	Thu,  9 Mar 2023 17:10:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59424F8042F; Thu,  9 Mar 2023 17:10:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 009BDF80236
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 17:09:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 009BDF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZI2DeXV3
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CDAC5B81F83;
	Thu,  9 Mar 2023 16:09:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427BFC4339B;
	Thu,  9 Mar 2023 16:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678378192;
	bh=ArVCExQpw/D1wBqu7rbyyKBt7Q44nH0MhVAz9mk1mTw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZI2DeXV3d+x3DEQ4Vdu8q9VyEZFOtjf0AD/BtTSxtqE+VQIW5WF5BZKpXtHHL29/k
	 AYAgl7ElGiguClTx2NuxnrR1zLw1ZgCOxLc3yCU5Yqj+qFRb/NA6djp4Hc6BHfD3ly
	 rld1cd1g++auayX8aTq9CC8EAgqlycdRG0h21VHv5xoMhI4i9KOJzJ87RSZJ2NOFD6
	 sDdfiiugNuCW4ALmFZL9WbGIZmYtM0G6CxqEWNPv25hurEqMm/IfOWIG+UJil31XVC
	 EOXP3fs08UxY7T3vAKlfwf3WIKsXrqxxZBjp0P60aqI4is2YKDNaRhLx8d+G8U8t2i
	 cc9V9nLZoX7UQ==
From: Mark Brown <broonie@kernel.org>
To: Emil Abildgaard Svendsen via Alsa-devel <alsa-devel@alsa-project.org>
In-Reply-To: 
 <167834534835.26.10951905157889262193@mailman-core.alsa-project.org>
References: <167829274851.108660.12928497382811712287.b4-ty@kernel.org>
 <167834534835.26.10951905157889262193@mailman-core.alsa-project.org>
Subject: Re: [PATCH v2 0/1] ASoC: hdmi-codec: only startup/shutdown on
 supported streams
Message-Id: <167837819099.37742.3130240296051915539.b4-ty@kernel.org>
Date: Thu, 09 Mar 2023 16:09:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: K2SWECFJJC4YWCYR7CN3273OF3ZIVPZJ
X-Message-ID-Hash: K2SWECFJJC4YWCYR7CN3273OF3ZIVPZJ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: =?utf-8?q?Alvin_=C5=A0ipraga?= <ALSI@bang-olufsen.dk>,
 Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>, lgirdwood@gmail.com,
 linux-patches@vger.kernel.org, tiwai@suse.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K2SWECFJJC4YWCYR7CN3273OF3ZIVPZJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 09 Mar 2023 06:54:41 +0000, Emil Abildgaard Svendsen via Alsa-devel wrote:
> I have accidentally inverted "tx".
> 
> Truth table for when to ignore.
> +--------------+----+--------+-----+ +--------+-----+
> | has_playback | has_capture | TX  | | Before | Now |
> +--------------+-------------+-----+ +--------+-----+
> |      0       |      0      |  0  | |   1    |  1  |
> +--------------+-------------+-----+ +--------+-----+
> |      0       |      0      |  1  | |   1    |  1  |
> +--------------+-------------+-----+ +--------+-----+
> |      0       |      1      |  0  | |   1    |  0  |
> +--------------+-------------+-----+ +--------+-----+
> |      0       |      1      |  1  | |   0    |  1  |
> +--------------+-------------+-----+ +--------+-----+
> |      1       |      0      |  0  | |   0    |  1  |
> +--------------+-------------+-----+ +--------+-----+
> |      1       |      0      |  1  | |   1    |  0  |
> +--------------+-------------+-----+ +--------+-----+
> |      1       |      1      |  0  | |   0    |  0  |
> +--------------+-------------+-----+ +--------+-----+
> |      1       |      1      |  1  | |   0    |  0  |
> +--------------+-------------+-----+ +--------+-----+
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdmi-codec: only startup/shutdown on supported streams
      commit: e041a2a550582106cba6a7c862c90dfc2ad14492

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

