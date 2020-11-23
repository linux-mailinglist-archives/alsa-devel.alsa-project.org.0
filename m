Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FF02C16A4
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 21:40:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9E64166D;
	Mon, 23 Nov 2020 21:39:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9E64166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606164040;
	bh=A8e5XsmrEj94F0Lbxy4tU9ohPxOZwgP/VW6wbdCvxdI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g1am3VEzrKTNaK6gcbrhFl7lKreaF1jAoMYiVAMZYFLr0pVPwbqIBo0+eR9US/cg0
	 U93YTq3waBnbJNDH5mdDUZ9ISYdOXdaQz04ANyhj41/OJ69Nq/N4Qol+sZ9ETDH3b5
	 gTkvCK8u/2suW37yMyenTw+TnD7eq846kIbWMD1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59B3CF80268;
	Mon, 23 Nov 2020 21:39:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 143ACF80255; Mon, 23 Nov 2020 21:39:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09EC6F8015B
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 21:39:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09EC6F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="F1IFkrbs"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 44D2A204FD;
 Mon, 23 Nov 2020 20:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606163938;
 bh=A8e5XsmrEj94F0Lbxy4tU9ohPxOZwgP/VW6wbdCvxdI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=F1IFkrbsk2ZUP+5vsvu62iGXHiaCjEomOSw7B1hCcEu6ne6r9Vq3NlvF2FdwUk2l+
 UNk+lt6HuuoAXyvHKn2uSogZpgdB5YUt5NoxHYVO22Y5vhxjxveY8t5+pmdZF/dQsc
 vgOoQHbCyxfMximLrhvrqzecmlcxwQp9kGhC2l/Q=
Date: Mon, 23 Nov 2020 20:38:35 +0000
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Cheng-Yi Chiang <cychiang@chromium.org>
In-Reply-To: <20201118043852.1338877-1-cychiang@chromium.org>
References: <20201118043852.1338877-1-cychiang@chromium.org>
Subject: Re: [PATCH v2] ASoC: hdmi-codec: Get ELD in before reporting plugged
 event
Message-Id: <160616391558.20973.12207964506823429764.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, dianders@chromium.org,
 Srinivasa Rao <srivasam@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>,
 Takashi Iwai <tiwai@suse.com>, tzungbi@chromium.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Rohit kumar <rohitkr@codeaurora.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 dgreid@chromium.org, judyhsiao@chromium.org,
 linux-arm-kernel@lists.infradead.org
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

On Wed, 18 Nov 2020 12:38:52 +0800, Cheng-Yi Chiang wrote:
> In plugged callback, ELD should be updated from display driver so that
> user space can query information from ELD immediately after receiving jack
> plugged event.
> 
> When jack is unplugged, clear ELD buffer so that user space does not get
> obsolete information of unplugged HDMI.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdmi-codec: Get ELD in before reporting plugged event
      commit: 25ce4f2b3593fa6bba70ddabbd2ee297b262784f

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
