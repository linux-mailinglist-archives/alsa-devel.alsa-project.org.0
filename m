Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AA427419E
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Sep 2020 13:51:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 258331716;
	Tue, 22 Sep 2020 13:50:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 258331716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600775492;
	bh=Q4KDNQJE+iH1DnDYsmw0dPu90gd1omWDNMB3ZeVjjGg=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j3eR3o+dhgk24Z0JJ18cunzUCtsCsgGtpDPPK3T/DPH8zcEJAsHqE7QzEmoJqFdAW
	 OROvbT4FN3EKRtbhav0L/pKVwbKAmv5+4iUi0s3xVdRY5DZ9QrUMzz+5mHbmF/Qggp
	 HEHb6jCZHmAtffSnCP92zQYv+UkgJbQoRLh0DXBA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C89DF8015F;
	Tue, 22 Sep 2020 13:49:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFCF5F80229; Tue, 22 Sep 2020 13:49:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 865DBF800ED
 for <alsa-devel@alsa-project.org>; Tue, 22 Sep 2020 13:49:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 865DBF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Q0kzW0fq"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC07A221EB;
 Tue, 22 Sep 2020 11:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600775377;
 bh=Q4KDNQJE+iH1DnDYsmw0dPu90gd1omWDNMB3ZeVjjGg=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Q0kzW0fqgH/ZynkmIIsZ+Sk3TIZn1d1t5vPwcPmXgKloPcyO+FEfgbJPD2ON45Hz8
 OOhutiHnFCkdlS2Oq5dnBkZlt3W7mf2vS5wJL9kS7AQvzZ8+wJETBuTKgGLs+1yuJc
 NnwNw6eHuWv6vW9+hMhEnlq2sqh22UhUiTpgzLzI=
Date: Tue, 22 Sep 2020 12:48:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Cheng-Yi Chiang <cychiang@chromium.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20200922062316.1172935-1-cychiang@chromium.org>
References: <20200922062316.1172935-1-cychiang@chromium.org>
Subject: Re: [PATCH] ASoC: hdmi-codec: Use set_jack ops to set jack
Message-Id: <160077532459.10007.8996932486569302078.b4-ty@kernel.org>
Cc: dianders@chromium.org, alsa-devel@alsa-project.org, tzungbi@chromium.org,
 Srinivasa Rao <srivasam@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-rockchip@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Rob Herring <robh+dt@kernel.org>, Rohit kumar <rohitkr@codeaurora.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 dgreid@chromium.org, linux-arm-kernel@lists.infradead.org
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

On Tue, 22 Sep 2020 14:23:16 +0800, Cheng-Yi Chiang wrote:
> Use set_jack ops to set jack so machine drivers do not need to include
> hdmi-codec.h explicitly.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdmi-codec: Use set_jack ops to set jack
      commit: 55c5cc63ab3277aa20637dc20f6528987ac23743

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
