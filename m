Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B180817EBBA
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 23:11:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 576C082E;
	Mon,  9 Mar 2020 23:10:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 576C082E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583791875;
	bh=8N6GqjZI02szZevVC4YuiW+B5IjBIoj3yW+z/xUs8jQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h47TO+e0TJFRIYYcykO/FOKCilo87vDr17Nk2Hg9ND13yMVnZvptLEL3sH9ZGm3r+
	 TmCXUsilto49oCOS+vc/OaH46MFF1YW+scWGGeKnyDFIOMLu5S3XDko4gp5ERBF2Vm
	 NC/3yNmO+AbW3c/tCJIZnWR39PYdDQw0JM3SciPg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C67B2F802E7;
	Mon,  9 Mar 2020 23:06:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CB9AF8028F; Mon,  9 Mar 2020 23:06:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A4C9F800DA;
 Mon,  9 Mar 2020 23:06:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A4C9F800DA
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 15:06:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,534,1574150400"; d="scan'208";a="388711087"
Received: from bnkannan-mobl.amr.corp.intel.com (HELO [10.254.6.234])
 ([10.254.6.234])
 by orsmga004.jf.intel.com with ESMTP; 09 Mar 2020 15:06:11 -0700
Subject: Re: [PATCH 0/3] [RESEND] ASoC: SOF: preparatory patches
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200309170749.32313-1-guennadi.liakhovetski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9cfc4182-1f22-9f28-52d8-f8aac1f7bc0b@linux.intel.com>
Date: Mon, 9 Mar 2020 17:05:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200309170749.32313-1-guennadi.liakhovetski@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 sound-open-firmware@alsa-project.org
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



On 3/9/20 12:07 PM, Guennadi Liakhovetski wrote:
> This is the first set of patches for the SOF virtualisation work. We
> send these patches first because they touch the ASoC core. 2 of them
> are mostly cosmetic with no functional changes, but patch 2/3 might
> cause some discussions. Please review and comment.

Sorry about the delay in reviewing.

To get a better picture of the directions, reviewers are invited to take 
a look at the in-depth documentation written by Guennadi since the 
initial patches were shared. This documentation was reviewed by Liam and 
me and is really required to understand the concepts:

https://thesofproject.github.io/latest/developer_guides/virtualization/virtualization.html

I added a couple of comments on the three patches, this looks good to me.

> Thanks
> Guennadi
> 
> Guennadi Liakhovetski (3):
>    ASoC: (cosmetic) simplify dpcm_prune_paths()
>    ASoC: add function parameters to enable forced path pruning
>    ASoC: export DPCM runtime update functions
> 
>   include/sound/soc-dpcm.h |  30 ++++++++---
>   sound/soc/soc-compress.c |   2 +-
>   sound/soc/soc-dapm.c     |   8 +--
>   sound/soc/soc-pcm.c      | 130 +++++++++++++++++++++++++++++------------------
>   4 files changed, 109 insertions(+), 61 deletions(-)
> 
