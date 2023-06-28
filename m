Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B454374171A
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 19:20:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 484097F1;
	Wed, 28 Jun 2023 19:19:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 484097F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687972822;
	bh=peKAr0s1Kurrh+o6kbrz5QnnAIgvQneW3GDRLAasnhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=clZbBBIXsuHjVMK5Ejadb4950xF7sQfsoQ0Fvrf2Yyd3VExI9xaLGCtZVzkTVxRKn
	 jbicb0RfUR8iajyhTnEIr1geq91Kb3Muij1MqKAfdxRBpzs8naszj7xURpefsfV4qr
	 P+16RLPulp2FKSAmYtVFmExTxDacMdzDszVAQCnc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7472CF80124; Wed, 28 Jun 2023 19:19:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9B75F80212;
	Wed, 28 Jun 2023 19:19:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82AD3F80246; Wed, 28 Jun 2023 19:19:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F594F80124
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 19:19:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F594F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BxkGxKlv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687972762; x=1719508762;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=peKAr0s1Kurrh+o6kbrz5QnnAIgvQneW3GDRLAasnhQ=;
  b=BxkGxKlvA3bChJtQx5bna0WC6IVwMzS4KhMYsr2ZFc/UwTYn6BjI0MeQ
   qMNzLpYqqzmhPfGTs/APgOBWkOv9QKkvSpCMQ8QBLWOFI9n+mMdOCgApl
   1j6vrZfb5Z/mgag8iMhE29eUAhgM9AK9KSGwufb5wz3GDy4zXkexca5R2
   qK9mQF7yWGUqgkeAAvzRGf4esJmObr4dKHagz86JcYbgUDHWdJyBKP7mt
   by3TaBG03pfhjgplEYdvkVQT0QAvATduqBACnG1rUhhk7aXXl4aqxX1q2
   MAs/J93RVQgAjZXCajZWE1YwAik+fk2BoI4OGvtlyCq50Dvz7nRYllxy5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="425533946"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200";
   d="scan'208";a="425533946"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 07:42:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="891069714"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200";
   d="scan'208";a="891069714"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 28 Jun 2023 07:42:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1qEWNi-000coK-0e;
	Wed, 28 Jun 2023 17:42:54 +0300
Date: Wed, 28 Jun 2023 17:42:53 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [RFC PATCH 4/8] ALSA: hda/i915: Update PCI IDs
Message-ID: <ZJxG7YRroqi6kiyz@smile.fi.intel.com>
References: <20230628205135.517241-1-amadeuszx.slawinski@linux.intel.com>
 <20230628205135.517241-5-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230628205135.517241-5-amadeuszx.slawinski@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: FSH7ADNPBZFO4GUJTIZRQC6GY4YHBX2G
X-Message-ID-Hash: FSH7ADNPBZFO4GUJTIZRQC6GY4YHBX2G
X-MailFrom: andriy.shevchenko@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FSH7ADNPBZFO4GUJTIZRQC6GY4YHBX2G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 28, 2023 at 10:51:31PM +0200, Amadeusz Sławiński wrote:
> Use PCI device IDs from pci_ids.h header

Missing period at the end.

...

> -#define IS_HSW_CONTROLLER(pci) (((pci)->device == 0x0a0c) || \
> -				((pci)->device == 0x0c0c) || \
> -				((pci)->device == 0x0d0c) || \
> -				((pci)->device == 0x160c))
> +#define IS_HSW_CONTROLLER(pci) (((pci)->device == PCI_DEVICE_ID_INTEL_HDA_HSW_0) || \
> +				((pci)->device == PCI_DEVICE_ID_INTEL_HDA_HSW_2) || \
> +				((pci)->device == PCI_DEVICE_ID_INTEL_HDA_HSW_3) || \
> +				((pci)->device == PCI_DEVICE_ID_INTEL_HDA_BDW))

The very same macro under different name appeared in the previous patch.
Am I correct? Perhaps go further and first move it somewhere to be available
for both?

-- 
With Best Regards,
Andy Shevchenko


