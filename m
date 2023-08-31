Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D8978EA08
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 12:16:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFA9183A;
	Thu, 31 Aug 2023 12:16:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFA9183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693477014;
	bh=RklcOlR9Ft6ToyxZkI1TycwhFtZjpvj3ZdgDkjh9OkQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XsyBXEjAvZb+OiyGtY3/VpOZgqYMA+tSdOFORbcnP+Cuwga8K2F/U6IoaGkztSjbB
	 m06fJeBMyN3sOeoH9S1plS2vfRGa2prHfyj7eNmUZF5pqNTEJev4mnwyw+hYQb1BZX
	 ROFZtehvM6jCvH6vKHiilbu1m1mkLZ1+qj8V154E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4939F8032D; Thu, 31 Aug 2023 12:16:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72934F800F5;
	Thu, 31 Aug 2023 12:16:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B55FF80236; Thu, 31 Aug 2023 12:16:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C6B4F800F5;
	Thu, 31 Aug 2023 12:15:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C6B4F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UhzyIQkU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693476959; x=1725012959;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RklcOlR9Ft6ToyxZkI1TycwhFtZjpvj3ZdgDkjh9OkQ=;
  b=UhzyIQkU+Fh5kc89xDfQYCSwZ2jfvidWU3imhQ5R3FqEImIdr0vPawS+
   3SWTsjslQV42msvwhJhkfo+8hexvCH3J3Z9wTOMUJGnYL1xqfApn/aJ3c
   QTJeRzQax0Uba7FGrZzL62iMa+s5CtYPvFZ5NAAiDoOixtQyrW0bD0EFr
   qEAQVZ/YQJLh24opMiziOTDt9fPkK4M4Rf7x/ZXGnZCy7NoDp75YVg/3w
   45QSEe8xd8w4vdQaOor67Un8C8r1jBka0svqCebt5iKEJSGM/UL4agHkU
   1neOyc7CpuK830z7YHzp3QKLhV1PAQmuVUgVwvjMjW0hBGM+6Wr5BkzP2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="462264871"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000";
   d="scan'208";a="462264871"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 03:15:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="804922362"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000";
   d="scan'208";a="804922362"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.91])
 ([10.94.0.91])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 03:15:48 -0700
Message-ID: <6d5fb09d-4664-3689-4196-607dba10cbba@linux.intel.com>
Date: Thu, 31 Aug 2023 12:15:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 08/11] ASoC: Intel: Skylake: Move snd_hdac_i915_init to
 before probe_work.
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
References: <20230830153652.217855-1-maarten.lankhorst@linux.intel.com>
 <20230830153652.217855-9-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20230830153652.217855-9-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XB22SP7PLC6JK2BJXJ4CMQWCX5SZNLDV
X-Message-ID-Hash: XB22SP7PLC6JK2BJXJ4CMQWCX5SZNLDV
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XB22SP7PLC6JK2BJXJ4CMQWCX5SZNLDV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 8/30/2023 5:36 PM, Maarten Lankhorst wrote:
> Now that we can use -EPROBE_DEFER, it's no longer required to spin off
> the snd_hdac_i915_init into a workqueue. It's likely the whole workqueue
> can be destroyed, but I don't have the means to test this.
> 
> Removing the workqueue would simplify init even further, but is left
> as exercise for the reviewer.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

