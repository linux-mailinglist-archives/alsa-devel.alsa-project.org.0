Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5A84D3D2C
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 23:40:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 052F41774;
	Wed,  9 Mar 2022 23:39:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 052F41774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646865603;
	bh=IfVPdKhS4QZ5fdjxK7CDIclXFb1vUgQyUNprq6qyH7w=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iXD1nHZZ+Zf1txWl34ZJCPaDcou5yBPePMjvfhgJZL5+SqrErB02klfBDi9eorkso
	 Wlecsno1EvLkpiOI4sGxBkUEUKQ7evAOeT6+bUY4522G3lDsEQMGxAvKcX2ZnNaar/
	 j738oZa2hAzb7K5E5zpRvPa55uYZJZv250FKhdRM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82CFFF80526;
	Wed,  9 Mar 2022 23:37:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F250BF8051E; Wed,  9 Mar 2022 23:37:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F846F80508
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 23:37:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F846F80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fsR0mWKz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646865458; x=1678401458;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IfVPdKhS4QZ5fdjxK7CDIclXFb1vUgQyUNprq6qyH7w=;
 b=fsR0mWKzppybs+NBYbqG2Y8v8O+EYKyQ8QTFxh+6mGzfmICkJjnlcwJo
 cjGKEBPEmsuGYsGnYost559lXgRUbh4S8cyagaT8NW2FefRhCe1KBcL3t
 GWnF5d6YYTkc3f+qTUg4iQ1aqavRVwEBvqaMz5Y7L2ZwulBlCzR9o1ORM
 /BKDJPyt1IzUCuYXlP5CBZkZEl+6zBr5dNG/R+rnS+qIL//Tpv9+UKmhx
 BBJ5vTJbu38A0H3vO/mQXqX9Ub1oO5azt0rcXlpSKQs7bJAh2EiR9tBq+
 2/x94EHgdC6v+C2vj6Bxi4PWLiDlfMorL7w5dzvaLIF+oT/HQwh7hZEVl A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="279840331"
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; d="scan'208";a="279840331"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 14:37:31 -0800
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; d="scan'208";a="688449514"
Received: from nhaouati-mobl2.amr.corp.intel.com (HELO [10.212.216.252])
 ([10.212.216.252])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 14:37:27 -0800
Message-ID: <21355731-115b-5b8b-fe19-51e82cc6ae2a@linux.intel.com>
Date: Wed, 9 Mar 2022 16:20:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v4 10/17] ASoC: Intel: avs: Add basefw runtime-parameter
 requests
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220309204029.89040-1-cezary.rojewski@intel.com>
 <20220309204029.89040-11-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220309204029.89040-11-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
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



> +enum avs_i2s_version {
> +	AVS_I2S_VER_15_SKYLAKE   = 0x00000,
> +	AVS_I2S_VER_15_BROXTON   = 0x10000,

I would add a comment that this is added for completeness but not 
tested/supported.

> +	AVS_I2S_VER_15_BROXTON_P = 0x20000,
> +	AVS_I2S_VER_18_KBL_CNL   = 0x30000,
> +};

