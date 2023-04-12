Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C85E66DF19B
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 12:06:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E2EF10D1;
	Wed, 12 Apr 2023 12:05:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E2EF10D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681293963;
	bh=oeHVXBgw/xh3zO+Pnydf9J/h2XOmECN7MIu3+GNG39Q=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XDyJYTTA+NFf1GwqxxlhgBmEowSQNL9oOsAqtfMvf/5usWCsVZ8KIkRRf08UVG7HD
	 74Z6NCgtMGb3zdkz1Rfp/e7sat+8oodXcT9AVH9aAjlBL6tbD8nvsq0K6xa17iIceB
	 aFuqu0GcfBxZHa8b1C6eBhIG8dSj9ULQtjAXRVuY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88A02F8025E;
	Wed, 12 Apr 2023 12:05:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A602F8032B; Wed, 12 Apr 2023 12:05:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9959DF80149
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 12:05:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9959DF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lBFqo8Yo
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 98A4363299;
	Wed, 12 Apr 2023 10:04:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86473C4339B;
	Wed, 12 Apr 2023 10:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681293899;
	bh=oeHVXBgw/xh3zO+Pnydf9J/h2XOmECN7MIu3+GNG39Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lBFqo8YoK03T36dsFTv0c8crR6XKvyEmC7Zy7yUk/pR0W3Aj690J83FeJl5xtOzxT
	 4ymA1st86pkF1mvmWcENDVb5SuTrqPttM8b4NZf7Hvni9wesNNIsUESI/eVJadDMzq
	 UUbXFMDNbafgVI2pNfNu3Ylud/NcRiKkGyPik/MBpSz5pHlDCRKaTdl9T64dxxo/Vt
	 yH99WngCgxHZDrAqndV9njV5r2zHT7fVyQ/ScWCyT9H4Gu9Xb7fOaHf5Gce1LPvj9e
	 F0iYnoc1sfivTAHf6fAx1JKXtt5ezSchEvqtbrDEOEcMvr27msch08aFaUpa1Uj+GP
	 Q/8DsGMHwNQgw==
Date: Wed, 12 Apr 2023 15:34:55 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH RESEND] soundwire: bus: Fix unbalanced pm_runtime_put()
 causing usage count underflow
Message-ID: <ZDaCRwU+WFqNo5iL@matsya>
References: <20230406134640.8582-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406134640.8582-1-rf@opensource.cirrus.com>
Message-ID-Hash: KYES73KCZOPQQMM4HK5NJGFATQLLB657
X-Message-ID-Hash: KYES73KCZOPQQMM4HK5NJGFATQLLB657
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KYES73KCZOPQQMM4HK5NJGFATQLLB657/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 06-04-23, 14:46, Richard Fitzgerald wrote:
> This reverts commit
> 443a98e649b4 ("soundwire: bus: use pm_runtime_resume_and_get()")
> 
> Change calls to pm_runtime_resume_and_get() back to pm_runtime_get_sync().
> This fixes a usage count underrun caused by doing a pm_runtime_put() even
> though pm_runtime_resume_and_get() returned an error.
> 
> The three affected functions ignore -EACCES error from trying to get
> pm_runtime, and carry on, including a put at the end of the function.
> But pm_runtime_resume_and_get() does not increment the usage count if it
> returns an error. So in the -EACCES case you must not call
> pm_runtime_put().
> 
> The documentation for pm_runtime_get_sync() says:
>  "Consider using pm_runtime_resume_and_get() ...  as this is likely to
>  result in cleaner code."
> 
> In this case I don't think it results in cleaner code because the
> pm_runtime_put() at the end of the function would have to be conditional on
> the return value from pm_runtime_resume_and_get() at the top of the
> function.
> 
> pm_runtime_get_sync() doesn't have this problem because it always
> increments the count, so always needs a put. The code can just flow through
> and do the pm_runtime_put() unconditionally.

Applied, thanks

-- 
~Vinod
