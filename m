Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4027218DDE
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 19:05:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7383615E2;
	Wed,  8 Jul 2020 19:04:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7383615E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594227915;
	bh=N7zc2EeHk3r0bhTq3OgKegYaJEeQCtjXoaIweWas5ac=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oNKSElTb20Thmos5q23wjut8XSDspr9vTl3nOv+x5TeYtR1uAy57dMQEXJTomIhyS
	 UxKH8ktQjb9LrwKg2y8VSZ9BCNr/URh9tEXMa2HFV8QIQiOF42tEx8fK2ATdboktln
	 akoeZD78ql8hTzRR+wJeGffgLgwScYMusEl3dUNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81A27F802FD;
	Wed,  8 Jul 2020 19:00:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C56DF802FB; Wed,  8 Jul 2020 19:00:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5328AF802F7
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 19:00:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5328AF802F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ANGvFU+F"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D4DCD206F6;
 Wed,  8 Jul 2020 17:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594227625;
 bh=N7zc2EeHk3r0bhTq3OgKegYaJEeQCtjXoaIweWas5ac=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ANGvFU+FrmeS3EjWD++6/jhDsQ+yknawZY+4glld97t0R+O+WyHaKy4n8AMWKxVn6
 PsfgPUe7IniSEtFTp+McMdwHEM3HaLDrK82LbU1iMcYkfTb0fyn5cJUS/ZA6DdhuwC
 kOrq8rmIMVpBUZes4c6yKhIItueWSDe+9RlKhAHQ=
Date: Wed, 08 Jul 2020 18:00:20 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
In-Reply-To: <1594147044-25582-1-git-send-email-Vijendar.Mukunda@amd.com>
References: <1594147044-25582-1-git-send-email-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: amd: fixed kernel warnings
Message-Id: <159422758800.28431.7689040196790188529.b4-ty@kernel.org>
Cc: open list <linux-kernel@vger.kernel.org>, rdunlap@infradead.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Alexander.Deucher@amd.com, Takashi Iwai <tiwai@suse.com>
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

On Wed, 8 Jul 2020 00:07:11 +0530, Vijendar Mukunda wrote:
> This patch will fix unused variables kernel warnings when
> CONFIG_ACPI is disabled.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: fixed kernel warnings
      commit: ee3d133972f1e5d260891c4dd58adb005014414a

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
