Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B28971EA7
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2024 18:04:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4570847;
	Mon,  9 Sep 2024 18:03:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4570847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725897839;
	bh=PDO5Q2PW0U8Dl37qialTE5Jq9umZ1RqHzT6t9eTX7oo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O4Y1UYCIhJ/5RPIRSLVOQbITJMu2A92JGOYCI0KtvL4uZFCW9z4//xI8S/677YKKV
	 2eH1SPFHp0L63I3bCLSO23rxihKIztDapD/K9Ru68875h9uKDkTiwZieRHUsPMMLJ9
	 rQ+haB0NdrASmEkREqZkV81qw1AtnPW3ZmajCLLo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16F1AF805AF; Mon,  9 Sep 2024 18:03:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76AE6F805B1;
	Mon,  9 Sep 2024 18:03:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75634F801F5; Mon,  9 Sep 2024 18:03:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 277F1F8010B
	for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2024 18:03:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 277F1F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WcN2+c8L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725897802; x=1757433802;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PDO5Q2PW0U8Dl37qialTE5Jq9umZ1RqHzT6t9eTX7oo=;
  b=WcN2+c8Lgm5MP65LGWTr0B2MdOfItf6lRe/16o4uV02um0x7tgxe7i1y
   lADd4Nw0P4fDWU7y+p6LWwM25q3cBadmQQlEna/jAaVS2II/F76s1iOk4
   g5vdXPV0AB1zwHdXlP6g1nOa989aewS7evQZjWBMj/RhUkTM0nok0+AnL
   YGlwFyyTZfLRIxlTGXxf/AOmDHkxCdfYFltQ0AWLRiowOOoi/kS3nUkIY
   exv/0zMIdLFPgS+cVwRx7IuDcwGr5egjxeDZQaev9mTfPwBh6EKhPUpNT
   MLjh7iWv/eIZtf0NyK3J3ZiN7QaG9sL7hPMizYaJM8fbTKER9RM0WtVUD
   g==;
X-CSE-ConnectionGUID: LeidAAPQQTGV5Cz5DC4mtA==
X-CSE-MsgGUID: YBDEaWpQQyiNTN9gTqMPuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="35747372"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600";
   d="scan'208";a="35747372"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 09:03:16 -0700
X-CSE-ConnectionGUID: Wbp3KqQkREOjxTGxEV3hFw==
X-CSE-MsgGUID: LO4DXqsKSbOOvbpNnTj+0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600";
   d="scan'208";a="67456255"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.246.241])
 ([10.245.246.241])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 09:03:12 -0700
Message-ID: <d6625b2e-c926-478b-b3bf-5e241270da62@linux.intel.com>
Date: Mon, 9 Sep 2024 18:03:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] Add static channel mapping between soundwire
 master and slave
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_rohkumar@quicinc.com, kernel@quicinc.com, quic_pkumpatl@quicinc.com
References: <20240909105547.2691015-1-quic_mohs@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240909105547.2691015-1-quic_mohs@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XLPLO75CRRKB46E4VO6ZYFVZ2FEME3UP
X-Message-ID-Hash: XLPLO75CRRKB46E4VO6ZYFVZ2FEME3UP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XLPLO75CRRKB46E4VO6ZYFVZ2FEME3UP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 9/9/24 12:55, Mohammad Rafi Shaik wrote:
> Add static channel map support between soundwire master and slave.
> This patch series will resolve channel mask mismatch between master and slave.
> 
> Scenario: wcd937x AMIC2 usecase
> 
>                           Master                 Slave (wcd937x)
>                      +--------------+           +--------------+
>                      |  +--------+  |           |  +--------+  |
>          AMIC1 ----->|  | PORT1  |  |           |  |   TX1  |  |<-----------AMIC1
>          AMIC2 ----->|  |        |  |           |  |        |  |
>                      |  +--------+  |           |  +--------+  |
>                      |              |           |              |
>          AMIC3 ----->|  +--------+  |           |  +--------+  |
>                      |  |  PORT2 |  |           |  |   TX2  |  |<-----------AMIC2
>                      |  |        |  |           |  |        |  |<-----------AMIC3
>                      |  +--------+  |           |  +--------+  |
>                      |              |           |              |
>                      |  +--------+  |           |  +--------+  |
>  DMIC0...DMIC3------>|  |  PORT3 |  |           |  |   TX3  |  |<-----------DMIC0...DMIC3
>                      |  |        |  |           |  |        |  |<-----------MBHC
>                      |  +--------+  |           |  +--------+  |
>                      |              |           |              |
>                      |  +--------+  |           |  +--------+  |
>  DMIC4...DMIC37----->|  |  PORT4 |  |           |  |   TX4  |  |<-----------DMIC4...DMIC7
>                      |  |        |  |           |  |        |  |
>                      |  +--------+  |           |  +--------+  |
>                      |              |           |              |
>                      +------------- +           +--------------+
> 
> For AMIC2 usecase, The Slave need to configure TX2 Port with channel mask 1 and
> for Master required PORT1 with channel mask 2,
> 
> In existing design master and slave configured with same channel mask, it will fail
> AMIC2 usecase.
> 
> The New design will help to configure channel mapping between master and slave from
> device tree.

That's rather controversial...

In theory you already have the means to deal with a different channel
mapping in the hw_params callback for your manager and peripheral
devices. That's how we e.g. send a 2ch stream on the manager to two
separate amplifiers and program which channel is used by what amplifier.

The common part between manager and peripheral is the notion of
'stream', and you can add a different port/stream configuration for
manager and peripheral with sdw_stream_add_master() and
sdw_stream_add_slave() respectively.

Port1 and TX2 can be used by just setting the relevant port_config.num
value.

Likewise the port_config.ch_mask can be programmed at will to select the
relevant mappings. See e.g. rt1308_sdw_hw_params() in rt1308-sdw.c, the
mapping were handled with a set_tdm_slot() callback before.

In short, please re-visit your hw_params() implementation first and use
the existing 'stream' APIs.
