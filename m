Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DE6273711
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Sep 2020 02:08:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CB3F16D2;
	Tue, 22 Sep 2020 02:07:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CB3F16D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600733290;
	bh=puHOFQFO8c+3FJiXRCoOWFvOPzC6ktrPZjVmalHSDO8=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HyqWOCry/0uW6XumRtg11GL28k+o9UCkcEaIzg1QjqagTZ/SRxJGFcwC7OrniUhpF
	 GUWeGPMItOkZSBKnsKlEa6AlZXpw52faF/1e1qwGyH9tc5tVyomh/BPIA62vDtZL9H
	 vOimXQL2SK/4g9wzeEdEztgynvm1JCY9qom7KGYg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C385F801EC;
	Tue, 22 Sep 2020 02:06:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1692F80162; Tue, 22 Sep 2020 02:06:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AAF8F800B2
 for <alsa-devel@alsa-project.org>; Tue, 22 Sep 2020 02:06:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AAF8F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sy0uzIp0"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 36335207C4;
 Tue, 22 Sep 2020 00:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600733180;
 bh=puHOFQFO8c+3FJiXRCoOWFvOPzC6ktrPZjVmalHSDO8=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=sy0uzIp0fsyWHl12/CpfdGikWyMQ/W2aiRNDPTSxkMSV224v7u73vbtp7iLgSC2kE
 PxS9EvJ4jc5k7fKQafho5jlmRb5rWaLt2GD47PpisZ6DHy2wZdZE49vmNvIdWds04d
 ztyY9NWXiF/GepSCM2qdjcmMd5TCr+MX0EiQTWA4=
Date: Tue, 22 Sep 2020 01:05:28 +0100
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 Dan Murphy <dmurphy@ti.com>
In-Reply-To: <20200921153820.18357-1-dmurphy@ti.com>
References: <20200921153820.18357-1-dmurphy@ti.com>
Subject: Re: [PATCH 1/2] dt-bindings: tas2562: Add the TAS2110 amplifier
Message-Id: <160073312817.6173.18247828257698591331.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
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

On Mon, 21 Sep 2020 10:38:19 -0500, Dan Murphy wrote:
> Add the TAS2110 amplifier compatible.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] dt-bindings: tas2562: Add the TAS2110 amplifier
      commit: 9074a078435eb9c4e16862ec08faaf19aee6190f
[2/2] ASoC: tas2562: Add the TAS2110 class-D amplifier
      commit: 8adcdbe63aa7745ecd253b6dcf03cd2d30ece8f5

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
