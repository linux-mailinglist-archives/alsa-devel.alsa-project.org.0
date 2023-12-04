Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4212803AA3
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 17:44:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A4CA7F4;
	Mon,  4 Dec 2023 17:44:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A4CA7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701708296;
	bh=8gQdgndpZFQZb2gJqlOJ/xwgQA+emZiGmAjbrIpj5Xs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=irjVu9iaBl+By9jWT/oZsjxwiFWwFPw1us6E/pV3EGNio1i2V/tQx2zrolOVFQzOl
	 pnh1ThOmOAjxVV59peE6WTxqcWUEPN23AOVID0AruJ7ywcpftFfhNwHLBfABWT4zgQ
	 b7ay0ME3zF92lT62vntf6P057dLo7CkxolDbTnBE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D8E2F80563; Mon,  4 Dec 2023 17:44:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7721F8056F;
	Mon,  4 Dec 2023 17:44:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 068EBF8024E; Mon,  4 Dec 2023 17:44:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F2A2F800AC
	for <alsa-devel@alsa-project.org>; Mon,  4 Dec 2023 17:44:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F2A2F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VIbT0yR6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701708256; x=1733244256;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8gQdgndpZFQZb2gJqlOJ/xwgQA+emZiGmAjbrIpj5Xs=;
  b=VIbT0yR6qndzf7VFlIatkK/LcuO9qASLwEu/yRcXqf/Lbhi3oKgDXKil
   i//JpPaOUXMZPPf2szpndmt7F+Q4dD1Zl9RzRZQb0mgEnkoCSTGwY4DGF
   aHpo/5YByOO/ZHhf8H+o1qGPrZBS87Tf5hN9a0/vNa8yma+5rAhKoLbVl
   g8OeYGtQ7dUBXU8/1MinV6jzKFxKy3HNs4dAKejH2oPuABjdNH2Gvj84s
   pEQHr+NLdcfbwtuXAAY8QkPPkH55NCSLZRv2pB8HJsSMln43ZY5s0sTzJ
   xMmALCPs3Sa4VPOwGUQ4+XXXd9r/WVCRHPy/Gomzh/QEJ75JQr0/XuOCP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="12476129"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600";
   d="scan'208";a="12476129"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 08:44:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="836641461"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600";
   d="scan'208";a="836641461"
Received: from sdneilso-mobl1.amr.corp.intel.com (HELO [10.212.147.197])
 ([10.212.147.197])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 08:44:09 -0800
Message-ID: <041f60ab-a90a-4654-afd2-c2a296a25c46@linux.intel.com>
Date: Mon, 4 Dec 2023 10:44:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ASoC: Intel: soc-acpi-intel-tgl-match: add cs42l43 and
 cs35l56 support
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com
Cc: kai.vehmanen@linux.intel.com, cezary.rojewski@intel.com,
 ranjani.sridharan@linux.intel.com, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20231204135614.2169624-1-rf@opensource.cirrus.com>
 <8510b464-9352-480d-88cf-857597e16cbc@linux.intel.com>
 <f2dec209-6bc7-49ab-9dff-57a2ca4efb03@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <f2dec209-6bc7-49ab-9dff-57a2ca4efb03@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JKNHO5E4XSYX6Z7RCV6KSM32AZ6HVJKG
X-Message-ID-Hash: JKNHO5E4XSYX6Z7RCV6KSM32AZ6HVJKG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JKNHO5E4XSYX6Z7RCV6KSM32AZ6HVJKG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>> Don't we need the same change of name_prefix for
>> soc-acpi-intel-mtl-match.c? I see this in the existing code:
>>
> 
> The chain that Peter sent only has CS35L56 added to tgl-match.
> 
> I've checked the history of mtl-match and the patch that added CS35L56
> there was not cc'd to any cirrus.com email address so we didn't notice
> it. Otherwise we would have picked this up earlier. alsa-devel is noisy.
> 
> I haven't got a MTL platform to test on but I can send a separate patch
> to change mtl-match if you are happy with this prefix change.

That would be nice, best to align on all platforms and use the same the
same prefix.
