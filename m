Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 044C217C793
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 22:08:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93CEC827;
	Fri,  6 Mar 2020 22:07:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93CEC827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583528907;
	bh=t00BSpVEeTB6VtoYNTViTHiACDSKqnvh3qbuJnzUmEw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s0DK6a2efuBC2Tw1rsp91YcTaEoN3X9AZ0yPtmR3Nv49MWbyYrjzoE/0tOiVBxLTR
	 QebjY+UgwWHs+u4lPhcr0ZTVqgMg8p7oKUI0kjl0vkiNLiquhcA0xoeijwefQjVpo/
	 LfooLSHKvIZL/dZznTdUK65d2P1Igp6Q16H1kL+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57CAFF80229;
	Fri,  6 Mar 2020 22:06:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D7C2F80216; Fri,  6 Mar 2020 22:05:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0756BF801EC
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 22:05:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0756BF801EC
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Mar 2020 13:05:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,523,1574150400"; d="scan'208";a="275688916"
Received: from jrbond-mobl.amr.corp.intel.com (HELO [10.254.11.58])
 ([10.254.11.58])
 by fmsmga002.fm.intel.com with ESMTP; 06 Mar 2020 13:05:46 -0800
Subject: Re: [PATCH 1/7] ASoC: Intel: Skylake: Remove superfluous chip
 initialization
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200305145314.32579-1-cezary.rojewski@intel.com>
 <20200305145314.32579-2-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ec7c8c11-80aa-d252-26e8-bf5d1ff95fb7@linux.intel.com>
Date: Fri, 6 Mar 2020 14:52:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200305145314.32579-2-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: vkoul@kernel.org, broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
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



On 3/5/20 8:53 AM, Cezary Rojewski wrote:
> Skylake driver does the controller init operation twice:
> - first during probe (only to stop it just before scheduling probe_work)
> - and during said probe_work where the actual correct sequence is
> executed
> 
> To properly complete boot sequence when iDisp codec is present, bus
> initialization has to be called only after _i915_init() finishes.
> With additional _reset_list preceding _i915_init(), iDisp codec never
> gets the chance to enumerate on the link. Remove the superfluous
> initialization to address the issue.

Have you tested with with DRM built-in and as a module? that was enough 
to trigger race conditions in the past on Dell XPS9350.

