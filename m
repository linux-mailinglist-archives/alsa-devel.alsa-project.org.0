Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA496965E16
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2024 12:12:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E842846;
	Fri, 30 Aug 2024 12:12:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E842846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725012732;
	bh=mzpoRm6pkWleBrw0wleX4p6vApAgUsGuMXqYcVu4waM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=isoEl7Ek539jav7Jmoc5sMu4/Iz5/wBmRB4XX3JW+pwqRfMxeFAWSM+URYe9xaq1N
	 Q0jN8gGF7PIAePuDSUC0zVqVjlnvPd+KXWt9ujKev9X45ZrU8KHKDefI6ZxAUPFeru
	 cj5+INAeXB84d6cc+knp+0YdvW5QCcrOJ+bqmf/c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 664EAF80589; Fri, 30 Aug 2024 12:11:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7584AF8058C;
	Fri, 30 Aug 2024 12:11:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE48FF80518; Fri, 30 Aug 2024 12:11:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 724E5F80087
	for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2024 12:11:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 724E5F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KmyjC9jt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012684; x=1756548684;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mzpoRm6pkWleBrw0wleX4p6vApAgUsGuMXqYcVu4waM=;
  b=KmyjC9jtYDnKRnb/MctbW3m1iKzkGOEAAKL/mkZIMC8kJITVJmtcZNNM
   Hqh6BHaeQDg+hLRy32FPeMKOY5p6gdQ+M9+QBQ1zGM3YYobVSt1QVdmHq
   qOgFCizh1ZTT9yudmF80MkAAmkEurTX+PQ1Qoh58ar27E2q9ZOmfESbm4
   DZ8cCoh5gouYPWDWmbvWlPeA8gKxRacNKyRljgO1g2Vsua4YVdBgXGZfG
   baQz6CoF1nSkdSa+VkxLzzaVeMz012ZnIK2MVzkXx4QJOE8DhMqqkTRwv
   cHVTYSNrSzRmVrAJ8dm2c22Q/gVOOnw+jyo3ypzkKqLYHRY8B8Lji9eei
   Q==;
X-CSE-ConnectionGUID: Z/w/Rtz9Qcy+rQE+JmxPNQ==
X-CSE-MsgGUID: S7YGYvumTI2NPt11u2tjhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34218679"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="34218679"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:11:18 -0700
X-CSE-ConnectionGUID: UdDa5sGcRTmh0+HQzTNJ/A==
X-CSE-MsgGUID: d92XtbghTcSNVx17hlh1Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="63481267"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101])
 ([10.245.246.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:11:12 -0700
Message-ID: <ec7d01d4-7887-4a61-9387-9669762c35aa@linux.intel.com>
Date: Fri, 30 Aug 2024 10:28:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 09/33] ALSA: Add USB audio device jack type
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, robh@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, alsa-devel@alsa-project.org
References: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
 <20240829194105.1504814-10-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-10-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KN6G6JUSYZCCGNNODXK6QYV75KHEGMGQ
X-Message-ID-Hash: KN6G6JUSYZCCGNNODXK6QYV75KHEGMGQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KN6G6JUSYZCCGNNODXK6QYV75KHEGMGQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/29/24 21:40, Wesley Cheng wrote:
> Add an USB jack type, in order to support notifying of a valid USB audio
> device.  Since USB audio devices can have a slew of different
> configurations that reach beyond the basic headset and headphone use cases,
> classify these devices differently.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

