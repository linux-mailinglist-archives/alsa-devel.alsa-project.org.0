Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B387F8A3F
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Nov 2023 12:39:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D222E91;
	Sat, 25 Nov 2023 12:39:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D222E91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700912351;
	bh=GwUm1z7JNGmx9AHHEHp+yhIxEyZUQY11WglFg95CV0A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qUaeVniZa7g3u37QOpzSErHIOzUCV5aGKGhV2WY+pKZGE2dk974mpKI8lAGx21PYC
	 kdjeu66YEaxeflje4LIfGjUOc88UNMO3BjkICZH+AssGFT4pDWveSxUvACvsXoUSot
	 +GbcXiaDguUddgqfaUjUB/w8tTzHgFKH/Kja52x0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11899F80166; Sat, 25 Nov 2023 12:38:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43193F80579;
	Sat, 25 Nov 2023 12:38:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C7E9F80310; Sat, 25 Nov 2023 12:37:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43E27F80249
	for <alsa-devel@alsa-project.org>; Sat, 25 Nov 2023 12:37:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43E27F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=W9CyEmT+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6704ACE0ABD;
	Sat, 25 Nov 2023 11:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BACBCC433C8;
	Sat, 25 Nov 2023 11:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700912224;
	bh=GwUm1z7JNGmx9AHHEHp+yhIxEyZUQY11WglFg95CV0A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=W9CyEmT+nhx3j47D4G/aMS5ia8csPuTNw7uriGVZIc7jVTARW7T/r0/3s4NgVlg/k
	 AqtD8DRgrIFAQQYmhj9V19qwLjEql8MmYEM040Sf0yQu8p3idp8aWPcXJDN9sWJbfp
	 5uRfXeRoHP6rILn2XLGZLk+9A2F+1FV6yjReGcXuJJT4AqKA2KKaB4LtyVgcYyCo+/
	 Qn2ZJ3Z/gdPEkwKRS/xjhrSAizw5q4NP6zUClWDt662LBHjjgRZRGHRH2Ja1Ddo/q9
	 0N+CaHgKJnQ6y9reAiSj7dQ58eN2ffs0GtJNf4xqALCBTorTqD0fBrioSeA1KFH0nm
	 ODxvbe09qYAqA==
From: Mark Brown <broonie@kernel.org>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231124095030.24539-1-mstrozek@opensource.cirrus.com>
References: <20231124095030.24539-1-mstrozek@opensource.cirrus.com>
Subject: Re: [RESEND] ASoC: cs43130: Allow configuration of bit clock and
 frame inversion
Message-Id: <170091222238.2632109.3145285136716343850.b4-ty@kernel.org>
Date: Sat, 25 Nov 2023 11:37:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: FV67HOPPODZV2ENPID2BV6BVSFM54AH6
X-Message-ID-Hash: FV67HOPPODZV2ENPID2BV6BVSFM54AH6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FV67HOPPODZV2ENPID2BV6BVSFM54AH6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 24 Nov 2023 09:50:30 +0000, Maciej Strozek wrote:
> 


Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs43130: Allow configuration of bit clock and frame inversion
      commit: 52be2c4926831f7858c25701950afe9c1879f71f

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

