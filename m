Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A09E13CB971
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 17:08:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C32816A6;
	Fri, 16 Jul 2021 17:07:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C32816A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626448120;
	bh=pGMxukKZvH4Y7JZQ4mlY+aiYhpQxmOjH0aesN0E4GE8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JhxCES5Tf4n8ORSfXD8N52ChwUEEyQFUopw7xvlkDSeQhB6crr9g81pdPIdT2JYDp
	 5O0N6Hq2p7U2dHAJSIlzvL+UUtoqgQPuV+hBYcFGt+MEWNxY6s1Q0O2RAwQk/dxYBB
	 WgJbTMbwl8fwBwH3Cv2LEjcg+Y0UctuCSSZv58cM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C724F804E1;
	Fri, 16 Jul 2021 17:06:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2878DF80269; Fri, 16 Jul 2021 17:06:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD231F800FE
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 17:06:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD231F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NHcomHnI"
Received: by mail.kernel.org (Postfix) with ESMTPSA id ADBD760FF3;
 Fri, 16 Jul 2021 15:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626447978;
 bh=pGMxukKZvH4Y7JZQ4mlY+aiYhpQxmOjH0aesN0E4GE8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NHcomHnIzjnFE4Y7jk/4gnhGA99I4JQSRe7Kw7jNp6C8grwiKtxa2GqUbgTq25syZ
 wR0MvkvZfAuWzDmn689aVruliGBpRbPege7ISey4ge58lfYyW/g+vwu8DxYmM4x/+i
 PvPQjcPv07U2smtfSBj0N13SwwOgCPYpV749/Uub3UlbbSjD6S3evmW8fgyuRPn6PH
 vyyucqgTIrWev/QlKM89V4tHFpp+IJRsCS4qUFuAe8M3njR+NWE6iDoBBaHy5rF3Tq
 Cj7A+0HXcf07mvPKxnMIuEqAeVmTkKjUJYqYJDg5AkCves1THzlY9JlnP2VBBtaRDK
 96M43IFPM9Z3g==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: wcd938x: setup irq during component bind
Date: Fri, 16 Jul 2021 16:05:31 +0100
Message-Id: <162644746764.25983.14228885456148612746.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210716105735.6073-1-srinivas.kandagatla@linaro.org>
References: <20210716105735.6073-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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

On Fri, 16 Jul 2021 11:57:35 +0100, Srinivas Kandagatla wrote:
> SoundWire registers are only accessable after sdw components are succesfully
> binded. Setup irqs at that point instead of doing at probe.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd938x: setup irq during component bind
      commit: f99986c0fcad8e1d7d842e9a636f55bcc6748da5

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
