Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D78337AF1
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 19:23:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13742850;
	Thu,  6 Jun 2019 19:22:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13742850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559841787;
	bh=Mn1hqWm8qDSl2v45Dh7BXPpbx6NaGResSvofTaWKubY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M7uH6SDWpJE2D14Ac5OvEbkBQ4g42H2VX7YusVZdKi5aZvzV69JxRuG6N6W4ESEwe
	 bgbvhEOYlnJ9a1f7wBMPTyXsxfeC9fL96kr0j7KnxCXZgSJkAeAn8klVXfPOtbhc0V
	 Aqc5Lwgf/crVKZgV/19awOKYfq6F3DlE+eY4FlXE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3709CF896EF;
	Thu,  6 Jun 2019 19:21:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68084F896F7; Thu,  6 Jun 2019 19:21:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DBEDF80768
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 19:21:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DBEDF80768
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GZaszXjp"
Received: from localhost (unknown [106.200.230.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 623B62083E;
 Thu,  6 Jun 2019 17:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559841676;
 bh=I/rvHo9bLLx0LGwz77STImMguRJWk3J4MC7sA4wpYxw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GZaszXjpaZrArJSQLPce12MPD86tSIVaqGz2hdOSxmJlIj7O+M2xosutN40by5PGL
 heaic1LuOVfW8s2Pb2mcv3baxvaSIqMHSpzm1hbIbNJzGBnOwN+ZMHt2lbJUY74DPS
 UvL2671Grg0zPs81woOYLKnZc69jg186SJarydzI=
Date: Thu, 6 Jun 2019 22:48:07 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20190606171807.GB9160@vkoul-mobl.Dlink>
References: <20190606112222.16502-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606112222.16502-1-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2] soundwire: stream: fix bad unlock
	balance
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

On 06-06-19, 12:22, Srinivas Kandagatla wrote:
> multi bank switching code takes lock on condition but releases without
> any check resulting in below warning.
> This patch fixes this.
> 
>  =====================================
>  WARNING: bad unlock balance detected!
>  5.1.0-16506-gc1c383a6f0a2-dirty #1523 Tainted: G        W
>  -------------------------------------
>  aplay/2954 is trying to release lock (&bus->msg_lock) at:
>  do_bank_switch+0x21c/0x480
>  but there are no more locks to release!

Applied after changing the log suggested by Pierre, thanks
-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
