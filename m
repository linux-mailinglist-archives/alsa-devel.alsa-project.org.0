Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1556213AA74
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:15:53 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45D2D16FF;
	Mon, 13 Jan 2020 13:34:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45D2D16FF
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 279B8F801F7;
	Mon, 13 Jan 2020 13:33:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E52C3F801EB; Mon, 13 Jan 2020 13:33:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43F62F80122
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 13:33:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43F62F80122
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 04:33:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,428,1571727600"; d="scan'208";a="424296222"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga006.fm.intel.com with ESMTP; 13 Jan 2020 04:33:10 -0800
Date: Mon, 13 Jan 2020 14:33:10 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20200109090104.26073-1-tiwai@suse.de>
Message-ID: <alpine.DEB.2.21.2001131425180.2957@eliteleevi.tm.intel.com>
References: <20200109090104.26073-1-tiwai@suse.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH for-5.6] ALSA: hda: Manage concurrent reg
 access more properly
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Thu, 9 Jan 2020, Takashi Iwai wrote:

> In the commit 8e85def5723e ("ALSA: hda: enable regmap internal
> locking"), we re-enabled the regmap lock due to the reported
> regression that showed the possible concurrent accesses.  It was a
> temporary workaround, and there are still a few opened races even
> after the revert.  In this patch, we cover those still opened windows
> with a proper mutex lock and disable the regmap internal lock again.

I've been running tests on multiple HDA machines plus submitted the patch 
through the GFX CI (that found the original problem) and no issues have 
been found. So with that:

Tested-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

One minor nit from checkpatch:

> +/* a helper macro to call @func_call; retry with power-up if failed */
> +#define CALL_RAW_FUNC(codec, func_call)				\
> +	({							\
> +		int _err = func_call;				\
> +		if (_err == -EAGAIN) {				\
> +			_err = snd_hdac_power_up_pm(codec);	\
> +			if (_err >= 0)				\
> +				_err = func_call;		\
> +			snd_hdac_power_down_pm(codec);		\
> +		}						\
> +		_err;})

Checkpatch --strict doesn't like this:

ERROR: space required after that ';' (ctx:VxV)
#121: FILE: sound/hda/hdac_regmap.c:450:
+               _err;})
                    ^
Br,
Kai
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
