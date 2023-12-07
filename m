Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F327880966C
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Dec 2023 00:07:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F00DA4A;
	Fri,  8 Dec 2023 00:07:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F00DA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701990460;
	bh=kAl17usOA5d6GBSeFljpNfCwDDGWkVTVlMIetvdF7kk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eNUwpwBxlQzzGWIGezBxaOOpQb/+jZ7ddl5YZR5fP8qvXfS/fogvQFS8vQ0EkMCTC
	 Rxp9uLZk3Y6d0MswAVhNf1uALXcmWwllotR7DT0xI0AgKByFVImPoAvAh0qCtGsrcc
	 5CZMXLP5v6bXcAvYUQQvV90fc1gX9x6pL4X8BZgc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79018F80564; Fri,  8 Dec 2023 00:07:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5969EF80570;
	Fri,  8 Dec 2023 00:07:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76890F8024E; Fri,  8 Dec 2023 00:07:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2E3DF800F5
	for <alsa-devel@alsa-project.org>; Fri,  8 Dec 2023 00:06:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2E3DF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LKdpEiVi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701990418; x=1733526418;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=kAl17usOA5d6GBSeFljpNfCwDDGWkVTVlMIetvdF7kk=;
  b=LKdpEiViaL7dkMayqHHLKJ4ySCr8z+yBXAvYkjVAxhCysQ9Dmw4evs1t
   gyJFPMiZMh3PmHFIGrRSOZOH/rqmSpQTIij2UxqxpmzCAj4HKSPvRaMmI
   TEsF2h+ozQ+ck/5aleMso2cXogQtYjQ5oudkMjcIGEzXxpHQfTb36EyTb
   HHpb/vioECg7JMP4DKJTYBgq6EFD+Q9Qlziu3PtKwUjcQdg4yl9DsSQuE
   AuWsSfSJbPA16PZ8FCnyOzWiHyzyPFBQ+4ibYziQPfcCRD0jgz89nJtOb
   7/bH6f0bx6hlvKI2FCsOo1zk8c4JG3mJcrom2BPiWzACh/6QdeISdc73e
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="397108960"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="397108960"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 15:06:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="800899041"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="800899041"
Received: from hrcolco-mobl3.amr.corp.intel.com (HELO [10.212.148.159])
 ([10.212.148.159])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 15:06:44 -0800
Message-ID: <ba39f664-595d-4f22-9bee-cb31cbaeaddb@linux.intel.com>
Date: Thu, 7 Dec 2023 17:06:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/16] soundwire/ASoC: speed-up downloads with BTP/BRA
 protocol
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 vinod.koul@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, srinivas.kandagatla@linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 vijendar.mukunda@amd.com, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <eb50a35d-9d77-48c2-ba76-bf5c1c3f1959@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <eb50a35d-9d77-48c2-ba76-bf5c1c3f1959@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UCAICC4YYOVPMVRS7UWHTYYZJV7LFB7V
X-Message-ID-Hash: UCAICC4YYOVPMVRS7UWHTYYZJV7LFB7V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UCAICC4YYOVPMVRS7UWHTYYZJV7LFB7V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/7/23 16:56, Mark Brown wrote:
> On Thu, Dec 07, 2023 at 04:29:28PM -0600, Pierre-Louis Bossart wrote:
> 
>> The MIPI specification and most of the new codecs support the Bulk
>> Transfer Protocol (BTP) and specifically the Bulk Register Access
>> (BRA) configuration. This mode reclaims the 'audio' data space of the
>> SoundWire frame to send firmware/coefficients over the DataPort 0
>> (DP0).
> 
> So the bulk register access is accessing registers that are also visible
> through the one register at at time interface, just faster?

Yes, each frame can transmit a packet with a start address, length and a
bunch of data bytes protected with a CRC. With the default 50x4 frame
size we use, we can send 8 contiguous bytes per frame instead of 1. With
a larger frame you get even more bytes per frame.

Also because we program a large buffer with all the packets
pre-formatted by software, we don't have much software overhead. The
packets are streamed over DMA and inserted in the frame by hardware at
the relevant time. That means waiting for one DMA complete event instead
of dealing with thousands of command/responses with interrupts.

There are limitations though, if the frame is already transmitting audio
data then obviously we have a conflict.
