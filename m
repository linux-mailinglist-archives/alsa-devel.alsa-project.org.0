Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7664E4F2979
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 11:33:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6915174D;
	Tue,  5 Apr 2022 11:32:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6915174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649151202;
	bh=w/qmrPEIOfBh1lZCVrt3be7cmnNT8Ingtoi9EdxNVuo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PjHuQUWde401fZv61G+dj3BTwkqArgSk3M/GZ1Ikv/YX2E0YgR7EAkl5xc8ynDHGh
	 lWeiurzj/WgDn4UZ2A0YexbQnAHnh/1xTx3F3w490lVwS6MgcA9IK43M0wz8ERYc/V
	 94CTWfz3O2DYWswLEyW9lNsMwFGqDAgacn8K3wlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00B16F80525;
	Tue,  5 Apr 2022 11:31:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A927F800D2; Tue,  5 Apr 2022 11:31:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADDFDF8049C
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 11:31:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADDFDF8049C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VvYIo+BX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 31231616D2;
 Tue,  5 Apr 2022 09:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC50C385A0;
 Tue,  5 Apr 2022 09:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649151068;
 bh=w/qmrPEIOfBh1lZCVrt3be7cmnNT8Ingtoi9EdxNVuo=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=VvYIo+BX32qG55V3iMfHtdiN/sPr8AkGsOxSwhz016IUSGNCSsQWp/fvjJRUO9Xae
 XYv/o1ku/6mUjCjcDt5DC1tMXx/x7t9YELIisUpksc5BzHEbGaH7D47y2k9wXKziZu
 jnMj38HUQuCSQJdFLDnuSrGz2tDxA+zuo/jAxtKwWvgYhGuhk+ZWnBeX6TkrNJwMPg
 Rz8QcWHz/zKRQQEbTw/G5QIu9RY/HzgW7L2LpQzeoIaYWh5heLo/S9affHOm5yHdZn
 hGINCP4ejKeYB+gbMoUwGLGhkak14ePpsZHCze0pO9m0LnbK/n4kE11BVBgF/+R+Id
 ogLDHsrqW2oQg==
From: Mark Brown <broonie@kernel.org>
To: patches@opensource.cirrus.com, tanureal@opensource.cirrus.com,
 alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 hui.wang@canonical.com
In-Reply-To: <20220324081839.62009-1-hui.wang@canonical.com>
References: <20220324081839.62009-1-hui.wang@canonical.com>
Subject: Re: [PATCH 1/2] ASoC: cs35l41: Add one more variable in the debug log
Message-Id: <164915106640.276574.12404607783112800825.b4-ty@kernel.org>
Date: Tue, 05 Apr 2022 10:31:06 +0100
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

On Thu, 24 Mar 2022 16:18:38 +0800, Hui Wang wrote:
> otp_map[].size is a key variable to compute the value of otp_val and
> to update the bit_offset, it is helpful to debug if could put it in
> the debug log.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: cs35l41: Add one more variable in the debug log
      commit: c598ccfbeb26cb9452f99e7beb92ef779dcb16b1
[2/2] ASoC: cs35l41: Fix a shift-out-of-bounds warning found by UBSAN
      commit: 0b3d5d2e358ca6772fc3662fca27acb12a682fbf

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
