Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7550485A19B
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Feb 2024 12:04:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6EB1EB6;
	Mon, 19 Feb 2024 12:04:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6EB1EB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708340690;
	bh=FYHwUjv0CBOVE/UvV6qkWI5k+uNh+6/RQIoNRoiJaqg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jfwTi+/zBX66ZyUNfJusjzcQO25BwJsgE5k+lX19cHt9BNFFilCBt0eUdrz65wRaF
	 2yQQ7goe3fDVxpfurDqJvUw+BAPmK9BDCyMnBNk/TVRQEvF+HKW71XPNQso2SuZagg
	 OoMdL56F4kFdjKaQelq4vEwQhs4c58ryCbDhVQwM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36160F805A1; Mon, 19 Feb 2024 12:04:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01472F8059F;
	Mon, 19 Feb 2024 12:04:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4193FF80496; Mon, 19 Feb 2024 12:02:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C22B3F800EE
	for <alsa-devel@alsa-project.org>; Mon, 19 Feb 2024 12:02:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C22B3F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=E1N8fHm9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708340522; x=1739876522;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FYHwUjv0CBOVE/UvV6qkWI5k+uNh+6/RQIoNRoiJaqg=;
  b=E1N8fHm9Z2s5lnHOsWBV2Su16BGiqc4LJ4h7uJIpYCs/rWJtphHxl3jn
   OZyIxBbyseUW2TdbiaVmq7QLw54tKk1/3u2GjFU8iO5CKQVHmqVzqWbJf
   bzvcCbaNJFVKKF0GZ+rR0SH5zpYKwwBYHgO88esod2tGmzkccv5N7GbvG
   y11jm9nTG5LyowYchH0Ypf4K/ZtsZxA0P7JrvtJCSqujkrkodKfbrzI29
   4+/lwt76IlJuRDWHs+X+TXSMKxlN2Gv0jCBfZCBMgo3aWWn4CBj3ooPvv
   2WcRcMc3m9FE5H081I4dwH/vLPpHcJRqNGUJJYFa3p4ZfX/+q4aN2P3lZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2276111"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000";
   d="scan'208";a="2276111"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 03:01:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="936276332"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000";
   d="scan'208";a="936276332"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199])
 ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 19 Feb 2024 03:01:53 -0800
Message-ID: <d82c8955-6793-7544-0013-1033abd9f1e9@linux.intel.com>
Date: Mon, 19 Feb 2024 13:03:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v17 00/51] Introduce QC USB SND audio offloading support
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, lgirdwood@gmail.com, andersson@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Thinh.Nguyen@synopsys.com,
 broonie@kernel.org, bgoswami@quicinc.com, tiwai@suse.com,
 robh+dt@kernel.org, konrad.dybcio@linaro.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, alsa-devel@alsa-project.org
References: <20240217001017.29969-1-quic_wcheng@quicinc.com>
 <2024021754-unengaged-saggy-6ab1@gregkh>
 <96ab6033-2cb9-daa7-ddad-090138896739@linux.intel.com>
 <2024021922-privatize-runt-495e@gregkh>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <2024021922-privatize-runt-495e@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: O6XQTMHUROMTUYDDWUZN4THHZTZZSGVJ
X-Message-ID-Hash: O6XQTMHUROMTUYDDWUZN4THHZTZZSGVJ
X-MailFrom: mathias.nyman@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O6XQTMHUROMTUYDDWUZN4THHZTZZSGVJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

>>
>> Patch 10/10 is based on an old POC patch by me, but it's heavily modified.
>>
>> It looks like it does a few minor things that are not optimal, like extra
>> spinlock/unlock, and wait_for_completion_timeout() with magical timeout value.
>> I haven't tested this version, but I guess any fixes or cleanups can be done
>> later on top of it.
> 
> I can revert it now if you want, just let me know.
> 

Maybe reverting it would be better yes.

Thanks
Mathias
