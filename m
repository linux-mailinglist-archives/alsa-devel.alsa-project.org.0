Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 855D63F4A69
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 14:14:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F3E215E5;
	Mon, 23 Aug 2021 14:13:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F3E215E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629720884;
	bh=rXa58bEpK1TJTYaskl8eajtA23xdKsOQ8KdDNB4UIi4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xw8SBY7gfEv/5tH/rd5pzotsJ37hDEdfhIupcpJheA4mKeTZYkieultRv1KxcwWjC
	 H0U8WDbv0InyuuhwbGk/Hp6VRZh8X8rIUVFQxjP3wOuLkxdvX8P2vOUMwmZeWBM7N/
	 qc+Ae+EhnpQXe5waVm0ZTv+azYJ6w/+GYQ+P9brw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A13EF80430;
	Mon, 23 Aug 2021 14:13:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 831CAF80424; Mon, 23 Aug 2021 14:13:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 214ACF800B6
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 14:13:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 214ACF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="At2fhNL3"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BB4236137F;
 Mon, 23 Aug 2021 12:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629720779;
 bh=rXa58bEpK1TJTYaskl8eajtA23xdKsOQ8KdDNB4UIi4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=At2fhNL3DlA6ciYyIrmGX5vZ/Zgsqv+G0RarW3YcBcxat64UzdzoKTZWaKxQEIO6+
 XBRV/QB08brgm8qUGlX9QpwY9/rmFHF2ZgISRFvPJTOYoSfLuL7/oGB/SawLMGtdoT
 ntANYVR9K7Kd3AgWNFzZjmrafQRgS+7ez79IcJ47MmbYEq1JFE/JDkKrQpAEFmz8+I
 GP+sM94ht9Mao6aAyRHHu29Tzw5kYpmXO2+8uuB6oes1FCznQssVKtuwBOgr6/tqum
 hpcp9Xo+aX+lcXWa1Okx100oT/Xpxg45y8pdc5y0QFGoXOAp7VsOcwxW0sNhVUjjPL
 QpASYVXPRrSvg==
Date: Mon, 23 Aug 2021 17:42:54 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: cadence: do not extend reset delay
Message-ID: <YSOQxk7qHaj184J1@matsya>
References: <20210818030130.17113-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818030130.17113-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 sanyog.r.kale@intel.com, bard.liao@intel.com
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

On 18-08-21, 11:01, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> The duration of the hw_reset is defined as 4096 cycles. The Cadence IP
> allows for an additional delay which doesn't seem necessary in
> practice: the actual reset sequence duration is defined by the sync_go
> mechanism, not by the IP itself.

Applied, thanks

-- 
~Vinod
