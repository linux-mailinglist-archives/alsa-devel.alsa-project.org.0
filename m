Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B33356038A
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 16:45:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CCCE839;
	Wed, 29 Jun 2022 16:44:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CCCE839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656513916;
	bh=1YEn9fvXA0PLaCeoqu7cVXgKLU0IspUKNzvH94ZGFcA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DGM0aFnj0zwfx8zZ23Ledk3hi2JWxuTvpw498f6ZhHxAvIEhih8pqpPvj5TNKlZ5P
	 n8ZBW4jO3urQuTR8PvTqv+hQy7wyKOZ22JbmLbjcuA1JF4ALtk+koivV8DY6WYru6D
	 GU6KhwavbcYb7VOgijxTy7LFVTtfJROuPq0lWag8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18FE6F80245;
	Wed, 29 Jun 2022 16:44:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0ECBF8020D; Wed, 29 Jun 2022 16:44:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70F6EF80107
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 16:44:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70F6EF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jIi/PbGg"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 649FAB824EE;
 Wed, 29 Jun 2022 14:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6D60C341C8;
 Wed, 29 Jun 2022 14:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656513847;
 bh=1YEn9fvXA0PLaCeoqu7cVXgKLU0IspUKNzvH94ZGFcA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jIi/PbGgjxbjjmIrmYItwU6UIjRm3l7P9KTz5fa0HFljbhEe50lOtYBiQFeLqg1SC
 MNcUha72VzGtPftRqhlvRiCgZ5bA96J3H8v73Y9+r82lqFT6UHNAyxsbyEh2+WdeU9
 O4rlpUye7jQ2CB7TQHZuvhEPVmJWc4WyD2TH3Gr9rUD6D5a4nm1P7jwSbKM7XfCWBF
 EEtcr7a7lY3B2FCQ6ROdrIdZFfd46/8hXrtbASCnYQ9akEBNgUTjX5vmh7KerEBjoP
 q8Noc92Q0bohMO/ftW6ObCnxBcABp4hDUKOjPAhnWOqvXhJgLqIOeZ6z0wrnMbtHMU
 4t5AwHZSeOBGA==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org
In-Reply-To: <20220629090644.67982-1-srinivas.kandagatla@linaro.org>
References: <20220629090644.67982-1-srinivas.kandagatla@linaro.org>
Subject: Re: (subset) [PATCH 0/4] ASoC: codecs: add WSA883x support
Message-Id: <165651384559.1635179.5697660258524985288.b4-ty@kernel.org>
Date: Wed, 29 Jun 2022 15:44:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, tiwai@suse.com
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

On Wed, 29 Jun 2022 10:06:40 +0100, Srinivas Kandagatla wrote:
> This patchset adds support for WSA883x smart speaker amplifier codec
> connected via SoundWire. This codec also has a temperature sensor used
> for speaker protection, support for this is not added yet.
> 
> Most of the code is derived from Qualcomm downstream msm-5.10 kernel.
> Thanks to Patrick Lai's Team.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: dt-bindings: Add WSA883x bindings
      commit: 16e2f8a4e9d5e4c7653ee774d9377d602070b16e
[2/4] ASoC: codecs: add wsa883x amplifier support
      commit: 43b8c7dc85a14f36048a27bb6c627fd49144a8d1
[4/4] MAINTAINERS: add ASoC Qualcomm codecs
      commit: a7b028e4252bc1e8b5646657fd45a68792826c23

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
