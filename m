Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6B654318A
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jun 2022 15:37:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B89318AC;
	Wed,  8 Jun 2022 15:36:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B89318AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654695432;
	bh=U9vmyHt85vN3sCyWmKsu5sYz8hIEMAHVCv64ZatqnPc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V/7vJcepTCX1tStK5Drg7Q+mXJPiCO9KfNTY8dBKFfMIHyiNqNq/PTntSYZEt9CPM
	 t9iJv6G4ne++NX/g35IwqLPr24hXSB6EdVFGwo/bVgnO3pURWAaYC3RCITvEH7EQ1L
	 56w6Rl5cSnd3HfnFsseeBcZPXchZPnVS/Uu7r0LE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E8BBF80520;
	Wed,  8 Jun 2022 15:35:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E5A5F80526; Wed,  8 Jun 2022 15:35:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 486F3F800C7
 for <alsa-devel@alsa-project.org>; Wed,  8 Jun 2022 15:35:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 486F3F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NpwOo9cb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 880C761AC4;
 Wed,  8 Jun 2022 13:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B229C3411F;
 Wed,  8 Jun 2022 13:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654695325;
 bh=U9vmyHt85vN3sCyWmKsu5sYz8hIEMAHVCv64ZatqnPc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=NpwOo9cb9O/8g4klzQN46b0IYNqra7Fwlgrzlye5JHVUUONWg8KDgw5mqO3S1W39Z
 lmOjtJR1DLQmFURkgP1bExihg6eohMROn2Vtg5Q5O3+ysItAgL5FZi4+4tfZq5GB4Y
 ILo+AEXAathcrxQHthdZxFjeTl6Y0KdSDGWbCpL/dfKLoYg6k0NDywrbsAl8/QdeTI
 Z79zxa0xERS0fqFU9SV4YIi0nvYABQ1Lk55DSM0pbXANpVq4mdYrFLytzKQXzICnsC
 pTqu4TQPhORt7ajvYzvQDwh8oz5PpgU4fHH6yerWUAbI6WTNnUiTJRjpO77w4s0sRy
 uqtUQox3EPGWQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h74v29f7.wl-kuninori.morimoto.gx@renesas.com>
References: <87h74v29f7.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: ak4613: cares Simple-Audio-Card case for TDM
Message-Id: <165469532489.615471.10019728812817999193.b4-ty@kernel.org>
Date: Wed, 08 Jun 2022 14:35:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, geert+renesas@glider.be
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

On Wed, 8 Jun 2022 02:09:16 +0000, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Renesas is the only user of ak4613 on upstream for now, and
> commit f28dbaa958fbd8 ("ASoC: ak4613: add TDM256 support")
> added TDM256 support. Renesas tested part of it, because of
> board connection.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ak4613: cares Simple-Audio-Card case for TDM
      commit: ec3ad554b956d5dbefa1962c419f164ba223e6b3

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
