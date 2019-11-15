Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAAAFE0AF
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 15:57:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E642165E;
	Fri, 15 Nov 2019 15:56:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E642165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573829849;
	bh=LVPjF6OPTkoZ8BA8IbYKl+xVnSD2fUvIc7/CGzwmCqU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UyShVNxsle40ctgu7UtphQcJQMF/ThbEshcXkIYZNQkJcxUmFsawcYDz+xzZQG736
	 rPLGHi0hF+w2G76+5uzGW36+oxwHUACVHlITDQo2zXGZ96/29psOD8AF67UfNbXJWd
	 u1F+BidWRt93piY8GcQ6nBj/m0f6Txa96G3YbZOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06F01F80103;
	Fri, 15 Nov 2019 15:55:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCB5EF80104; Fri, 15 Nov 2019 15:55:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49404F800FF
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 15:55:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49404F800FF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Nov 2019 06:55:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,308,1569308400"; d="scan'208";a="214789942"
Received: from jdstodda-mobl.amr.corp.intel.com (HELO [10.254.177.96])
 ([10.254.177.96])
 by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2019 06:55:28 -0800
To: Vinod Koul <vkoul@kernel.org>, Takashi Iwai <tiwai@suse.com>
References: <20191115102705.649976-1-vkoul@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <19c70dac-aa3e-f0ea-d729-26df4f193eb0@linux.intel.com>
Date: Fri, 15 Nov 2019 08:55:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191115102705.649976-1-vkoul@kernel.org>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [RFC PATCH 0/3] ALSA: compress: Add support for
	FLAC
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



On 11/15/19 4:27 AM, Vinod Koul wrote:
> The current design of sending codec parameters assumes that decoders
> will have parsers so they can parse the encoded stream for parameters
> and configure the decoder.

that's not quite correct. It's rather than there was no need so far for 
existing implementations to have parameters on decode, this was never a 
limitation of the design, see e.g. the comments below:

/* AAC modes are required for encoders and decoders */

/*
  * IEC modes are mandatory for decoders. Format autodetection
  * will only happen on the DSP side with mode 0. The PCM mode should
  * not be used, the PCM codec should be used instead.
  */
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
