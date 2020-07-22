Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABEB229FD2
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 21:06:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B71961616;
	Wed, 22 Jul 2020 21:05:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B71961616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595444779;
	bh=anCmUF6py5vVsUJzlR60OY1ZmQP5ulODdm7EeXIyzXM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JezKaYDqOMoaic0GHhwotAcQ0oaWPxVIB5LZQ+d82uTNz8J2mstT+Vq11LOdnKzrV
	 Ed2ajCmc5COcUaJPkgaE1TswOEE9Xvt5oEnFQ2rbEMbAGdbjsi63dwKSSH5YeP2r8a
	 TC85JvNj13fvtEF66ab2p3HLzpVMlFxv+cUsiYTs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F01AFF80150;
	Wed, 22 Jul 2020 21:04:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC769F8014C; Wed, 22 Jul 2020 21:04:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_PASS,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16283F80139
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 21:04:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16283F80139
IronPort-SDR: mBluGPpByYSDyY84d/a8JDc2adfvw8JNggz/nFvdP4QySEyj0N2bBxHPkiJsU6PiHcoKLCn8WO
 C4yFsA5mJ5Jw==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="129970919"
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; d="scan'208";a="129970919"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 12:04:30 -0700
IronPort-SDR: kjOdNe34MxGHhBfYi7CYUQ7aGm0xVqeqxEhsGsCYGHzT5ismlre7JmSiC6CJH0T5qUXuyE7+zF
 lIw1HLARN4gw==
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; d="scan'208";a="462565371"
Received: from aadl-mobl.amr.corp.intel.com (HELO [10.254.77.197])
 ([10.254.77.197])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 12:04:29 -0700
Subject: Re: [PATCH] ASoC: Intel: skl_hda_dsp_generic: Fix NULLptr dereference
 in autosuspend delay
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20200722173524.30161-1-mateusz.gorski@linux.intel.com>
 <2674621e-1546-3048-3ba2-f8fe1265d6e1@linux.intel.com>
 <014d8a2f-1ba7-1872-73b2-2384d908de79@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <edc0c832-c92b-ab95-c5e5-6bea2cf12973@linux.intel.com>
Date: Wed, 22 Jul 2020 14:04:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <014d8a2f-1ba7-1872-73b2-2384d908de79@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, tiwai@suse.com,
 Mateusz Gorski <mateusz.gorski@linux.intel.com>
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


>>> Change the string in conditional statement to "ehdaudio0D0" to ensure
>>> that only the HDAudio codec is handled by this function.
>>
>> I am not sure this is correct.
>>
>> I may be wrong, but my understanding is the following:
>>
>> Before 5bf73b1b1dec, the driver would use the first dailink of the 
>> card, and in the case of devices without an HDaudio codec (e.g. Up2 
>> board) it would set the auto suspend delay using that first dailink. 
>> See the code in skl_hda_fill_card_info(), it reorders the dailinks 
>> when HDaudio codecs are not present so if you test for 'edhaudio00' 
>> you no longer allow for this HDMI-only case to be handled with 
>> autosuspend.
>>
>> Kai would need to review this, so this will have to wait I am afraid.
>>
> 
> So, for_each_card_rtds needs to be context aware (hdmi type). Right now, 
> introduced _autosuspend_delay is causing kernel panics.

The code before 5bf73b1b1dec would use an HDMI dailink when HDaudio 
codecs are not present, so I don't really see the point on being context 
aware. Either this never worked or there's a side effect. In both cases, 
I would kindly ask that this does not get merged before Kai is back.
