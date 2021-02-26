Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AE33266D6
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 19:20:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACDC4852;
	Fri, 26 Feb 2021 19:19:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACDC4852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614363621;
	bh=+ecwRLkVvgxSxry9ne6qgpPoXqphsnLk+96zUDFZm4Y=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ScsE2GJQAdl3TTDuLrL0MZG8Yp5ZLMqp8tD4eXtubNhPJ9XN4QllPRLcT3Dzd39ZN
	 YPyRRND4kBPZnltc9Z4N+UeJtBFN78iu0fgwwUizrooAMoQX8iGzde+MMtX4HoUwvZ
	 tUhxfIrk+5ki45Ud52vIEvyYBT88XZ1lqLAEFpUk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0302EF80154;
	Fri, 26 Feb 2021 19:18:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12036F8016C; Fri, 26 Feb 2021 19:18:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9134F80154
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 19:18:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9134F80154
IronPort-SDR: oDnZI3/E58c5neSYeTkolXESHx2SW/8QUYfXisM56N8daH3gDyzcXw8VrMiKRTFshPei9rxG4y
 vc6ASxPlgerA==
X-IronPort-AV: E=McAfee;i="6000,8403,9907"; a="270937277"
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; d="scan'208";a="270937277"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2021 10:18:38 -0800
IronPort-SDR: JX5KlZZiKnj9GjuYkwteFxbdK4gnW9mrhc6cwAhU49A0yj8H9cDO+kaS2snj6ZX64Ha1tbBpik
 Sl3IDFhKnETg==
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; d="scan'208";a="405074714"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2021 10:18:36 -0800
Date: Fri, 26 Feb 2021 20:14:32 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Hui Wang <hui.wang@canonical.com>
Subject: Re: [PATCH v2] ALSA: hda/hdmi: let new platforms assign the pcm slot
 dynamically
In-Reply-To: <20210225102028.41769-1-hui.wang@canonical.com>
Message-ID: <alpine.DEB.2.22.394.2102261954260.864696@eliteleevi.tm.intel.com>
References: <20210225102028.41769-1-hui.wang@canonical.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com
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

Hi,

thanks! I tested this on a few machines and seems good, no functional 
issues.

On Thu, 25 Feb 2021, Hui Wang wrote:

> --- a/sound/pci/hda/patch_hdmi.c
> +++ b/sound/pci/hda/patch_hdmi.c
> @@ -157,6 +157,7 @@ struct hdmi_spec {
>  
>  	bool dyn_pin_out;
>  	bool dyn_pcm_assign;
> +	bool no_fixed_assign;

hmm, I wonder if we could come up with a better name. "dyn_pcm_assign"
and "no_fixed_assign" seem a bit at odds.

How about:
   bool dyn_pcm_assign; 
+  bool dyn_pcm_no_legacy; 

Then it's more clear this is still the same dynamic PCM assign policy, but 
we just drop the legacy exception.

Takashi, do you think we can go with this without any method (a module 
option) to opt-out?

I'm ok to go with this, given all users should be using kcontrol status to 
select the PCM for HDMI/DP output. Any other method is not guaranteed 
anyways to work in all cases as the assignment is dynamic in the end.. 

Br, Kai
