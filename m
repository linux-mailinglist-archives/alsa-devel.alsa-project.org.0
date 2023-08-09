Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF957767D4
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 21:03:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4AE982C;
	Wed,  9 Aug 2023 21:02:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4AE982C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691607800;
	bh=DLaLQ4nsUMcnLJe2hdcXxiDEkHoG+vblKTViNjeTKig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nORWd5Qq/npZeRJseMBTvm3xy2hpoJrW24kxFKEnm/r70CQyJlrIGHzMNFZLannW9
	 r0JjRoBOfTpz+b0R+Y+iS7wW5xi3Z38L23igeQPIz3d2xJ3/UbyRZWn+fSivZ5ZRqW
	 AQ3lnMMe1bniDKlHpn+Yr4j5tD/1zz/vL5AVI6DY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BA5BF8055B; Wed,  9 Aug 2023 21:02:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC140F80134;
	Wed,  9 Aug 2023 21:02:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04B98F8016E; Wed,  9 Aug 2023 21:02:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE5B2F800FB;
	Wed,  9 Aug 2023 21:02:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE5B2F800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WsbhmUVD
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B7C82644BE;
	Wed,  9 Aug 2023 19:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 465ECC433C8;
	Wed,  9 Aug 2023 19:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691607735;
	bh=DLaLQ4nsUMcnLJe2hdcXxiDEkHoG+vblKTViNjeTKig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WsbhmUVDxxUU5AKtdMD+ld8irEp2+G7gGwMG+Jm/l7wEg5dHrvhMEq15+Llc/EpZ1
	 p4D062pr/7mTSZCfmNcTjTZ+yUEheVFNafMCMV858mlMKUA2uuJfeA7EX2R3TpIIul
	 vyMSJ5DHoN8DfD/jGXZQEZ4KcEa2lfkrEtWrE/GH2o1QxCa9I2MzMJKtInJQ/ecSY2
	 dDfbHj8dsaRTvTcYtYmc39Laz9Ka63tuAB1cQA4PvmsmoP4Pu60Xz+/OGRzOB5pd3a
	 GIce1u/nAXFqQkEBqomqIdqjvuPZCm65jnPGbyN44kacqajdoMQJCBkNC2zUGn8C4t
	 Sq0SoEWPCVuqA==
Date: Wed, 9 Aug 2023 12:02:12 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
	daniel.baluta@nxp.com, kai.vehmanen@linux.intel.com,
	ndesaulniers@google.com, trix@redhat.com, rander.wang@intel.com,
	sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
	llvm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH] ASoC: SOF: Intel: Initialize chip in
 hda_sdw_check_wakeen_irq()
Message-ID: <20230809190212.GB3355565@dev-arch.thelio-3990X>
References: 
 <20230809-intel-hda-missing-chip-init-v1-1-61557ca6fa8a@kernel.org>
 <8eed2099-2853-df8d-92db-921d0702f512@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8eed2099-2853-df8d-92db-921d0702f512@linux.intel.com>
Message-ID-Hash: FXL4NQN7XQTMO4POX6ILI2ZWJU4SMOTV
X-Message-ID-Hash: FXL4NQN7XQTMO4POX6ILI2ZWJU4SMOTV
X-MailFrom: nathan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FXL4NQN7XQTMO4POX6ILI2ZWJU4SMOTV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Aug 09, 2023 at 01:41:18PM -0500, Pierre-Louis Bossart wrote:
> 
> 
> On 8/9/23 13:12, Nathan Chancellor wrote:
> > Clang warns (or errors with CONFIG_WERROR):
> > 
> >   sound/soc/sof/intel/hda.c:423:6: error: variable 'chip' is uninitialized when used here [-Werror,-Wuninitialized]
> >     423 |         if (chip && chip->check_sdw_wakeen_irq)
> >         |             ^~~~
> >   sound/soc/sof/intel/hda.c:418:39: note: initialize the variable 'chip' to silence this warning
> >     418 |         const struct sof_intel_dsp_desc *chip;
> >         |                                              ^
> >         |                                               = NULL
> >   1 error generated.
> > 
> > Add the missing initialization, following the pattern of the other irq
> > functions.
> > 
> > Fixes: 9362ab78f175 ("ASoC: SOF: Intel: add abstraction for SoundWire wake-ups")
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
> Indeed, thanks Nathan for flagging this obvious mistake. I must have
> done something wrong when extracting the patches.
> 
> Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks for the quick response!

> That said, we DO compile with clang and there was no warning
> https://github.com/thesofproject/linux/actions/runs/5542372669/job/15010818307
> 
> Is this dependent on a specific version of clang? I'd like to make sure
> our tools and tests are updated.

It should not be, I can reproduce it with all the versions of clang that
the kernel supports (11.x+).

Looking at your GitHub Actions files, I am not sure exporting CC works
correctly so I don't think you are building with clang. If I do it
locally:

$ export CC=clang

$ make -j$(nproc) defconfig

$ grep -E 'CONFIG_(CC_IS|CLANG|GCC)' .config
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=130201
CONFIG_CLANG_VERSION=0
CONFIG_GCC11_NO_ARRAY_BOUNDS=y
CONFIG_GCC_PLUGINS=y
# CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
# CONFIG_GCC_PLUGIN_STACKLEAK is not set

$ make -j$(nproc) sound/soc/sof/intel/hda.o

$ head -1 sound/soc/sof/intel/.hda.o.cmd
savedcmd_sound/soc/sof/intel/hda.o := gcc ...

This was brought up some time ago and Masahiro made a decent point that
this might not be a desirable behavior change.

https://lore.kernel.org/CAK7LNAT6Yp3oemUxSst+htnmM-St8WmSv+UZ2x2XF23cw-kU-Q@mail.gmail.com/

Switching to passing CC via the actual make command should fix that.

Cheers,
Nathan
