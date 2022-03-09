Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F51A4D3241
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 16:56:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B28071701;
	Wed,  9 Mar 2022 16:55:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B28071701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646841400;
	bh=F13/4Bt3hYx0TgnARvX9PdNzkMy26a1mQJXrehce2eA=;
	h=Subject:From:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l2hKcjy+YaXdOHoRmFsDrySybqmWNSJkJeBHwucihR+F+s93qMRnCe899CXug+3Pv
	 7JXxCWk0yR6rmUwzh5fk26Ev3qRJwi4h3RHYQgnTZBllZu4FxovVvr4tO8SPy2bdJU
	 ZAcmJ5tT7F0t3qN38UwRVnM194QhQGMe38tnfgwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11DC3F80158;
	Wed,  9 Mar 2022 16:55:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29505F800D2; Wed,  9 Mar 2022 16:55:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CC33F800D2
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 16:55:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CC33F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="LunD1ND4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646841330; x=1678377330;
 h=message-id:subject:from:to:cc:in-reply-to:references:
 mime-version:date:content-transfer-encoding;
 bh=F13/4Bt3hYx0TgnARvX9PdNzkMy26a1mQJXrehce2eA=;
 b=LunD1ND49HVEcCjBb7L1kOqzYF8yLIgQvUPiIk5OgFxedbEju+x1EhEf
 abcoFRDlLeE+zAW7ppRwV3xsVQPTYmC+fzb15mGpTPBk5Ruy3xSPmAMNN
 Tgr4kgUATHDRAUC0GzA1VFwhHmVczpJZeQBVvnisarXWI9JfhoG1bbo3d
 UqNjTVoJJqXllOE9JW/fULzaK8ainRyWi3GZuf5xqVzHfWtkuaV2kdiHi
 nsEopVsfzD36Hn/CJzWfl9stAo1OdL912+Jjix0RMo3DZo453hDr/LYPr
 2yqQI7bKbxrN7PvuvrczDiM21hDmgagODK2achbDVAMChwK1sS2r2fq6E A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="253834741"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="253834741"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 07:55:26 -0800
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="495877668"
Received: from skawthek-mobl.amr.corp.intel.com ([10.254.24.79])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 07:55:26 -0800
Message-ID: <98f16493cc291ee621f3ef5cfcaebd5cc7f15ebc.camel@linux.intel.com>
Subject: Re: [PATCH v2 00/18] Clean ups and preparation for IPC abstraction
 in the SOF driver
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
In-Reply-To: <20220308164344.577647-1-ranjani.sridharan@linux.intel.com>
References: <20220308164344.577647-1-ranjani.sridharan@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date: Wed, 09 Mar 2022 07:44:31 -0800
User-Agent: Evolution 3.36.3-0ubuntu1 
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, broonie@kernel.org, amadeuszx.slawinski@linux.intel.com
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

