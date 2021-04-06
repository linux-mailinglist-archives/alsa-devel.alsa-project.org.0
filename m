Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C495B354BD9
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 06:55:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CBBF16C7;
	Tue,  6 Apr 2021 06:54:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CBBF16C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617684949;
	bh=0rww47IafzbgbXEYx+IN9+Ntm6//M9vv4zbbSzEGEjI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XrPL7sw33n4GwDAkkIy9CpngM+ZzDc9+D3cCtLB9hc/TnjoUDsS9rtM81Aha55Usp
	 GE3mmjPOrflSoguYAaYVZ8392YUy7wT5PZ9Mv9HmccXNj4BmKbZAYl65hWdNa2VAUQ
	 RVCMbB4dgTscaBxWhl0ykY427uVApmZK3s79mE/4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 999F0F80246;
	Tue,  6 Apr 2021 06:54:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBFCCF8020B; Tue,  6 Apr 2021 06:54:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDDF2F800E3
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 06:54:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDDF2F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ILA0ZYTM"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0102060FE6;
 Tue,  6 Apr 2021 04:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617684851;
 bh=0rww47IafzbgbXEYx+IN9+Ntm6//M9vv4zbbSzEGEjI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ILA0ZYTMD0zZgHbfiZ+OqXegUsN/guH1H33DakqVpXd2ys4dC/i7kDBO+J4/LBxCu
 2uQtQDl3UkAmjGBJa3oylZDF7St1Dm4SnJDLPXxfDoPoJL1r8nV5t0ZF2pk2f6Wzl/
 IenjOnaGureCio8F627XUvIYoqYoBknDZx0Au5DtdcicG1ndL4N+peiUVVQ8bIW15f
 AcGia9o/mh1a4rHJvvTdycTsKp7nEbXVt2gc4QKb1GCPXp1uYZXF8iiHioyCL9kmGI
 kpYfi9jYQqxLEAGcMpXP0531npQRkPYfk4rOtMvHrg0mL/7bLz1b0meDnMSW+I+TAX
 RTsi7vZAzZxEg==
Date: Tue, 6 Apr 2021 10:24:08 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] soundwire: qcom: cleanup internal port config indexing
Message-ID: <YGvpcAcOGWiOFWim@vkoul-mobl.Dlink>
References: <20210401092454.21299-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401092454.21299-1-srinivas.kandagatla@linaro.org>
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
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

On 01-04-21, 10:24, Srinivas Kandagatla wrote:
> Internally used portconfig array for storing port bandwidth
> params starts from offset zero. However port zero is not really
> used and we also copy the bus parameters to offset zero.
> So basically we endup with a code which has to subtract 1 from port
> number to get to port parameters.
> 
> This is bit confusing to the reader so, make this bit more obvious by only
> copying the parameters to offset 1 instead of zero. This will avoid doing
> -1 every time when we try to get port params.
> 
> Similar thing has been recently done with din/dout_port_mask.

Applied, thanks

-- 
~Vinod
