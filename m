Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 914914D03DD
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 17:17:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A34216DC;
	Mon,  7 Mar 2022 17:16:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A34216DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646669839;
	bh=PVx3pz+Cc/1vvF/O9ZwC1847s5h2idC450Ea+aIu9Ho=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E9PWnrpBZWgcqt7vhIYA2SCX5Z3NCyAgImdj7dbLfjIxDPje6ZHxkJm9FG1fhzz2X
	 YzameYcGH87wrrs1CHxN8wysLEDJgYQqu+cJznb+7fo14xoazPx9N1f11uAjL1Bv8U
	 lEAH/QWSxs/vS00rcAaq4LpgLeC1UxcPeu5ty1gw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AB9FF80159;
	Mon,  7 Mar 2022 17:16:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4870F8013F; Mon,  7 Mar 2022 17:16:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF8E7F80124
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 17:16:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF8E7F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BuLGQoNR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646669767; x=1678205767;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PVx3pz+Cc/1vvF/O9ZwC1847s5h2idC450Ea+aIu9Ho=;
 b=BuLGQoNRRUTYzpwdR0EGmo2tyK2SwQBYBhfSFOZKGXT3Aus8Xv89hR/i
 1aL0r3ugKzFa0m7ZqPVeQ21T9UTfvvMtrtZS0rOB/VubIkoBfSugNMUcG
 tV53MTIPcFM3ZPwcgdbptO6k+7c2RJ/OiR/4twTJc/frOLpfAOSDTi22H
 YQfOGCZk84Ajx6hKRnokX1F4zFDAcSu224HWm7DSQaY9HP2u5M8kOHXwD
 q0etaWhvv6DpfbDwqZ7hrFAKccbirh26qUdNF14h3PkQ2B90DebQo+2kP
 oDaGAtFrAPSb+/jZ1hfm+dUB/kKNaoTYl62FWJbwFaciYUDMRzBLY0dVM g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254618913"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="254618913"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 08:15:59 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="631890938"
Received: from zhaojohn-mobl1.amr.corp.intel.com ([10.254.24.100])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 08:15:58 -0800
Message-ID: <3bce930519d6211499948cb219294560b9c8786c.camel@linux.intel.com>
Subject: Re: [PATCH v3 04/17] ASoC: Intel: avs: Inter process communication
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
Date: Mon, 07 Mar 2022 08:15:58 -0800
In-Reply-To: <9a536988-4d21-256a-254a-d5b422eceb42@intel.com>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-5-cezary.rojewski@intel.com>
 <3a4bd57f06b9dddca6b7726c462bd0ccaaa508ff.camel@linux.intel.com>
 <9a536988-4d21-256a-254a-d5b422eceb42@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
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

On Fri, 2022-03-04 at 18:11 +0100, Cezary Rojewski wrote:
> > > +     * -EPERM error code is expected and thus it's not an actual
> > > error.
> > And what happens in this case? do you retry the IPC after recovery?
> 
> 
> 
> 
> Not at all. Why would you want retry IPC after recovery in the first
> place?
So what happens after FW recovery? Will this lead to an xrun and cause
usersapce to restart the stream?

Thanks,Ranjani

