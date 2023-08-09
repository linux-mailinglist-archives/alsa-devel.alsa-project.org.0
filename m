Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 079E8776A79
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 22:44:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA3E9823;
	Wed,  9 Aug 2023 22:43:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA3E9823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691613851;
	bh=gvyh+YMZyzw6l1AUm6s4evm1s8qrAk/50sEjOO8oAAs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iIl8pGcEL+MPw0lLdsjIEJbBD7lOKN2B29WOs1wIRAOKA6LWvlK87jDxJPUnnwjW1
	 3i4bJvBptgXS6VKehrj/KMI1JqsrOx9GQ4ATOeydb3uSbYOOaRf6QIppIdpPdrfiDR
	 i5PmVa4liHXKBq0/ATQjF0ijcCVygnVxVETyx2PA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7ACB8F80549; Wed,  9 Aug 2023 22:43:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BF1DF80116;
	Wed,  9 Aug 2023 22:43:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A07B9F80134; Wed,  9 Aug 2023 22:43:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8983FF800F4;
	Wed,  9 Aug 2023 22:43:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8983FF800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LnIqNNe/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691613783; x=1723149783;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gvyh+YMZyzw6l1AUm6s4evm1s8qrAk/50sEjOO8oAAs=;
  b=LnIqNNe/bM/dVnFRGgI/1xI2ltlKuRtCa/08oeoiTY3+ijr6q4jRhmTy
   xs7NpydmYuorTpnkL9p9fEZLX3Nub4Mt40b9m8XgmmAV1kIPuz3s4RG1D
   WKg3dAOcC3G2D+wVBIXeAcgna+vkXTuZ4NCv9tFHjxFLTAJggsK1g0icr
   K9lAPEqM0Uz7E5xsPUeuH5rEO8N6EdnnCosrrFdlyjC/CoSLdXFUdssdl
   b7L7+lnKbnAUihaEaamADC9aBquM9XvfzFxa1epB7CQr0k39k3FghzhEl
   seCuRyiO78YVHqlkghdDEyisOi4/Q5L7n+rFi8SItHDPiYTbbCM3YVy4k
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="402185180"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200";
   d="scan'208";a="402185180"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 13:42:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="1062626796"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200";
   d="scan'208";a="1062626796"
Received: from jcaminer-mobl.amr.corp.intel.com (HELO [10.212.58.36])
 ([10.212.58.36])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 13:42:45 -0700
Message-ID: <d224ef41-373f-186b-1ba2-86f00ea8fbce@linux.intel.com>
Date: Wed, 9 Aug 2023 15:42:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH] ASoC: SOF: Intel: Initialize chip in
 hda_sdw_check_wakeen_irq()
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
Cc: broonie@kernel.org, lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com, kai.vehmanen@linux.intel.com,
 ndesaulniers@google.com, trix@redhat.com, rander.wang@intel.com,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 llvm@lists.linux.dev, patches@lists.linux.dev
References: 
 <20230809-intel-hda-missing-chip-init-v1-1-61557ca6fa8a@kernel.org>
 <8eed2099-2853-df8d-92db-921d0702f512@linux.intel.com>
 <20230809190212.GB3355565@dev-arch.thelio-3990X>
 <2a2de1b5-4dd5-f170-bb0b-61d39230c3a7@linux.intel.com>
 <20230809200906.GA4016444@dev-arch.thelio-3990X>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230809200906.GA4016444@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3ZSTUNBQXAK5ABPEFBD6FWQD3LTO4HNO
X-Message-ID-Hash: 3ZSTUNBQXAK5ABPEFBD6FWQD3LTO4HNO
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3ZSTUNBQXAK5ABPEFBD6FWQD3LTO4HNO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> Ah, I still think you will need to pass CC to make directly, rather than
> through the environment but you should be able to prevent
> merge_config.sh from getting in the way by passing '-m' to avoid having
> it invoke make itself, then you can add a 'make olddefconfig' step after
> that, perhaps something like this?
> 
>   - name: build start
>     run: |
>       export ARCH=x86_64 KCFLAGS="-Wall -Werror"
>       export MAKEFLAGS=j"$(nproc)"
>       bash kconfig/kconfig-sof-default.sh -m

The -m doesn't work since it's added last, but it's not even needed. The
sequence below re-adds clang, that's just fine.

>       make CC=clang olddefconfig
>       make CC=clang sound/
>       make CC=clang drivers/soundwire/
>       make CC=clang
The fun part now is that I get tons of unrelated errors - but at least
that's a sign we're using the clang compiler

https://github.com/thesofproject/linux/actions/runs/5813817494/job/15762178568?pr=4518


sound/pci/hda/hda_bind.c:232:18: error: format string is not a string
literal (potentially insecure) [-Werror,-Wformat-security]
2151
                request_module(mod);
2152
                               ^~~
2153
./include/linux/kmod.h:25:55: note: expanded from macro 'request_module'
2154
#define request_module(mod...) __request_module(true, mod)
2155
                                                      ^~~
2156
sound/pci/hda/hda_bind.c:232:18: note: treat the string as an argument
to avoid this
2157
                request_module(mod);
2158
                               ^
2159
                               "%s",
2160
./include/linux/kmod.h:25:55: note: expanded from macro 'request_module'
2161
#define request_module(mod...) __request_module(true, mod)
2162
                                                      ^
2163
1 error generated.
