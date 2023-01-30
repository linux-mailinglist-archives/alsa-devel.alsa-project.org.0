Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBAE681C20
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 22:02:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85799E7B;
	Mon, 30 Jan 2023 22:01:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85799E7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675112557;
	bh=iRg99z3vTaLGUvQvUebXqz6g0jHz4G5yj786/Gc2mwE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VZiL14df9fukQbGK5yixgorAJz7JIjs7m88EGMZGnhm6eW8UxoupyVgorAO67P3xi
	 qYz7DiqA4kQmxpVdUYQdeFBVKPP0rXVgaJme2bRt4efTWK0mVvvlwga0gj6M0Xpk7s
	 m9S+D3/sDLc/zCORoSX13O8mydh6RF7hib5sFjRA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AED7FF80567;
	Mon, 30 Jan 2023 22:00:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78A62F80557; Mon, 30 Jan 2023 22:00:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A615F80548
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 22:00:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A615F80548
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qjiH7a22
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7FC78B8169A;
 Mon, 30 Jan 2023 21:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C75B2C433A1;
 Mon, 30 Jan 2023 21:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675112420;
 bh=iRg99z3vTaLGUvQvUebXqz6g0jHz4G5yj786/Gc2mwE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qjiH7a22voIpZqzZfJhuZkB59RtLvWyNkSNcSmGiiR7/tMIkojqaMBwsoQbTi5NCW
 TOSOGTtmaU67yXRl2oasjHK7GIj+S6lnMZlhAGdGUhfZT3on5uoEwo5e2latHKru2o
 fhB2rxlme5bCKlDICnQSUbf1YsxIRzdJa9Tdewenw/Qv1m0oRImRPRER7Z8UgJURmm
 zFS8yujJRdZOD8zggoxRVNWC81Jc0fict1tevjFx6kSXlrd+EvW6h2UTKyK3ENIt7y
 jDafXzARWIEmRvH6uOfiychd3OIvGzZUEtSyBVszB5Q4PfToKDjG2QVw+4QjIH+4ly
 abX70CPF6CRWg==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20230127231111.937721-1-amadeuszx.slawinski@linux.intel.com>
References: <20230127231111.937721-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 00/11] ASoC: topology: Fixes and cleanups
Message-Id: <167511241838.2141894.15213514873056641200.b4-ty@kernel.org>
Date: Mon, 30 Jan 2023 21:00:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.0
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
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sat, 28 Jan 2023 00:11:00 +0100, Amadeusz Sławiński wrote:
> Following is series of fixes and cleanups for core topology code. Few
> patches fixing various problems all around and few fixing function
> names.
> 
> v2:
>  - fix commit messages
>  - change order of last two patches
>  - as there is no code changes, add Reviewed-by from Ranjani
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: topology: Properly access value coming from topology file
        commit: c5d184c92df2b631fb81fe2ce6e96bfc5ba720e5
[02/11] ASoC: topology: Remove unused SOC_TPLG_PASS_PINS constant
        commit: 6257d224b894b676540998ae9563c211410c9436
[03/11] ASoC: topology: Fix typo in functions name
        commit: 8f9974d9d767d11ce17280bec0d0f2e95e91954d
[04/11] ASoC: topology: Fix function name
        commit: 23e591dc0f8ce0298857a1445993fa7549a1f2e0
[05/11] ASoC: topology: Rename remove_ handlers
        commit: 2abfd4bd7b0700df4996ae2b60a12f22a0ef633d
[06/11] ASoC: topology: Remove unnecessary forward declarations
        commit: 70a7cd09a6368e0c9d351185a8fbfb3bae5a74f3
[07/11] ASoC: topology: Pass correct pointer instead of casting
        commit: 9e2ee00039a8ff236ae4db2366f4d2325658bea6
[08/11] ASoC: topology: Return an error on complete() failure
        commit: b784617a407c4f7e079e1694c3161ab29eb4bab1
[09/11] ASoC: Topology: Remove unnecessary check for EOF
        commit: d9b07b790a5c47dd4fd66c9264a3b38a103fa09b
[10/11] ASoC: topology: Unify kcontrol removal code
        commit: fdfa3661f830c98fb0f6380c3876fae33bc83b1d
[11/11] ASoC: topology: Use unload() op directly
        commit: 31e9273912bf5e4c23a876b5dfe0760fbecde92c

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

