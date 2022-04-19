Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DD3507163
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 17:08:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE2B51AB7;
	Tue, 19 Apr 2022 17:07:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE2B51AB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650380904;
	bh=HntouFN5ejtrkvYerLJGVSQw239dqMRIJBPq+igg9rI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t5Awq4/lGUKl0DBtwIO41HcFtmIewFnTzU1y8wUv9chUx5gVJ3kUb9ud7drwBI3kc
	 EIgtzT69MzEc/Ze5EcFcQwy8KM+N9TDKO5dXJLBqjF+YRv9Tg+dpyFynTulEWAov6p
	 JVZTVPOmmcS3KPDHGaagIh/+UoK7fAhVOWO+fIus=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37DB9F80269;
	Tue, 19 Apr 2022 17:07:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A51BBF8025D; Tue, 19 Apr 2022 17:07:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26137F800C1
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 17:07:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26137F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fr+XU4H5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650380840; x=1681916840;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HntouFN5ejtrkvYerLJGVSQw239dqMRIJBPq+igg9rI=;
 b=fr+XU4H5kHH3+D29tC5Zy1y5HeQL9FsH2rNEm50/dEbdcreViO9K/aYe
 qnzvD/Sb6KzS6I7ZH7bpS/JK/7Q+cOdTy2mSrFSeeFX3etlgNa+U1Hv+m
 lsgd9kYApNqu3HxRjjMGeAjAQ11r3uy6dw3yNb346wkko4lhb7k9eAqlk
 AygM8sYEixWKGqJhjqYS2dUVYUaadvrgWOv0o1MdWiw9jC6MKVkroXaw8
 hFVctr99Vui0h7hgMr/Ms0U1vVuERQHc9cO590DEKya6VIC2HDNsmyxde
 8zOVaYLpHxQ3fugDGJuA0urUM+i4kFLD89ZTTdUdrSt3ibk2bi5znqKgK g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="263547410"
X-IronPort-AV: E=Sophos;i="5.90,273,1643702400"; d="scan'208";a="263547410"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 08:05:27 -0700
X-IronPort-AV: E=Sophos;i="5.90,273,1643702400"; d="scan'208";a="666368195"
Received: from ahfarrel-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.228.159])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 08:05:27 -0700
Date: Tue, 19 Apr 2022 08:05:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda/i915: Fix one too many pci_dev_put()
Message-ID: <20220419150527.tcdxf6gzxq3m75si@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220416064418.2364582-1-lucas.demarchi@intel.com>
 <s5h35i936b5.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <s5h35i936b5.wl-tiwai@suse.de>
Cc: intel-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

On Tue, Apr 19, 2022 at 09:01:34AM +0200, Takashi Iwai wrote:
>On Sat, 16 Apr 2022 08:44:18 +0200,
>Lucas De Marchi wrote:
>>
>> pci_get_class() will already unref the pci device passed as argument.
>> So if it's unconditionally unref'ed, even if the loop is not stopped,
>> there will be one too many unref for each device not matched.
>>
>> Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
>> Cc: Takashi Iwai <tiwai@suse.de>
>> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5701
>> Fixes: 0dc2696a4623 ("ALSA: hda/i915 - skip acomp init if no matching display")
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Thanks, applied now.
>But the Fixes commit id was wrong.  I corrected to the right upstream
>one, c9db8a30d9f0.

indeed, I messed that up, using the hash from our local tree.

thanks
Lucas De Marchi
