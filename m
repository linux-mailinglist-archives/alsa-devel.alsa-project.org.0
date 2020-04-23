Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4741B59A7
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 12:50:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB58E1684;
	Thu, 23 Apr 2020 12:49:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB58E1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587639001;
	bh=59GR1U0lXfj09fD/+Q2JWMOTGa0EapQcGOf9lcS5ITA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V02SFyhDgp4q3a9+rSs2TAh5o/6K48+kTa8piGuMYQ4b2mw4KZc/nPJy32i6SKofc
	 C+htwdikEHGWTediy+OUrpLanWcODMJshtvTN58X7ePltr6APw+9WiaFlctJwddKQV
	 r7ugbzUm1JLzpDNjZX+vBE4nmBv998I9SSm5LSfY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 032B8F800FF;
	Thu, 23 Apr 2020 12:48:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 673FDF801EC; Thu, 23 Apr 2020 12:48:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAB50F800FF
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 12:48:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAB50F800FF
IronPort-SDR: p/WjL8kIod/MbuQ6M5KyDzXU8UQyGcpX7xdRVxuDwGb4uCF6ifw6Yjuzy+wEvr8lnxPUCt+kTZ
 Y/0eWMCrS4dQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 03:48:04 -0700
IronPort-SDR: Nya16Jl1HjZbJC3oNUxzwpy5CS93XpN8oMC1ju8yEsE15broVCSl8/54T/UAiPoLbRitMWAnWs
 GXaI5GRNVGig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; d="scan'208";a="456864313"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.5.100])
 ([10.213.5.100])
 by fmsmga005.fm.intel.com with ESMTP; 23 Apr 2020 03:48:02 -0700
Subject: Re: [PATCH v2 1/3] ASoC: Intel: Skylake: Add alternative topology
 binary name
To: Mateusz Gorski <mateusz.gorski@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200422120532.31492-1-mateusz.gorski@linux.intel.com>
 <20200422120532.31492-2-mateusz.gorski@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <554b3330-b3c8-4c73-3755-d780f930b843@intel.com>
Date: Thu, 23 Apr 2020 12:48:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200422120532.31492-2-mateusz.gorski@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.com
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

On 2020-04-22 14:05, Mateusz Gorski wrote:
> Add alternative topology binary file name based on used machine driver
> and fallback to use this name after failed attempt to load topology file
> with name based on NHLT.
> This change addresses multiple issues with current mechanism, for
> example - there are devices without NHLT table, and that currently
> results in tplg_name being empty.
> 
> Signed-off-by: Mateusz Gorski <mateusz.gorski@linux.intel.com>
> ---
> 
> Changes in v2:
> - added <sound/soc-acpi.h> include
> - machine driver name is now read from different field
> 

> @@ -3575,6 +3588,9 @@ int skl_tplg_init(struct snd_soc_component *component, struct hdac_bus *bus)
>   		}
>   	}
>   
> +component_load:
> +
> +
>   	/*
>   	 * The complete tplg for SKL is loaded as index 0, we don't use
>   	 * any other index
> 

Looks like double newline after 'component_load' slipped through my 
eyes. Please fix it.
