Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 153164AF5C0
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Feb 2022 16:53:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 977921666;
	Wed,  9 Feb 2022 16:52:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 977921666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644421993;
	bh=flsecFKKChZAy5EzZt8RA0SxEB4OdyTMGB483D8j+zc=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tl60QGyDekyy+ot29ka8rkav9s9YH+Tdqd4IQOK2Ne9Q0YrunesPaTMnuz6pfrZ3b
	 Vi1/UkqPcy6egf6nj8VRMyWX2Qvy874ZbHCiOEydUumU17h/MycqPHpDSVRpvgJ563
	 hG7jts9EfGHfc83fGJL8o0/nBifs9p0Y4k7WYYB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0461EF8016B;
	Wed,  9 Feb 2022 16:52:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF8A5F8016A; Wed,  9 Feb 2022 16:52:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD007F800ED
 for <alsa-devel@alsa-project.org>; Wed,  9 Feb 2022 16:51:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD007F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CIWU7d+I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644421920; x=1675957920;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=flsecFKKChZAy5EzZt8RA0SxEB4OdyTMGB483D8j+zc=;
 b=CIWU7d+IVQ0YO9myE2fOavVJ+mXbTRDVHbVlLqItBpmLV1i0TOmOZNW3
 J+tDVJdxFRA2Mj9EZY9shZv3NCSdi8IGT/wod+6wyN4Y0LeI0Z338M//T
 /vEoBv7J2wpBQTW7hUyUyM1mKMyiWlrAiwfJkyKv3pQaiDkxagB+C3qeX
 WphfPX9SCX+eyLJ8/GF3NcBW4yuxCYme+8WmciKqBg/z2fy4BgEbqLXTt
 mxRclx/jKiBmlQt/R+wsAumBK3KmbatvlVGTEXDiMFYvswbv8C2WSUnNw
 2DREO/Ls+9IvrURkRGTCPNYJKUmJ3hl5UYasYaTYUK7OWosRYVdc+QsnA w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="249437224"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="249437224"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 07:51:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="482366647"
Received: from qiangfan-mobl.amr.corp.intel.com (HELO [10.212.86.102])
 ([10.212.86.102])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 07:51:35 -0800
Message-ID: <c71dbf89-80a3-538e-6ebe-e1d1869183e8@linux.intel.com>
Date: Wed, 9 Feb 2022 09:51:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: Aw: Re: Cannon Lake PCH cAVS (ALC892) not detected by kernel
 driver
Content-Language: en-US
To: dmummenschanz@web.de, alsa-devel@alsa-project.org
References: <trinity-f018660b-95c9-442b-a2a8-c92a56eb07ed-1644345967148@3c-app-webde-bap22>
 <209270c3-4a46-d6a1-0f1d-d4400ecc5962@linux.intel.com>
 <trinity-c5ab92fd-fbab-4431-8579-f8576a9ba71e-1644390880605@3c-app-webde-bap12>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <trinity-c5ab92fd-fbab-4431-8579-f8576a9ba71e-1644390880605@3c-app-webde-bap12>
Content-Type: text/plain; charset=UTF-8
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



On 2/9/22 01:14, dmummenschanz@web.de wrote:
>    The information about the codec is based on the string windows
>    provides:
> 
>    HDAUDIO\FUNC_01&VEN_10EC&DEV_0892&SUBSYS_15580351&REV_1003\4&16AF2B56&&
>    0001
> 
>    Here is the alsa-info output for the 5.16 mainline kernel:
> 
>    http://alsa-project.org/db/?f=38c48cd24dc4ba9a9487dd96f857120cc9ce4367

The use of this option is not clear:

snd_intel_dspcfg: dsp_driver=1

This means you are trying to force the use of the legacy driver. is this
intentional? Can you remove it and see what happens?

The results show you don't have a driver bound to the PCI device, so
likely something goes boink in the probe.

It wouldn't hurt to enable dynamic debug as well.

options snd_hda_intel dyndbg=+p
options snd_intel_dspcfg dyndbg=+p
