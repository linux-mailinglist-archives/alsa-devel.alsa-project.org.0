Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E985F4038
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Oct 2022 11:47:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 171E216FE;
	Tue,  4 Oct 2022 11:46:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 171E216FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664876843;
	bh=+jHMsFYTInpAfLG8L/tWPAaaVoIo1OoPsLLqscE3UM8=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IVaTdJPqcgPJ8nS00rQ5lNmQrU7JkqgT0oLbdyPvDR1jZyqu1e6UEhcivOJJE55FV
	 Zr6GSiQvqygVHKW1C9iv3Q28VDhGUUcXpafoF8ruRxDhmfR5tPnVQrOPRy7h66cjRS
	 kG0pEV7yW+31kEv7D6+vEKOVmVjLMAD3QaQg7l4k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A100F8012A;
	Tue,  4 Oct 2022 11:46:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48FF4F801EC; Tue,  4 Oct 2022 11:46:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B29BFF80118
 for <alsa-devel@alsa-project.org>; Tue,  4 Oct 2022 11:46:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B29BFF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VsSMY4Ca"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664876779; x=1696412779;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=+jHMsFYTInpAfLG8L/tWPAaaVoIo1OoPsLLqscE3UM8=;
 b=VsSMY4CaDMIs0uiOmrMDBPkgHMFixNtW3Qgh3aPyXuwnxItay+aD400H
 bDS2fk9BksgjAsPSIQjtij/Ti+e/a08EmHaRXJ0nxj6Uu3H7xAdms6D+f
 aq7TvqKQSkhKIjsj7bZyv1+NI8AlHBv5UCCP1d1wLiof0oHPHooHtCIBC
 o1vAPUWJj0subkwYPBJNsHQX1r51lxUn9t0i0mT+RZt5tlWGwopwmokyW
 dDquy8em00OlwxVS8xHxnJgtoTZe5h9UPaDdmbg1G3GEsexP0c4hI4MmK
 DxtSmn9b7vBdPMW8Xeh5VLWTxeESDGsM4kxH7WQ9EdVykJSEmhhYL7N7k w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="283237024"
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200"; d="scan'208";a="283237024"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2022 02:46:14 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="712949601"
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200"; d="scan'208";a="712949601"
Received: from joudin-mobl2.ger.corp.intel.com (HELO [10.252.59.251])
 ([10.252.59.251])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2022 02:46:12 -0700
Message-ID: <2d31661e-0542-69b0-4a97-ff1e277c3351@linux.intel.com>
Date: Tue, 4 Oct 2022 11:44:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: ALSA Compress API - system suspend/resume
Content-Language: en-US
To: Daniel Baluta <daniel.baluta@gmail.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Vinod Koul <vkoul@kernel.org>
References: <CAEnQRZALsr3Cf20K103ax9kvk-opAfWMW5XBE6pgu0KKq2Xaxw@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CAEnQRZALsr3Cf20K103ax9kvk-opAfWMW5XBE6pgu0KKq2Xaxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 10/4/22 11:07 AM, Daniel Baluta wrote:
> Hello all,
> 
> It looks like system suspend is not implemented for Compress streams.
> 
> Any story behind this? Were there any attempts on implementing this?

It depends on the definition of 'system suspend'.

What we had in mind back in the early 2010s was to allow for 'active 
suspend' aka S0ix or low-power playback. That was the main reason for 
introducing the API.

For suspend to S3/D3, the plan was to just completely stop any 
playback/capture and restart on resume. I am not sure if this was ever 
implemented, that may be a miss.

There is a corner case we may have overlooked. I am not sure what 
happens if the S3/D3 suspend while playing. This is supported with e.g. 
aplay but for the compressed case it's a bit more complicated. Not all 
formats support rendering for a random position.
