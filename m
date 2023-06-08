Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86017727F04
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 13:41:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EF1D1D7;
	Thu,  8 Jun 2023 13:40:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EF1D1D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686224503;
	bh=fMlsmt82Ib7I6t+N+Wk5ayBUVMcy6ID8LIVIDHkBIHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i6m2Tkfo0Ud/Zav4mkodkqHTllpVxTUm5xjDkkztUyBWeGBuic63PFSmbAFWlodsf
	 CIwHGEYpztH3YgfF53VMoQ7mho8inP8XtxGjljap2aPu+6qbLMJCoxKvsJvU9zWLrn
	 K/j25uZ3/qB2WEIdbgQccBbHiRHXFXiaXEoqNT4k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6810EF80494; Thu,  8 Jun 2023 13:40:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C1F0F8016C;
	Thu,  8 Jun 2023 13:40:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2F3DF80199; Thu,  8 Jun 2023 13:40:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5083BF80155
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 13:40:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5083BF80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BDHZ/TRj
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1AB3061041;
	Thu,  8 Jun 2023 11:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA0FC4339B;
	Thu,  8 Jun 2023 11:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686224444;
	bh=fMlsmt82Ib7I6t+N+Wk5ayBUVMcy6ID8LIVIDHkBIHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BDHZ/TRjhfhSoHxwc7qdBTvYyq4Eru1PzhV0+/2rLTQSkd5iPYbt6a5tj3wF3T1oR
	 WPIXbDC5B63ZUI8omlWMWG3DjpK4f+Wc8kzkEsVTaUXfBZlfhe+Tk9zYxG4FiZJfgW
	 22hO1RvaJbMIUm+/84HAONphUhcY0MIHLCRpiKoiloQ5/BLSRLI4smBnEf97zUOMsK
	 5ZWxZgQKAXiq3cyRJIfh+zDvJOUbqI6xNA5YIQ3TaHrt166ydZ0BvnuTrnhoLngPt7
	 rbWhSn53iaRl0qHTFhEriTUZdIKQG0XMHYiJ6GGyznuST1p4gSOTZI8KUrtXVHrhTR
	 nnTyVP9TnLZEQ==
Date: Thu, 8 Jun 2023 17:10:40 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
Subject: Re: [PATCH] soundwire: debugfs: Add missing SCP registers
Message-ID: <ZIG+OJ4P6t2KIgKK@matsya>
References: <20230607020632.1030309-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607020632.1030309-1-yung-chuan.liao@linux.intel.com>
Message-ID-Hash: R3DKEO2HJU24WOFOAGYX5PS4OSFFK67C
X-Message-ID-Hash: R3DKEO2HJU24WOFOAGYX5PS4OSFFK67C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R3DKEO2HJU24WOFOAGYX5PS4OSFFK67C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 07-06-23, 10:06, Bard Liao wrote:
> From: Uday M Bhat <uday.m.bhat@intel.com>
> 
> SCP registers needs to be updated to accommodate additional
> register entries as per the Soundwire 1.2 specification.

Applied, thanks

-- 
~Vinod
