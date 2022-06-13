Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4A5548B40
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 18:09:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4E161786;
	Mon, 13 Jun 2022 18:08:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4E161786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655136583;
	bh=tfjRnPB5emG2L4Jef72rHm8N5OHicWHsvAUn6VvcjmU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OJI1jxwicukDFumCzhbi0kL3fizw/3v1YSNyUKHzg9g+FzfFB3PjMFUOMnl0DVYUH
	 NcmMMWGEiWOs7pqeOuv46Q7ZHcY8DsBLNlB7MhVvKg2weT1Wu+1EWEhAqY/wp5/lda
	 6X6nN6jej2UAiLBb5Y5nZQ74xh1A5zHY1AcrEDhc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C2DFF80534;
	Mon, 13 Jun 2022 18:08:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0376DF8052D; Mon, 13 Jun 2022 18:08:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7457F804BB
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 18:07:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7457F804BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="l+BRpCEH"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AD60AB810F1;
 Mon, 13 Jun 2022 16:07:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25DAC3411C;
 Mon, 13 Jun 2022 16:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655136477;
 bh=tfjRnPB5emG2L4Jef72rHm8N5OHicWHsvAUn6VvcjmU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=l+BRpCEHp3ZqrvfTlaeybd8XxUuh/8/GU9hy6eiahvhAHgcL/QTzRyoYO8E+R5tqE
 wrpFVFCuARhQpYHkb5Q3zKEoSAdxJxrPuQYh2z1q60zpIMi54eWvaoQE7jUKrpev02
 ffBgOfSEruQveZSVakIoLHFndG78oxdVJno+ePJ1bpTiEhaX4yCW6/MBmN/dmGvcZ7
 uwxh00lYIA6r6kscLMo+gdo0KLjz/rQ3EUZUvjDl0hc4H8CbItrI43i8mxwIAh5Q0i
 ts/PEyjmhyKlRo8i9vsLkEycPp/90b9hUl1omsy+bXOJyfAFz1ASXdVAW7ufEK1MDR
 FdipfA0UvuPHQ==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, yassine.oudjana@gmail.com, lgirdwood@gmail.com,
 srinivas.kandagatla@linaro.org, tiwai@suse.com
In-Reply-To: <20220606152226.149164-1-y.oudjana@protonmail.com>
References: <20220606152226.149164-1-y.oudjana@protonmail.com>
Subject: Re: [PATCH] ASoC: wcd9335: Remove RX channel from old list before
 adding it to a new one
Message-Id: <165513647538.514792.3755540877211595484.b4-ty@kernel.org>
Date: Mon, 13 Jun 2022 17:07:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 y.oudjana@protonmail.com, linux-kernel@vger.kernel.org
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

On Mon, 6 Jun 2022 19:22:26 +0400, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Currently in slim_rx_mux_put, an RX channel gets added to a new list
> even if it is already in one. This can mess up links and make either
> it, the new list head, or both, get linked to the wrong entries.
> This can cause an entry to link to itself which in turn ends up
> making list_for_each_entry in other functions loop infinitely.
> To avoid issues, always remove the RX channel from any list it's in
> before adding it to a new list.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wcd9335: Remove RX channel from old list before adding it to a new one
      commit: 7263fc6c71c3a88c17a1ce3565b7b6f378d13878

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
