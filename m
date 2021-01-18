Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A43522FA598
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 17:06:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 286821846;
	Mon, 18 Jan 2021 17:05:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 286821846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610985999;
	bh=BaHcTrmig6I2bWVEMJ7n2A023OZXTR1N/orNvFnxSlo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KcXIzAP4NYtL+2vNUGd7qIkT42JY+YStdTSwWjSpdhCmiNAf7Ube6N611l/fU+ZBS
	 dOvrLL6EnbQkbCvE/2qGRiW6EUC+C0gmUYT7oy0jlUT7YYdRmoqhgxJ9MJ8zLLO1Hm
	 GgXc4r813xKoBfv3I+UrGPIGFDym988l9Zsz/Qmc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99B60F804E0;
	Mon, 18 Jan 2021 17:03:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BCFDF804DF; Mon, 18 Jan 2021 17:03:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66A54F804D2
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 17:03:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66A54F804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iMWutN7k"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 585F922CA1;
 Mon, 18 Jan 2021 16:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610985820;
 bh=BaHcTrmig6I2bWVEMJ7n2A023OZXTR1N/orNvFnxSlo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=iMWutN7kWKfjc2v2MAskIn//PIrjSfC/FeegBLBztobzbua7+oB17rUQH9o3B4pop
 MDZwT6hyPQcEkyRF5Ut8vMQZV5qavrW7g8lKZH0Cu5BCzV3k4KhYzRmNmO++RGe8Rt
 a96tZt+De6CuZnFRxXg7sBwTzgc8BxylwQ+GQ5gQs4lZONzavKFrBuP3cM7kYeUQI9
 tNeOtUKE4gq/rFk8RlfgpwyXYYk/ki107zk8HiqY42kTZaqK+5S+qbKG2OdJ+HP0bg
 Ka0loC6bC3hjFrvSNCl8bOqdRb4FdM/XUYeSAk4b3jK8RsFIcUDnylwjPef5487zbp
 DPAqm/qT0AaeQ==
From: Mark Brown <broonie@kernel.org>
To: James Schulman <james.schulman@cirrus.com>
In-Reply-To: <20210115201105.14075-1-james.schulman@cirrus.com>
References: <20210115201105.14075-1-james.schulman@cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: Fix control name parsing for multi-fw
Message-Id: <161098576157.26872.11313625375715051537.b4-ty@kernel.org>
Date: Mon, 18 Jan 2021 16:02:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 david.rhodes@cirrus.com
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

On Fri, 15 Jan 2021 14:11:05 -0600, James Schulman wrote:
> When switching between firmware types, the wrong control
> can be selected when requesting control in kernel API.
> Use the currently selected DSP firwmare type to select
> the proper mixer control.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm_adsp: Fix control name parsing for multi-fw
      commit: a8939f2e138e418c2b059056ff5b501eaf2eae54

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
