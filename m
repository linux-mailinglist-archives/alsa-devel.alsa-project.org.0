Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FB25EC376
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 15:01:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AC569F6;
	Tue, 27 Sep 2022 15:00:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AC569F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664283700;
	bh=ef0fll36tZayaTkXFFwATMBk/FB37HxBMxP+ebvIFKE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ccm86VLggRVgpiBjQay/GYBVJi8NR8Mud+NPzQwnqsZWACdMgugEvKP6/34S58qKW
	 DM6JSlF1joRTdXa13jSTZoHNA6+PjLCTd2aX9YcCj+I+a/T7n7u/6NRnqHaSxEO8hC
	 ezYvqqcZXF0s+C5ODd6Md7Nk4Fxlx6YzSOk2fxFk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 264C8F8053A;
	Tue, 27 Sep 2022 15:00:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57214F80508; Tue, 27 Sep 2022 15:00:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B472F80515
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 14:59:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B472F80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VI80a1Nr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 715F6CE1932;
 Tue, 27 Sep 2022 12:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8F9C433C1;
 Tue, 27 Sep 2022 12:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664283589;
 bh=ef0fll36tZayaTkXFFwATMBk/FB37HxBMxP+ebvIFKE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=VI80a1NrJMMaXrKdkqJnKLwutGC8e9QbcQRorV7r9tp5huhfO6Egj3HJdg0Hpu73O
 3fbZ38GhjbBUi49B96emzG4YipnDJ1VGLq7/SINg4EnZb8BoDng93RS9fyceiL0moB
 TwnYE0R0hvMoGpmxHgST+XTi5w9Lo2oHG62R27bWLsgYf1UZ53l5pq64yd4T5rQC6p
 J1I8gYNeYixJts9aojoBeSLSDzAw70qNDqo0U6PWGkNVkvKZgFsP7VlzXBeYA4XX9F
 /r2LDyJpyJ0KltaNKI3FB2C7MHVo+Q/xyoTCJvMAvkHuw+VKS4pWSWHvH17c3E2uYp
 J+wWxreRDICvw==
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
In-Reply-To: <YzIuiUul2CwPlkKh@work>
References: <YzIuiUul2CwPlkKh@work>
Subject: Re: [PATCH][next] ASoC: Intel: Skylake: Replace zero-length arrays
 with DECLARE_FLEX_ARRAY() helper
Message-Id: <166428358688.365276.7811132471034976434.b4-ty@kernel.org>
Date: Tue, 27 Sep 2022 13:59:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, linux-hardening@vger.kernel.org,
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

On Mon, 26 Sep 2022 17:58:17 -0500, Gustavo A. R. Silva wrote:
> Zero-length arrays are deprecated and we are moving towards adopting
> C99 flexible-array members, instead. So, replace zero-length arrays
> declarations in anonymous union with the new DECLARE_FLEX_ARRAY()
> helper macro.
> 
> This helper allows for flexible-array members in unions.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: Skylake: Replace zero-length arrays with DECLARE_FLEX_ARRAY() helper
      commit: 6fed3265c3c811c79819860051375f6d7efc1d7e

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
