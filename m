Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3236B38FD
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 09:41:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C4D414ED;
	Fri, 10 Mar 2023 09:40:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C4D414ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678437688;
	bh=9aag2BFnG53J7wZ2j5UirQ9ze6TeaSkUxaPLa0nh+8o=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=c9txfLG7gEroIdX9woV6oYwQxuyrnQIll1hFHHZ1HyhrzY/B/acF3fIvBu2iRlkOp
	 jXWKEQjUCP5SGQG8RvRBd39dC/h/gEI+EwOhSdX/drYopdY113wEEJS2+lxgZxjOyf
	 koCQODf27sbHFs7ls3IWaeqvrhnGfbcv15W9n99s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ABD01F80236;
	Fri, 10 Mar 2023 09:40:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3B6AF8042F; Fri, 10 Mar 2023 09:40:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,LOCALPART_IN_SUBJECT,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83D23F8007E
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 09:40:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83D23F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IBmDgmm0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678437628; x=1709973628;
  h=message-id:date:mime-version:subject:to:references:cc:
   from:in-reply-to:content-transfer-encoding;
  bh=9aag2BFnG53J7wZ2j5UirQ9ze6TeaSkUxaPLa0nh+8o=;
  b=IBmDgmm0HzAts9cUSLiV3JwVP6W+J0ObPD8zX06FeiYeXaQ1sxSpBkb3
   adpLiGAOQuG4AfKYp5zN9ARVQXP92pFPttoMOo3dSQ8hFb/7Tyo5HYIuD
   X6fG/w1rwhouzsyBBTXkpgIdIXodu8Yz1qiBfz4FO6YCfIad1HG5xtTZX
   OsTcqeVG4tKtmo/PUgLqA1b/jH03Y6LNx8BlsYpHmUlRMthe9dPmfr4bO
   MVQ2mg+kZhJXuSbL2cNEIE2UxyT8hTj5SyfKvWrGRAVhvK8pkMPHitNpL
   9YL3QESrT1KAoEMEHy15CfYndzEkujycEPjdfEiZtA2jvwAnNlWUgsJQX
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="339044860"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400";
   d="scan'208";a="339044860"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 00:40:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="671010129"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400";
   d="scan'208";a="671010129"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 00:40:24 -0800
Message-ID: <1232949a-0efd-9814-5587-bb5e0417bf1d@linux.intel.com>
Date: Fri, 10 Mar 2023 09:40:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: alsa-devel - message mangling?
Content-Language: en-US
To: alsa-devel@alsa-project.org
References: <20230307103022.1007420-1-claudiu.beznea@microchip.com>
 <167818863631.26.6699494131684260973@mailman-core.alsa-project.org>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: 
 <167818863631.26.6699494131684260973@mailman-core.alsa-project.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: P4IAB2343YVQLYJG72U44RCEWKSTIHTH
X-Message-ID-Hash: P4IAB2343YVQLYJG72U44RCEWKSTIHTH
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P4IAB2343YVQLYJG72U44RCEWKSTIHTH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 3/7/2023 12:30 PM, Charles Keepax via Alsa-devel wrote:

Hi Jaroslav,

any chance that you can take a look at mailing list settings, it seems 
like from few days some messages to mailing list come as "Someone via 
Alsa-devel", like in top line, also content is attached as messages, so 
when I clicked reply it didn't quote the email, as message body is 
"empty", because all content is in attachment. You can also see it on 
archives:
https://lore.kernel.org/alsa-devel/167843595709.26.931771458197876919@mailman-core.alsa-project.org/T/#m543a4c13e2f291684e54807a10ba638d906006de

Notice that message came from:
From: Charles Keepax via Alsa-devel @ 2023-03-07 11:30 UTC
and then that content is in attachment:
[-- Attachment #0: Type: message/rfc822, Size: 6313 bytes --]
again showing the header this time without "via Alsa-devel" line:
From: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Amadeusz
