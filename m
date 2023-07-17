Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD03E75659A
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 15:55:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4B09AE9;
	Mon, 17 Jul 2023 15:54:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4B09AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689602143;
	bh=FrmhMcGq6Yw5RIRrByo036Ctus6slD2drwf6+eTiVSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fIgv6n1NQmtv13sJ7Z26aS7dXfLaxRhPLanXXXLLVy6gXZ8cjg6+VNrTgF08zLwXW
	 JTZv8Mp7i6Dot/1w+jOCRUSyv3ctCdGyramHfTqYBSFVIMMeQA5+P41Vp+Yu2ahTbF
	 IFq1fjxFPtLbNWBu7S0wR/iHC78jOfbfBV6UGoao=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09F57F8053B; Mon, 17 Jul 2023 15:54:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 904FAF8032D;
	Mon, 17 Jul 2023 15:54:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD932F8047D; Mon, 17 Jul 2023 15:54:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3DED3F800D2
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 15:54:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DED3F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=C+CHlg0m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689602085; x=1721138085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=FrmhMcGq6Yw5RIRrByo036Ctus6slD2drwf6+eTiVSs=;
  b=C+CHlg0mL0oDrj2+qX6DNZxX8gKKPFNF+eTbH9OKkxT2EUgKf7adxw4b
   VoEK0+nPj5d/0DWWJh3XXW25t5lCsioDCbu4IoBUeTvrg6bdjZ049eX0n
   yccabE27oGKf4qeaFqcvr59AriMpoPIlbMSGLUt1FXpLyb2Bi9IuWBY7y
   BH3JsP+PrkdJXtWu0bw5TX2LQA2ChEj2Ea1Q1jVGMFnhwlpGYkvvI/sjD
   mVtth2uve8MVXKFylum4UyOFC2b57/wJ48D/DvRZKcHNaPxpwZwRCuCds
   c8tkK23B0uvFCTnJvramadImgR5D3yFd2LbVcqSrvyRKd7xCp+STJ9ssH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="345525867"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200";
   d="scan'208";a="345525867"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 06:54:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="752903299"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200";
   d="scan'208";a="752903299"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 17 Jul 2023 06:54:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1qLOgM-00H3tq-1u;
	Mon, 17 Jul 2023 16:54:34 +0300
Date: Mon, 17 Jul 2023 16:54:34 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 01/15] PCI: Sort Intel PCI IDs by number
Message-ID: <ZLVIGlpoNsr0RRGE@smile.fi.intel.com>
References: <20230717114511.484999-1-amadeuszx.slawinski@linux.intel.com>
 <20230717114511.484999-2-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230717114511.484999-2-amadeuszx.slawinski@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: YCKU7CSVCJ3XKXS4D2PIECENB7KDWIFF
X-Message-ID-Hash: YCKU7CSVCJ3XKXS4D2PIECENB7KDWIFF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YCKU7CSVCJ3XKXS4D2PIECENB7KDWIFF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 17, 2023 at 01:44:57PM +0200, Amadeusz Sławiński wrote:
> Some of the PCI IDs are not sorted correctly, reorder them by growing ID
> number.

Hmm... I don't see a cover letter...

-- 
With Best Regards,
Andy Shevchenko


