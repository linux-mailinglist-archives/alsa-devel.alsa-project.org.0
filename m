Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6818E3DF5
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 23:07:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7989F1748;
	Thu, 24 Oct 2019 23:06:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7989F1748
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571951223;
	bh=m3DtafqRv5RpswhGWtc7aqHISNRswPA+xHaXrlQPn4U=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ockvSnl5hq6BOMBgNkwadetP3gv2kPT5sPOxICrxZwBE72nvyMLi/v0PUJr9Hbdez
	 gk5z8OVB3dsEULejGWL7HOgU2bF+ZZXkgEoYnLbp6Sb46BSQCcuFwKuciI/z5Eq0Ce
	 5CWmXSRztFJlCo6njjrUx45IUBuot8yhLRfvShmU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 154D3F80377;
	Thu, 24 Oct 2019 23:05:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 766EBF8036B; Thu, 24 Oct 2019 23:05:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0744F80112
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 23:05:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0744F80112
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Oct 2019 14:05:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,226,1569308400"; d="scan'208";a="398553865"
Received: from ksengupt-mobl.amr.corp.intel.com (HELO [10.251.138.183])
 ([10.251.138.183])
 by fmsmga005.fm.intel.com with ESMTP; 24 Oct 2019 14:05:23 -0700
To: sathya.prakash.m.r@intel.com, alsa-devel@alsa-project.org
References: <1569430624-30505-1-git-send-email-sathya.prakash.m.r@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1ecdf331-1de3-4cc1-e306-67dbfcb0b843@linux.intel.com>
Date: Thu, 24 Oct 2019 16:05:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1569430624-30505-1-git-send-email-sathya.prakash.m.r@intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, naveen.m@intel.com, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v4 0/2] Add CML M/C for RT5682 and RT1011
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 9/25/19 11:57 AM, sathya.prakash.m.r@intel.com wrote:
> From: Sathya Prakash M R <sathya.prakash.m.r@intel.com>
> 
> The series adds CML m/c driver with RT5682 on SSP0 and
> RT1011 on SSP1.
> The RT1011 is smart AMP which supports 2 Whoofers and
> 2 tweeter support.
> RT5682 is headset codec supporting playback and record.
> The m/c supports HDMI playback and DMIC record.
> 
> Naveen Manohar (2):
>    ASoC: Intel: boards: Add CML m/c using RT1011 and RT5682
>    ASoC: Intel: Add acpi match for rt1011 based m/c driver
> 
>   sound/soc/intel/boards/Kconfig                    |  18 +
>   sound/soc/intel/boards/Makefile                   |   2 +
>   sound/soc/intel/boards/cml_rt1011_rt5682.c        | 473 ++++++++++++++++++++++
>   sound/soc/intel/common/soc-acpi-intel-cnl-match.c |   7 +
>   4 files changed, 500 insertions(+)
>   create mode 100644 sound/soc/intel/boards/cml_rt1011_rt5682.c

re-adding my tag for the series

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> V3 Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Changes from V3: repost with more recipients and edits to commit messages
> Changes from V2: re ordered match table
> to ensure non i2c device matches are at the end
> Changes from V1:
> Addressed comments on
> ASoC: Intel: boards: Add CML m/c using RT1011 and RT5682
> 1.9.1
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
