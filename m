Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53614776984
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 22:10:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0680F1DC;
	Wed,  9 Aug 2023 22:09:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0680F1DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691611814;
	bh=g6rYgy+MPs3unR3QlJahG1JrUzUL0BpSkhQKnWPcIdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W1gZRCQl8Z/6r+Nvem6NJiAU4wCiaj0jncUWUUe+FhRGrScO1Um+BoW5Z7aFohIJu
	 HT2Axn+hn4Iy9QGB1m5zWJKuMU2m9+KvasZ4Mxfa7oUIhG3U8CFt4SsZr9SjzA2Oiq
	 Hq/JCSrIwFsOREqoinPFTzbTS5ZtRK2B7iF39oRI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 789D6F8016E; Wed,  9 Aug 2023 22:09:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9268FF80116;
	Wed,  9 Aug 2023 22:09:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D674F80134; Wed,  9 Aug 2023 22:09:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9ABABF800FE;
	Wed,  9 Aug 2023 22:09:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9ABABF800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sm8ESXXB
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5932D64811;
	Wed,  9 Aug 2023 20:09:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3F8C433C7;
	Wed,  9 Aug 2023 20:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691611748;
	bh=g6rYgy+MPs3unR3QlJahG1JrUzUL0BpSkhQKnWPcIdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sm8ESXXBEE1sOdivUjr4ohxWdrxwfJyjliUAyV3ATjwPV/ayS88fq4alKDBYxkt5d
	 sIex/4I4P0AyCcueQVlwSHnkrxZjV19Ha86LMmltS1Z3lWmzV1sW51aPUQp124aHkD
	 2apFExEONxiJ6I3GLe0AHEIiByQewI2kRPytVDTPCvZtgtQYibhlX7wqAzNVSH6eJj
	 osk3LzzEYAECZGKNBu7JAa3pN55l+7BTWPKBNDI6wu3mv1joKPJ3QCiL/piCip7vNo
	 7fZSzfNZrqjcqzTVGxaIhQfrs3CXC/jvxSGie1I+tDdrtf/SAqvT7Konp5ZD3qQObe
	 TdsUotB6LgHKQ==
Date: Wed, 9 Aug 2023 13:09:06 -0700
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
Message-ID: <20230809200906.GA4016444@dev-arch.thelio-3990X>
References: 
 <20230809-intel-hda-missing-chip-init-v1-1-61557ca6fa8a@kernel.org>
 <8eed2099-2853-df8d-92db-921d0702f512@linux.intel.com>
 <20230809190212.GB3355565@dev-arch.thelio-3990X>
 <2a2de1b5-4dd5-f170-bb0b-61d39230c3a7@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a2de1b5-4dd5-f170-bb0b-61d39230c3a7@linux.intel.com>
Message-ID-Hash: XS7VV6AOU7LUZ7BDY4SRJ5D5CT5P63EU
X-Message-ID-Hash: XS7VV6AOU7LUZ7BDY4SRJ5D5CT5P63EU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XS7VV6AOU7LUZ7BDY4SRJ5D5CT5P63EU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Aug 09, 2023 at 02:57:13PM -0500, Pierre-Louis Bossart wrote:
> > Looking at your GitHub Actions files, I am not sure exporting CC works
> > correctly so I don't think you are building with clang. If I do it
> 
> D'oh. I did not see this one coming... nice.
> 
> > locally:
> > 
> > $ export CC=clang
> > 
> > $ make -j$(nproc) defconfig
> > 
> > $ grep -E 'CONFIG_(CC_IS|CLANG|GCC)' .config
> > CONFIG_CC_IS_GCC=y
> > CONFIG_GCC_VERSION=130201
> > CONFIG_CLANG_VERSION=0
> > CONFIG_GCC11_NO_ARRAY_BOUNDS=y
> > CONFIG_GCC_PLUGINS=y
> > # CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
> > # CONFIG_GCC_PLUGIN_STACKLEAK is not set
> > 
> > $ make -j$(nproc) sound/soc/sof/intel/hda.o
> > 
> > $ head -1 sound/soc/sof/intel/.hda.o.cmd
> > savedcmd_sound/soc/sof/intel/hda.o := gcc ...
> > 
> > This was brought up some time ago and Masahiro made a decent point that
> > this might not be a desirable behavior change.
> > 
> > https://lore.kernel.org/CAK7LNAT6Yp3oemUxSst+htnmM-St8WmSv+UZ2x2XF23cw-kU-Q@mail.gmail.com/
> > 
> > Switching to passing CC via the actual make command should fix that.
> 
> Not quite. We generate our .config using "make defconfig" as a baseline
> and then "merge_config.sh" to add a bunch of fragments we need [1]. And
> of course the latter script does not understand CC=clang and switches
> back to GCC.

Ah, I still think you will need to pass CC to make directly, rather than
through the environment but you should be able to prevent
merge_config.sh from getting in the way by passing '-m' to avoid having
it invoke make itself, then you can add a 'make olddefconfig' step after
that, perhaps something like this?

  - name: build start
    run: |
      export ARCH=x86_64 KCFLAGS="-Wall -Werror"
      export MAKEFLAGS=j"$(nproc)"
      bash kconfig/kconfig-sof-default.sh -m
      make CC=clang olddefconfig
      make CC=clang sound/
      make CC=clang drivers/soundwire/
      make CC=clang

Cheers,
Nathan
