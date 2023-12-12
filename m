Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C92780EB5C
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Dec 2023 13:20:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9A4FA4E;
	Tue, 12 Dec 2023 13:20:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9A4FA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702383615;
	bh=Dczsb8Lz0txj5qb87j2PpgSmqi+pQxPJUgj9mkehhcY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XHdBnhr6QebtXj7+srlvxvqoI9khYaMQP88Y0mCwgsJNBO44HHiwCCv4IZGLWn++a
	 ZFDFUq/nQOcVff/U32XFAUOtLRJSLeK6LdCWW7uN1+L72x0AHopzO5D59v0DA3XV0V
	 EjgnPILSPnCZ8d3ycIbb2osSmgnFH1uoqKupNkr0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 676F0F8019B; Tue, 12 Dec 2023 13:19:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F480F8055C;
	Tue, 12 Dec 2023 13:19:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B7E2F8016A; Tue, 12 Dec 2023 13:19:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C19CF80124
	for <alsa-devel@alsa-project.org>; Tue, 12 Dec 2023 13:19:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C19CF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=SsxYxBJZ
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BC70GiM016663;
	Tue, 12 Dec 2023 06:19:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=xnNumDFzNq/dKmd
	lPWS/NLc37aZNTvE98e+DGHWWu14=; b=SsxYxBJZ92ukNjj8K3wYblRcgYrmldq
	VTEk6ilnvFcu7EQ9MJN5rM6eem0G9hvgvEeoDkpfw4u7VaikT0No4DcwPa3lab6+
	M7HPBgH2Tx/x/MJgrjrXxTDwawTyGHC1Fhz9ZBOuiKKpxMPow6M6H4Km3Wx+jT0U
	GbEkavKnLSk+ZPkKuOQiL3+h1qxb4naJlhYovSSI0hdhd9E1s6Wq7TODa0xHYPsq
	Snv7VoE5f9KTf2FPtxNu7O/fJspYkK6sVnGbl7LDkjIi+A6kMOzLdiEiY4a0i8IT
	T8fwun7Il+OARhRkytGC/iwq4UX99qgBB+umOkhNCnD+2px/D8V81+g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3uvnhpk3k3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 06:19:33 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 12 Dec
 2023 12:19:31 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.40 via Frontend
 Transport; Tue, 12 Dec 2023 12:19:31 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4F14211D4;
	Tue, 12 Dec 2023 12:19:31 +0000 (UTC)
Date: Tue, 12 Dec 2023 12:19:31 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <tiwai@suse.de>, <broonie@kernel.org>, <vinod.koul@intel.com>,
        Bard liao
	<yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>,
        Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>,
        Kai Vehmanen
	<kai.vehmanen@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>,
        <vijendar.mukunda@amd.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Shuming Fan
	<shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
        Oder Chiou
	<oder_chiou@realtek.com>
Subject: Re: [RFC PATCH 07/16] soundwire: bus: add API for BPT protocol
Message-ID: <20231212121931.GX14858@ediswmail.ad.cirrus.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-8-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231207222944.663893-8-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: htJqln7vk2a5aPcaW7iBkta1ik6p21zh
X-Proofpoint-ORIG-GUID: htJqln7vk2a5aPcaW7iBkta1ik6p21zh
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 5F25PIOQQOMZFU5UUBPMFCE5TSIHSTBF
X-Message-ID-Hash: 5F25PIOQQOMZFU5UUBPMFCE5TSIHSTBF
X-MailFrom: prvs=7710dd07de=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5F25PIOQQOMZFU5UUBPMFCE5TSIHSTBF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Dec 07, 2023 at 04:29:35PM -0600, Pierre-Louis Bossart wrote:
> This patch suggests a minimum bound of 64 bytes, for smaller transfers

128 in the code.

> +int sdw_bpt_close_stream(struct sdw_bus *bus,
> +			 struct sdw_slave *slave,
> +			 enum sdw_bpt_type mode,
> +			 struct sdw_bpt_msg *msg)
> +{

Seems weird to pass the message to close?

> +int sdw_bpt_open_stream(struct sdw_bus *bus,
> +			struct sdw_slave *slave,
> +			enum sdw_bpt_type mode,
> +			struct sdw_bpt_msg *msg)

Ditto, here does it make sense to pass the msg to open? I guess
the idea is that one only sends a single message in one
open->send->wait->close cycle? Would be much nicer if multiple
send/waits could be done in a single open/close, or if the
limitation is unavoidable why split out open/send into separate
calls at all? Just have send and wait and wrap open/close into
them.

> +	if (msg->len % SDW_BPT_MSG_BYTE_ALIGNMENT) {
> +		dev_err(bus->dev, "BPT message length %d is not a multiple of %d bytes\n",
> +			msg->len, SDW_BPT_MSG_BYTE_ALIGNMENT);
> +		return -EINVAL;
> +	}

Should this really be here? My understanding is this alignment is
a limitation of specific hardware so should this check not be in
the Cadence master code.

> +int sdw_bpt_send_async(struct sdw_bus *bus,
> +		       struct sdw_slave *slave,
> +		       struct sdw_bpt_msg *msg)
> +{
> +	if (msg->len > SDW_BPT_MSG_MAX_BYTES)
> +		return -EINVAL;

Does this check make sense since this was already checked in
open? I guess the user could pass in a different message at this
stage, but that I guess is part of what feels weird about passing
the message into open.

> +/**
> + * struct sdw_btp_msg - Message structure
> + * @addr: Start Register address accessed in the Slave
> + * @len: number of bytes to transfer. More than 64Kb can be transferred
> + * but a practical limit of SDW_BPT_MSG_MAX_BYTES is enforced.

Where is the 64kb coming from here?

> +/*
> + * Add a minimum number of bytes for BPT transfer sizes. BPT has a lot of
> + * overhead, enabling/disabling a stream costs 6 write commands, plus the bank
> + * switch that could be delayed in time. In addition, transferring very small
> + * data sets over DMA is known to be problematic on multiple platforms.
> + */
> +#define SDW_BPT_MSG_MIN_BYTES      128
> +

Is it really necessary for the core to enforce a minimum transfer
size (well except for the required alignment thing)? Yes small
transfers don't obviously make sense, but there is nothing inherently
wrong with doing one, which makes me feel it is excessive for the
core to block more than it has to here.

I would be of the opinion its up to driver writers if they have
some reason to do small BRA transfers. Firstly, since we are so
keen on allowing BRA and normal writes to overlap, one could see
use-cases when you want to do something through BRA such that it
doesn't block the normal command stream. Also there is already 1
feature on cs42l43 that can only be accessed through BRA, yes that
is a heroically questionable hardware design choice. Whilst we are
mostly ignoring that for now, I can see this being something some
other hardware teams decide to heroically do at some point as well.

Thanks,
Charles
