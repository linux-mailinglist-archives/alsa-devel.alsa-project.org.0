Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D0D4ABFC0
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 14:49:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 575B317F0;
	Mon,  7 Feb 2022 14:48:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 575B317F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644241762;
	bh=AGuiTKUcur18lkayFASwvG9wxHBKvcs76p2RzclV8Lo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DQqeVQiHvurpgg6M8K0YbI4QGsB33Qb2xKMmFNyyUfsYj2g/30RsWDlDHb1vxWitL
	 MZNochiMH8HIFqZ2rRWacHB/SlP5OG6VH3r0FmA0Po3SCw3nx4nKBBT/LOxJ24BXHx
	 wh32AN1H6JrBjD+zB1aoVmon6SK8FHzEimxfEgng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD466F80246;
	Mon,  7 Feb 2022 14:48:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA4D9F80240; Mon,  7 Feb 2022 14:48:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E769AF800F5
 for <alsa-devel@alsa-project.org>; Mon,  7 Feb 2022 14:48:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E769AF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Z+kjRhdS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644241692; x=1675777692;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AGuiTKUcur18lkayFASwvG9wxHBKvcs76p2RzclV8Lo=;
 b=Z+kjRhdSB/bVJF1hNKxYxd44l26UO195h/poC8xD1QDeTXt1K+oBbiMq
 1jqQQKuMgY7ml7/xSdehV10HkGwOJasikqR/OFuvRAAvu5XN98b+n4u9L
 w7+B4oE1oyV+lrwVhMcyak2E5ZGuvvHKz0EKFBAnLXBuOTvkBVV+PubPz
 r/f61kBjQ6hLibG28jfkqF1YlHTwfnIS7G67rOMogmK1y+VAux4kcYhpJ
 6WdS63Jhwz5RzX9yFLJ9qb+Wc2QQcSkS5Ii4IIFVJt5eBP3ipa1KJgGJY
 cqMCx3f2Vvk1Ovtu9ATq8i7pX0P6Gjt9C0/17WvQs04maf7nlAhyemwhZ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="228685852"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="228685852"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 05:48:06 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="632461588"
Received: from psayyaga-mobl2.amr.corp.intel.com (HELO [10.212.85.20])
 ([10.212.85.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 05:48:05 -0800
Message-ID: <e609134a-a501-77fb-dcb8-60514d231d3d@linux.intel.com>
Date: Mon, 7 Feb 2022 06:35:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 0/4] ALSA: hda: Expose codec organization functions
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220207114906.3759800-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220207114906.3759800-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 cujomalainey@chromium.org, lma@semihalf.com
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



On 2/7/22 05:49, Cezary Rojewski wrote:
> Changes expose several function that are currently unavailable for
> HDA-DSP drivers for use. Those functions are:
> 
> snd_hda_codec_cleanup_for_unbind()
> snd_hda_codec_set_power_save()
> snd_hda_codec_register()
> snd_hda_codec_unregister()
> snd_hda_codec_device_init()


It would be useful to explain why a platform driver would need to make
use of codec-management related routines, which would typically be
needed only in a codec or machine driver, or hidden as part of a generic
bus layer.

In addition, both the Skylake and SOF/HDA drivers make use of e.g.,
snd_hdac_ext_bus_device_init(), what was wrong with this approach that's
been used since 2018?

