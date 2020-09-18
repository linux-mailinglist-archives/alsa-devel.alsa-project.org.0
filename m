Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B50727005A
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 16:59:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1584C16D4;
	Fri, 18 Sep 2020 16:59:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1584C16D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600441196;
	bh=XQT60u6MkyCyY1ca/H6h9n77MVUAHABuju6d7WaIq5Q=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PCkEgxOMqQ6A56ipTizy1yTLHIDTUyBsrTAFJvX0RyP8fVMCVoEUnqSWjtTm32HdQ
	 Gd5Pr2asngaTdJECv8qVfRRp6FS/awd71w+hlo1C4vAM+XDnIg6jhYOWysgyQj6ZFJ
	 72gssU6X+bdLBODrJq/rLQh2QMaoC7xg7QW9Naro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 301B2F80150;
	Fri, 18 Sep 2020 16:58:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9118F8015A; Fri, 18 Sep 2020 16:58:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DDCFF8013A
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 16:58:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DDCFF8013A
IronPort-SDR: gwDEYoc8N3MUk6exDFn3xuMP/takxJNXgZEP6+BoeYEqsdFf1H6HLmkWZJu3dJiqs2nExK6xT6
 GleHgAdf/AcQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="244786074"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="244786074"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 07:57:51 -0700
IronPort-SDR: w3I6Ato49uOIcbk2c4ZCM6yaermzI3geyVGfzN05Nw17/tFFmrP9vpwnKc4YpAALoFHGl5TUpT
 o7/YRoEDq2rA==
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="484238360"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 07:57:50 -0700
Date: Fri, 18 Sep 2020 17:56:21 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH v2] ALSA: HDA: Early Forbid of runtime PM
In-Reply-To: <alpine.DEB.2.22.394.2008281800180.3186@eliteleevi.tm.intel.com>
Message-ID: <alpine.DEB.2.22.394.2009181739320.3186@eliteleevi.tm.intel.com>
References: <1598569536-9450-1-git-send-email-harshapriya.n@intel.com>
 <s5h5z93ns23.wl-tiwai@suse.de>
 <alpine.DEB.2.22.394.2008281800180.3186@eliteleevi.tm.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Takashi Iwai <tiwai@suse.de>, Harsha Priya <harshapriya.n@intel.com>,
 alsa-devel@alsa-project.org, Emmanuel Jillela <emmanuel.jillela@intel.com>
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

On Fri, 28 Aug 2020, Kai Vehmanen wrote:

> On Fri, 28 Aug 2020, Takashi Iwai wrote:
> > Thanks.  The only concern is about the influence on the relevant ASoC
> > code, especially hdac_hda.c.
> > 
> > Kai, could you check whether this still works?
> 
> I did queue a SOF CI job for this v2 patch and I'm seeing some failures
> in module load/unload test that might be related and need checking before
> we merge:
> 
> https://sof-ci.01.org/linuxpr/PR2403/build4400/devicetest/

ok this took a bit longer than expected, but we've been debugging this 
with Emmanuel and found the rootcause.

So if we take this patch in and forbid runtime PM in device_new, it then 
becomes mandatory for all controllers to call set_default_power_save(). In 
SOF, this is only added recently to some machine drivers (notably the 
widely used generic HDA machine driver), which explains why tests pass on 
many targets. However, on platforms that use other machine drivers, 
set_default_power_save()/snd_hda_set_power_save() is not called, and 
device will never hit suspend (and this fails the tests).

To further complicate the matter, recently merged "ASoC: Intel: 
skl_hda_dsp_generic: Fix NULLptr dereference in autosuspend delay" will 
cause tests to fail on more platforms as HDMI/DP codec's powersave 
settings are not set.

The original patch is ok, but to merge it without a lot of regressions, 
we need to rework how powersave initial settings are done in SOF and other 
ASoC controllers using HDAC. I do think this is the right solution.

Br, Kai

