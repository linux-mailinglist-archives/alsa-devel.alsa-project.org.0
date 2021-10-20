Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 065F7434EFB
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 17:25:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72006168C;
	Wed, 20 Oct 2021 17:24:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72006168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634743546;
	bh=AOrEQwh34odxrVdGxLcZw5Q/dM4ELKaoGa+EpDOkYOE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xs+B0KIta9oLPdp7S6kAYvDOSlRiKlj5oIxodQeG4AmYt+MBupT5wSZwS1VDBDkWI
	 XwYmo43uv9FS78miJLoOA0RyR5A15VM8ZeB3/KNVbm21xg3nY3mCuFsffFdmwkp9IC
	 Ttgipsxv5NA2fyEAXMlMGB6zvX/TberCPfedKvj8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C98D3F80253;
	Wed, 20 Oct 2021 17:24:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F40DAF80229; Wed, 20 Oct 2021 17:24:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B6FFF80082
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 17:24:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B6FFF80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jL2FLach"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D6C561359;
 Wed, 20 Oct 2021 15:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634743459;
 bh=AOrEQwh34odxrVdGxLcZw5Q/dM4ELKaoGa+EpDOkYOE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jL2FLachzm67lr6dxj9OWerbp5bmJW7FMsLMsn7pXERMPhOVjqkuzcQjKxcESGGVH
 LVRf5YlF7F2M5gYXGVYqWZnli9Bf3XI0snkhWDwKN6Mbuui2g4tG6Q9Df6ZDyKZhTf
 o2iISKn4ziIe5MT/I9JjUcUFRjQJxyWI4coVzoTM4gqHKgNamzSoI5ulqmFrb8TIH7
 qmm0jRbEDLi/LQr5IydPIvaZhFg4ohSiWvnpvvUZYRu3SiqPBBuJ3WVyNOYE2eBLHV
 QXXI+p+Gg44PtCIoS8k3YZY65kRNTucmakRtjCK9/MkDHTwXpv7RZXUyYu1EabFw5b
 GXuZlfEHCvMFw==
Date: Wed, 20 Oct 2021 20:54:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] soundwire: bus: stop dereferencing invalid slave pointer
Message-ID: <YXA0nyvwuC+qWu+C@matsya>
References: <20211012101521.32087-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211012101521.32087-1-srinivas.kandagatla@linaro.org>
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 rander.wang@intel.com, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com
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

On 12-10-21, 11:15, Srinivas Kandagatla wrote:
> Slave pointer is invalid after end of list iteration, using this
> would result in below Memory abort.

Applied, thanks

-- 
~Vinod
