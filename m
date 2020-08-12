Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAD7242829
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Aug 2020 12:19:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80C881674;
	Wed, 12 Aug 2020 12:18:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80C881674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597227555;
	bh=4FzYyW5JJNVBQO4GB8avNDtPRVKFwQlJedNUISU2tsE=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cvXlj+eGaFzLZ6oneeyCB8sAEjEFk4I2zT3DL7uF2fLu9D2nzRHP1PijJAJ2e3cmU
	 4rVGYZD17FcTxiKyoTTwn6iOkuWRkedDhYNEvENA4D0Vy6/i7Z1ABplhrWUenDoSt5
	 3BJSlcxtImQc4Ppt6O0ycb+96jzEri39tYINrLlM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EF5BF80247;
	Wed, 12 Aug 2020 12:16:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3374FF80245; Wed, 12 Aug 2020 12:16:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E38E2F800F4
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 12:16:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E38E2F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="1dgB38AR"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A85B3206B2;
 Wed, 12 Aug 2020 10:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597227402;
 bh=4FzYyW5JJNVBQO4GB8avNDtPRVKFwQlJedNUISU2tsE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=1dgB38ARzjRx/PgOGShQd/GmWjSnHlV3Xz0JgrmYSxmpl8tE+d4JV/xCtK8GQ8h14
 0LprerGEAt3dt0vddiE0IR2RXyCx4YdElutOvy0FJVQBf1Ma+h7ydZuMUNszm1RPIb
 RP6f1HJJYVq9olYriMZurPncvITiUAo1ZE6qVWPI=
Date: Wed, 12 Aug 2020 11:16:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20200811120205.21805-1-srinivas.kandagatla@linaro.org>
References: <20200811120205.21805-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 1/2] ASoC: q6afe-dai: mark all widgets registers as
 SND_SOC_NOPM
Message-Id: <159722736188.10105.1473595017449198199.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, stephan@gerhold.net,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 john.stultz@linaro.org
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

On Tue, 11 Aug 2020 13:02:04 +0100, Srinivas Kandagatla wrote:
> Looks like the q6afe-dai dapm widget registers are set as "0",
> which is a not correct.
> 
> As this registers will be read by ASoC core during startup
> which will throw up errors, Fix this by making the registers
> as SND_SOC_NOPM as these should be never used.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: q6afe-dai: mark all widgets registers as SND_SOC_NOPM
      commit: 56235e4bc5ae58cb8fcd9314dba4e9ab077ddda8
[2/2] ASoC: q6routing: add dummy register read/write function
      commit: 796a58fe2b8c9b6668db00d92512ec84be663027

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
