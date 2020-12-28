Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DAC2E6696
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Dec 2020 17:15:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B94D11743;
	Mon, 28 Dec 2020 17:14:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B94D11743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609172147;
	bh=ITfs0W/+RpXTKRzJEvABqjsZfGEPs/V/z9bip7jFNo4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eRpWk8kYb1K8RkvPv53heUE2fA+4nTq9/3yA8oNDhdkaxDzT0FyB3Z5XaUk1TR1Ov
	 BQn4lC9Wpila2yuClaRfsFzd95IHa4DnKdk05HkuE+youfb8+WH+sIefWWHjlvXIKp
	 mtHdyqMKT50txOIMJGsulTq6FmmyuuZu6mOvW/zU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78A7FF804C1;
	Mon, 28 Dec 2020 17:13:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64A87F804B0; Mon, 28 Dec 2020 17:13:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1281DF80249
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 17:13:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1281DF80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="d1V40PzH"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 13F7E2084D;
 Mon, 28 Dec 2020 16:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609172001;
 bh=ITfs0W/+RpXTKRzJEvABqjsZfGEPs/V/z9bip7jFNo4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=d1V40PzHeYxxfXzjxWxCzHwYJE/Ad5XkchDbhQVuLAWHfe4rQm0aDo5d7Jg2HZLqO
 uzfDnBAlu7LrI1gOh2yJca4caskyNzU8hNQHt3IjD0FxNdxNYK+Oflvpc6XxuJAA7X
 vh+ywvK9BSYIXn6d9SeVYuvQfKN6HTvvTWBOAkaKbGPJW+wiSwzNLwV3el35VsPfbB
 PY5AAH96HhK7npELSbEXC7W9uJRRWf3pnoJ6GPqXZ7at4l3/GaIXJQNXdpWM8K3GvX
 HAWU7lwJ57nIOIIhub3zETK/XAOTpcSrjCUI8rclVKXMs2kpi2BtEs18bBcI4h8Z9H
 BeHO/RTroOa2Q==
From: Mark Brown <broonie@kernel.org>
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
In-Reply-To: <20201222115929.11222-1-Vishnuvardhanrao.Ravulapati@amd.com>
References: <20201222115929.11222-1-Vishnuvardhanrao.Ravulapati@amd.com>
Subject: Re: [PATCH] ASoC: amd:Replacing MSI with Legacy IRQ model
Message-Id: <160917197014.51862.14166013678155131576.b4-ty@kernel.org>
Date: Mon, 28 Dec 2020 16:12:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Akshu Agrawal <akshu.agrawal@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Dan Carpenter <dan.carpenter@oracle.com>
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

On Tue, 22 Dec 2020 17:29:18 +0530, Ravulapati Vishnu vardhan rao wrote:
> When we try to play and capture simultaneously we see that
> interrupts are genrated but our handler is not being acknowledged,
> After investigating further more in detail on this issue we found
> that IRQ delivery via MSI from the ACP IP is unreliable and so sometimes
> interrupt generated will not be acknowledged so MSI model shouldn't be used
> and using legacy IRQs will resolve interrupt handling issue.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd:Replacing MSI with Legacy IRQ model
      commit: a523e1538fdd5f00ea3289cc0b3c6c1785b89814

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
