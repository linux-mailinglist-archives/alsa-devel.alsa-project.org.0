Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C893A6FC1
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Jun 2021 22:01:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BB70168C;
	Mon, 14 Jun 2021 22:00:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BB70168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623700893;
	bh=fNFJUqAq01ipcR1uUZlhTo8RHMzwgmOdackeJZ6s1I8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lW4NWU1jF82mhC9Xi56tQ5MARRGh0TVVnSv7bHAiGOwOyreiSFw29ZOgLWIrllg2Z
	 UUIm6PjIaQjMAdLyRhJifhTDwW4atyf2C/DabjgoRGYqEzOR+lM5KPXjxq+lan+ahy
	 6QBY2bI13tPaTf4yx40PO1MbAaxjekr7aUZj2rWY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F3EDF8053A;
	Mon, 14 Jun 2021 21:55:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1E71F80529; Mon, 14 Jun 2021 21:55:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C0F8F80525
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 21:55:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C0F8F80525
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FqilMXT6"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D58661246;
 Mon, 14 Jun 2021 19:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623700521;
 bh=fNFJUqAq01ipcR1uUZlhTo8RHMzwgmOdackeJZ6s1I8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FqilMXT6Q32JdZ4v/tXITvsmSo+byh4QBPywPrcFjRS9Rlx7uf09ettP/fGz3QdVB
 Dr3GpEjM9qsKgrYOfx51r16YUubepdHTIlJioafGCFkHkWmmDaKs+5KhauDo+IsniA
 y0QFvi/s82CMAjctuW0pO/LVQk2XRKo7x9TSCcZZ3/bGIBkWvVufBgUqtyfzMlfl+6
 ApXEZQ+86xKGuWrmrPeFUAMUmMcJzXunCtCLdez8QyHiVsc8AKJS9SZ1FHDTrPC2DY
 99zCiHOycL4s97U9XYtvv+LLk//QwmyVropfNsgY8l6OFT8E4NLj2MiUWeqPexdYk2
 F1fePt/0N2eYQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RESEND PATCH] ASoC: rt5640: Make codec selectable
Date: Mon, 14 Jun 2021 20:53:53 +0100
Message-Id: <162369994009.34524.11288841519238246714.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210612200650.1301661-1-martin.blumenstingl@googlemail.com>
References: <20210612200650.1301661-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.com, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

On Sat, 12 Jun 2021 22:06:50 +0200, Martin Blumenstingl wrote:
> The Realtek rt5640 codec driver can be used with the generic sound card
> drivers, so it should be selectable. For example, with the addition
> of #sound-dai-cells = <0> property in DT, it can be used with simple and
> graph card drivers.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5640: Make codec selectable
      commit: 08c56cab302a059c1f3a95c164def7b21c67ad2e

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
