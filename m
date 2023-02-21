Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F12E369E55E
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 18:00:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74558E73;
	Tue, 21 Feb 2023 17:59:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74558E73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676998847;
	bh=iqD6VB3dm3m3zjYF1FbGjINgDU1gByjhn5gk1ce92qw=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sGKIKt8lpC5hGagS8ZNgBbqXTaSlSlx3Eq0Gth1X4HfPjh/CIUJmyTRRNcFFH9A78
	 VkA/L+eKLd/QcNgXEpt5obQZ8FRg7rhxFwMUlZlQoX0izSrqpkeMYfwyZQ8zsuLp3h
	 8bxrjf8H6iKNJPr+IJX08GPLkshFpALSSfnfMEUM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC95BF80534;
	Tue, 21 Feb 2023 17:59:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E85FF804FC; Tue, 21 Feb 2023 17:59:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6825DF8025A
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 17:58:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6825DF8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PUAkRnPU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676998731; x=1708534731;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iqD6VB3dm3m3zjYF1FbGjINgDU1gByjhn5gk1ce92qw=;
  b=PUAkRnPUHMOSTn7pgD0wBJzBbqs0qyrHwpRakRzNi2scQ0zw351yeN0e
   vesgSmQKtaNijPboiduzfYAcGyPKlaUfoHYDzigM9V9O+X923alrCS7+W
   AuzznjwlMld2Q2dbPfXTMlVw8XnxrDQUbLw0NQ7lSwQPQ/UbqpwntXVXf
   aWj6SakMgg8JqEP1sKU7CEyLmXqOwkz/L51L3dJSL8nHzN67qJjrTpVvo
   t2VYlD63+Mb/8nWkacS46ZEEId3io3JGmbzuVszxfZpH2bAdtjEL6uMOd
   sZiZxZ4hIKIIf/FP+iv7txsnTpHPVnMoTpBrKIZzYgHiFRAmmTnc8VrWP
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="334884648"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000";
   d="scan'208";a="334884648"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 08:58:37 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="814569100"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000";
   d="scan'208";a="814569100"
Received: from taevough-mobl.amr.corp.intel.com (HELO [10.209.174.213])
 ([10.209.174.213])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 08:58:35 -0800
Message-ID: <c870e74e-5f21-49f1-7bc4-f2211e0cfdd6@linux.intel.com>
Date: Tue, 21 Feb 2023 11:01:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH V3 4/8] soundwire: amd: enable build for AMD SoundWire
 manager driver
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
References: <20230220100418.76754-1-Vijendar.Mukunda@amd.com>
 <20230220100418.76754-5-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230220100418.76754-5-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WCKADUFUQ47XKLHHWNKOLVHUKEW44D7G
X-Message-ID-Hash: WCKADUFUQ47XKLHHWNKOLVHUKEW44D7G
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, amadeuszx.slawinski@linux.intel.com,
 Mario.Limonciello@amd.com, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WCKADUFUQ47XKLHHWNKOLVHUKEW44D7G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2/20/23 05:04, Vijendar Mukunda wrote:
> Enable build for SoundWire manager driver for AMD platforms.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


