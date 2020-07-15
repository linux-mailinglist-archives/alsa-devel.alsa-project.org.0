Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DE9221227
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 18:22:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 108C31660;
	Wed, 15 Jul 2020 18:22:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 108C31660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594830174;
	bh=Nvj/gwzbEtkkdID7JECG9YneMAi6IjfNG6GK24DqIfY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dOKm5znZHfoL0BEt8ICaqCg1a3FfK+Pg+IP3fgWG17Ruh5QvFWxFiu7+X2eaaJvcP
	 MiHtCUsbiJVNCc/1q6BKF0I+3O4cI3tHbF2NuD88SarDHwfGy7C6ma4/XaPy6KlSqL
	 TGH9oo4R4/lMKq3bAQZ6bKoK0mxqLGXyW7OAWHSw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57E73F8014E;
	Wed, 15 Jul 2020 18:21:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7B1DF80227; Wed, 15 Jul 2020 18:21:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FC2FF8014E
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 18:20:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FC2FF8014E
IronPort-SDR: J34SC72vNGzdt6TPgTlwDTc+7ZJmsGJOBRHPH8MMw3vnSXPdd65zMIVj8DPLsA8s/fDtKluTWE
 GLtykYtHk53g==
X-IronPort-AV: E=McAfee;i="6000,8403,9683"; a="146704622"
X-IronPort-AV: E=Sophos;i="5.75,355,1589266800"; d="scan'208";a="146704622"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 09:20:55 -0700
IronPort-SDR: FeMPZUc2l/GN5szS1rX5bxbNPiAyJwN8UHStFCpO9b3j6wbAbLdou+QkrudlHFWk3XPlWIsSLs
 KR7hKSUgD1jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,355,1589266800"; d="scan'208";a="282149152"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.3.67])
 ([10.213.3.67])
 by orsmga003.jf.intel.com with ESMTP; 15 Jul 2020 09:20:52 -0700
Subject: Re: [PATCH v3 00/10] topology: decode: Various fixes
To: Piotr Maziarz <piotrx.maziarz@linux.intel.com>, alsa-devel@alsa-project.org
References: <1594725911-14308-1-git-send-email-piotrx.maziarz@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <4fe4ac98-2604-239e-29df-298723e9ff4c@intel.com>
Date: Wed, 15 Jul 2020 18:20:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594725911-14308-1-git-send-email-piotrx.maziarz@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: amadeuszx.slawinski@intel.com
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

On 2020-07-14 1:25 PM, Piotr Maziarz wrote:
> This series fixes various problems with topology decoding mechanism.
> Some of the problems were critical like improper memory management or
> infinite loops that were causing undefined behaviour or program crashes,
> while other resulted in losing some data during conversion.
> 
> Bugs found while testing with Intel SST topologies.
> 
> Changelog:
> v2:
>    -Divide into more patches, critical fixes are in separate patches now
>    -More specific descriptions
>    -Fix a typo UML to UCM
>    -Add error reporting in topology: decode: fix channel map memory
>     allocation
>    -Remove goto again in topology: Make buffer for saving dynamic size
>     for better readability
> 
> v3:
>    -No functional changes
>    -Changed UCM to more descriptive standard ALSA configuration files
>    -removed Gerrit's Change-Id
>    -Added missing signed-offs
> 
> Piotr Maziarz (10):
>    topology: decode: Fix channel map memory allocation
>    topology: decode: Fix infinite loop in decoding enum control
>    topology: decode: Remove decoding  values for enum control
>    topology: decode: Add enum control texts as separate element
>    topology: decode: Fix printing texts section
>    topology: decode: Change declaration of enum decoding function
>    topology: decode: Fix decoding PCM formats and rates
>    topology: decode: Print sig_bits field in PCM capabilities section
>    topology: decode: Add DAI name printing
>    topology: Make buffer for saving dynamic size
> 
>   src/topology/ctl.c        | 51 ++++++++++++++++++++++-------------------------
>   src/topology/dapm.c       |  3 +--
>   src/topology/pcm.c        | 11 +++++++---
>   src/topology/save.c       | 34 ++++++++++++++++++++++++++-----
>   src/topology/text.c       |  2 +-
>   src/topology/tplg_local.h |  2 +-
>   6 files changed, 64 insertions(+), 39 deletions(-)
> 

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
