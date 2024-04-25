Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC978B2316
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Apr 2024 15:45:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88E0DBC0;
	Thu, 25 Apr 2024 15:44:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88E0DBC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714052700;
	bh=sevXQPHqwt+0Ww7Ab9Mk8uFLSxt6KOf9Ig3smUYioLc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m0V5+GkVB9exs9P6lqP78RlxTQePU2T+Y99tt8A4kykW/bdvYDSV9Wp2kJMf6Y784
	 ++oNVUOme0OSJNSN6h9tYAef9vQ4ynmDB0sHFP/iOG5kEDU+zIGbZVM1rUhJHOS5h2
	 +flB29ATQGYSsoQCzUXWudDCjT3Lv2ymKdmVl/SY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5CC8F805A9; Thu, 25 Apr 2024 15:44:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66FD2F805A1;
	Thu, 25 Apr 2024 15:44:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB9B2F80423; Thu, 25 Apr 2024 15:44:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DB42F800B5
	for <alsa-devel@alsa-project.org>; Thu, 25 Apr 2024 15:44:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DB42F800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CKAUxlFa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714052658; x=1745588658;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=sevXQPHqwt+0Ww7Ab9Mk8uFLSxt6KOf9Ig3smUYioLc=;
  b=CKAUxlFaXgmYbypgvPd3gKC8nAX5KQsGcSD9aLDsB8V1bCvs7hr5Jkf+
   E4tWgO+IThA/p+aLHh7MFDw5FyihTRxIf33ivz7k9/MGATBkKQcAvpp2i
   eBnEDdn2wj3jUs+j842SlFpNYLPMkYmxzbPVMeJuqohp8gudAn0a0k5SK
   ie34WZ0TT+F+wz4w+byw4IMZEfRMIXDMPsQMNPvGpGNr0m5VqaFgTij8O
   Iwa8WFDw0nmmwujYjBI2wArYL6K0q7jqPX5PkKFvfCt80cjpylW7zgAjU
   VKeATK/GNtmloeo6NMSGJ0w7lS4WrZXqvwXSz40ScgIKcORgmXoIA4WYA
   A==;
X-CSE-ConnectionGUID: aqalek4aTbuI8oFab5rMDA==
X-CSE-MsgGUID: TccS0QPwRhqW2pX8OXNgZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9587379"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000";
   d="scan'208";a="9587379"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 06:44:13 -0700
X-CSE-ConnectionGUID: 7OVoDDweRre70A69GO9ozQ==
X-CSE-MsgGUID: mlJfMqBPSgudVBltKqVGDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000";
   d="scan'208";a="25564915"
Received: from shivapri-mobl.amr.corp.intel.com (HELO [10.209.176.73])
 ([10.209.176.73])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 06:44:12 -0700
Message-ID: <59f78ca7-ea09-41d7-9e6e-b0ce1af484e4@linux.intel.com>
Date: Thu, 25 Apr 2024 08:43:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] ASoC: codecs: wcd937x: add wcd937x codec driver
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
 quic_pkumpatl@quicinc.com
References: <20240425091857.2161088-1-quic_mohs@quicinc.com>
 <20240425091857.2161088-3-quic_mohs@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240425091857.2161088-3-quic_mohs@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ENDMA4FWGDMODFEBS447UN5P4N5YGRSD
X-Message-ID-Hash: ENDMA4FWGDMODFEBS447UN5P4N5YGRSD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ENDMA4FWGDMODFEBS447UN5P4N5YGRSD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +struct wcd937x_priv {
> +	struct sdw_slave *tx_sdw_dev;
> +	struct sdw_slave *rx_sdw_dev;

Does this mean that the codec has 2 SoundWire interfaces?

If yes, aren't there merits in splitting the implementation in two
separate drivers, one for each interface and probing on the relevant partID?

This is how the RT713 was handled. The mic function was exposed as the
RT1713.

By representing the device as a single entity, things could be fun
because the two interfaces are really independent. things like clock
stop are handled at the interface level.

The code in this driver is difficult to review, for example in the probe
you wait for the TX part to complete the enumeration/initialization, but
there's nothing mentioned or stated on the RX part, and there's really
nothing related to the detection of this device. I don't actually see a
sdw_driver at all, it's a platform driver.

Would you mind adding a paragraph on how the SoundWire interfaces are
handled and how the SoundWire bus is involved if there's no sdw_driver?

Thanks!
