Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FEF33DBEC
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Mar 2021 19:02:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 783B21905;
	Tue, 16 Mar 2021 19:01:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 783B21905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615917753;
	bh=vdy2WpeZI2HCzGdQqz3Y/L//P+ab1QFmmzSf0iTsJxg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VlPuEdyQeo1ev/y9Y7ropijQwUprpTmqJUSulQmYIzKZf7RGWnUr6Ld8g2NDd8uTg
	 S9gnD3OYxNQTLFknygzwosRAdkYEG1pBhGOmkt/lC4vohYu3weylDaqX5Iggq9K2Pe
	 TrAHvXe2QchFA+LTxIqADbuU5cHhzWzNEdJMCoqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C67DF8042F;
	Tue, 16 Mar 2021 19:00:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D74BF80224; Tue, 16 Mar 2021 19:00:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FF43F80137
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 19:00:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FF43F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UnlsifzF"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7E73650D9;
 Tue, 16 Mar 2021 17:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615917598;
 bh=vdy2WpeZI2HCzGdQqz3Y/L//P+ab1QFmmzSf0iTsJxg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UnlsifzFhj3D7YpXvvXOJU1CORovHfvgX17+U2yLJQFIhShbsFwrxhYDfy4n3Qkwp
 t+tSGUVpZcfEVLKsHejsyo26wxOi/2dh6ZTWags7XmGxJCI20l0YQhkgAwde5K69CO
 YIqlWdcLppGJR1U8qaT+dlLgjE4mu+nWZT/AxDSIBUfBU5DTVWzc/P2KLpCopE8xRR
 sDsb4MpkKwRPRZHje7YgqUNa98+5xMgUgPW9ebUDLMUEAeyR5EM18v8RJtQ/MEaKn2
 vDQEq6I9Ttz8qOessEJAW/UgI04oHXEq5OLCKEljcMW/jc4FwTqIUkWccl49vwuF9k
 HYyY4rqU9s1TQ==
From: Mark Brown <broonie@kernel.org>
To: timur@kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>
Subject: Re: [PATCH] ASoC: hdmi-codec: fix platform_no_drv_owner.cocci warnings
Date: Tue, 16 Mar 2021 17:59:41 +0000
Message-Id: <161591744695.13544.8415296923566318166.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1614761651-86898-1-git-send-email-yang.lee@linux.alibaba.com>
References: <1614761651-86898-1-git-send-email-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, tiwai@suse.com, nicoleotsuka@gmail.com,
 Mark Brown <broonie@kernel.org>, linux-imx@nxp.com, kernel@pengutronix.de,
 shawnguo@kernel.org, linuxppc-dev@lists.ozlabs.org,
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

On Wed, 3 Mar 2021 16:54:11 +0800, Yang Li wrote:
> ./sound/soc/fsl/imx-hdmi.c:226:3-8: No need to set .owner here. The core
> will do it.
> 
> Remove .owner field if calls are used which set it automatically

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdmi-codec: fix platform_no_drv_owner.cocci warnings
      commit: 2e2bf6d479616a15c54c4e668558f61caffa4db4

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
