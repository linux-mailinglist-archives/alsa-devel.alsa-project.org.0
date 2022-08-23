Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B65459E82C
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 18:58:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5416916B9;
	Tue, 23 Aug 2022 18:57:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5416916B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661273908;
	bh=ILofJQNAPtCt8D4KROyhb9HXhaTVCSnLCCkexZJs6WQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BFQmFJ8c40ru4QU9kieYB8YYPWjMvADWqpOFi8fRWWzqjc+RmxHx9wRNMEX/uoN04
	 mwMDjNBLrE5oRzGvdythiJvM+ZkXDqQ/5AV5NH4Y+e74MEUYQC6M+WPONpq7qkXEf6
	 GnpghSij16U6lz9t5HnQnKae47qV6Gjed8M2+jtM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 028A6F8014E;
	Tue, 23 Aug 2022 18:57:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29B84F8020D; Tue, 23 Aug 2022 18:57:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2716AF8014E
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 18:57:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2716AF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aj5W19QI"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9CDD9612A0;
 Tue, 23 Aug 2022 16:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E004C433C1;
 Tue, 23 Aug 2022 16:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661273847;
 bh=ILofJQNAPtCt8D4KROyhb9HXhaTVCSnLCCkexZJs6WQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aj5W19QIbx6s3zf4uNbcihaIRNhaCWfnn1FHQfFMoLMcYfhkOA4MvkAB9GQXj0LwJ
 3/J514Yqs4iGttCRRYqf3pp2S0XBEn1YIdBkz9fqkPErZLhz7DnW4D4JxRnzOXroKK
 Sqm0lNOIExWp6HXueo+QxZKFlVm/LyUJmpvm38EiHCZ0IEK37EzippOJp6vD3I3uEt
 uLcdRv4o0ShoSkKxrwvsgkzPalhGdFNIhN41q48Z8dhXodCovB4F7ypU8YYdzdGkLR
 1oyDErA687AWLL+T9q+wySrExvJDY8B2ZG2FNzcHrX8lIzvNlr8x08DSZTye1j953w
 AiOE25T30Pkfg==
Date: Tue, 23 Aug 2022 22:27:21 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: dmi-quirks: add remapping for HP Omen
 16-k0005TX
Message-ID: <YwUG8bRepEWv0imD@matsya>
References: <20220823030919.2346629-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823030919.2346629-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 bard.liao@intel.com, pierre-louis.bossart@linux.intel.com
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

On 23-08-22, 11:09, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> The DSDT for this device has a number of problems:
> a) it lists rt711 on link0 and link1, but link1 is disabled
> b) the rt711 entry on link0 uses the wrong v2 instead of v3 (SDCA)
> c) the rt1316 amplifier on link3 is not listed.
> 
> Add a remapping table to work-around these BIOS shenanigans.

Applied, thanks

-- 
~Vinod
