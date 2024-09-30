Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E1F989EAC
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 11:45:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DC82193B;
	Mon, 30 Sep 2024 11:45:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DC82193B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727689544;
	bh=Q1AdGozcclP0r+s3Y2IB7CLEYJu+sAnra0/syEMcwxE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GtDLIRLyDzoqpZfEKUNDNIB2YZdWVJGuYJvR4PKHUSKAV0T9UYPtYqm5ZQOSRuI66
	 MCJRCGecD4Qb3L/u6dnveD49fsd2aaM0CYv//dSiJGh0SgJbBFXNWizRmFkL/fl2RV
	 Djb2RIPYr+joJXGGJnUiX/iP8hZnApZW7Hb8X/q0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35ACDF805AF; Mon, 30 Sep 2024 11:45:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 050C3F805AF;
	Mon, 30 Sep 2024 11:45:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0F7EF80508; Mon, 30 Sep 2024 11:45:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78B9CF80074
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 11:45:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78B9CF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OnHC8OEc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727689505; x=1759225505;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Q1AdGozcclP0r+s3Y2IB7CLEYJu+sAnra0/syEMcwxE=;
  b=OnHC8OEcl0ah+p0foxHpEto5wh2Mnn58hICGHDtExV/PnpYsbSaZptkS
   g2DZ7EF8HTMsTz+SEC3iVi07PzCVphwCPi1OQnCyzb37kknh6HLsOJXxS
   n0/P/euscgYMMZ6UFS3vnYMARNCFfSDZsBNojO5Ms4hQmUr2eJns35DkI
   yYbYbkWxNsYwb879U95OY//JZXg2zP8udvx9xc0+rN+IDZNXg29pU6LxV
   74vLx0CC3Y85KVxWRVR8JkTzyLY3+Qbz3SkAPCPDN+lMEVZ87m/YajsuR
   UNFaNUA5DCI2kvA/lnBQVDOo3gqbGvOFiMrAT79zAR3PUL9DF/alAfWVO
   Q==;
X-CSE-ConnectionGUID: MlyFqfhsTuu4j+Bk44M5og==
X-CSE-MsgGUID: Vhz5n4utRUqwwiMyjOgEOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="37911149"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800";
   d="scan'208";a="37911149"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 02:45:01 -0700
X-CSE-ConnectionGUID: bLNqx0rMR466jqFYeR3mRw==
X-CSE-MsgGUID: u5YJzkvoT9WLLgb1TqVeXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800";
   d="scan'208";a="77754484"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 02:44:59 -0700
Message-ID: <7b4ddfa0-193e-44a1-a039-1f2fdea0923d@linux.intel.com>
Date: Mon, 30 Sep 2024 11:44:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/13] ASoC: intel: remove dpcm_xxx flags
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
References: <87r091lwhg.wl-kuninori.morimoto.gx@renesas.com>
 <87ldz9lwgl.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87ldz9lwgl.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LPWQWAV6F24MWE2P3NRSDQJ4FZHGMZZL
X-Message-ID-Hash: LPWQWAV6F24MWE2P3NRSDQJ4FZHGMZZL
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LPWQWAV6F24MWE2P3NRSDQJ4FZHGMZZL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 9/30/2024 4:14 AM, Kuninori Morimoto wrote:
> dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
> xxx_only if needed.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/intel/avs/boards/da7219.c        | 2 --
>   sound/soc/intel/avs/boards/dmic.c          | 4 ++--
>   sound/soc/intel/avs/boards/es8336.c        | 2 --
>   sound/soc/intel/avs/boards/hdaudio.c       | 4 ----
>   sound/soc/intel/avs/boards/i2s_test.c      | 2 --
>   sound/soc/intel/avs/boards/max98357a.c     | 2 +-
>   sound/soc/intel/avs/boards/max98373.c      | 2 --
>   sound/soc/intel/avs/boards/max98927.c      | 2 --
>   sound/soc/intel/avs/boards/nau8825.c       | 2 --
>   sound/soc/intel/avs/boards/rt274.c         | 2 --
>   sound/soc/intel/avs/boards/rt286.c         | 2 --
>   sound/soc/intel/avs/boards/rt298.c         | 2 --
>   sound/soc/intel/avs/boards/rt5514.c        | 2 +-
>   sound/soc/intel/avs/boards/rt5663.c        | 2 --
>   sound/soc/intel/avs/boards/rt5682.c        | 2 --
>   sound/soc/intel/avs/boards/ssm4567.c       | 2 --
>   sound/soc/intel/boards/sof_board_helpers.c | 2 --

That's a bit of weird split, sof_board_helpers.c should've probably been 
with the rest of SOF boards in patch 10? ;)

