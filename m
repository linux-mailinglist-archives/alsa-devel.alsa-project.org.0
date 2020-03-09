Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D42017E5AB
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 18:25:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A3083E;
	Mon,  9 Mar 2020 18:25:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A3083E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583774756;
	bh=1jSICkbIQ84WrcRX9GV6yvHczSn5C4BXS++8A+b3PN8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oSoyr7Xz311wt/9ccYzBGW74Sk9wJ0zeDqQOHi0CUU7UtuFvl6N6b8WxMs5QXWP5c
	 nXEEVY9M4BnDZZNRPmuffqL+dwd4+WonK9bMGq4443MP1gjRkSGhcBbBd4Nl44Fcft
	 qeID8lDVViWDONHj/oByHMvK8aKDkuRfIF3hXmx4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5A04F80291;
	Mon,  9 Mar 2020 18:21:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98C5CF8028B; Mon,  9 Mar 2020 18:21:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DDDFF801A3
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 18:21:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DDDFF801A3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 10:21:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,534,1574150400"; d="scan'208";a="231003485"
Received: from jdbostic-mobl1.amr.corp.intel.com (HELO [10.251.152.35])
 ([10.251.152.35])
 by orsmga007.jf.intel.com with ESMTP; 09 Mar 2020 10:21:44 -0700
Subject: Re: [PATCH v2] topology: Add topology file for generic HDA DSP
 machine driver
To: Mateusz Gorski <mateusz.gorski@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200309120944.15240-1-mateusz.gorski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0d2fb996-2668-e53b-ec91-18bf9e27df31@linux.intel.com>
Date: Mon, 9 Mar 2020 12:10:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200309120944.15240-1-mateusz.gorski@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: cezary.rojewski@intel.com, tiwai@suse.com
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


> +SectionPCMCapabilities."DMIC-Capture" {
> +    formats "S16_LE"
> +    rates "48000"
> +    channels_min "2"
> +    channels_max "2"
> +    sig_bits "16"
> +}

NHLT reports 4 microphones on a number of devices, is there any specific 
reason to limit the capture to 2ch?

I believe the generic Hdaudio card now reports the number of channels to 
pulseaudio, so it's possible that PulseAudio would open a 4ch stream but 
be told sorry no can do by topology.

FWIW we ended-up selecting different topology files in SOF, depending on 
whether we had 0, 2 or 4 mics.
