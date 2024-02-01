Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B41484601A
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Feb 2024 19:40:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9376B84C;
	Thu,  1 Feb 2024 19:40:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9376B84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706812825;
	bh=tgw4+yNSXYvoHx+l8Du/I6ui5/EiC9XA6FnewlYo6Ds=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QeJ7F/4zPW6izEy9v3XWVgzTBnsf9shcxJL1BiL79LfTjgLHCwGrm4CzjAjOaUY28
	 yrLeslv1BnLLgZW4lgE588u/bRKRNA+aK5pVTyMd/uHfjtKPpsgAuiYRjdA7Zu1Sq1
	 H1R2KV/WNizpntUY+El6VoXjGhMcY6TtTMgP7KzY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCE01F80580; Thu,  1 Feb 2024 19:39:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5ACBF80567;
	Thu,  1 Feb 2024 19:39:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70ABDF8055C; Thu,  1 Feb 2024 19:39:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DA4F5F804E7
	for <alsa-devel@alsa-project.org>; Thu,  1 Feb 2024 19:39:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA4F5F804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uAjMXxKM
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8462CCE276E;
	Thu,  1 Feb 2024 18:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A25AC433F1;
	Thu,  1 Feb 2024 18:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706812781;
	bh=tgw4+yNSXYvoHx+l8Du/I6ui5/EiC9XA6FnewlYo6Ds=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uAjMXxKMTVJzhSaQ6MunzoQr2LwnkYgozso/cc6+ZUewd58ICKl5RCUR8UYtxzWfD
	 QfajRXeB36x7zyK5WDXuh1esYUYTH0jW2QKjolsI1T5q4kYYG5LiYXQBd2o8x+ZR3T
	 bDCl8Qg+kfA1tIXXmSqL5UATJENyM8l8qMu2BpN2hvu12jLbGVHQoEXM0v7hA7Yw4/
	 wPsWe6Hq8QslfG8Ki4IPgaqTC680aHdlay95vZ8Xva3DWsNP/DHEprwbhE8rT4RoG/
	 NZkorIl6P9YBlQ3OTneFgjVEBzuQRrDLAXmobKcwZnAQC+lmPvxYfyzZ5E39Jja8VV
	 EKqLrSYNUXBrg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20240129162737.497-1-rf@opensource.cirrus.com>
References: <20240129162737.497-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 00/18] ALSA: Various fixes for Cirrus Logic CS35L56
 support
Message-Id: <170681278028.203738.8808339176775600542.b4-ty@kernel.org>
Date: Thu, 01 Feb 2024 18:39:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: XL4ZDXHDYPCIIKDWXU4MGJKAVKVI3NYO
X-Message-ID-Hash: XL4ZDXHDYPCIIKDWXU4MGJKAVKVI3NYO
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XL4ZDXHDYPCIIKDWXU4MGJKAVKVI3NYO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 29 Jan 2024 16:27:19 +0000, Richard Fitzgerald wrote:
> This chain of patches fixes various things that were undocumented, unknown
> or uncertain when the original driver code was written. And also a few
> things that were just bugs.
> 
> The HDA patches have dependencies on the ASoC patches, except for the final
> patch that removes a bogus test stub function.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/18] ASoC: wm_adsp: Fix firmware file search order
        commit: 3657e4cb5a8abd9edf6c944e022fe9ef06989960
[02/18] ASoC: wm_adsp: Don't overwrite fwf_name with the default
        commit: daf3f0f99cde93a066240462b7a87cdfeedc04c0
[03/18] ASoC: cs35l56: cs35l56_component_remove() must clear cs35l56->component
        commit: ae861c466ee57e15a29d97629e1c564e3f714a4f
[04/18] ASoC: cs35l56: cs35l56_component_remove() must clean up wm_adsp
        commit: cd38ccbecdace1469b4e0cfb3ddeec72a3fad226
[05/18] ASoC: cs35l56: Don't add the same register patch multiple times
        commit: 07687cd0539f8185b6ba0c0afba8473517116d6a
[06/18] ASoC: cs35l56: Remove buggy checks from cs35l56_is_fw_reload_needed()
        commit: 3739cc0733ba7eeafc08d4d4208d1f3c2451eabd
[07/18] ASoC: cs35l56: Fix to ensure ASP1 registers match cache
        commit: 72a77d7631c6e392677c0134343cf5edcd3a4572
[08/18] ASoC: cs35l56: Fix default SDW TX mixer registers
        commit: 782e6c538be43a17e34f552ab49e8c713cac7883
[09/18] ALSA: hda: cs35l56: Initialize all ASP1 registers
        commit: 856ce8982169acb31a25c5f2ecd2570ab8a6af46
[10/18] ASoC: cs35l56: Fix for initializing ASP1 mixer registers
        commit: 07f7d6e7a124d3e4de36771e2a4926d0e31c2258
[11/18] ASoC: cs35l56: Fix misuse of wm_adsp 'part' string for silicon revision
        commit: f6c967941c5d6fa526fdd64733a8d86bf2bfab31
[12/18] ASoC: cs35l56: Firmware file must match the version of preloaded firmware
        commit: f4ef5149953f2fc04907ca5b34db3df667dcddef
[13/18] ASoC: cs35l56: Load tunings for the correct speaker models
        commit: 245eeff18d7a37693815250ae15979ce98c3d190
[14/18] ASoC: cs35l56: Allow more time for firmware to boot
        commit: 9e92b77ceb6f362eb2e7995dad6c7f9863053d97
[15/18] ALSA: hda: cs35l56: Fix order of searching for firmware files
        commit: 77c60722ded7d6739805e045e9648cda82dde5ed
[16/18] ALSA: hda: cs35l56: Fix filename string field layout
        commit: e82bc517c6ef5d5c04b845420406e694c31bdb8a
[17/18] ALSA: hda: cs35l56: Firmware file must match the version of preloaded firmware
        commit: 6f8ad0480d82245961dae4d3280908611633872d
[18/18] ALSA: hda: cs35l56: Remove unused test stub function
        commit: 28876c1ae8b8cd1dacef50bd6c0555824774f0d2

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

