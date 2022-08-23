Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA4159E673
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 18:01:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79F6B15E2;
	Tue, 23 Aug 2022 18:00:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79F6B15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661270474;
	bh=wwA2YBGNNnFA5PDfuSBe87l2HUq3ccMQ6rtyqsiqxMU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oIAP2clx0fo1crZM/ObGqWWi9Y3w2I36/fGOtBe6/MJDr0sn1I89Jq2rScjI3nQ2z
	 eaAxANtWJYb169JQwqeXYWy79T4FnWbLyd7I3VW4xVvkUi2xWFy9eHewYD6gtAKa1F
	 15g+ZIPjhXnfIgWZTXQDzKrpkJSecbWWVsep899Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A310F8027B;
	Tue, 23 Aug 2022 18:00:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3002F8020D; Tue, 23 Aug 2022 18:00:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A820F800A7
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 18:00:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A820F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="D2wzR9sr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 00C97B81E5B;
 Tue, 23 Aug 2022 16:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34439C433D6;
 Tue, 23 Aug 2022 16:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661270406;
 bh=wwA2YBGNNnFA5PDfuSBe87l2HUq3ccMQ6rtyqsiqxMU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D2wzR9srCXN1qFL5426wgoeqRnsuJ0GkcO8kvNGy+dgikGCoykZkcyFXACWabGHM1
 DYNag5zeaudntWOiwvzIvTQOuE84z7uHTNCfhY6Dr3z9CRv2yMPkg412p0fzCFbWIz
 2UfVn1OEvm2EYh/l0vA/+k04YnAaXnddlF36KkCh4iJTF4QuYMG6QehMauZtjnGv3w
 fuIMBTQ29WWV1jxEZPFR9PmGwv3hlkZPDscXPJqQ4jyH+td2N87GLmg3vhIK7KqadG
 PaB9wvyKjSwKQlfmgOjASXPoMCOLTJp0KSkMsWhXc6fDECMdL0kVj0QmrHIzrAgTp0
 5rgSHZ/mAYZJw==
Date: Tue, 23 Aug 2022 21:30:02 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/5] soundwire: sysfs: move sdw_slave_dev_attr_group into
 the existing list of groups
Message-ID: <YwT5gqOihDYK73aF@matsya>
References: <20220729135041.2285908-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220729135041.2285908-1-gregkh@linuxfoundation.org>
Cc: Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org
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

On 29-07-22, 15:50, Greg Kroah-Hartman wrote:
> The sysfs logic already creates a list of groups for the device, so add
> the sdw_slave_dev_attr_group group to that list instead of having to do
> a two-step process of adding a group list and then an individual group.
> 
> This is a step on the way to moving all of the sysfs attribute handling
> into the default driver core attribute group logic so that the soundwire
> core does not have to do any of it manually.

Hey Greg,

DO you have a v2 for this, or if you are too busy I can update the
patchset...

-- 
~Vinod
