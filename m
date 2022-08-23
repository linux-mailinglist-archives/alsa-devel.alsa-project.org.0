Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B731559E82A
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 18:57:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 506E416B1;
	Tue, 23 Aug 2022 18:56:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 506E416B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661273848;
	bh=ykYOL7gSGZDNnRRgDev5HSCvPkulm8hwq0MTZUqdvIs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VoG3cl5ObMy8iGcf+XsTj5AwxXur8DfWidkLTuz4VjAvJXxmsOUh3zkRvwRga5zbj
	 EQzat4+CxuGZt8znrsZ5znurj3CkZ+M3NFnMBNtvsJz7OFigAwB5fkBi6M1UiW//ZA
	 VkOX0NjBW2zVnRPUQ7KYZXoharPFNIEczl7pemXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C224EF8027B;
	Tue, 23 Aug 2022 18:56:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27757F8020D; Tue, 23 Aug 2022 18:56:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4B52F800C9
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 18:56:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4B52F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V8KLKrAa"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2B4D7B81CED;
 Tue, 23 Aug 2022 16:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07B8C433D6;
 Tue, 23 Aug 2022 16:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661273783;
 bh=ykYOL7gSGZDNnRRgDev5HSCvPkulm8hwq0MTZUqdvIs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V8KLKrAasaWWsnbIU2WmG9qwRPo+0fdQ1cWag0aWOWkdTePkE+I/+70Jxg8jqrQHa
 q+R11I8FRN0VR9U1v/VNlVKXoRULKw2h0fE30JxNzb/7RIojEIlbVRXWWuyr0Mflaq
 pxGJn6Rxcz4KPqy++T5a5bdi6vaZe54T86i5Y794AA6JWPMXgv+6rRoLxJ6UxASQhh
 CeyPXIluvSbgHw7+EEI7d6gVm4w/jEh9zFd/sCB3cFi2S0oEBIv1CBFGySs5oFGOxC
 ZdY+i6TclHBMqnKUFKY5O7oLzwE2RpF4xIuP5I0T7h74SF1+6pyTtL4+vXe+EkXJUY
 bOl/Fe5GFDEVA==
Date: Tue, 23 Aug 2022 22:26:18 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Khalid Masum <khalid.masum.92@gmail.com>
Subject: Re: [PATCH v3 linux-next] soundwire: intel: Remove unnecessary TODO
Message-ID: <YwUGsucV4DMU5ZXp@matsya>
References: <20220817074859.4759-1-khalid.masum.92@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220817074859.4759-1-khalid.masum.92@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 17-08-22, 13:48, Khalid Masum wrote:
> The capabilities enabled for multi-link are required as part of the
> programming sequences, even when a stream uses a single link we still
> use the syncArm/syncGo sequences. Therefore the TODO is no longer
> necessary.

Applied, thanks

-- 
~Vinod
