Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 683228B1C16
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Apr 2024 09:44:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5284EDF8;
	Thu, 25 Apr 2024 09:43:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5284EDF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714031042;
	bh=5PBcStouiAL0LL01bVFaRv1aQRBdnBtOYC7EAUalJIs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qbfea6qSgYid9tZN1UcfGpOe4mIhkwh11Ln1Vu8jmE6W0aZbIAZtXAok273Pd5zcE
	 P5kpbZla4FEWCZ3UxW0OLCU2aXFwVIdAv/R1t+phbIaPFG72iUigUFHDz/OPq7tYmu
	 Cf6Gnu/27bK7uTLckQtmeb978b5YN4h8hdT5lVnc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6072BF80578; Thu, 25 Apr 2024 09:43:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4EFCF80423;
	Thu, 25 Apr 2024 09:43:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DF3FF80423; Thu, 25 Apr 2024 09:39:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27A43F800B5
	for <alsa-devel@alsa-project.org>; Thu, 25 Apr 2024 09:39:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27A43F800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nO1opTEJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714030788; x=1745566788;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5PBcStouiAL0LL01bVFaRv1aQRBdnBtOYC7EAUalJIs=;
  b=nO1opTEJt5gnY9tQkXRPkNMI+wb40oTCp96Rrf5DmT4JPxxePouANe6I
   Nx6FhTN5FuVjOGYnxEaiz9octH4lsnc1LlaLSsJHrtT2icmoDi00/cnRL
   JmY/kzQvhXldmvXLqD0T/YMnhxDNOblpc4wkIPxwPcMUrouTKVvyGbvL7
   /xm3ZfgE3O/bu70yKjF+UH0EhZBK9WF1KGxPxZ5WX0i6bbZrAy116VqrR
   giJJC7CLD3PDzl7x/r1CnWpDWwLV5PqZSxioSXNqLTee7LEq91v3qBs8z
   PZRjc0FuUZWEKeKrPpVtEMWQnm4ao+goLwJzyl16IroVWjXNxyDCfwaQX
   g==;
X-CSE-ConnectionGUID: kqNrfNvjRryKrJHC3ohynw==
X-CSE-MsgGUID: BFUcvwX9TQidVqz/NVZECQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="13483136"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000";
   d="scan'208";a="13483136"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 00:39:43 -0700
X-CSE-ConnectionGUID: H8E5lNTsSWaGPcjdPXBkEw==
X-CSE-MsgGUID: Bp1BJxZUTxCddboCRR0itA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000";
   d="scan'208";a="29614232"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 00:39:38 -0700
Message-ID: <cf878edb-2e99-4e21-9ccb-a1867b37feaf@linux.intel.com>
Date: Thu, 25 Apr 2024 09:39:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 68/71] ASoC: Intel: avs: es8336: Switch to new Intel
 CPU model defines
To: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <20240424181245.41141-1-tony.luck@intel.com>
 <20240424181550.42466-1-tony.luck@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240424181550.42466-1-tony.luck@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P3HSTJGYT2DBAST65TPQBEAJBBI3RLIQ
X-Message-ID-Hash: P3HSTJGYT2DBAST65TPQBEAJBBI3RLIQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P3HSTJGYT2DBAST65TPQBEAJBBI3RLIQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 4/24/2024 8:15 PM, Tony Luck wrote:
> New CPU #defines encode vendor and family as well as model.
> 
> Signed-off-by: Tony Luck <tony.luck@intel.com>
> ---

Thanks!

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

