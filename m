Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D70161F8A0
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 17:13:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08D10207;
	Mon,  7 Nov 2022 17:12:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08D10207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667837611;
	bh=I+9EDWZDRcrwrowkVWiDgcpOptpjuq0XgTZLS11c9UI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mNvxim3QeVHbpzMXUf0Qa74IPBq4qDrU4SFW+nj5eJm69DBOqS5PYp+s69VZPETW0
	 OlYjz+e23bvjJEeKdQgeRoz3lP7w/hMkF65iOcfM91KB/sQAXl3brEqJvT+TjjgNaf
	 R67b2APl6m6y8ZJ1O6JqgoQ38yoeSeGN0jH8IDgU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D719F804C1;
	Mon,  7 Nov 2022 17:12:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 586B7F8025A; Mon,  7 Nov 2022 17:12:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9D77F800AE
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 17:12:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9D77F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qIIlB4ue"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4BCBFB812A9;
 Mon,  7 Nov 2022 16:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB93C433B5;
 Mon,  7 Nov 2022 16:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667837550;
 bh=I+9EDWZDRcrwrowkVWiDgcpOptpjuq0XgTZLS11c9UI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qIIlB4uebPpyfiLvVwQsJY/VXellbGwW4Xi0pbSNlH5JORz0NnfhPJMVJpoRi2GJe
 cEmX7t9/e+7pt5L6pkxhUCVPknl+d5/DQeXINmA4HeGX+1/WdFfQvvk6V42rR6p9fm
 B/o1LBsfkMFX5R47FgSkiyD8jef9DeMMtKQxZlhpX3o/9DrkU8kVGyg+Ig5rWCsKbJ
 9zkPEV0kCpCx9Sx+PdZ7+rcTtBQ/A2SD18hfxECl8SWtisv1Ix6Xl5ZhVtkgmo/rCZ
 kOAq69tHOgOtMdTA0Zpb2SgN6ktROwJO1KczwLCRDHJQsjDWBOTJZLwM1YjSHhalRA
 bCfGlVBV1X5Qg==
From: Mark Brown <broonie@kernel.org>
To: Zhu Ning <zhuning0077@gmail.com>, alsa-devel@alsa-project.org
In-Reply-To: <20221028020456.90286-1-zhuning0077@gmail.com>
References: <20221028020456.90286-1-zhuning0077@gmail.com>
Subject: Re: [PATCH v1] ASoC: sof_es8336: reduce pop noise on speaker
Message-Id: <166783754848.206087.2037963622937127533.b4-ty@kernel.org>
Date: Mon, 07 Nov 2022 16:12:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: Zhu Ning <zhuning@everest-semi.com>, tiwai@suse.com,
 yangxiaohua@everest-semi.com, pierre-louis.bossart@linux.intel.com
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

On Fri, 28 Oct 2022 10:04:56 +0800, Zhu Ning wrote:
> The Speaker GPIO needs to be turned on slightly behind the codec turned on.
> It also need to be turned off slightly before the codec turned down.
> Current code uses delay in DAPM_EVENT to do it but the mdelay delays the
> DAPM itself and thus has no effect. A delayed_work is added to turn on the
> speaker.
> The Speaker is turned off in .trigger since trigger is called slightly
> before the DAPM events.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sof_es8336: reduce pop noise on speaker
      commit: 89cdb224f2abe37ec4ac21ba0d9ddeb5a6a9cf68

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
