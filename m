Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E709B4B8FD2
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 19:03:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81BDD1A2C;
	Wed, 16 Feb 2022 19:02:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81BDD1A2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645034626;
	bh=XD/nyKzA7YBuZeYgwMrWbmDBjd9uoqzMMHucltaUhbA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R52ouT2hQPOfVih5Qrs2PziPF4RBK/nh5yBYUMitShcfY8tjF/lyv/uY7HaqDxR51
	 pcWNleXC14Ks2lIQcizUYRt8Y1UXTae54f2I/XagvYpJCU3mwSYB+XBem/YqaE1Mep
	 d3iRvD16lcBvdSug+9To2bVra9gTRQf+bX/A3mzY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 956A0F80256;
	Wed, 16 Feb 2022 19:02:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5DF4F80118; Wed, 16 Feb 2022 19:02:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C475CF80118
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 19:01:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C475CF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lsw7TqR9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 24CA4B81FB5;
 Wed, 16 Feb 2022 18:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB183C340E8;
 Wed, 16 Feb 2022 18:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645034516;
 bh=XD/nyKzA7YBuZeYgwMrWbmDBjd9uoqzMMHucltaUhbA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=lsw7TqR94cuOYN7RpzTW0pZPBDQHuB7PtYzjwIgTlGKRpktVRzhP2C56iSvga3j/+
 robxjMFO4g9WJhBW0ssmsERgjqVGry8g9Rm0fkBJTjYMxc6QsZkl/bT2Vvjl6PA23g
 31v3QApr2zv8lB4q/zPzfPnxHJGBOYkrzNP0Bqcx0b0NbQrR1xXa8Q4GFflB8Nqy51
 udE5m+K0XuHsgGuB2f6a6tQ1W/2Cf3vHwlyc2h22j3A4uF0Q8WASBwTffK6UMFm+ep
 XF++5GCHzMpfU67zVarNFv9Xwyx3wPd5t2cn0GaE45EOBeLouGZaxZiRF/hwFTrkSc
 sS1X1SFuxeKZA==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20220215120514.1760628-1-festevam@gmail.com>
References: <20220215120514.1760628-1-festevam@gmail.com>
Subject: Re: [PATCH v2] ASoC: cs4265: Fix the duplicated control name
Message-Id: <164503451555.3088802.5545811785236254940.b4-ty@kernel.org>
Date: Wed, 16 Feb 2022 18:01:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Fabio Estevam <festevam@denx.de>,
 ckeepax@opensource.cirrus.com, flatmax@flatmax.org
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

On Tue, 15 Feb 2022 09:05:14 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Currently, the following error messages are seen during boot:
> 
> asoc-simple-card sound: control 2:0:0:SPDIF Switch:0 is already present
> cs4265 1-004f: ASoC: failed to add widget SPDIF dapm kcontrol SPDIF Switch: -16
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: cs4265: Fix the duplicated control name
      commit: c5487b9cdea5c1ede38a7ec94db0fc59963c8e86

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
