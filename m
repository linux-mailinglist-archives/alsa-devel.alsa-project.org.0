Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E89674143D
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 16:50:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F8BD7F4;
	Wed, 28 Jun 2023 16:50:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F8BD7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687963854;
	bh=sruLiv3/xbwyVIj40BdSCpcvE/mBru7v73bQNqR+j/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fZx3BCFB+tUEFhoy5OcFqKykRG9WZobwY8ULaaYLQT7naBkgHgIZYAfiuvwwUFd2y
	 C0vCSMoTL0rQtNJyfNpGceHBHxnzVcAsVCxITdn4Ij1+UUdUv+0dbmZq3DQmHWi2WV
	 wtj8aRr4CI1WfCljBJ2i8x3G5gHiftfI8ewPptCs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E90BF8027B; Wed, 28 Jun 2023 16:49:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B297DF80212;
	Wed, 28 Jun 2023 16:49:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12DFCF80246; Wed, 28 Jun 2023 16:49:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CBE07F80169
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 16:49:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBE07F80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cyTdxBKD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687963778; x=1719499778;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=sruLiv3/xbwyVIj40BdSCpcvE/mBru7v73bQNqR+j/8=;
  b=cyTdxBKDZ7oJ9rAAMUG71phljmaedJf8ZKH5T6HLDOi4ektyLeUGsJLq
   RdWQNQp9Fgiqhu7BqPFZY2Oy6cPenKfgHmboOAiwPwgQgMhQlACw8Xi+/
   dE9PedJq8P5sdr5OpUYYyxXy8f7V3G05DIGadwrR2BVR/3Zy75nIttYCn
   qHo0hnNW8UoLH+5LE3f0sZ9BlrnocBkT20/xlj3Qodz9xsCf17P+oVxnw
   +BjuvaNQrrH2ZOKt5g7B+c8KEYnqET4jhZJ1C5KlK3kUtaWKwXx1kIXOb
   n1EU2nAY3giF2VOYbDyUzXv58/8SuNiYyj6cf1cQyQEB9NQA2iyE+mUSR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="365326096"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200";
   d="scan'208";a="365326096"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 07:48:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="1047454257"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200";
   d="scan'208";a="1047454257"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jun 2023 07:48:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1qEWSk-000ctL-10;
	Wed, 28 Jun 2023 17:48:06 +0300
Date: Wed, 28 Jun 2023 17:48:06 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [RFC PATCH 5/8] ASoC: Intel: avs: Update PCI ID list
Message-ID: <ZJxIJnIdoxb5CM/B@smile.fi.intel.com>
References: <20230628205135.517241-1-amadeuszx.slawinski@linux.intel.com>
 <20230628205135.517241-6-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230628205135.517241-6-amadeuszx.slawinski@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: Y4CCPIDM2FV63RZG6BRBCWOXJL4KKHZ3
X-Message-ID-Hash: Y4CCPIDM2FV63RZG6BRBCWOXJL4KKHZ3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y4CCPIDM2FV63RZG6BRBCWOXJL4KKHZ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 28, 2023 at 10:51:32PM +0200, Amadeusz Sławiński wrote:
> Use PCI device IDs from pci_ids.h header and while at it change to using
> PCI_DEVICE_DATA macro, to simplify declarations.

PCI_DEVICE_DATA()

-- 
With Best Regards,
Andy Shevchenko


