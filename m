Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F522322BFB
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 15:13:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25E961688;
	Tue, 23 Feb 2021 15:12:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25E961688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614089591;
	bh=+JINFj2BPE5byrIfpTw8QQ0mFPqOXrcYF+2MPu/X51E=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MEWV++0t9VUx8BoeqJKzPTd4yuYbi0amzH5+HxSN0hD+2L/OFmcLIPkYtW1o7Tmqu
	 lHdmTgNgsNEn6bL6qc5SGgIQixNb1vOgxk8MMUVxIlY1VsBBRbD4nt5tCWaZXDOEzR
	 qjtsCV3q0JYuQDbwSltjpDqwFZaU8Kmr5wMUj/tI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24318F802E0;
	Tue, 23 Feb 2021 15:11:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28B40F802DF; Tue, 23 Feb 2021 15:11:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85C6DF80129
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 15:11:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85C6DF80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nYNLclt3"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 33FE364DE9;
 Tue, 23 Feb 2021 14:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614089505;
 bh=+JINFj2BPE5byrIfpTw8QQ0mFPqOXrcYF+2MPu/X51E=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=nYNLclt3aYnXo/uXYJYUbO3DNeNcflGBYWd5imEIlyGObH400D0zesBoG83XECPSZ
 rLeo2Nw8EO7a9fjrpLzrAfDqjmNoxEJpUUkfPEaZk1CGBWgHPZmljZ8tWEzIpTIbnP
 TfYbyjoq8aqOygl1fsXOrVRRXBYE2/LzAEGTgiRqrFTXgUxixcM2eI7TS+EsNfHQvV
 dCy6N4Zdq+7DXxmDKw78pIgsxKuAYRo9UNvPBSlhCDjJJje2XbWvciaH4uJxq/Il/E
 e1pUyRi0eZrMZ3cMcUrl1wA8GB/duBXa0DFl9Gde5mf0eIqVr+0Z082g+axgx4x4nL
 eT+puUbDHkghg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Colin King <colin.king@canonical.com>
In-Reply-To: <20210215163313.84026-1-colin.king@canonical.com>
References: <20210215163313.84026-1-colin.king@canonical.com>
Subject: Re: [PATCH][next] ASoC: codecs: lpass-rx-macro: Fix uninitialized
 variable ec_tx
Message-Id: <161408943852.48131.13240298966962769896.b4-ty@kernel.org>
Date: Tue, 23 Feb 2021 14:10:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Mon, 15 Feb 2021 16:33:13 +0000, Colin King wrote:
> There is potential read of the uninitialized variable ec_tx if the call
> to snd_soc_component_read fails or returns an unrecognized w->name. To
> avoid this corner case, initialize ec_tx to -1 so that it is caught
> later when ec_tx is bounds checked.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: lpass-rx-macro: Fix uninitialized variable ec_tx
      commit: 2d003ec15396cc8ffa2a887605c98a967de3078d

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
