Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D257688766F
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Mar 2024 02:43:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C644218F;
	Sat, 23 Mar 2024 02:43:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C644218F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711158217;
	bh=kmA52/Y1gBrszvKZJP1S20hNrjScCZmCd2ui3kkG0x4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sOMM15HHFa3KbdaFx5dC9ppgg/QdC5M14OIsEM85gOeyr8+Xk09b6XeaJJ4XG0zBw
	 2/M0cN2yfpiz5ZxpE7Gp3nLkhUpIlmB0JOF2N0W6nDUSRHBDJUzdF3Ou4CZpBQ4Xs2
	 avvA5CGqSwQdrwyGaYeXenWtsmekBlblYND2qSRg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31DC1F805C5; Sat, 23 Mar 2024 02:42:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9420DF805C2;
	Sat, 23 Mar 2024 02:42:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28382F805B0; Sat, 23 Mar 2024 02:42:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F037F805AD
	for <alsa-devel@alsa-project.org>; Sat, 23 Mar 2024 02:42:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F037F805AD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dPa66BYP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711158170; x=1742694170;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=kmA52/Y1gBrszvKZJP1S20hNrjScCZmCd2ui3kkG0x4=;
  b=dPa66BYPLNhxdzfeZLJ3STRy8vksRaXrT54RBkBd9mFQwwx85sGKoWBP
   p1dLW3cWUOnzRa0PVnh8z5Gt7Ol4tRxhyxdgwjeqtCKCmvaY+eZwPu87N
   Kt7HSmAw2Vl3uzQcmUi68t6T32Nfipsf/Vs1ttMKNkirnkCwhW8HdY25I
   WH5u9NixaAo2ZuLcCJpTaozmEIMoliI4fUm1OjtOco6uHI5DOZ9ykmrab
   iAk1knhCIDK8byGOsSyO/oLZJxz7OAIe90fzEMexXyoaYzSPNkMyyph9i
   YZ9VLBgvL9Wmw2/rGdvoGf6mEUFERNBcwzvdxUTcNGF9Wm/DTpB5X74lO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6434662"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000";
   d="scan'208";a="6434662"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 18:42:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000";
   d="scan'208";a="19636662"
Received: from ajbawden-mobl1.amr.corp.intel.com (HELO [10.212.109.118])
 ([10.212.109.118])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 18:42:44 -0700
Message-ID: <2089e703-62b9-4aef-9722-488fe14d4546@linux.intel.com>
Date: Fri, 22 Mar 2024 20:42:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] ASoC: topology: Do not ignore route checks when
 parsing graphs
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, tiwai@suse.com,
 perex@perex.cz, amadeuszx.slawinski@linux.intel.com, hdegoede@redhat.com
References: <20240308090502.2136760-1-cezary.rojewski@intel.com>
 <20240308090502.2136760-3-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240308090502.2136760-3-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: S3KQIDVFT2K45AC7CNDJ4PS73ASF4PCQ
X-Message-ID-Hash: S3KQIDVFT2K45AC7CNDJ4PS73ASF4PCQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S3KQIDVFT2K45AC7CNDJ4PS73ASF4PCQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/8/24 03:04, Cezary Rojewski wrote:
> One of the framework responsibilities is to ensure that the enumerated
> DPCMs are valid i.e.: a valid BE is connected to a valid FE DAI. While
> the are checks in soc-core.c and soc-pcm.c that verify this, a component
> driver may attempt to workaround this by loading an invalid graph
> through the topology file.
> 
> Be strict and fail topology loading when invalid graph is encountered.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
