Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 144976D0AED
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Mar 2023 18:23:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B12C21F0;
	Thu, 30 Mar 2023 18:22:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B12C21F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680193409;
	bh=fyXNca3te2913RqJgdzgrV2/PwI3pvZpRRQ+S19RUO8=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UlzDJDWUDG+/sCZJa6i3sSPpcEYoF95HVN1FbwWUYlrJbNeVHskHuhTlN7+Hgl1rT
	 fGgGkvftIZH92MSeO+9JMJycGjwSpYB2GKvtOrfjLzZq7JFrhaStJE+p186XgQxBhD
	 uGAHsPfS9t0nc1NRCN8xpFvKVeAtzjpxStzGG2X8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20AC4F8024E;
	Thu, 30 Mar 2023 18:22:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FD0CF80272; Thu, 30 Mar 2023 18:22:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8EC63F80114
	for <alsa-devel@alsa-project.org>; Thu, 30 Mar 2023 18:22:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EC63F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WLEfNoHu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680193348; x=1711729348;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fyXNca3te2913RqJgdzgrV2/PwI3pvZpRRQ+S19RUO8=;
  b=WLEfNoHuBG5telk/SJvkzhTDw6sf9hdk9QeuTEwRNJ2HTEQpHju/yw0E
   8p8gO57Diwg/VxD+2AzK+YFW6yGj6KpSkdX4X4nUkFc0wgTwUC/tVeSuz
   WckPd9MsfMaUNp9ETG1WGakw1NkF+SowGAtEyQoJjKeSu73iImjfqeCrS
   ZpbgP58y6qOPfDImW7IqxQtcGAYCd247e8pBwHcZw0goNW8C45SHZj29b
   EoajK32ehHhQUNpi+DaOSwyWgn/kUI+hSBI9KwiyFSR49/y4Yn4EvLN6D
   HzR0kEgonmhsUCyJUrMaBsKNrlEpfSXrbzcFKyibnZYtYCwsKQ0iDc0wk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="427494447"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400";
   d="scan'208";a="427494447"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 09:22:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="858970595"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400";
   d="scan'208";a="858970595"
Received: from leedong-mobl.amr.corp.intel.com (HELO [10.209.122.136])
 ([10.209.122.136])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 09:22:23 -0700
Message-ID: <7ab92f54-d11f-1e9b-4fc7-083014807748@linux.intel.com>
Date: Thu, 30 Mar 2023 11:22:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH 08/18] ASoC: SOF: Intel: hda-mlink: introduce helpers for
 'extended links' PM
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
References: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
 <20230327112931.23411-9-peter.ujfalusi@linux.intel.com>
 <87a5zukzfb.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87a5zukzfb.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6CJXTAJ7NEUTJ5YA24YCRY5OWJZOUU2X
X-Message-ID-Hash: 6CJXTAJ7NEUTJ5YA24YCRY5OWJZOUU2X
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6CJXTAJ7NEUTJ5YA24YCRY5OWJZOUU2X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>




>> +/*
>> + * Hardware recommendations are to wait ~10us before checking any hardware transition
>> + * reported by bits changing status.
>> + * This value does not need to be super-precise, a slack of 5us is perfectly acceptable.
>> + * The worst-case is about 1ms before reporting an issue
>> + */
>> +#define HDAML_POLL_DELAY_MIN_US 10
>> +#define HDAML_POLL_DELAY_SLACK_US 5
>> +#define HDAML_POLL_DELAY_RETRY  100
>> +
>> +static int check_power_active(u32 __iomem *lctl, int sublink, bool enable)
>> +{
>> +	int mask = BIT(sublink) << AZX_ML_LCTL_CPA_SHIFT;
>> +	int retry = HDAML_POLL_DELAY_RETRY;
>> +	u32 val;
>> +
>> +	usleep_range(HDAML_POLL_DELAY_MIN_US,
>> +		     HDAML_POLL_DELAY_MIN_US + HDAML_POLL_DELAY_SLACK_US);
>> +	do {
>> +		val = readl(lctl);
>> +		if (enable) {
>> +			if (val & mask)
>> +				return 0;
>> +		} else {
>> +			if (!(val & mask))
>> +				return 0;
>> +		}
>> +		usleep_range(HDAML_POLL_DELAY_MIN_US,
>> +			     HDAML_POLL_DELAY_MIN_US + HDAML_POLL_DELAY_SLACK_US);
>> +
>> +	} while (--retry);
>> +
>> +	return -EIO;
>> +}
> 
> Can read_poll_timeout() and co be alternative?

Yes they can. I chose the simple route because I find it clearer, and
because we modified the sleep/retries compared to previous implementations.

here's what I wrote in the commit message:

"
Note that the _check_power_active() implementation is similar to
previous helpers in sound/hda/ext, with sleep duration and timeout
aligned with hardware recommendations. If desired, this helper could
be modified in a second step with .e.g. readl_poll_timeout()
"

If you want to jump directly to the next step that'd be fine. Peter had
the same comment, so I'll go with the flow.
