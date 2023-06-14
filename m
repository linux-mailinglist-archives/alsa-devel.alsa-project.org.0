Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEE472F17D
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 03:17:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4224823;
	Wed, 14 Jun 2023 03:16:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4224823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686705452;
	bh=Q7IVuU8ZRNKIsAkyDdRpF7tiAMQN0jg9pxqaxOuK4D0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dRlK70vrfqaWJfNiB2uFsHzEELjb3RVmQkvyrKbqFSW7okzc9za+yJujFU67/DJr5
	 QEqdD+sPn7DFfQExMIsQagKhgXCaEhxuXQN2p4C7yNFfmPP0ZYDK9QVKikSfoX0WZm
	 VX0vjkO6amyFDb90DtIPL1iuLjIBfGre7Q9pPBxg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24008F8052E; Wed, 14 Jun 2023 03:16:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B6E4F80132;
	Wed, 14 Jun 2023 03:16:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DE67F80149; Wed, 14 Jun 2023 03:16:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47361F800BA
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 03:16:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47361F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=f7xha7T5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686705363; x=1718241363;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Q7IVuU8ZRNKIsAkyDdRpF7tiAMQN0jg9pxqaxOuK4D0=;
  b=f7xha7T5Pl5CrF3fBJtgVY4b5jmctbiDEyJIuwop1nHtIkns7gFeodzh
   pO83T17reEUeZCyy02XJd7IzYEmXPq+i/T06f1ZiWTWJs6YSsjQsAT8Cz
   pV2/5jWqN/ZKNEefUqfRqBqViU0KI9QBoR8BEorM7fcwdT6LzhQGJlkDX
   DhT9jaEbqY/7ybwoZ/kzft1KDTDaXGCBxxOSWWVbVZWA8Q1+b4/YXjLjs
   vIdw5VXRQa1faXVh6bTCn9CBlf56B0+rtzwAReAf0KAOEIpY0ncE/sgsi
   KqV4O5mfU3HCZromATIpsoJd52v6XEfznX56rlh3ezq+LKRa4lUj+4gDl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="444864894"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400";
   d="scan'208";a="444864894"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 18:15:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="781904817"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400";
   d="scan'208";a="781904817"
Received: from yungchua-mobl2.ccr.corp.intel.com (HELO [10.92.2.114])
 ([10.92.2.114])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 18:15:49 -0700
Message-ID: <7af52548-a87a-dd18-5f28-6dc0f029e7ce@linux.intel.com>
Date: Wed, 14 Jun 2023 09:15:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/8] ASoC: Use the maple tree register cache for RealTek
 SoundWire CODECs
To: Mark Brown <broonie@kernel.org>, Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org
References: <20230609-asoc-rt-sdw-maple-v1-0-85ee50c93905@kernel.org>
Content-Language: en-US
From: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20230609-asoc-rt-sdw-maple-v1-0-85ee50c93905@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: EJ73O332UIYZYRO7T5TM7MWAIVUBAGY3
X-Message-ID-Hash: EJ73O332UIYZYRO7T5TM7MWAIVUBAGY3
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EJ73O332UIYZYRO7T5TM7MWAIVUBAGY3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 6/10/2023 10:27 PM, Mark Brown wrote:
> The RealTek SoundWire CODECs don't support bulk register operations so
> they gain no advantage from using the rbtree cache, convert them to use
> the maple tree cache instead - it is more modern.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Tested on a Dell laptop with rt1316, rt711-sdca, and rt715-sdca.

Tested-by: Bard Liao <yung-chuan.liao@linux.intel.com>

> ---
> Mark Brown (8):
>        ASoC: rt700: Use maple tree register cache
>        ASoC: rt711: Use maple tree register cache
>        ASoC: rt712: Use maple tree register cache
>        ASoC: rt715: Use maple tree register cache
>        ASoC: rt722: Use maple tree register cache
>        ASoC: rt1308: Use maple tree register cache
>        ASoC: rt1316: Use maple tree register cache
>        ASoC: rt1318: Use maple tree register cache
>
>   sound/soc/codecs/rt1308-sdw.c      | 2 +-
>   sound/soc/codecs/rt1316-sdw.c      | 2 +-
>   sound/soc/codecs/rt1318-sdw.c      | 2 +-
>   sound/soc/codecs/rt700-sdw.c       | 2 +-
>   sound/soc/codecs/rt711-sdca-sdw.c  | 4 ++--
>   sound/soc/codecs/rt711-sdw.c       | 2 +-
>   sound/soc/codecs/rt712-sdca-dmic.c | 4 ++--
>   sound/soc/codecs/rt712-sdca-sdw.c  | 4 ++--
>   sound/soc/codecs/rt715-sdca-sdw.c  | 4 ++--
>   sound/soc/codecs/rt722-sdca-sdw.c  | 4 ++--
>   10 files changed, 15 insertions(+), 15 deletions(-)
> ---
> base-commit: 08e6c4bb17087584261c4aff555d32fc1c620b81
> change-id: 20230609-asoc-rt-sdw-maple-fa6714ac4318
>
> Best regards,
