Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA2871340E
	for <lists+alsa-devel@lfdr.de>; Sat, 27 May 2023 12:39:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE1D31F6;
	Sat, 27 May 2023 12:38:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE1D31F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685183966;
	bh=d69AAhBzpUC0eOvHS0/YI/AvoeOO4D0EBrByjnwcrzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Bi1fKi8FcYmcRmrIU3/9L4mv+oEYHP24aE4IjyOBXUrvgQYW6uBTvf7RAXzDMpRIs
	 mA5ZQciorCJ7sMwF2AwsYXq5ah/mV4KmGU24lp6ti2dAdASO70jFdCJiXpWq+7IBuJ
	 G19G6RD+34KWTdFntr7ky5LzO9eW/FRiOGKAUvXk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BDBDF80548; Sat, 27 May 2023 12:38:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 422EDF8016A;
	Sat, 27 May 2023 12:38:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FE6BF80249; Sat, 27 May 2023 12:37:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E072F80053
	for <alsa-devel@alsa-project.org>; Sat, 27 May 2023 12:37:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E072F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NUtO/deU
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 232B461830;
	Sat, 27 May 2023 10:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C15E3C433D2;
	Sat, 27 May 2023 10:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685183822;
	bh=d69AAhBzpUC0eOvHS0/YI/AvoeOO4D0EBrByjnwcrzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NUtO/deUrGniO0a+n+KCYtwmLQphTh6YanAQUwv4V0vdyu8gt1FjmDQAO1lOW6xIb
	 qxQ5lG9PJjEXCNZxqo4uIybg85UJWq2q5N5B8yx5u4VSmkYdMMtEFl9qdoD5Xm38hd
	 EeTqJ3PAxzEf6rA7S4h/i+qtAPklVhCqLIVb4NajIaspDWL4tjnsViTAfxPx1yVnsH
	 GSjkGih+69Y7Cl8PMFbxn6anPhCZa4nKa6TJyysqY0i1zlNhi+vgYMiQOAbTPbVyFG
	 vgLZXy7sAvsauUldvqMsWydMded+TxiWMeeCfq6z+6dwGJrRfhM3ZPrap0n0PnuW9t
	 E2bWCgO3ULhGw==
Date: Sat, 27 May 2023 16:06:58 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, tiwai@suse.de,
	linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: Re: [PATCH v2 00/26] ASoC/soundwire: add support for ACE2.x
Message-ID: <ZHHdSjXwyHvBezkG@matsya>
References: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
Message-ID-Hash: FEOYUUCQL6NGYRGR4H4Z5B6GS34H4XXK
X-Message-ID-Hash: FEOYUUCQL6NGYRGR4H4Z5B6GS34H4XXK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FEOYUUCQL6NGYRGR4H4Z5B6GS34H4XXK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 15-05-23, 15:10, Bard Liao wrote:
> This series uses the abstraction added in past kernel cycles to provide
> support for the ACE2.x integration. The existing SHIM and Cadence
> registers are now split in 3 (SHIM, IP, SHIM vendor-specific), with some
> parts also moved to the HDaudio Extended Multi link structures. Nothing
> fundamentally different except for the register map.
> 
> This series only provides the basic mechanisms to expose SoundWire-based
> DAIs. The PCI parts and DSP management will be contributed later, and the
> DAI ops are now empty as well.
> 
> The change is mainly on SoundWire. It would be better to go through
> SoundWire tree.

Applied, thanks

-- 
~Vinod
