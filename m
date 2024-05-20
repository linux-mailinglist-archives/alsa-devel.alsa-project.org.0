Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FB58C9E28
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 15:29:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD03DDEC;
	Mon, 20 May 2024 15:29:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD03DDEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716211761;
	bh=nw8hp8/8+msTlDJ9UUY927z2ZDGlE1iKI4XjOZa7LQE=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=msO+4N+XD/sGCnPVMTTZ3etoHmBiR6IDkisZanj4GqJL6xvtRiOBg2ovMQTbCwfjD
	 K78tAqKjMhUpVz+OFeKpXl02mrEz1dO2EQLEiqjLxDgzTmmEBJEb3rg4tvwSlDItCa
	 ud7x4VVtPm+jVl1QfFZt0i9qo7K0VoVYeIms9LQA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C11C3F805FE; Mon, 20 May 2024 15:28:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1289BF805E0;
	Mon, 20 May 2024 15:28:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4C52F805C3; Mon, 20 May 2024 15:20:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88CA8F80578
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 15:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88CA8F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dfO5vWpx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716211215; x=1747747215;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nw8hp8/8+msTlDJ9UUY927z2ZDGlE1iKI4XjOZa7LQE=;
  b=dfO5vWpxh6ggKxXMRDaJKq1RdjSsjmNszlios8/UtPgiartyHYv6VvTq
   65H0UDHCNhaoRiTsSGjYoO+BrInHAS2ZDZkgpp5BctgnGPSmx/s58O8DO
   HDlpErD3C7h9OmvcTMtXcVmBjVTg/atPBL0gmkjnExy6KtO3RtERgdogo
   s1LMCFw+9hxa+adwr6fp4aOMrckLLN1YY6BbPer44S86b1PiN5Opn4nat
   9Jn6UymYF83RKU5gKyA/VirjvBhpzgmrnQ2Uz6Jj6wpjdcpz/89yF3++s
   4Fn2EDqjTDq7JPmC/Jev2z3+4SjOt5WWLE6uTgAvgxGLpTqhQ/2xQWKLE
   w==;
X-CSE-ConnectionGUID: 3OKS1yE4S62Mbniw8rUxLw==
X-CSE-MsgGUID: +NX1zo1PRu+TqTZ7oCWsUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12556244"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000";
   d="scan'208";a="12556244"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 06:20:06 -0700
X-CSE-ConnectionGUID: GpvW/zniQqm/NQHEMYtCbw==
X-CSE-MsgGUID: 0vol+ruxREWyzvPY49cxmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000";
   d="scan'208";a="32977289"
Received: from daliomra-mobl3.amr.corp.intel.com (HELO [10.125.109.51])
 ([10.125.109.51])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 06:20:03 -0700
Message-ID: <9853cf34-105f-4430-a232-af04c25a834b@linux.intel.com>
Date: Mon, 20 May 2024 08:19:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ASoC: rt1320: Add RT1320 SDCA vendor-specific driver
To: shumingf@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
References: <20240520091801.399154-1-shumingf@realtek.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240520091801.399154-1-shumingf@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DDVKZWLZXVFLI45KU5QUU5SPA6JTRBIZ
X-Message-ID-Hash: DDVKZWLZXVFLI45KU5QUU5SPA6JTRBIZ
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com,
 pierre-louis.bossart@intel.com
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +static const struct sdw_device_id rt1320_id[] = {
> +	SDW_SLAVE_ENTRY_EXT(0x025d, 0x1320, 0x3, 0x0, 0),
> +	SDW_SLAVE_ENTRY_EXT(0x025d, 0x1320, 0x3, 0x1, 0),
> +	{},

Sorry, not following why one of the two entries in the table is an SDCA
class device and the other not - both rely on SDCA
controls/entities/functions/etc. That doesn't really align with the
notion that VA and VB only differ by their DSP capabilities, so not sure
what the 0/1 difference means.
