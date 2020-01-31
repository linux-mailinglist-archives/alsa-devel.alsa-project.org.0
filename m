Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2763814F114
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jan 2020 18:09:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD7A71680;
	Fri, 31 Jan 2020 18:08:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD7A71680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580490546;
	bh=jFkGPqOqZIjDQwWhmVX2aoRXgqybOP+YPKQzo/nrGhw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LdaQ9bDqmJNJR4bPl+9nGjZp5IaaimqheiyF7/pqJQqTwjHgtttkyeTWLuMyxbQr0
	 XVh0F9tv1pnHkeLFzP7KJ3ITnBVWp51MDcxPxXARcR//q+cJpC8VEIYZOdozYUIv0Q
	 3+zNQwi0StpW1itVAr932LlvKoqaw1YSRat/5SGE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6E3AF80249;
	Fri, 31 Jan 2020 18:06:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AD5DF80234; Fri, 31 Jan 2020 18:06:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33DA7F80218
 for <alsa-devel@alsa-project.org>; Fri, 31 Jan 2020 18:06:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33DA7F80218
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 09:06:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,386,1574150400"; d="scan'208";a="224494509"
Received: from dsankar-mobl.amr.corp.intel.com (HELO [10.252.202.81])
 ([10.252.202.81])
 by fmsmga008.fm.intel.com with ESMTP; 31 Jan 2020 09:06:35 -0800
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200131123115.14247-1-cezary.rojewski@intel.com>
 <20200131123115.14247-10-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <00c94f11-d9a1-fc0b-ec36-6a3845a9a740@linux.intel.com>
Date: Fri, 31 Jan 2020 11:05:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200131123115.14247-10-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: vkoul@kernel.org, broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com
Subject: Re: [alsa-devel] [PATCH v4 09/11] ASoC: SOF: Intel: Probe compress
 operations
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



On 1/31/20 6:31 AM, Cezary Rojewski wrote:
> Add HDA handlers for soc_compr_ops and snd_compr_ops which cover probe
> related operations. Implementation supports both connection purposes.
> These merely define stream setups as core flow is covered by SOF
> compress core.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
> 
> Changes in v4:
> - Reverted SND_SOC_SOF_HDA_LINK requirement-removal change for HDA probes.
>    Code requires SND_HDA_EXT_CORE in order to function on Intel platforms

Since the beginning of SOF our direction has been to only enable the 
HDA_LINK option to support HDMI and HDAudio codecs. Probes are unrelated 
and should work with plain vanilla I2S codecs and even in nocodec mode.

Let's talk on this.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
