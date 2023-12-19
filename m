Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83560818D8C
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 18:09:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 356FFAE9;
	Tue, 19 Dec 2023 18:09:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 356FFAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703005750;
	bh=/wQo6ICqc15Zh13giXF+Imb5Y6zr40bNbquSO4cg7VU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QKNwHleSgyXGiKSDfr8S8096CCRCoZM2NBTM+KLQIWCV7dtCHrIDOtgZULsdwYGRl
	 8ujWD+3k0zQZ386kTzjNYX1mVPHjMHXHwcXFhGm54v1lh71Z0Bcm6GziOpEFwFAIyl
	 elqsd9zMFakQWjJiiBYfKSheXzvDhNCSD+SCqmOE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61171F8055A; Tue, 19 Dec 2023 18:08:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AB7CF8057A;
	Tue, 19 Dec 2023 18:08:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77AD7F80425; Tue, 19 Dec 2023 18:08:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02071F8016E
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 18:08:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02071F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PXBb6fDx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703005710; x=1734541710;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/wQo6ICqc15Zh13giXF+Imb5Y6zr40bNbquSO4cg7VU=;
  b=PXBb6fDx80/H053YOJIGpe/fAkfmmYCr7nV3+9dRKfcm/JZQsOfF/3Wt
   293YCdBnGqLnIADqWt0tyIBz2qxAORWvl2++EtoFsP2y1o3Ywnub0jLNx
   RgOh+OQO/Qhb1ZAfERDZAmqJcbcKrk+hziy4JT4G/UE0K4FuQG47Rj1Un
   77x0E/wSgN3ijzfGho1V6iaZ/SYDWHRN319f9xSb3WZ79VN2PBtRiOEMM
   Wacm0ZdOnMzMNf0pCo38PfDm18Houe/uAITaXk9jBiVXrgMOholzOOO+O
   lYbxBpoc9pqm+zILeDzG0kUjrYk8HV95Swe0xCRTCQGrJZ8IGp7WUlvHj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="2921386"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600";
   d="scan'208";a="2921386"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 09:08:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600";
   d="scan'208";a="17669304"
Received: from hierlema-mobl.ger.corp.intel.com (HELO [10.252.34.230])
 ([10.252.34.230])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 09:08:18 -0800
Message-ID: <f24a2a89-3d8a-4a6d-849a-cddbae4c1e03@linux.intel.com>
Date: Tue, 19 Dec 2023 18:08:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/16] Documentation: driver: add SoundWire BRA
 description
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
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <38d0c1c9-d60c-4ddd-b2ee-091d1717a377@sirena.org.uk>
 <5b8e74ad-460f-4e68-a17b-3131d810f29b@linux.intel.com>
 <ZXOPWRWvrRddOWpT@finisterre.sirena.org.uk>
 <700e564d-7e87-463a-a764-c4713ddf11cd@linux.intel.com>
 <bec481f0-5361-4090-b69c-1123f83ac8ac@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <bec481f0-5361-4090-b69c-1123f83ac8ac@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UCSH6ZU5OG2FN43YLF4Q3XQ4QT7BZQAS
X-Message-ID-Hash: UCSH6ZU5OG2FN43YLF4Q3XQ4QT7BZQAS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UCSH6ZU5OG2FN43YLF4Q3XQ4QT7BZQAS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/19/23 17:53, Mark Brown wrote:
> On Tue, Dec 19, 2023 at 05:50:30PM +0100, Pierre-Louis Bossart wrote:
> 
>>> grep for regmap_.*async - cs_dsp.c is the upstream example in a driver,
>>> or there's the rbtree cache sync code which uses a back door to go into
>>> an async mode.  Basically just variants of all the normal regmap I/O
>>> calls with a _complete() call you can use to wait for everything to
>>> happen.  The implementation is a bit heavyweight since it was written to
>>> work with fairly slow buses.
> 
>> I spent a fair amount of time this afternoon trying to understand the
>> regmap_async parts, and I am not following where in the code there is an
>> ordering requirement/enforcement between async and sync usages.
> 
> The only actual async implementation is SPI which processes things in
> order of submission, the sync API wraps the async API.
> 
>> Also is this just me spacing out or there is no regmap_raw_read_async()?
> 
> Right, there was never any need.

ok. I am starting to think that we could have a new type of regmap, say
"regmap-sdw-bra", where the use of write_raw_async() would rely on the
send/wait bus primitives, and write_raw() would fallback to the regular
read/write commands. We'd need a mutual exclusion to prevent parallel
async/sync access to the same regmap.

In other words, "memory" areas that are used for firmware downloads
would be moved to a different regmap with async capabilities and no
caching support.
