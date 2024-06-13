Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DE390652E
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 09:33:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC793BC0;
	Thu, 13 Jun 2024 09:33:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC793BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718263994;
	bh=+uieUl4T0AiiG6OOna2b86fDGRMjAkpZ5je8upHdYZ0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YaaTozapTfiPxwORHG1WE98ROWSYxuwzu3hpwKXmkWDUsCY/DT4rp+MiaiodFSfbB
	 tFLg0G1N+FHzfILK2PGyHnKBqLoZDhL9HXQFjM43+WiXTq/ZQGHpdwBCexsQcFIltH
	 7UdtERYJPyV9V7py0h7dBH8OP1DsKWrDSKrFjkGI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83650F805BB; Thu, 13 Jun 2024 09:32:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80A6AF80579;
	Thu, 13 Jun 2024 09:32:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64200F8057A; Thu, 13 Jun 2024 09:32:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5801F80579
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 09:31:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5801F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YnnpNhVB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718263917; x=1749799917;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+uieUl4T0AiiG6OOna2b86fDGRMjAkpZ5je8upHdYZ0=;
  b=YnnpNhVB9TABRT7qpDFo/QLbRleL6LAY6A6bcDXd01Ms5mBs1lM/XTkk
   C+U8IVpd4YubErl2bAvny1N9PkPHnI4TLS+Zjo+epGtmQQJHkfxsJp/6u
   ZO6SYSVSRbFC4ug6+eNwwB67ZeIaJHv7DlvaIzPnZ50+dBkMuoQrt4gNV
   SM9XadJgDBXe6sYCoaZHZBHEF74mExL5SAVT7QNZV9uzSI8eXVfDyEyto
   ity7E30SmY2/XMYvTIR1E7Dzi4PDvcYJlU43n/pj2lBkccSyMJg0/6v/c
   ow64H6q3VVGtr+vIOj5v/L0+GH6kfDLIxW0Y3Mgi+hYoBmzOb9OnDbMqy
   g==;
X-CSE-ConnectionGUID: 8gfP3P6yTrufnJ2e2TE6sQ==
X-CSE-MsgGUID: hv2IOhHvQTGkF4wFArIdLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14940915"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000";
   d="scan'208";a="14940915"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 00:31:47 -0700
X-CSE-ConnectionGUID: rJkVczvGSpirDlIgiNYQaw==
X-CSE-MsgGUID: 532QuY2GSfufheKRKw+d9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000";
   d="scan'208";a="44436167"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107])
 ([10.94.8.107])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 00:31:44 -0700
Message-ID: <be6d9c07-1b26-408a-93ec-64fcbec73e80@linux.intel.com>
Date: Thu, 13 Jun 2024 09:31:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ASoC: topology: Fix references to freed memory
Content-Language: en-US
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 Jason Montleon <jmontleo@redhat.com>
References: <20240603102818.36165-1-amadeuszx.slawinski@linux.intel.com>
 <20240603102818.36165-2-amadeuszx.slawinski@linux.intel.com>
 <507e9f6a-7113-4781-8a6d-27e4b87dbe24@linux.intel.com>
 <5bdae438-a976-44c0-b6d3-1aab5167a68e@linux.intel.com>
 <38d7b3e2-33cb-4a81-bad8-73c22679f49f@linux.intel.com>
 <750f8ab4-f283-44e0-9b6c-57176bdbf59e@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <750f8ab4-f283-44e0-9b6c-57176bdbf59e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DC4XPHJM5U52KGBUHBSVIRE5HXSLWKEZ
X-Message-ID-Hash: DC4XPHJM5U52KGBUHBSVIRE5HXSLWKEZ
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DC4XPHJM5U52KGBUHBSVIRE5HXSLWKEZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 6/13/2024 8:44 AM, Péter Ujfalusi wrote:
> 
> On 13/06/2024 09:29, Péter Ujfalusi wrote:
>>>>> +		route->sink = devm_kmemdup(tplg->dev, elem->sink,
>>>>> +					   min(strlen(elem->sink), SNDRV_CTL_ELEM_ID_NAME_MAXLEN),
>>>
>>> Initially I did not see why this breaks, but then:
>>>
>>> The strlen() function calculates the length of the string pointed to by
>>> s, excluding the terminating null byte ('\0').
>>>
>>> Likely the fix is as simple as:
>>> min(strlen(elem->sink) + 1, SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
>>
>> or better yet:
>> route->sink = devm_kasprintf(tplg->dev, GFP_KERNEL, "%s", elem->sink);
> 
> or even better:
> route->sink = devm_kstrdup(tplg->dev, elem->sink, GFP_KERNEL);
> 

I guess I might have overdid it a bit, let's go with devm_kstrdup for 
all of them, as it should just work unless someone tries to corrupt 
topology file.
