Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DA1308008
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jan 2021 21:58:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89A4F16AD;
	Thu, 28 Jan 2021 21:57:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89A4F16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611867499;
	bh=jkweb2pifxzJp7sxiZtI+a9pMzcdV4TWy+OrK9mpB+s=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GSwtPNCu3JmjsbYI9dLSQDh23kndeUE91OdAu65R9ZapnuaMUlnbxCP8DNsTXGCCu
	 Mx07m3AJim0uJU5MOGbpacnMfyp9756+8w9aHA/KkScwgY+jQjLgT+tE1L4kQg54kA
	 kHsVXSUtTGAdaCFns+XHJsqPzLNqnr5eW/Lq4zOQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82C14F804D8;
	Thu, 28 Jan 2021 21:55:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88F64F804E4; Thu, 28 Jan 2021 21:55:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AEACF804D8
 for <alsa-devel@alsa-project.org>; Thu, 28 Jan 2021 21:55:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AEACF804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RAISmF8u"
Received: by mail.kernel.org (Postfix) with ESMTPSA id F3AED64DE6;
 Thu, 28 Jan 2021 20:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611867337;
 bh=jkweb2pifxzJp7sxiZtI+a9pMzcdV4TWy+OrK9mpB+s=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=RAISmF8uxQBlSMPz2frkN9fJy7JnEbtczh7+3ZYhkUcl/K3/3/GBeXJYr+OqGL+DN
 G9VyoTdG9Bxo6JZgwKzAqpWn27MDhNPAXwYfLQo/FQ0ITticnmZrVZQ9ge2pr59GcG
 +HPMP2RhkFxgtdJGZ5pqcNreN3hZKqJpgHeVmDuqzwVDYdB54885yLGLNxWVmCBj2K
 zs4zn5n3eCxLcAUL8G1yNhqdygahBy9vwd35U3GqWUC/9dZQyHcyONdk0lnGi0ZphY
 eeQzmX0GWSJF7eqNEo2ATclqw2GmV7ipCqXTdV/mKDyR7MHZ7qtwuYZ75tL79D/UKS
 TR1Adicld3lSA==
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20210128105751.1049837-1-kai.vehmanen@linux.intel.com>
References: <20210128105751.1049837-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: remove duplicate MODULE_LICENSE/DESCRIPTION
 tags
Message-Id: <161186727762.43763.10625910430337104529.b4-ty@kernel.org>
Date: Thu, 28 Jan 2021 20:54:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com,
 yang.jie@linux.intel.com, Rander Wang <rander.wang@linux.intel.com>,
 lgirdwood@gmail.com
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

On Thu, 28 Jan 2021 12:57:51 +0200, Kai Vehmanen wrote:
> The snd-soc-acpi-intel-match has duplicate module tags for all
> platforms separately. Remove all but one and save some storage
> space and cleanup modinfo output.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: remove duplicate MODULE_LICENSE/DESCRIPTION tags
      commit: 1fc96dc29c3ba342915c3a935c9d177f8f420d03

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
