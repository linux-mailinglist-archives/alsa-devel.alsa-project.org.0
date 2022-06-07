Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D2053FC0E
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:49:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EB991A45;
	Tue,  7 Jun 2022 12:48:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EB991A45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654598957;
	bh=fYxNbwPSVr/66WMOgiyAGOorrBlpKFmsqN5lemf2nIM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LmERPq0EsqcFkDrSzux060zU6E/NI0wUXqxzuuAuh+v+Ry9u4uSQdQlCUIcqoaKp5
	 ln/CImSROHO9CuHT0EuNoEYJCmI52t08Q9EcBtYnaOG5ddetKcWtlZECokGlMhn631
	 9EKgyRo6x1Lp26XWjqYKGIEyJlPfn4vhJl25huTo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 926ABF8056F;
	Tue,  7 Jun 2022 12:45:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C3B1F80567; Tue,  7 Jun 2022 12:45:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21738F80564
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:45:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21738F80564
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YoA4Ppkd"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 230CDB81F07;
 Tue,  7 Jun 2022 10:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BADCC3411F;
 Tue,  7 Jun 2022 10:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598742;
 bh=fYxNbwPSVr/66WMOgiyAGOorrBlpKFmsqN5lemf2nIM=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=YoA4Ppkdp8AYFYI0bTkAynYDmgn6Kjb0j8j52AYcOjvg2skP8HrPDqsdk7FRjeXJ4
 8YuXB1NwYrdz1GjnDaHNjm13NRM9a2v4iBfO0ebsSBuOxL6MeaUE5jLs4vvafmk44E
 Qwx4+Lh5QDoPKqE8IfpWcCnCPjho9CYCEDXj755TdJ8HaJCeuJihXr1S/LVEZXKpb9
 R4GCmR7+/IcGTAv7mee/R9UdWK3mfcXB55l7bV1kfhdzaHN9n2URpyBiDt2I4lARll
 y9/vNDqWBBvfeyuGY1zMKR0TggR9hhjahf7Sn2yms33cZXmLCyNv477dofcxi7PhDq
 PoJGyovBoxX+Q==
From: Mark Brown <broonie@kernel.org>
To: linmq006@gmail.com, Liam Girdwood <lgirdwood@gmail.com>,
 krzysztof.kozlowski@linaro.org, Takashi Iwai <tiwai@suse.com>,
 s.nawrocki@samsung.com, xc-racer2@live.ca, linux-kernel@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
In-Reply-To: <20220603130640.37624-1-linmq006@gmail.com>
References: <20220603130640.37624-1-linmq006@gmail.com>
Subject: Re: [PATCH v2] ASoC: samsung: Fix error handling in aries_audio_probe
Message-Id: <165459874083.301808.8944605604871415466.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:45:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 3 Jun 2022 17:06:39 +0400, Miaoqian Lin wrote:
> of_get_child_by_name() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> This function is missing of_node_put(cpu) in the error path.
> Fix this by goto out label. of_node_put() will check NULL pointer.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: samsung: Fix error handling in aries_audio_probe
      commit: 3e2649c5e8643bea0867bb1dd970fedadb0eb7f3

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
