Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9192C4E74
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Nov 2020 06:36:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D470E1689;
	Thu, 26 Nov 2020 06:36:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D470E1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606369014;
	bh=SQ9EM5DKO0FDPcLkKrOAzp0Hp/ce+DVQ/7l3J/t9VW0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PraoT3GZLesl0Rp2t9kuPb1OC1m6cY/ODixj+AS3RM1bWlxnDM8JXU8XKQ/8B9O7C
	 xs9fNiy6XD+XFHJdJrYSnqlb7A72G6z8GZ+7VJXzPAQq5kxlOdbrzYvzUDS6NZApG9
	 dbcvI7yAmG6waRrk92/iNOjJGfSrjzojdUKpg6AE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0384CF80166;
	Thu, 26 Nov 2020 06:35:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7A3FF80165; Thu, 26 Nov 2020 06:35:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 118C2F80159
 for <alsa-devel@alsa-project.org>; Thu, 26 Nov 2020 06:35:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 118C2F80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="kGO0lGep"
Received: from localhost (82-217-20-185.cable.dynamic.v4.ziggo.nl
 [82.217.20.185])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A4735206F4;
 Thu, 26 Nov 2020 05:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1606368907;
 bh=SQ9EM5DKO0FDPcLkKrOAzp0Hp/ce+DVQ/7l3J/t9VW0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kGO0lGepBUjnAlHlzQN4Jlh4CXkMW1fymbSXk+6d15tvpFg3wHnRD4iO2LEhoIQh5
 VSSwmroq4BFfe+OQUvkxwztb50N6mLqusiFQ2p/4+CX8UtuvDgiJqQwgY2q9X8rDE4
 r9Uyj/JvQW6+kfH4chIFlYTlKwMXnTAhO0v/fBjg=
Date: Thu, 26 Nov 2020 06:35:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] regmap: sdw: add required header files
Message-ID: <X78+hlJTgA3FdmxY@kroah.com>
References: <20201125130128.15952-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201125130128.15952-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 vinod.koul@linaro.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

On Wed, Nov 25, 2020 at 09:01:28PM +0800, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> Explicitly add header files used by regmap SoundWire support.

What is failing to build without this?

thanks,

greg k-h
