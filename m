Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2271520A1D4
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 17:24:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C681B18FB;
	Thu, 25 Jun 2020 17:23:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C681B18FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593098656;
	bh=SuxWlMN/mUE25qtcI+f8Tt+ztT79OHvGlR2UWnNxj7A=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T4yBjlmNfvmWeLoAPgc7twBfaZy3kL5vSZDbhke6ZecaBDKi3jhZK6auu9pWewNQj
	 tBSaPjKSR7TqEwpemQ7YAMq0Q0I3lAC0FQ3qCyeRtcBXJa7Eo8V4R0oN0uwVzAO/mQ
	 KQexiBF0bg8h4lVDgOXSWWjYDElUJ9lVswyZ5F/Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E76B3F8023E;
	Thu, 25 Jun 2020 17:22:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7D8BF80234; Thu, 25 Jun 2020 17:22:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D646F80137
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 17:22:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D646F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="o0biBRzU"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F3DBF206C0;
 Thu, 25 Jun 2020 15:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593098548;
 bh=SuxWlMN/mUE25qtcI+f8Tt+ztT79OHvGlR2UWnNxj7A=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=o0biBRzUnoDbK5rZCdkVebGPX/jXIr6LhyFACFWqV2hOZw7kcXY/gBnxWf4Hzl1ZB
 ajeWfis3IOYng0SmG3P6V8PV6epOeEzUReVkhYDr41P7W4S1ULgcDlrYAx38JSPax5
 byi8qVXUyHkVK/hAyMO7MDNzpE4VUFQT+W3be8Pw=
Date: Thu, 25 Jun 2020 16:22:26 +0100
From: Mark Brown <broonie@kernel.org>
To: ALSA development <alsa-devel@alsa-project.org>,
 Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20200625115829.791750-1-perex@perex.cz>
References: <20200625115829.791750-1-perex@perex.cz>
Subject: Re: [PATCH] AsoC: amd: add missing snd- module prefix to the acp3x-rn
 driver kernel module
Message-Id: <159309854633.30972.4323594276725877773.b4-ty@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>, Alexander.Deucher@amd.com,
 vijendar.mukunda@amd.com
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

On Thu, 25 Jun 2020 13:58:29 +0200, Jaroslav Kysela wrote:
> 


Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] AsoC: amd: add missing snd- module prefix to the acp3x-rn driver kernel module
      commit: bc5c7f55f5ea91e137fc7939435ed2e2bb6e5a15

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
