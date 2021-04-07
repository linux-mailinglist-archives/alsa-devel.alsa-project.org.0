Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 561F4357609
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Apr 2021 22:29:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2C12168F;
	Wed,  7 Apr 2021 22:28:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2C12168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617827372;
	bh=DbNJfOATZhRLaLqCciLxAQrVD95vTb6G/WEYWfPZ0HA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q/Vaj3zUpOnHxhpfKmOn3UKM7HPXKndnkujkvUHHsixmdOsCgqjKlXuJwaleVbkkg
	 +4wn48ITZP439YY2Aixrt2Tz79+a/nd1L9a4u9Saat45HdedlRYpQ7ognCKDJeW68M
	 NXTw3sR9xca+Xv7Q47eVPZn+0tR6l47wpcY7f02Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6241EF804AA;
	Wed,  7 Apr 2021 22:27:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC134F80482; Wed,  7 Apr 2021 22:27:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E6CEF80274
 for <alsa-devel@alsa-project.org>; Wed,  7 Apr 2021 22:27:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E6CEF80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IcMrHIEZ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3F6D06121E;
 Wed,  7 Apr 2021 20:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617827219;
 bh=DbNJfOATZhRLaLqCciLxAQrVD95vTb6G/WEYWfPZ0HA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IcMrHIEZIDb57hiR7wzXGoNstuGeQ7K1XeYlonLjjOQ9tAcqOarhp8PaJrcPD7PyU
 JO0iUHQ2SxvjovsebRa4NZ54nkkcDrgEWQpkT7fuvlEB0RMEz3T1ZGL/fsOPVEmX4M
 BU7F7maOsVxovcxTBM9hs7VMhO5XyXnRElUxitF0sGNgJmbAS5jADWLlW/hSSDKkpb
 cS+hB3gKRQ36XJ0DyOE7Kz36bqmTFcqDCQPg7zihuBTDpP1V6oWeBkSOTLWz5d+eGe
 ESB6/9ej9vskMv76UXVw6ok0vvMqlhZDIZghnx8/SJyHVApZGE/aOqGV8sdlCmWigc
 Ct8vR5Q20Lvng==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: axg-fifo: add NO_PERIOD_WAKEUP support
Date: Wed,  7 Apr 2021 21:26:24 +0100
Message-Id: <161782703231.42756.2000858967744578792.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210407145914.311479-1-jbrunet@baylibre.com>
References: <20210407145914.311479-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>
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

On Wed, 7 Apr 2021 16:59:14 +0200, Jerome Brunet wrote:
> On the AXG family, the fifo irq is not necessary for the HW to operate.
> It is just used to notify that a period has elapsed. If userpace does not
> care for these wakeups (such as pipewire), we are just wasting CPU cycles.
> 
> Add support for NO_PERIOD_WAKEUP and disable irq when they are no needed.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: axg-fifo: add NO_PERIOD_WAKEUP support
      commit: 9be701ec3493d3348723a38f0c19702d710758ce

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
