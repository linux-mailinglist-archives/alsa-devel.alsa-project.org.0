Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4F259605B
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 18:34:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13AA1163F;
	Tue, 16 Aug 2022 18:34:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13AA1163F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660667694;
	bh=fEY0ZMzz5QQH1NMs/TZ51HDCXd7zhsu3uq/F+/WgQkA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eK0aZLN2E4LoP5C9brm3kPwms3x/yxWfzqg8U3dx3RzTa3eon9uV0Wlv+9weHSzK7
	 jW5S4aaKUlfDRf2rf/QegrjF/+UvFeaS4I+bSt0uhjw4L1T9mFh2caOv4dVwMMx8QM
	 0cASROH12b5mknq2ZrM4VgsrB6aaj+o97DGDJ58A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA190F80424;
	Tue, 16 Aug 2022 18:33:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3099F8032D; Tue, 16 Aug 2022 18:33:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E51DF80118
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 18:33:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E51DF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Z+kpyNsA"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 05800B81A87;
 Tue, 16 Aug 2022 16:33:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6110DC433C1;
 Tue, 16 Aug 2022 16:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660667625;
 bh=fEY0ZMzz5QQH1NMs/TZ51HDCXd7zhsu3uq/F+/WgQkA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Z+kpyNsAIy7KPBzaSUqm7UV88U9wWKlT3YxOOlrZ7j61lakWIGaBLcU9GJ0Eqp3Ne
 TR9ULMjShUp6M3dOA/TIrIgs9EVrrmRYccoRKlVP6SIlmnRjfUcVvqyfhaaRlPDSVh
 3Hv0SXY2SzN9+qFaN/rIsS7Xf+tmh7BjIO6Rd0LpWBxgj8PwnGk090jJzRMkeQ5kz6
 fGNeMNcVJr31OoorseZfnGZH4+umBl8uNm8Q4dRqbwBNdnwehs+/KLLi4rHXbc7BAS
 O0FsnNGdWLc1ozOqI+Z361PAZ7wMMAPhWtOWBubpAURF+tDHuKKntpuFEqboJJXfX4
 BKJg/Rnnobikw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220815165818.3050649-1-cezary.rojewski@intel.com>
References: <20220815165818.3050649-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/4] ASoC: Intel: HSW and BDW updates
Message-Id: <166066762412.1463673.7967648401301188217.b4-ty@kernel.org>
Date: Tue, 16 Aug 2022 17:33:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com, tiwai@suse.com,
 kai.vehmanen@linux.intel.co, pierre-louis.bossart@linux.intel.com
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

On Mon, 15 Aug 2022 18:58:14 +0200, Cezary Rojewski wrote:
> Sharing this PR as it touches on cross-driver subjects. Four commits yet
> two subject. Given the small delta, decided to combine within single PR
> here. I plan to send these subjects separately to the mailing list
> though.
> 
> 1. Rename hsw_rt5640 and bdw_rt286 module names
> 2. Drop SND_SOC_INTEL_ACPI_MATCH dependency for catpt-driver
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: Intel: hsw_rt5640: Rename module
      commit: 7c32710c8be4be8a2999a648bcb4e899e12f9a4b
[2/4] ASoC: Intel: bdw_rt286: Rename module
      commit: efbaa66852ee98fbd661beef8663d2992cfa901a
[3/4] ASoC: Intel: catpt: Drop SND_SOC_ACPI_INTEL_MATCH dependency
      commit: 02f29be6a553e4ebee5b718165b01cc4f17dffa8
[4/4] ASoC: Intel: Drop legacy HSW/BDW board-match information
      commit: a25e1183ea2d0feb068794adf0249919ea7e0d8c

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
