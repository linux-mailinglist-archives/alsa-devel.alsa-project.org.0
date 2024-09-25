Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FC598620C
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2024 17:06:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 463C2E80;
	Wed, 25 Sep 2024 17:06:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 463C2E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727276818;
	bh=oUEDKfr3g2+OPN66lqRdCh/RebgOM2ORzt3yS88puJc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vtHHhfJiRDMsOFj5NHMEobGHpHzousIuBezmths43XZ67Y60QyxNcC/K39GwNm8bs
	 1RJYFQFkATUuXFOtHeoLU3Rv0+IOzFw+4hnLlsJINRmpTxSFSBR9SMW4ntcK+2Me+C
	 4tumngSw97aldaHdLi11A2sgEE7Oxg45mWzeuRzE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E3D2F8064C; Wed, 25 Sep 2024 17:05:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2390F8063D;
	Wed, 25 Sep 2024 17:05:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED3C3F80632; Wed, 25 Sep 2024 17:05:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8D39F80633
	for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2024 17:05:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8D39F80633
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ma5zlO1I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727276733; x=1758812733;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oUEDKfr3g2+OPN66lqRdCh/RebgOM2ORzt3yS88puJc=;
  b=Ma5zlO1IdYSn9+wbCwqaLuTP/MbvIbjo9S+QNwLPV27X/CmwPY/iXv/C
   DJJJgxHvx/q8YbW4Und12Un4BfwMBVD8RdznaQuArOpabUNTqx/s4xWp8
   cVQKNCeuCd7uZREeiAy1EJVfEsVWP8J1KFjrXg5rzcwcOglweEQ3gWEwk
   6YoRkynk8l2xFYgzoN45zOFWdsI0/J8rkQxWbCavcqy37e3fiS46b8LId
   Y3GPkdYgFJ4Bfku32xJax/B4xvT2YGPtgdCQubeT+tH1JTxNg8RBwz2Sz
   nLzG9Bz1SFOOTElLYO2SaGv0TZChpjTtT0VqTtfhy3/G8qs9dFD57iuxT
   g==;
X-CSE-ConnectionGUID: vJY6GeEfSKOhSJa/HT1AkQ==
X-CSE-MsgGUID: wgJZ4PR1S1W3eIvorpfWVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26482982"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600";
   d="scan'208";a="26482982"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 08:05:31 -0700
X-CSE-ConnectionGUID: UJBsXjh0QG6gd/Q+NIpkLw==
X-CSE-MsgGUID: Q21AA1FjTgeEkddoyjPTvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600";
   d="scan'208";a="76317772"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.246.30])
 ([10.245.246.30])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 08:05:26 -0700
Message-ID: <4552c7fb-2c59-485d-af67-0bf36d2424e5@linux.intel.com>
Date: Wed, 25 Sep 2024 17:04:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v28 00/32] Introduce QC USB SND audio offloading support
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
References: <20240925010000.2231406-1-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240925010000.2231406-1-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4A4XTS5BMAM2DZ3MIA3FFFJXXHSJHF23
X-Message-ID-Hash: 4A4XTS5BMAM2DZ3MIA3FFFJXXHSJHF23
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4A4XTS5BMAM2DZ3MIA3FFFJXXHSJHF23/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Overall the patchset is much improved but you still have misleading
information, see e.g. the rather poor description of error codes for the
update_offload_route() helper.

I hope other reviewers step-in to cover this large set of patches...
Cheers,
-Pierre
