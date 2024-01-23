Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6672483890E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jan 2024 09:34:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF0C63E8;
	Tue, 23 Jan 2024 09:34:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF0C63E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705998893;
	bh=ZWGRlXBFfPFOmCTbF8+Gg5VQTsULZlZZ5aaqessVmL4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W9m9V/T3ni40wMytfS3tiU2FTAGvaal3HeQsSYvfPPPtxLvEmSqZ/I2izkQxDqtHR
	 YIPfGmPKyOWPxTEJWaXZAhPWUY65Yr+pU0ncl3iH7+gK2ziOWuPPt8lS2g3u7jDTOL
	 4d44SXOSzMWH8seL++XJw9lyoeYFsG5GcoMCHMzE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5C80F8059F; Tue, 23 Jan 2024 09:34:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5030F80587;
	Tue, 23 Jan 2024 09:34:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C65FEF8028D; Tue, 23 Jan 2024 09:34:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 156F2F8003A
	for <alsa-devel@alsa-project.org>; Tue, 23 Jan 2024 09:34:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 156F2F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IE1UC0pv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705998852; x=1737534852;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ZWGRlXBFfPFOmCTbF8+Gg5VQTsULZlZZ5aaqessVmL4=;
  b=IE1UC0pvYeExMDfxLqiwy0sWfIqnwmnAv8YWbQo6FDwL31w5uOuw9v5N
   ndEfkTyb4mL/5qprNp0rphCdViNVOeW9xMYZFj+n0uLIA6RRKotAxIoei
   mtmNrOFRXF0kSEVhkQMWMVerfTuB4on8VDlMWrpCZsWI97AbTgC3WHexi
   yRqRj/tmVvKjj0YE6EMwDSkqTtPbLE7+lq97wLx7xKJYpOFuqt6GPj6x+
   tHp0ULubX3fAtWKy/Msy8ZYR/u/kJm8il0V1S/C3yvkpFE8yMcbb0IQL+
   WsOaquRoRVpUAkXNl2pf7JhMa7KYJr6aC4902JgDu4ILeAFQjpBsllznF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="398604202"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400";
   d="scan'208";a="398604202"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 00:34:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="909223366"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400";
   d="scan'208";a="909223366"
Received: from hle1-mobl.amr.corp.intel.com (HELO [10.254.116.113])
 ([10.254.116.113])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 00:34:02 -0800
Message-ID: <30f022a5-7ab1-4b2d-b4c1-5a209ec67c5b@linux.intel.com>
Date: Tue, 23 Jan 2024 09:34:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: Intel: mtl-match: Add cs42l43_l0 cs35l56_l23 for
 MTL
Content-Language: en-US
To: Maciej Strozek <mstrozek@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240122151545.69437-1-mstrozek@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240122151545.69437-1-mstrozek@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HVUU2IXNLCUL5Z2PDNMO5TRXRMLHWODN
X-Message-ID-Hash: HVUU2IXNLCUL5Z2PDNMO5TRXRMLHWODN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HVUU2IXNLCUL5Z2PDNMO5TRXRMLHWODN/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 1/22/24 16:15, Maciej Strozek wrote:

It wouldn't hurt to add a brief commit message describing what the
hardware layout is, specifically how the mics are handled.

It's also best to submit the corresponding machine driver updates at the
same time to check for consistency.


>  	},
> +	{
> +		.link_mask = BIT(0) | BIT(2) | BIT(3),
> +		.links = cs42l43_link0_cs35l56_link2_link3,
> +		.drv_name = "sof_sdw",
> +		.sof_tplg_filename = "sof-mtl-cs42l43-l0-cs35l56-l23.tplg",

was this topology submitted to the SOF tree? I don't see it, usually we
review topology/acpi/machine stuff together to avoid disconnects.

> +	},
>  	{
>  		.link_mask = GENMASK(2, 0),
>  		.links = mtl_cs42l43_cs35l56,
> --
> 2.34.1
> 
