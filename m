Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C25D83DF80B
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Aug 2021 00:39:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4352F173A;
	Wed,  4 Aug 2021 00:38:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4352F173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628030375;
	bh=hcHr3un6vM6Jy8wur/6t7L/Lhc7LHra5hoSt0Zdm0Nk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BBGSG8Q4Bu4E4T6a0T2LcDvFgF/891nJVlZ+OchiV1F1pG4bjq0kfiCVxsaf//1HE
	 hFmQIixf2AgkVqCWvmOZSkHrunZJu4UPKrHjxs1vp8B3Q9tEjfqmihW6MiDCPBzfyA
	 WvZPygUM9C4Qx1XMRBdVOEX9ihxXsz8eHcRsJqMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23B4DF804FD;
	Wed,  4 Aug 2021 00:36:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A042F804FB; Wed,  4 Aug 2021 00:36:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14F6FF804EC
 for <alsa-devel@alsa-project.org>; Wed,  4 Aug 2021 00:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14F6FF804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Gt7uODj/"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C424461078;
 Tue,  3 Aug 2021 22:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628030186;
 bh=hcHr3un6vM6Jy8wur/6t7L/Lhc7LHra5hoSt0Zdm0Nk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Gt7uODj/2ODw1IRh8Wtq3MriRjB4G8ItAvkRnU21Gm35JbsAP8v5Ykgz8ZdI24naW
 j0uOlC3xxzyLHykiig/C1Fq4TGlwHRNJxX82ardqhmhxgRGkiBTUtOLnnnpvJHrVT5
 q8d+ef/IdAnzof3/sLd1Xj5G4/93vcqqCkORxSB39wJodXaLHvfQo4fZkMUup25B+u
 8zJyYisVT2o7QtgbaSHUDGjM7KlIqkkVFzE7JU6EOpTKUsAaff40ChfAX4/zy3YMIM
 Ah6JhK3/2X7YtWbKktO0o8vBrIqtwJ5F/q74xEEaW5DxfmZFU0CkCjOggihxBq4E5n
 89bFAMNtABpiQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH 1/2] ASoC: cs42l42: Fix inversion of ADC Notch Switch
 control
Date: Tue,  3 Aug 2021 23:35:40 +0100
Message-Id: <162802985541.42099.7806067166014112149.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210803160834.9005-1-rf@opensource.cirrus.com>
References: <20210803160834.9005-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Tue, 3 Aug 2021 17:08:33 +0100, Richard Fitzgerald wrote:
> The underlying register field has inverted sense (0 = enabled) so
> the control definition must be marked as inverted.
> 
> 
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: cs42l42: Fix inversion of ADC Notch Switch control
      commit: 30615bd21b4cc3c3bb5ae8bd70e2a915cc5f75c7
[2/2] ASoC: cs42l42: Remove duplicate control for WNF filter frequency
      commit: 8b353bbeae20e2214c9d9d88bcb2fda4ba145d83

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
