Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B94737FBD
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 13:00:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FB3882B;
	Wed, 21 Jun 2023 12:59:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FB3882B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687345212;
	bh=XGqVwPV972bAofKq7Ii+BNgpn8zMgGdyFdhMEb7bJ0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZxyBZQV/nj6HN+jyxk1+akCw/xBPNC/66jlAkvaQgGRKVjsgoncWy251aEBlp9n+6
	 lp0qTrtTSfh5wDcr5EzLPunme65LsjZPus08hF5t/jl+v/0azDQeEo6IIZm+PPgNS/
	 qcOA9Oizj+tDEiiBegHS2VFcK728A9iJFITwC8X4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 453C5F80535; Wed, 21 Jun 2023 12:59:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C410EF80132;
	Wed, 21 Jun 2023 12:59:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D020F80141; Wed, 21 Jun 2023 12:59:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A623F80093
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 12:59:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A623F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nl1pyQ0P
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 03345614D8;
	Wed, 21 Jun 2023 10:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD08C433C8;
	Wed, 21 Jun 2023 10:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687345153;
	bh=XGqVwPV972bAofKq7Ii+BNgpn8zMgGdyFdhMEb7bJ0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nl1pyQ0PaXumCuGFHcKPQwtVTpyKlQgbw42RYLBQbmmK7vzjRYOe8mnCvGNCVujH5
	 afER4UF24JrV29TMZfHL1kQYo4PDe0SAgfcvD8wIKHldrsShKM1Ev3dZCqW8QyH7Rj
	 PS6fxqDqD8lZr/7Nen+0JxLvYk5WXkB+uRQJtlxqgIHM49pREJhQ6+lM94Dxj700cn
	 ch2uE79VSRXokOG5OMBV1N1pTvwxdSv9KG98ZMXm3BT54Qcy3d1D9Eu7lfAZL5ySDN
	 zQKSKClODeJA3sPZl1YJSbX+JgWUh2iUbLQZPL0pFzYX+TKduQ/dC7f34AcBDYlb24
	 jtHqe2LuuPY6A==
Date: Wed, 21 Jun 2023 16:29:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	bard.liao@intel.com
Subject: Re: [PATCH 3/4] soundwire: extend parameters of
 new_peripheral_assigned() callback
Message-ID: <ZJLX/fPM1FbBxM2X@matsya>
References: <20230531033736.792464-1-yung-chuan.liao@linux.intel.com>
 <20230531033736.792464-4-yung-chuan.liao@linux.intel.com>
 <ZIF+G1mbis/lb8Po@matsya>
 <e07d507e-57bf-a2b7-2ab1-f5f45ff5399b@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e07d507e-57bf-a2b7-2ab1-f5f45ff5399b@linux.intel.com>
Message-ID-Hash: CPKACE2SSBNRBS62XDSFKGS6E3UZNV5K
X-Message-ID-Hash: CPKACE2SSBNRBS62XDSFKGS6E3UZNV5K
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CPKACE2SSBNRBS62XDSFKGS6E3UZNV5K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08-06-23, 08:24, Pierre-Louis Bossart wrote:
> 
> >> -static void generic_new_peripheral_assigned(struct sdw_bus *bus, int dev_num)
> >> +static void generic_new_peripheral_assigned(struct sdw_bus *bus,
> >> +					    struct sdw_slave *slave,
> >> +					    int dev_num)
> >>  {
> >>  	struct sdw_cdns *cdns = bus_to_cdns(bus);
> >>  	struct sdw_intel *sdw = cdns_to_intel(cdns);
> >> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> >> index 8a7541ac735e..41a856bedf1e 100644
> >> --- a/include/linux/soundwire/sdw.h
> >> +++ b/include/linux/soundwire/sdw.h
> >> @@ -861,7 +861,9 @@ struct sdw_master_ops {
> >>  	int (*pre_bank_switch)(struct sdw_bus *bus);
> >>  	int (*post_bank_switch)(struct sdw_bus *bus);
> >>  	u32 (*read_ping_status)(struct sdw_bus *bus);
> >> -	void (*new_peripheral_assigned)(struct sdw_bus *bus, int dev_num);
> >> +	void (*new_peripheral_assigned)(struct sdw_bus *bus,
> >> +					struct sdw_slave *slave,
> > 
> > maybe better, drop the bus and pass slave (which contains bus)
> 
> I kept it for consistency, all callbacks for sdw_master_ops start with
> the bus parameter.

That is a valid point, since this is sdw_master_ops() and not slave,
this looks better

-- 
~Vinod
