Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C5D48B3B8
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jan 2022 18:24:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 643231A90;
	Tue, 11 Jan 2022 18:24:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 643231A90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641921892;
	bh=BZF3SE6t8dO/Cv5g6RBij7XLjHcR41DdE5s0rpB9p9w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j9jKBz4SKHAmjcALOxy2q9ldN3+zYT2Slf76Z0DLqrSf8aL7WgIFUtMilHcv/FAxu
	 8DEhy9D4DPYS0zd7DpJMl52ls6DbLfqGlLpc66G46aYeRT6V1TcyxHb49/YRXN4JS8
	 TnqTXIJn6+O5aeNjnJBmqKqWrIMlBo9fsv6Ssv1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86881F8047C;
	Tue, 11 Jan 2022 18:23:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 591A4F80430; Tue, 11 Jan 2022 18:23:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45B71F80054
 for <alsa-devel@alsa-project.org>; Tue, 11 Jan 2022 18:23:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45B71F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BSg+GQ5i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641921817; x=1673457817;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=BZF3SE6t8dO/Cv5g6RBij7XLjHcR41DdE5s0rpB9p9w=;
 b=BSg+GQ5iSn7ygw4IqdAeFaZVSPTW/qi/HDYBmY+BJbKFaNxi2kt8889Q
 wN44fEEvfvT1yr1OKPDVBrwRK4DpOGzztzzJGiRm030jitRr5LNOZJYps
 LE8KU5xUZdtoDkeRgEK/n+XP131KMUls1K1qTtc8GTMDeKxmYKKgsP4Jp
 E4onJM/n+Jtk0mZDKFhWStjEx5QbLBoUTAWMjYQSFbMzQYusEYYJ+2Ptt
 wfedrKrrY6jC4Dzx/BL756TyDEH4jl6NkWq6q1b2JXzLKLhM4jV1ZTm+X
 zeUv/XcMzVwVWhFS2EKhHmDl36gED2AQaZHxQqd+Kbs4GDRTAMbxS0LI6 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="224237924"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="224237924"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 09:23:33 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="592749787"
Received: from cdoher2x-mobl1.amr.corp.intel.com (HELO [10.212.119.165])
 ([10.212.119.165])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 09:23:31 -0800
Subject: Re: [PATCH 0/3] ASoC: topology: Fixes
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
References: <20220111190528.445248-1-amadeuszx.slawinski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f03232bd-09c4-f64e-56fd-222aaf681562@linux.intel.com>
Date: Tue, 11 Jan 2022 10:49:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220111190528.445248-1-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
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



On 1/11/22 1:05 PM, Amadeusz Sławiński wrote:
> Following series performs few cleanups in topology code.
> 
> First patch reduces number of prints we get from failure.
> Second allos TLV controls to be either read or write which should be
> possible as evidenced by further code in function.
> Last one cleanups after refactoring of memory handling.
> 
> Amadeusz Sławiński (3):
>   ASoC: topology: Remove superfluous error prints
>   ASoC: topology: Allow TLV control to be either read or write
>   ASoC: topology: Optimize soc_tplg_dapm_graph_elems_load behavior
> 
>  sound/soc/soc-topology.c | 103 ++++++++++-----------------------------
>  1 file changed, 27 insertions(+), 76 deletions(-)

Thansk for the cleanups.

For the series

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

