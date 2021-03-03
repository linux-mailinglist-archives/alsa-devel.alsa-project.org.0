Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DFA32B9F7
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Mar 2021 19:42:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A72AF18D5;
	Wed,  3 Mar 2021 19:41:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A72AF18D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614796925;
	bh=3e4IxYB6J5XAIUqjaXNLnIEWzGoiWr9s6uhv1DWPE0w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UcWNP8DnzQoZFOdLa+kMMXJzo8nWVHWEGEdSsoHovPAKisRfOpkUY10eOk4N93dtW
	 Um825oETgwMhjt5T4QzP+zkAbIYFtFwT3JVKryMPkDnbhkVkoryOcoOz0OnbiUAhVA
	 G/B0MvMbU29e6AnaKlgOKadiYEGpHcDKT7x9UtPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2446F8026A;
	Wed,  3 Mar 2021 19:40:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AA99F8025E; Wed,  3 Mar 2021 19:40:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBAABF8012D
 for <alsa-devel@alsa-project.org>; Wed,  3 Mar 2021 19:40:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBAABF8012D
IronPort-SDR: dQa38Kjy4WqgeYltJevcg3TNYb6jo8csrM8x8EXXwBsA9lPep0IAhdRIZnDKeTfVtNoycZIrBA
 FeTOU7UuUYgQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="184842062"
X-IronPort-AV: E=Sophos;i="5.81,220,1610438400"; d="scan'208";a="184842062"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2021 10:40:13 -0800
IronPort-SDR: FtWlMerKBOhCam+brBZ6n3EVwiTHQFz2dHx7k2+kC1Oox6pY0+0MbWMXIz79kw1YlEvKjWDkfv
 41VoXG6w/u8w==
X-IronPort-AV: E=Sophos;i="5.81,220,1610438400"; d="scan'208";a="407365513"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.21.231])
 ([10.213.21.231])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2021 10:40:11 -0800
Subject: Re: [PATCH] ASoC: SOF: Intel: broadwell: fix mutual exclusion with
 catpt driver
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20210303181616.16751-1-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <bfdc15c3-1bbe-c00f-de34-818c6a30af56@intel.com>
Date: Wed, 3 Mar 2021 19:40:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210303181616.16751-1-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, broonie@kernel.org, David Ward <david.ward@ll.mit.edu>,
 stable@kernel.org
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

On 2021-03-03 7:16 PM, Pierre-Louis Bossart wrote:
> In v5.10, the "haswell" driver was replaced by the "catpt" driver, but
> the mutual exclusion with the SOF driver was not updated. This leads
> to errors with card names and UCM profiles not being loaded by
> PulseAudio.

Thanks for the patch, Pierre.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

Regards,
Czarek
