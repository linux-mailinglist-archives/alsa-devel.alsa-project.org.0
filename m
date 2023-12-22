Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6088081C741
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Dec 2023 10:22:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDE6BDF2;
	Fri, 22 Dec 2023 10:22:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDE6BDF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703236933;
	bh=lS5AXFMR/oA1w2ewrBpyK0zMvQfBfEvtG0ka4k7g5OQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kOzru9TkD2sCTDsuZ7CaaQZRkYbYObU39qbydJUiSSklMpm0YXgvHCNkVRZzCjM1x
	 txmNt+hTam+jGJgXZen+ZmS9ZreZdcI8iKs3F+Q7Z6bmpOhVfDFcbTc1cItGRgWhce
	 AJEgF4gB4WJU62FZOrWOrNRHN+DZkmRE+DEr75gE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C111F8057E; Fri, 22 Dec 2023 10:21:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B0EAF80578;
	Fri, 22 Dec 2023 10:21:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7749EF8016E; Fri, 22 Dec 2023 10:21:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59C69F80124
	for <alsa-devel@alsa-project.org>; Fri, 22 Dec 2023 10:21:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59C69F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HhvmNcVF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1DDBEB8218C;
	Fri, 22 Dec 2023 09:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62CAFC433C8;
	Fri, 22 Dec 2023 09:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703236886;
	bh=lS5AXFMR/oA1w2ewrBpyK0zMvQfBfEvtG0ka4k7g5OQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HhvmNcVFQlhrA3YzfgfJlUsClmlAdlKlnEeQMz02ys1ywmYBKTzYXRusZ6P8mbu1N
	 QbE0jD+TwsMJOU1hMPOrY034LF6l9lQIXKX9HYFvAHYc2P8A0QKnspEe1KbcgElTyD
	 U2Zi3yfdyh228bg1AQ0V7B3tJ0gyJy/eaj4dHA0WeGY4d34HJ99qj1M8xl4UNqsaP+
	 J+RF78UUTZjltvyPMLfqA17n9TVR+LdryhCFMxOWPIk8akTfruy5zUeSYahXLWS36u
	 dFnJeI/9IAwzMmyynDIjlBtyNfXHyOfonE82wAoIOExpY0P+6UCOfC0jpEouL+KECA
	 NSyAyqfV8rxCg==
Date: Fri, 22 Dec 2023 14:51:19 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
	Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
	pierre-louis.bossart@linux.intel.com, vinod.koul@intel.com,
	venkataprasad.potturu@amd.com,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 04/12] drivers: soundwire: refactor soundwire pads enable
Message-ID: <ZYVVD2mL5kAePXDE@matsya>
References: <20231221073558.3181911-1-Vijendar.Mukunda@amd.com>
 <20231221073558.3181911-5-Vijendar.Mukunda@amd.com>
 <ZYRqEbVADgU4fNtB@matsya>
 <6d98c43d-fb90-4cfa-a22e-8fd6d5a6eb50@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d98c43d-fb90-4cfa-a22e-8fd6d5a6eb50@amd.com>
Message-ID-Hash: ECUHBPEFW4BIKQMGQOYZOTETD4K2PRJY
X-Message-ID-Hash: ECUHBPEFW4BIKQMGQOYZOTETD4K2PRJY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ECUHBPEFW4BIKQMGQOYZOTETD4K2PRJY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 22-12-23, 12:45, Mukunda,Vijendar wrote:
> On 21/12/23 22:08, Vinod Koul wrote:

> > so the code is copied from a GPL declared file to now and GPL + BSD one!
> > Have you had lawyers look into this... why change one file license ?
> As per recommendations from our legal team, we have updated the license as dual
> one for amd_init.c file.
> We have also observed that license terms should be updated for other files as
> well (amd_manager.c, amd_manager.h & sdw_amd.h) as dual one, which we have
> planned to submit as a supplement patch.

Lets change that first before we move code from one license file to
another

Btw why would you want to do the change of license form GPL to dual?

-- 
~Vinod
