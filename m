Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6FB3F4FB0
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 19:40:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB51615F2;
	Mon, 23 Aug 2021 19:39:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB51615F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629740397;
	bh=sxg7/ON9fREqr6ugaTKv0kvU3rtpA1F8NirUtneOkwc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FORWBNcm1nHZfeOncVoG+dQwOm424oPSox7yhOxtiUh2xC44Hn48sh41FrqmE+9OJ
	 7D667q2wavPV+Jx1SMIStF1fZzIBsls9+SQGZFLjIp1up3RoYboL5RQKIA4m9gsToO
	 bZY3Az9BWRCBbZ3LqlSLyOIMk8nn/hfsd1ZXNiNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22EC4F8020D;
	Mon, 23 Aug 2021 19:38:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E13DFF80217; Mon, 23 Aug 2021 19:38:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D5D7F800AE
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 19:38:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D5D7F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AnNnSWxm"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E4FE610C7;
 Mon, 23 Aug 2021 17:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629740308;
 bh=sxg7/ON9fREqr6ugaTKv0kvU3rtpA1F8NirUtneOkwc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AnNnSWxmK2XJ0cHNh+/S8DN8QVXujAcgAbA1M5XFMxoBs0/Y+hYKdvls3kKACj8ky
 2ZH5wUFcsb0yq/2JU3JLNcFHAMKMYHwtPzIjeB1/5Py2PzTzrrcwButNHwLkyPaart
 TsqopvJgo1elPZ6D598D4hk0UsEczBy2DnH4BnqpuKl8CY1gtCcWEapzEKbUVjz6c2
 r/LfhxFBvkM/SjihFrA0KqFxBio5yn9xtgKqLjIQ6unG+s1s0+7cBFFlgyio2mAWEm
 mWrJLc9SZhfaBbAwlbFuDZAnE4mfKbuwRc7RHYfOMnJOd5gFMO498NbCcyL3cLUmWi
 GXTvy+hQPA+0Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Angelo Dureghello <angelo.dureghello@timesys.com>,
 alsa-devel@alsa-project.org
Subject: Re: [RESEND 1/3] ASoC: ics43432: add CMM-4030D-261 support
Date: Mon, 23 Aug 2021 18:37:52 +0100
Message-Id: <162973996481.3102.603346515916215049.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210821082658.4147595-1-angelo.dureghello@timesys.com>
References: <20210821082658.4147595-1-angelo.dureghello@timesys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, ricard.wanderlof@axis.com
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

On Sat, 21 Aug 2021 10:26:56 +0200, Angelo Dureghello wrote:
> Despite minimal datasheet differences, the driver seems
> perfectly compatible with CMM-4030D-261.
> 
> Tested CMM-4030D-261 to work with this changes:
> 
> / {
>         cmm4030d: cmm4030d {
>                 #sound-dai-cells = <0>;
>                 compatible = "cui,cmm-4030d-261";
>         };
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: ics43432: add CMM-4030D-261 support
      commit: 43d2c4982fcc6ed0adfea1275bc6df28bc48c1ea
[2/3] dt-bindings: add compatible vendor prefix for CUI Devices
      commit: 0f28b69e4b5959ee4ae1363b5f6d5dfe76faf36e
[3/3] ASoC: ics43432: add compatible for CUI Devices
      commit: c7bd58940bcb38fc506786fccdf51abeac40383e

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
