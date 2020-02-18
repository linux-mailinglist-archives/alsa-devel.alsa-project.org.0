Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21564162F23
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 19:55:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C34E169A;
	Tue, 18 Feb 2020 19:54:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C34E169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582052142;
	bh=lYmo1j5aHBiCxqL1CQUiT3JnDbf2RTcu2xMa8UrrZyY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r37avZ3qvhkJxZUP5pBoQC76xfw1lX3wzrLzDReuXkonnTcj9bJoOuRHQfSQHkFhq
	 UIGs58gXJisvaqqJcH/aUeF2CcyvVsrqcmH4Co0gPmcUkVXeOomQEKCODyqDfYyPiy
	 ruiSXG08QYAyo4YjHNTeexEIEDC1yEgmChsQ9Lh8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 920CDF8014A;
	Tue, 18 Feb 2020 19:54:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A25E8F80148; Tue, 18 Feb 2020 19:53:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95DCDF80135
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 19:53:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95DCDF80135
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2020 10:53:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,457,1574150400"; d="scan'208";a="268869289"
Received: from amholmes-mobl3.ger.corp.intel.com (HELO [10.251.87.78])
 ([10.251.87.78])
 by fmsmga002.fm.intel.com with ESMTP; 18 Feb 2020 10:53:51 -0800
Subject: Re: [PATCH 0/3] ASoC: snprintf() usage fixes
To: Takashi Iwai <tiwai@suse.de>
References: <20200218111737.14193-1-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <6e40ea50-7850-6040-fff8-3a22c98bb327@intel.com>
Date: Tue, 18 Feb 2020 19:53:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200218111737.14193-1-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

On 2020-02-18 12:17, Takashi Iwai wrote:
> Hi,
> 
> this is a series of patches I spotted during debugging other code.
> Intel skl and ASoC PCM core invokes succeeding calls of snprintf()
> with the incorrect expectation of the return value, which may lead to
> a buffer overflow.
> 
> The first patch is yet another bug I found during working on this, and
> it's rather a real bug that can be seen clearly.
> 
> 
> Takashi
> 
> ===
> 
> Takashi Iwai (3):
>    ASoC: intel: skl: Fix pin debug prints
>    ASoC: intel: skl: Fix possible buffer overflow in debug outputs
>    ASoC: pcm: Fix possible buffer overflow in dpcm state sysfs output

Thank you, Takashi for the fixes.

s/skl/skylake/g but I don't mind the shortcut usage at all.
For the /intel/skylake patches:

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
