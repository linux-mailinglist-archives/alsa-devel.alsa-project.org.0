Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2721C2594BE
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 17:42:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A409917EF;
	Tue,  1 Sep 2020 17:41:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A409917EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598974967;
	bh=Erq5k8HW8wQKgtLH4oY1KGOTy5dAOqHe+bQk+PlcCuM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SXYPX3APj+4SoyvhgFeZLMBEI3XMUMa3rzkyS3LBTZmlh+TiNrRMx1GyGyhq48GW3
	 qtmIQ9r+zgv/9I3idhG48zUyDX7Gem2sSyCbZA9E+zBbvVgpctUfecEuKw6IXtv9O/
	 qyi0I79+ltmR7d2scUJI4ZKE4+r/qkBuijKxU8pw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE26EF8021D;
	Tue,  1 Sep 2020 17:41:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC6D2F80217; Tue,  1 Sep 2020 17:41:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56A61F801EB
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 17:40:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56A61F801EB
IronPort-SDR: ALN2IpZcaHrQ2lx+2G3xq/Izgc+uMJy3wACRFodlqyLU4LBegUqjySzfpUL5a5P3HmiT4EybY6
 nigT4Bdc39bw==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="144931892"
X-IronPort-AV: E=Sophos;i="5.76,379,1592895600"; d="scan'208";a="144931892"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 08:40:55 -0700
IronPort-SDR: mzqCPuGJoYI4/vWDQNg4fr3Td+U4sBIGLPdOFsnSLv5kT2tx6OsfEiN5Sa8Houx46USYgFNtVf
 XLsSzX1enngw==
X-IronPort-AV: E=Sophos;i="5.76,379,1592895600"; d="scan'208";a="325390910"
Received: from bmjuthan-mobl2.amr.corp.intel.com (HELO [10.212.242.72])
 ([10.212.242.72])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 08:40:50 -0700
Subject: Re: [PATCH] Revert "ASoC: Intel: haswell: Power transition refactor"
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200901153041.14771-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <cf8a3b15-7848-3cbc-0dcd-391f34b29fe0@linux.intel.com>
Date: Tue, 1 Sep 2020 10:40:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901153041.14771-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: broonie@kernel.org, tiwai@suse.com
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



On 9/1/20 10:30 AM, Cezary Rojewski wrote:
> This reverts commit 8ec7d6043263ecf250b9b7c0dd8ade899487538a.
> 
> While addressing existing power-cycle limitations for
> sound/soc/intel/haswell solution, change brings regression for standard
> audio userspace flows e.g.: when using PulseAudio.
> 
> Occasional sound-card initialization fail is still better than
> pernament audio distortions, so revert the change.
> 
> Fixes: 8ec7d6043263 ("ASoC: Intel: haswell: Power transition refactor")
> Reported-by: Christian Bundy <christianbundy@fraction.io>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

This should be applied to 5.8-stable and 5.9-rcX, it impacts the Google 
'Samus' Chromebook and Dell XPS 9343 (if used in I2S mode).

Thanks Cezary.


