Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 837838FADB7
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 10:38:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C095F93A;
	Tue,  4 Jun 2024 10:38:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C095F93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717490319;
	bh=9Pomqts/Pt3XLTeQ+wcHCwmRtL3bWzsgNN6TTXHmXuI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SxdW1CD1ydHY28jtyTuZ8V3uVjt+n/dMZs/kfnF4DkdUCVeCabqWjx5YjU0ON6+YR
	 FJBnPmVKeGbJ3J2WlMW5W6CsRfQNz9GEX8ZDBX+rpItP1YWRUfqPtZqRunbouiUQ8+
	 vyHiy8aR5+nspwIP23lOt/DR+Imjew7/haYEn30I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55895F8051D; Tue,  4 Jun 2024 10:38:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D526DF8059F;
	Tue,  4 Jun 2024 10:38:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9E6CF804B0; Tue,  4 Jun 2024 10:38:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80BB5F80088
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 10:37:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80BB5F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SA+W2noE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717490278; x=1749026278;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9Pomqts/Pt3XLTeQ+wcHCwmRtL3bWzsgNN6TTXHmXuI=;
  b=SA+W2noExys4+dPnxHmOHkifU/HHFmv52PjKwD5SwWiaG+z2HE2Ci55G
   fZilcUGy2shDtDLGWbMADkNGCTQlinnT5DsVd+0HmG3EFUp9gOWqG7hqx
   CtHeDWUb9jkf+Obk+WU+QiMYvTSrqXua7s93zPEfwWzRnVTcCul4yrfFs
   ldd3ZdSvw0CSPqmlCQ8hFelX4tv2mnIsJ9SQQdwGmRw6VCEF62BBFfDYw
   VtuCggT44RBci+Z4HXSZ21y8MYTTO+rGziqAiIgvVyrOcQ+pKqiLMTsv8
   CsC78R1rpe3RLXKcsA5jBI2Iu1fyFDu6qb49DoDqI47qdQw9BDNzU81WJ
   g==;
X-CSE-ConnectionGUID: AkVBunejQzeNlckVkHGkOA==
X-CSE-MsgGUID: YiaR4UPwTaWLjFBMtDsDvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="17809380"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000";
   d="scan'208";a="17809380"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 01:37:54 -0700
X-CSE-ConnectionGUID: w2rWr0ilSTamxblJ/0p2gw==
X-CSE-MsgGUID: jJaY21gHQ1Sncq3lV065JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000";
   d="scan'208";a="37638029"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.105])
 ([10.245.246.105])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 01:37:52 -0700
Message-ID: <c5ecc0cd-c2ba-4f71-ac2a-9a81793a8f0c@linux.intel.com>
Date: Tue, 4 Jun 2024 10:30:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] soundwire: bus: suppress probe deferral errors
To: Johan Hovold <johan+linaro@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20240604075213.20815-1-johan+linaro@kernel.org>
 <20240604075213.20815-2-johan+linaro@kernel.org>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240604075213.20815-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YIHNJXA7TB7HRMMKPBBB57PQ4PNIG2HF
X-Message-ID-Hash: YIHNJXA7TB7HRMMKPBBB57PQ4PNIG2HF
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YIHNJXA7TB7HRMMKPBBB57PQ4PNIG2HF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/4/24 02:52, Johan Hovold wrote:
> Soundwire driver probe errors are currently being logged both by the bus
> code and driver core:
> 
> 	wsa884x-codec sdw:4:0:0217:0204:00:0: Probe of wsa884x-codec failed: -12
> 	wsa884x-codec sdw:4:0:0217:0204:00:0: probe with driver wsa884x-codec failed with error -12
> 
> Drop the redundant bus error message, which is also incorrectly being
> logged on probe deferral:

It's only redundant in the QCOM case... This would remove all error logs
for other codecs, e.g. see

rt711_sdca_sdw_probe
cs35l56_sdw_probe
wcd9390_probe

Looks like the wsa884x-codec is the chatty driver, others are just fine
with the existing code.
