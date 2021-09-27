Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E325419D76
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 19:50:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF00016B8;
	Mon, 27 Sep 2021 19:49:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF00016B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632765011;
	bh=vaAGDWdMM7DnyyWXxtxSddAQ5DUocd9iZv+90xzItsI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NdoQabBtVj3CyXypd2Fizq3tptCI4nZlLr7lMx/WkWQtLZMQDSM0vLv4P8uUJPM2E
	 ED55nqDS7ZBJHDP0VI/LfKIeyPk9M3eBUyoClxxQ3SjuWeItIng8MvNnt4NmnjIzxM
	 4JGTEQTQWO5apvqjK5DLYiKMheNEq/e6XfbEp0OU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9424F804F1;
	Mon, 27 Sep 2021 19:47:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1967F804FB; Mon, 27 Sep 2021 19:47:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57434F804E3
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 19:47:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57434F804E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PiFQVEkT"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E3D560F4F;
 Mon, 27 Sep 2021 17:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632764833;
 bh=vaAGDWdMM7DnyyWXxtxSddAQ5DUocd9iZv+90xzItsI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PiFQVEkTlYZsjWIqN83tvpAeQS66u7BaiLdsgKY23NVT37ltIo5A/J757P2ckRcXX
 LAby4ZotutVpi4NN8g8T7JJupJPfdmbQRlQJMwukYoW3LsYvF7lWlwmMljrK914qym
 lE3moP1tt0iBiich7SPzrlbeKgclai6zoN456Gq7/Ow1QJJe/CB9ihDPOArQJZAeWa
 DE7aIz+zwTRqQatXZ7erRpkshQbFmDbj56SCyRFc5wUA1/boF0adClXp86FQOmbRtH
 mnDhlauYAFfkrHwA91ENcqwbk2yZq+dL4RUnNcG0yLYwpq/eggvl3sL+Nl2gUwaz/0
 9iwf+2T1zRDRA==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>,
 alsa-devel@alsa-project.org, Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Colin King <colin.king@canonical.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ASoC: meson: aiu: Fix spelling mistake "Unsupport" ->
 "Unsupported"
Date: Mon, 27 Sep 2021 18:45:27 +0100
Message-Id: <163276442024.18200.9710161748366724709.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210924231242.144692-1-colin.king@canonical.com>
References: <20210924231242.144692-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

On Sat, 25 Sep 2021 00:12:42 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a dev_err error message. Fix it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: aiu: Fix spelling mistake "Unsupport" -> "Unsupported"
      commit: 9929265f2a7b5fa15d460dbbaa7f388c303411da

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
