Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 857C72EAFA5
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jan 2021 17:08:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07B8F16B5;
	Tue,  5 Jan 2021 17:08:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07B8F16B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609862939;
	bh=kb4mqV9a+o30+15FJ4eNgR7ptSa/90Y8x4QRZiN/RDU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RkiBYCa34l22Ldk3J+7wlkSvHMSscRcSiKC01QPNNbuQxghVFkbBKDzv/+1HcdEQJ
	 tezbYWbHTWEmxYqJlW6BbD58uf6GAb12FTCY1mc0GB5BA8k2Cu4xA9KwW61JiJ0jeR
	 G/8gget72moa9rwxYyZDNJYHwZ4CLLskGrbmrbfE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA141F80268;
	Tue,  5 Jan 2021 17:07:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DB70F80258; Tue,  5 Jan 2021 17:07:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03BCBF800FD
 for <alsa-devel@alsa-project.org>; Tue,  5 Jan 2021 17:07:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03BCBF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lySjW/Us"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 372FC22C9D;
 Tue,  5 Jan 2021 16:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609862835;
 bh=kb4mqV9a+o30+15FJ4eNgR7ptSa/90Y8x4QRZiN/RDU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=lySjW/UsRRKvhyTnhR310SUCJzNtzXT3bO59Zwmtoa+Q2nwAYka4MGl0iki4hE9Xi
 uvaQtnze7Vr/Rb7mHKfNnxfmdMrdOR7nLaw0U0svxHTKsfG6QEWOYraw9dNCsOPsUk
 wVse8XenRuNnhyMQ+RdNXyqWFVLxgJcXa1BGGJJRuCEiuSr9BK5YLcf7xiI2/6QRvt
 yoHdGY0nKG+DwQzHrx77tULeurSLq0HUjzxwUjGoc9ea5sRTCz4EVe/7aUv4YeyxOZ
 d1tcJJW9mHEsvi2N8jVKnn8zI+ZEiG0JyG/TMRu5GLJmYJJzpXzx7X4HxoX3quKutb
 cwfHWUzGmjwCA==
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20201224101854.3024823-1-tzungbi@google.com>
References: <20201224101854.3024823-1-tzungbi@google.com>
Subject: Re: [RFC PATCH] ASoC: rt1015: remove bclk_ratio
Message-Id: <160986280836.50063.1334452422825586499.b4-ty@kernel.org>
Date: Tue, 05 Jan 2021 16:06:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, akshu.agrawal@amd.com,
 Vishnuvardhanrao.Ravulapati@amd.com
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

On Thu, 24 Dec 2020 18:18:54 +0800, Tzung-Bi Shih wrote:
> bclk_ratio is unused.  Removes bclk_ratio and .set_bclk_ratio callback.
> 
> Removes snd_soc_dai_set_bclk_ratio() in a few machine drivers which are
> obviously using rt1015.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1015: remove bclk_ratio
      commit: 81a6320da73ca23f44155715ec3d9e92bea4e35a

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
