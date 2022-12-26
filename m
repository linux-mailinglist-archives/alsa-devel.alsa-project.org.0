Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC32656614
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 00:36:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03E8D65D2;
	Tue, 27 Dec 2022 00:35:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03E8D65D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672097766;
	bh=cDwu4kM8l3cgFD8Zxb1eDDB1DVSOVJ1DhZGICqs0pmQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jfj5ZvxY0U3+z/CROPhdX7ezoGjj8nebWoQh/1tSWDIDo1ja9v94i/dedhnS4U3ia
	 7UjWkm+uXCAwXkXjxuKiYWCAMMTbEhzpXFARtF2fFXXuKdjR89yUuS+iiUPebqCdsK
	 NDsZ4FoJuJEB6ZGN4T7wf5b5MNUXl1t1Ww7OYvPw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51FB1F80544;
	Tue, 27 Dec 2022 00:34:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 375C1F804D6; Tue, 27 Dec 2022 00:34:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7253DF80134
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 00:34:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7253DF80134
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=C95e+8c6
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C39D760E9D;
 Mon, 26 Dec 2022 23:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C29EBC433D2;
 Mon, 26 Dec 2022 23:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672097648;
 bh=cDwu4kM8l3cgFD8Zxb1eDDB1DVSOVJ1DhZGICqs0pmQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=C95e+8c64hIE8JKGxitFFNlla73ZMlVfdmZmc6486jHMzIb0CDVVAhLSMU/Si6mub
 lGmDJb3PAhehUUUIQkky8A88xGqxuwDPf4aQrOwsu71+rhWjGLp29JdlHB+KXVtzj1
 0ZaQlYAsR8nngpwZTi3KfO8Cz91Dj9bzr6KPxYxP2e7/f51QPz3HocGKEXd39n+yqO
 5T6LicKw/SfJiuUxbUEkg5Wl6kvzPpg5hIgOng85CxUjtJV8kElsGRxul1PwR+hQ83
 66p6aMMX5PEibVS+t5Q7X6Th6d6gMwlse2PJKTAddoI/sOXM8YU2jLBJdxyqUpJ9jW
 wbx84QRIG5vlg==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <20221221132559.2402341-1-arnd@kernel.org>
References: <20221221132559.2402341-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: Intel: fix sof-nau8825 link failure
Message-Id: <167209764451.330820.11826897991352846067.b4-ty@kernel.org>
Date: Mon, 26 Dec 2022 23:34:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-7ab1d
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 "balamurugan.c" <balamurugan.c@intel.com>, Mac Chiang <mac.chiang@intel.com>,
 David Lin <CTLIN0@nuvoton.com>, Gongjun Song <gongjun.song@intel.com>,
 Brent Lu <brent.lu@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 21 Dec 2022 14:25:48 +0100, Arnd Bergmann wrote:
> The snd-soc-sof_nau8825.ko module fails to link unless the
> sof_realtek_common support is also enabled:
> 
> ERROR: modpost: "sof_rt1015p_codec_conf" [sound/soc/intel/boards/snd-soc-sof_nau8825.ko] undefined!
> ERROR: modpost: "sof_rt1015p_dai_link" [sound/soc/intel/boards/snd-soc-sof_nau8825.ko] undefined!
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: fix sof-nau8825 link failure
      commit: 63f3d99b7efe4c5404a9388c05780917099cecf4

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
