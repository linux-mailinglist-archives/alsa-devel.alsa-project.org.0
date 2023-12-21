Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A31581B9BF
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Dec 2023 15:42:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA4BABC0;
	Thu, 21 Dec 2023 15:42:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA4BABC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703169774;
	bh=1rUHiSbBzjZVq93Y196VyIHTz/47RV9BbEGJsxBHTvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q99qcvLbWWm6YmLwSZm2u+rmldTY3o6c4jO9poApLqXptLRPYd66DqHqFqUZ07QEI
	 FHvsUq8AFC/qimgpwki26G2NZY9xRliVBTt8gZklJeNI6ZVWtD5ui4oI8shqg7Eu/2
	 F9t9uAdToMaQ3lwpHrER9OXat+3x43KOYGpaP3OQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4B86F80124; Thu, 21 Dec 2023 15:42:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81ADDF8024E;
	Thu, 21 Dec 2023 15:42:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 521FDF80153; Thu, 21 Dec 2023 15:42:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 686B0F800D2
	for <alsa-devel@alsa-project.org>; Thu, 21 Dec 2023 15:42:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 686B0F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=k8/PFBQP
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 33E5CCE1F63;
	Thu, 21 Dec 2023 14:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84BA1C433C7;
	Thu, 21 Dec 2023 14:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703169729;
	bh=1rUHiSbBzjZVq93Y196VyIHTz/47RV9BbEGJsxBHTvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k8/PFBQPxgb8+8FO147mx3fDfrJK0dIOwopwg0IfJtTJaIEL/ipCAvacL8FX2u59O
	 RB0TuxRKwJVqV8PLujLJ3SdiSvNs3tj15Yl0IDYqeuioyp9G48ZVJVLbkAwH6Gj2/h
	 QsKslRgtF3NPheJNkvHutSZYx+hcYkpM4UW4tgq3LQVu52kFWsiYodwQ7olrsGIove
	 qqEvDbVHjPaudwZAHZmKfLuceNkWMui4zgtOWveBBysvijkbdZ8Hr+8kvE2WEiO9gf
	 IW2xeDs9FpcJYdMw6T+TZU76W7dlpqccXW7uo1vD/nelr+OiUmZ5T3ItFXb31+ikCT
	 yj9MrMtqv+7Tg==
Date: Thu, 21 Dec 2023 20:12:05 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
	broonie@kernel.org, vinod.koul@intel.com,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>
Subject: Re: [RFC PATCH 09/16] soundwire: crc8: add constant table
Message-ID: <ZYROvUA7RrqQknlM@matsya>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-10-pierre-louis.bossart@linux.intel.com>
 <ZYA0gKf3bZgY4X_s@matsya>
 <121b44fb-9d2f-4e1f-beca-a54b16d7e13c@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <121b44fb-9d2f-4e1f-beca-a54b16d7e13c@linux.intel.com>
Message-ID-Hash: BSIA5LG7OASZUZJFYJWX5U6JJS7C7XWO
X-Message-ID-Hash: BSIA5LG7OASZUZJFYJWX5U6JJS7C7XWO
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BSIA5LG7OASZUZJFYJWX5U6JJS7C7XWO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 18-12-23, 14:26, Pierre-Louis Bossart wrote:
> 
> 
> On 12/18/23 06:01, Vinod Koul wrote:
> > On 07-12-23, 16:29, Pierre-Louis Bossart wrote:
> >> Add the lookup table required by crc8(). All configuration values were
> >> directly table from the MIPI SoundWire 1.x specification.
> >>
> >> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> >> ---
> >>  drivers/soundwire/Makefile |   4 +-
> >>  drivers/soundwire/crc8.c   | 277 +++++++++++++++++++++++++++++++++++++
> >>  drivers/soundwire/crc8.h   |  11 ++
> >>  3 files changed, 291 insertions(+), 1 deletion(-)
> >>  create mode 100644 drivers/soundwire/crc8.c
> >>  create mode 100644 drivers/soundwire/crc8.h
> >>
> >> diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
> >> index 657f5888a77b..170128dd9318 100644
> >> --- a/drivers/soundwire/Makefile
> >> +++ b/drivers/soundwire/Makefile
> >> @@ -5,7 +5,9 @@
> >>  
> >>  #Bus Objs
> >>  soundwire-bus-y := bus_type.o bus.o master.o slave.o mipi_disco.o stream.o  \
> >> -			sysfs_slave.o sysfs_slave_dpn.o
> >> +			sysfs_slave.o sysfs_slave_dpn.o \
> >> +			crc8.o
> >> +
> >>  obj-$(CONFIG_SOUNDWIRE) += soundwire-bus.o
> >>  
> >>  soundwire-generic-allocation-objs := generic_bandwidth_allocation.o
> >> diff --git a/drivers/soundwire/crc8.c b/drivers/soundwire/crc8.c
> >> new file mode 100644
> >> index 000000000000..b6b984d7f39a
> >> --- /dev/null
> >> +++ b/drivers/soundwire/crc8.c
> >> @@ -0,0 +1,277 @@
> >> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> >> +// Copyright(c) 2024 Intel Corporation.
> >> +
> >> +#include <linux/crc8.h>
> >> +#include <linux/module.h>
> >> +#include "crc8.h"
> >> +
> >> +/*
> >> + * the MIPI SoundWire CRC8 polynomial is X^8 + X^6 + X^3 + X^2 + 1, MSB first
> >> + * The value is (1)01001101 = 0x4D
> >> + *
> >> + * the table below was generated with
> >> + *
> >> + *	u8 crc8_lookup_table[CRC8_TABLE_SIZE];
> >> + *	crc8_populate_msb(crc8_lookup_table, SDW_CRC8_POLY);
> > 
> > Good that you found this API, so next question would be why should we
> > have this static table in kernel and not generate on probe if bpt is
> > supported..? Many subsystems use these APIs to generate the tables..
> 
> The table is going to be the same for all hosts, it's simpler if
> everyone uses a constant table, no? We're talking about 256 bytes added
> for the common bus parts, be it with dynamically allocated memory or a
> static table.
> 
> I don't mind reverting to a dynamically allocated table populated at
> boot if that was the consensus.

Most of the kernel users I looked have dynamically allocated table
populated at boot, also out of many users how many would support BTP.?
Your older platforms, current qcom dont, so not point is adding for
everyone...


-- 
~Vinod
