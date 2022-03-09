Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A154D2B47
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 10:03:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 762E81731;
	Wed,  9 Mar 2022 10:02:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 762E81731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646816617;
	bh=DLoF1DtyJHn/9ajgfHumaK2FEROPRRTAqJhi759co5c=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DexDyMdJ1Xgxfx4oAFgE6ZnwHc3okufM6veAzNAj/6jedBOXN+SskPKrq1bFZUdsC
	 rjejHPPSL3LeF20MLoNbJRQouZC57yALobLH6MrKjkBaM2/I+W0enbgCtuBFu6C4Mc
	 R69vbMU4ty4LFvsr3CegLBKNltJp6RnIxGC8uQUw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB371F800D2;
	Wed,  9 Mar 2022 10:02:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEB08F8016C; Wed,  9 Mar 2022 10:02:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HK_RANDOM_ENVFROM,HK_RANDOM_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BF5AF8012F
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 10:02:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BF5AF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KXwYUhLK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646816543; x=1678352543;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DLoF1DtyJHn/9ajgfHumaK2FEROPRRTAqJhi759co5c=;
 b=KXwYUhLKAfDC8L9Ym3C694xV001vz3+h8MA+qQFiQcwWfsqpKq74bT4h
 I8hl13gECD2RDCUX9IkYmsjrV2zm9w3uON2PwOZ+xRhgpljVj+Fxqbf+E
 JQheEUqJpLZQk0dmO1mGjGYPGasVpKU80BAElt+8uo+OJ+wIYFyyCoTTr
 E1ZukR9FWqyTHgFwG6rFUQe0DXwXHvNeyI9y4jfmSi02tQlYQ1OJixJ+g
 QRemlhik49pxJTtClsp25SX5XAVXhgjQvNlAKOTyOdTWV2jew2FoJpQdS
 7Q5uU77oXovxUjaBb+5vJGvIwZa/llS3TFAKrkwlH2X0LDrgDZx2Ol1aR Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="255116625"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="255116625"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 01:02:17 -0800
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="642080242"
Received: from hedwards-mobl1.ger.corp.intel.com (HELO [10.213.198.86])
 ([10.213.198.86])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 01:02:16 -0800
Message-ID: <9dabb68b-f2af-ae97-0fb2-869367c496bf@linux.intel.com>
Date: Wed, 9 Mar 2022 09:02:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH v2] ALSA: hda/i915 - avoid hung task timeout
 in i915 wait
Content-Language: en-US
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20220308172759.920551-1-kai.vehmanen@linux.intel.com>
 <f9f6f831-a05d-2d20-8ade-ab717f342ba5@linux.intel.com>
 <alpine.DEB.2.22.394.2203091035350.3088432@eliteleevi.tm.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <alpine.DEB.2.22.394.2203091035350.3088432@eliteleevi.tm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Paul Menzel <pmenzel+alsa-devel@molgen.mpg.de>,
 Takashi Iwai <tiwai@suse.de>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 amadeuszx.slawinski@linux.intel.com
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


On 09/03/2022 08:39, Kai Vehmanen wrote:
> Hi,
> 
> On Wed, 9 Mar 2022, Tvrtko Ursulin wrote:
> 
>>> -			/* 60s timeout */
>>
>> Where does this 60s come from and why is the fix to work around
>> DEFAULT_HUNG_TASK_TIMEOUT in a hacky way deemed okay? For instance would
>> limiting the wait here to whatever the kconfig is set to be an option?
> 
> this was discussed in
> https://lists.freedesktop.org/archives/intel-gfx/2022-February/290821.html
> ... and that thread concluded it's cleaner to split the wait than try
> to figure out hung-task configuration from middle of audio driver.
> 
> The 60sec timeout comes from 2019 patch "ALSA: hda: Extend i915 component
> bind timeout" to fix an issue reported by Paul Menzel (cc'ed).
> 
> This patch keeps the timeout intact.

I did not spot discussion touching on the point I raised.

How about not fight the hung task detector but mark your wait context as 
"I really know what I'm doing - not stuck trust me". Maybe using 
wait_for_completion_killable_timeout would do it since 
snd_hdac_i915_init is allowed to fail with an error already?

Regards,

Tvrtko
