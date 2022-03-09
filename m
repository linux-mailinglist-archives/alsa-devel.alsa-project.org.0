Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFFF4D3215
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 16:46:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE02916DC;
	Wed,  9 Mar 2022 16:45:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE02916DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646840787;
	bh=F13/4Bt3hYx0TgnARvX9PdNzkMy26a1mQJXrehce2eA=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FO2cxO7rkuTdIzZl6be2EaxwxKZhad3RQzWfvCr7FG8l4CO1Py5pE8KaaPZ1L7KlB
	 +kKZciVqznpzN9d9n48WIKHwiga+sq0qNGtnugV1AV2pFZ1SjCAdykbdeXOp/0F3QF
	 Ehb5kxI7Ejm54yONDMSkCMFPBGVYrrxpvvaGl+OM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16091F800D2;
	Wed,  9 Mar 2022 16:45:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94685F8016C; Wed,  9 Mar 2022 16:45:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9A8AF8012F
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 16:45:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9A8AF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WbH6mxHk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646840718; x=1678376718;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F13/4Bt3hYx0TgnARvX9PdNzkMy26a1mQJXrehce2eA=;
 b=WbH6mxHkAFe8W5G5kGhkKrI37gyCo5bv4M7nBdV5V0Trd3NLtmydhv0/
 kbl4NO2CnxEERV1cGWbsM+3NZrH+18HD2g4CE6SXrUKIhwB49KAk4rUMW
 FcvFGqsGhuD9l+jDqjRaarBaA00HKmAVfKx/tO5sIuZcJMhxGIKOEM0MJ
 2Py3akkEURh3IiMn6iprjW70hp9wsuTNRcz9EMa7zNkDoUhQyEeNiFPXz
 CebaIz/emuSahmqO8m8mIMdjMrmTuLkM4Xari1/Vw88iJYozBL8UTv1kX
 tUFeiTZqXdtmkA+pHmMIzWzi+gG3I/N8ZUfEBWWT3djo6UPz4imgBCoZX w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="253832653"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="253832653"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 07:44:53 -0800
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="495874383"
Received: from skawthek-mobl.amr.corp.intel.com ([10.254.24.79])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 07:44:53 -0800
Message-ID: <2d2f89b9ef32ec1e49d8d5c4025598047e30172c.camel@linux.intel.com>
Subject: Re: [PATCH v2 00/18] Clean ups and preparation for IPC abstraction
 in the SOF driver
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org
Date: Wed, 09 Mar 2022 07:44:52 -0800
In-Reply-To: <20220308164344.577647-1-ranjani.sridharan@linux.intel.com>
References: <20220308164344.577647-1-ranjani.sridharan@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, amadeuszx.slawinski@linux.intel.com
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

On Tue, 2022-03-08 at 08:43 -0800, Ranjani Sridharan wrote:
> In preparation for adding support for the new IPC version that has
> been
> introduced in the SOF firmware, this patch set includes some clean
> ups
> and necessary modifications to commonly used functions that will be
> re-used across different IPC-specific code.
> 
> Changes in v2:
> - Use guid_t instead of u8 array for uuid and the helper
> guid_is_null()
Hi Mark,

I see that you have applied the v1 of this series. Please disregard
this series and I will send the changes in v2 as a separate patch.
Also, I noticed that your for-next and for-5.18 branches only contain
12 of the 18 patches in this series. Should I resend the ones that got
missed?

Thanks,
Ranjani

