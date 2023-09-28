Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9737B2034
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 16:53:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65AEDE79;
	Thu, 28 Sep 2023 16:52:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65AEDE79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695912813;
	bh=chePX/SYayvnhA9C26rs98NM+t613nF7ydh4AzYC8O8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GFtLR7PqGP6v6AfRO+pecTyGwQ6EgJKvppGuCNkSXffv+6emsK0SxavLx0OCxS2Ta
	 goIEMUKMW+OApvp6o/vjbffPvgPean4FfGq8xv3oeSjC96Z74Exnvn7nGpadBhkqyR
	 +FBXeM8MmQUWw82jAByOUfMxSwJ57HHApr2Gg+84=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D29FF805A9; Thu, 28 Sep 2023 16:51:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E334BF80563;
	Thu, 28 Sep 2023 16:51:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E07AEF80578; Thu, 28 Sep 2023 16:51:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 898C7F8047D
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 16:51:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 898C7F8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZYG51XpL
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 34E83CE21D8;
	Thu, 28 Sep 2023 14:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C585C43397;
	Thu, 28 Sep 2023 14:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695912688;
	bh=chePX/SYayvnhA9C26rs98NM+t613nF7ydh4AzYC8O8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZYG51XpLTAQxCl3dQmuiHqqV5f1x/wwlk4hp8cdO5uo+sSITeMLwRS+fczhSYAP59
	 rxoP58+YlzvSjiBFda423UCh/bNTY/EaL2PmSKeNSTrTndEjDoFTxoKPscsMOuQDci
	 1ev0DhB0dq+0RyvgWKT0jkH42v9XEZXXnyzOcoQWi0+LMKzeU3/6q9J98d2zpvZ67e
	 O/QJX3SAL8ctmlJ95Mj1ctUkykrrglXUhY5i9M5zVZU6fI7phUIUxb1ygzwskuKZH6
	 P3SSaT6Zd/L/RorkaP1buhIsLBJz+QZX7imkHzBhQUoEoVCv+5a17xIcndUE0qrkSH
	 GPaGJP48Pbcyw==
From: Mark Brown <broonie@kernel.org>
To: james.schulman@cirrus.com,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: david.rhodes@cirrus.com, rf@opensource.cirrus.com, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>
In-Reply-To: <20230928085200.48635-1-jiapeng.chong@linux.alibaba.com>
References: <20230928085200.48635-1-jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] ASoC: cs42l43: Remove useless else
Message-Id: <169591268759.2776105.1120997506461467883.b4-ty@kernel.org>
Date: Thu, 28 Sep 2023 16:51:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: 4G7OSUCS2ZPIZ5PESENG2EDLPRNKLLRW
X-Message-ID-Hash: 4G7OSUCS2ZPIZ5PESENG2EDLPRNKLLRW
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 28 Sep 2023 16:52:00 +0800, Jiapeng Chong wrote:
> The assignment of the else and if branches is the same, so the else
> here is redundant, so we remove it.
> 
> ./sound/soc/codecs/cs42l43-sdw.c:35:1-3: WARNING: possible condition with no effect (if == else).
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l43: Remove useless else
      commit: 67fcdbfd9e133be69c9541a806f6ccfe594fa9a9

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

