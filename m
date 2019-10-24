Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 741A1E318A
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 13:54:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E117D16C5;
	Thu, 24 Oct 2019 13:54:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E117D16C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571918099;
	bh=Ja3xrcVPnZ+7zqL9/+jtlnbaZQ5glWZ5+u+o232KJXM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZY6pm7ckRtsSGh8DgsoU99+qLPSeuwPMyAik1UoOTI71KtUEkBNmBUgIAFSzx2XrH
	 ZpglLVcDg33WrdT/XZoPQKKWNb76xo978CYimrSTCKCWai06EOvR5Otz7Uyj2rw5sQ
	 6Kr3Jk01WcpXCas6/e8vk7ft6Ixcxg30OL3Iaqo0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FC0AF8036E;
	Thu, 24 Oct 2019 13:53:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73CF2F8036B; Thu, 24 Oct 2019 13:53:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15FEBF80137
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 13:53:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15FEBF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="wWLSjaOE"
Received: from localhost (unknown [122.181.210.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 96A0F21655;
 Thu, 24 Oct 2019 11:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571917987;
 bh=99qNRQHdAv3dolhrrrxjrJsk3saJLLP8RXdz9XOhJoY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wWLSjaOE1ZSOod4ym/XUfzf9mF/N2gw6RJSxC8XU8zbYjqypBMxdzGIJeydDb9sSb
 pvQUXYCCTsFCdgHKo9bHmsJnfB4sRekhq977OtQZNUckcyeiRuNurYJm+hvdQAQ5iG
 Wy61/3f9A3NS77jQYIvoyGjLnagrs4Nwa5XOOAuo=
Date: Thu, 24 Oct 2019 17:22:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191024115259.GE2620@vkoul-mobl>
References: <20191022235448.17586-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022235448.17586-1-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v3 0/5] soundwire: intel/cadence: better
	initialization
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 22-10-19, 18:54, Pierre-Louis Bossart wrote:
> Changes since v2: addressed feedback from Vinod Koul on patch 2&4
> Add kernel taint when using debugfs hw_reset (similar to regmap)
> Remove useless goto label
> 
> Changes since v1: addressed feedback from Vinod Koul
> clarified init changes impact Intel and Cadence sides
> remove unnecessary intermediate variable
> disable interrupts when exit_reset fails, updated error handling
> returned -EINVAL on debugfs invalid parameter

Applied, thanks

> 
> Pierre-Louis Bossart (5):
>   soundwire: intel/cadence: fix startup sequence
>   soundwire: cadence_master: add hw_reset capability in debugfs
>   soundwire: intel: add helper for initialization
>   soundwire: intel/cadence: add flag for interrupt enable
>   soundwire: cadence_master: make clock stop exit configurable on init
> 
>  drivers/soundwire/cadence_master.c | 134 +++++++++++++++++++++--------
>  drivers/soundwire/cadence_master.h |   5 +-
>  drivers/soundwire/intel.c          |  39 ++++++---
>  3 files changed, 129 insertions(+), 49 deletions(-)
> 
> -- 
> 2.20.1

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
