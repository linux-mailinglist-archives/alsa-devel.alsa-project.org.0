Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1805775F05
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 14:31:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44706823;
	Wed,  9 Aug 2023 14:31:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44706823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691584312;
	bh=ldHVhGQOmWxZpu2kQMhlvAyhJOT8MmEBUG8jSfzwNsE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A2RG1WXcKiRymJRXgKrqif86T5hI8Kmx4yo8FhCGLSLTZz54UHw0O481WGZYb/TxQ
	 N7WiTpM/1uCdkTzXnokUdp7JNNCUCAZADi4V57SP3Vpu/NGv1M/eF6oelHLQA/94Pe
	 e7hIPZWJJxI+H2gf3T+P797h/8ypFi4/XnfnVVWA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9375EF80558; Wed,  9 Aug 2023 14:31:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01888F80116;
	Wed,  9 Aug 2023 14:31:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 987B1F80134; Wed,  9 Aug 2023 14:30:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 697F0F800FE
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 14:30:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 697F0F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=J0rVBfoB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691584249; x=1723120249;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ldHVhGQOmWxZpu2kQMhlvAyhJOT8MmEBUG8jSfzwNsE=;
  b=J0rVBfoBzwjy7UNlFUnFnOgit0iv2dVe8KqrH+co8nTNq8EEf/myOKd7
   tv1MGMA3tStCb0FithX/Nf5v4w3TcEbEeNNd7vE63Zr/s6CrrKZO8wPCG
   DBSHwuCNiwYelWskFQMZcNPlpqeZfYK/5ZHy2DHBxcrJUDHzzPK2EpLz7
   hHjToaXXuanZRjJTnc56He405H+IpKzHEqAzX0olb/EZZr9IRl/iNWHs1
   OJBzHNMkun1KJiXmB0HVce893JDqEwuc4r3D1GIOa3R8IeWCDD9EJktXr
   /ov6Zty6rab1JHGCapG0qJ8kuRSVTWNhBI0KWF5CmAcs9NAe9n5/JH1Wr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="402073338"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200";
   d="scan'208";a="402073338"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 05:30:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="978369743"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200";
   d="scan'208";a="978369743"
Received: from hsyrja-mobl.ger.corp.intel.com (HELO [10.251.210.72])
 ([10.251.210.72])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 05:30:17 -0700
Message-ID: <964ac79b-b56b-4cfb-8b52-2deb03abb46b@linux.intel.com>
Date: Wed, 9 Aug 2023 15:31:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Update the basecfg for copier
 earlier
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, adrian.bonislawski@intel.com,
 yung-chuan.liao@linux.intel.com, chao.song@linux.intel.com
References: <20230809092343.12666-1-peter.ujfalusi@linux.intel.com>
 <cacbebb1-8c0c-4a4a-82df-00e932df3e7b@sirena.org.uk>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <cacbebb1-8c0c-4a4a-82df-00e932df3e7b@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: T2EBWKBHXTV5OZUPTAJBNQDMDWH3REQJ
X-Message-ID-Hash: T2EBWKBHXTV5OZUPTAJBNQDMDWH3REQJ
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T2EBWKBHXTV5OZUPTAJBNQDMDWH3REQJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 09/08/2023 14:52, Mark Brown wrote:
> On Wed, Aug 09, 2023 at 12:23:43PM +0300, Peter Ujfalusi wrote:
>> The sof_ipc4_update_resource_usage() call updates the CPC value in basecfg
>> and it must be done prior to making a copy of the copier configuration
>> for the init message.
>> Other module types do the resource update as last step or in case of a
>> process module at the correct time, before the memcpy.
> 
> This doesn't apply against my for-6.5 branch, please check and resend.

It is generated on top of your -next branch.

I believe it is failing because the for-6.5 does not have this patch:
ef8a29bae82f ("ASoC: SOF: ipc4-topology: restore gateway config length")

Basing this patch for 6.5 will cause conflict with the 6.6 material

0659f81c348 ("ASoC: SOF: ipc4-topology: add DMA config TLV to IPC data")
and it's fix:
ef8a29bae82f ("ASoC: SOF: ipc4-topology: restore gateway config length")

If that's OK, then I can re-create the patch or I can send w/o the Fixes
tag to be on top of your -next

-- 
Péter
