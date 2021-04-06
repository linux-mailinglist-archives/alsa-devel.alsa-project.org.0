Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2A0354BDC
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 06:58:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33157166F;
	Tue,  6 Apr 2021 06:57:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33157166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617685111;
	bh=eykr2zRjV23awTWOCrs34NVHeBS+R0SLLVT/NQ4p5mg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sSmMmKKrI0KedHoq3+//GqfjRsswSP0PbRy34ddZDiWQ4AtgkjilPbPloKspb83Wd
	 xdbPc2FTlKKs3fad/MoWHRG0hmEVVzXQEDkpdMm7xdYxT7QFeGdqC3lAxQXLvHt0Xd
	 Q83A0/gzl9IHIgrmN7IXMulVQjqYwP9afMyfeJaE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71648F80246;
	Tue,  6 Apr 2021 06:57:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBCFCF8020B; Tue,  6 Apr 2021 06:57:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08508F800E3
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 06:57:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08508F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KMl7fCzf"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7634960FE6;
 Tue,  6 Apr 2021 04:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617685019;
 bh=eykr2zRjV23awTWOCrs34NVHeBS+R0SLLVT/NQ4p5mg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KMl7fCzf+avFIw8n5FkcmYURstc51T80anYnwq8M8t+W0/9e+g01HxTZ8EMIqVY1k
 Ejn/7OtPzeNJLzB5M16CGrxT+KVCfIbkz/MX1IjBp71wvL5IOqWOVnhkt1x36+C2M8
 W95NRiSnEgDOBegAPE1Rg9s1iA4nV4HONgfqVpUbg8H2+wR0bzX49foYchJOdXXgUs
 QUyDZ5eWBNKRcVmpQTKIVLQlYn8zm7TqA+yI5mHk0UcbQuBpd1YeIQ6hk1FzVccYLC
 qta1zYorfZzbAm0h7CyBFa7ao41d3omkxJVzVBEat0eFoihqavebMDyExJkktKv2XO
 2Xihgl7JUvxRQ==
Date: Tue, 6 Apr 2021 10:26:55 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2] soundwire: intel_init: test link->cdns
Message-ID: <YGvqF43nP9OE7Y8d@vkoul-mobl.Dlink>
References: <20210406010101.11442-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210406010101.11442-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, sanyog.r.kale@intel.com, rander.wang@linux.intel.com,
 bard.liao@intel.com
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

On 06-04-21, 09:01, Bard Liao wrote:
> intel_link_probe() could return error and dev_get_drvdata() will return
> null in such case. So we have to test link->cdns after
> link->cdns = dev_get_drvdata(&ldev->auxdev.dev);
> Otherwise, we will meet the "kernel NULL pointer dereference" error.

Applied, thanks

-- 
~Vinod
