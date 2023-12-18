Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9AC818774
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 13:28:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BDE3857;
	Tue, 19 Dec 2023 13:27:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BDE3857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702988884;
	bh=AR/FTncpP3HZDm6f9IH+uJbJm+jxlPJQsQuijcUY4ak=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QCe49iUewrfQm4yIE3ZVYMDbz5APzlVhvpTHc5OOoprOzfgshx8HMqNImnZLPFDAo
	 soCKT52DMyRdNOAnOjmig6lygM93o5AwaMCWEi3tROZqf7IiDBEIBIxpxqm9qyPK9Z
	 9UMR4hyoUCn7BCGTNcX6AeiWSMbGjexVbOmZ4mAA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42AF6F80425; Tue, 19 Dec 2023 13:27:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D503BF8057A;
	Tue, 19 Dec 2023 13:27:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 223F2F80431; Tue, 19 Dec 2023 13:27:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8097F80124
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 13:27:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8097F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=O8beV8by
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702988839; x=1734524839;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=AR/FTncpP3HZDm6f9IH+uJbJm+jxlPJQsQuijcUY4ak=;
  b=O8beV8byr5bfJyNqHa41L6wKU3yT3hRypZ6a6+MiSykCA/in1chqXnPi
   FmYbT45nTACT/bRFOLQtQg/Lga9wH6xsEDRVRHk94+HL0+h1vi8J4KnJp
   sm5SjZrouxiyP/tUjeOEdSJKm33B6UKLJCZbcq0H/a0lCbKihkpc5Qogn
   UIrHAIZn1/xUUxE3ulh3T/ZwNxIRpZGTcGwL9vfH3qPw5HmcjFVdiSmUj
   qtbCE4Hnrfs0C5fyWFuNwq+kRb9SeZPxJM1iO7FHsHuZvql4jBmmZj+bt
   Sbr2tI1fxuZ4Izn8UwP4yTx4Wlzx78S4dnHjqqpe5FsZw7fzoT7qkkzi6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="14338230"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600";
   d="scan'208";a="14338230"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 04:27:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="1107335078"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600";
   d="scan'208";a="1107335078"
Received: from hierlema-mobl.ger.corp.intel.com (HELO [10.252.34.230])
 ([10.252.34.230])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 04:27:08 -0800
Message-ID: <a4bfdc56-b323-4c13-a09e-c0f5baf40450@linux.intel.com>
Date: Mon, 18 Dec 2023 17:33:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/16] Documentation: driver: add SoundWire BRA
 description
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, tiwai@suse.de, broonie@kernel.org,
 vinod.koul@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, srinivas.kandagatla@linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 vijendar.mukunda@amd.com, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <ZYAvoFbEP8RH_x0Y@matsya>
 <a5d0e3a7-e45c-4971-8ad7-7ba19702acf1@linux.intel.com>
 <20231218142946.GZ14858@ediswmail.ad.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231218142946.GZ14858@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WAJ5KUVIZWM4X6MAZ4VMY45RS4QZQ2W2
X-Message-ID-Hash: WAJ5KUVIZWM4X6MAZ4VMY45RS4QZQ2W2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WAJ5KUVIZWM4X6MAZ4VMY45RS4QZQ2W2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/18/23 08:29, Charles Keepax wrote:
> On Mon, Dec 18, 2023 at 01:58:47PM +0100, Pierre-Louis Bossart wrote:
>>> why not have a single API that does both? First check if it is supported
>>> and then allocate buffers and do the transfer.. What are the advantages
>>> of using this two step process
>>
>> Symmetry is the only thing that comes to my mind. Open - close and send
>> - wait are natural matches, aren't they?
>>
>> We do need a wait(), so bundling open() and send() would be odd.
>>
> 
> I agree send->wait->close would be odd, But you just bundle close
> into wait. So the API becomes just send->wait, which seems pretty
> logical.

Fair enough, send()/wait() would work indeed.

I guess I wanted to keep the callbacks reasonably small (already 200
lines for the open), but we can split the 'send' callback into smaller
helpers to keep the code readable. There's no good reason to expose
these smaller helpers to codec drivers.

>> But you have a point that the open() is not generic in that it also
>> prepares the DMA buffers for transmission. Maybe it's more natural to
>> follow the traditional open(), hw_params(), hw_free, close() from ALSA.
> 
> I think this just makes it worse, you are now adding even more
> calls. The problem I see here is that, open and close (at least to
> me) strongly implies that you can do multiple operations between
> them and unless I have misunderstood something here you can't.

That's right, the open was not compatible with multiple operations.
Collapsing open/send and wait/close sounds more logical, thanks for the
feedback.
