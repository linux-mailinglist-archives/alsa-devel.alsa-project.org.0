Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0113398FC8
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 18:18:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D24716FE;
	Wed,  2 Jun 2021 18:18:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D24716FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622650738;
	bh=fryZbV1WG4/wnitfveidkv/aHaYOjUvgIZf3uaJiM3o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VzqLhlKHxu9gBsRh/idLG7FRcIATYSw2XKgD5u8rk/E3vZbC8BMn8ovXJe5CLqa2N
	 Xih3LkyToRC7xh56LMRvY3LPu4SovZsRhzN+rwjynlEDFsyAG7t9DfQ8QJ5D/YWmu5
	 0IFT2LAOU3O7U7nK4iTXWzARXPa9qodS+lznfSqw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADEC1F802A9;
	Wed,  2 Jun 2021 18:17:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9D51F80424; Wed,  2 Jun 2021 18:17:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EF37F80141
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 18:17:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EF37F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SOmayTI+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 436826161E;
 Wed,  2 Jun 2021 16:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622650642;
 bh=fryZbV1WG4/wnitfveidkv/aHaYOjUvgIZf3uaJiM3o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SOmayTI+r7KWzNhNiQ4aT9RO2AIDsWzg5lxqXvOuWcI0HmC4Yxp0KgqzibkA3f1cs
 +jbAgJW31flOiymggoiiWsj7gHbtG9E4VCWCbZDqJM2y9jDBRWJsbiJfOrieqKQtkM
 Agpk3wd7BaWhKR841LAai/VtYRTgaOHQMlUCP1dOM+onjj2KJ6PZqX/tatrID2Qijp
 FrJHEd6ks6njghmJIJyGIQr/MH+UzTw1KQF5MiMmUUP1Ev02KgzRhEu3bTTqs+164i
 0Ck4+WzjmG/N5KT8YBKbgTBYt1/Yz5XBT5/UfKD9oV1+p5Oa2eXYMbXkLclWKY+QwV
 NKx2QVqyTa6XQ==
From: Mark Brown <broonie@kernel.org>
To: Mark Pearson <markpearson@lenovo.com>
Subject: Re: [PATCH] ASoC: AMD Renoir - add DMI entry for Lenovo 2020 AMD
 platforms
Date: Wed,  2 Jun 2021 17:16:52 +0100
Message-Id: <162265045454.22459.12647691279142134758.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210531145502.6079-1-markpearson@lenovo.com>
References: <markpearson@lenovo.com>
 <20210531145502.6079-1-markpearson@lenovo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Gabriel Craciunescu <nix.or.die@gmail.com>,
 lgirdwood@gmail.com, tiwai@suse.com, Mark Brown <broonie@kernel.org>,
 stable@kernel.org
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

On Mon, 31 May 2021 10:55:02 -0400, Mark Pearson wrote:
> More laptops identified where the AMD ACP bridge needs to be blocked
> or the microphone will not work when connected to HDMI.
> 
> Use DMI to block the microphone PCM device for these platforms.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: AMD Renoir - add DMI entry for Lenovo 2020 AMD platforms
      commit: 19a0aa9b04c5ab9a063b6ceaf7211ee7d9a9d24d

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
