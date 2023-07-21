Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE2C75C40F
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 12:10:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBE88DEC;
	Fri, 21 Jul 2023 12:09:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBE88DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689934249;
	bh=zfD3fxGaaJVbEP0Mg/47kMaERmFrmee6teDl/NH72f4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TCw4n1O+pOZEXD6PO2rq7acvy05eM0ZhmqwX69GbVBq5CgMFM4Mmt+SIgcWLy8FoY
	 P2aNehzz1lZ1FOI/x9NoeDj313yzYdLqz7odo9WzRc7BAgM9Kg77U0WFpWgbrPI+/B
	 5NFq6I1eKi2zSdZ1KUWslP63P0DdBKOmuk3eK0fQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98F00F8053B; Fri, 21 Jul 2023 12:09:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45691F8032D;
	Fri, 21 Jul 2023 12:09:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D59FF80527; Fri, 21 Jul 2023 12:09:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CBB0F8007E;
	Fri, 21 Jul 2023 12:09:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CBB0F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GEzyGjQb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689934191; x=1721470191;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zfD3fxGaaJVbEP0Mg/47kMaERmFrmee6teDl/NH72f4=;
  b=GEzyGjQboh2pSIRNVz3aXrdG3ZnETBsvFKAD6ktxR86g44wlgPSYC38R
   GWJQ4/8tfxeRJYKIhdJRc6J33Bzt2HmFpmsk9SzSfGj+YjsIGOOzF//rS
   +1ERLH5SeVJfQIGHB0tXSIZo2rFzFuevLszU+8KWgw7gxrUc7PjZJ+jsr
   g3dpSu+2sg98z7wZ2+Vaby4Ytrsqwq/LXNgNEGhYxYwRnmwm5TsDFCnlX
   /6ZNw4xJ2aixtVKaZaDuV2T7/XelFYDtGgk0bPkycHr36o4VxbWVby9e4
   t6TTpeOr1Q7BegDF0cjtoj4Tmf7rZDNKKMqM2P0XpEedomKa0RC3Ngbaa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="346581195"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200";
   d="scan'208";a="346581195"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 03:09:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="674991008"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200";
   d="scan'208";a="674991008"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 03:09:41 -0700
Date: Fri, 21 Jul 2023 13:06:21 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
cc: Alsa-devel <alsa-devel@alsa-project.org>,
    sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org,
    Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
    Cezary Rojewski <cezary.rojewski@intel.com>,
    Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
    Liam Girdwood <liam.r.girdwood@linux.intel.com>,
    Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
    Bard Liao <yung-chuan.liao@linux.intel.com>,
    Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
    Kai Vehmanen <kai.vehmanen@linux.intel.com>,
    Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v2 0/9] sound: Use -EPROBE_DEFER instead of i915 module
 loading.
In-Reply-To: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
Message-ID: 
 <alpine.DEB.2.22.394.2307211300270.3532114@eliteleevi.tm.intel.com>
References: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 3OP4QU2N7GQER4NRH6K3MLXKALUSLTR3
X-Message-ID-Hash: 3OP4QU2N7GQER4NRH6K3MLXKALUSLTR3
X-MailFrom: kai.vehmanen@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3OP4QU2N7GQER4NRH6K3MLXKALUSLTR3/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Wed, 19 Jul 2023, Maarten Lankhorst wrote:

> Explicitly loading i915 becomes a problem when upstreaming the new intel driver
> for Tiger Lake and higher graphics (xe). By loading i915, it doesn't wait for
> driver load of xe, and will fail completely before it loads.
> 
> -EPROBE_DEFER has to be returned before any device is created in probe(),
> otherwise the removal of the device will cause EPROBE_DEFER to try again
> in an infinite loop.

thanks, series looks good to me now. We'll need to adopt the new gpu_bind
parameter in a number of CI systems (where we test without i915/xe), but 
this looks perfectly doable.
  
I'll give my 

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

... for the hdac_i915.c changes. For AVS and SOF, I'd ask for some 
more review time to allow Cezary, Pierre et al to weigh in. I don't
personally recall e.g. where we've used CONFIG_SOF_FORCE_PROBE_WORKQUEUE
and do we have grounds to keep it even if workqueue is no longer set
for HDA codec support.

Br, Kai
