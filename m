Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3436947DF3D
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 07:59:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C49541700;
	Thu, 23 Dec 2021 07:58:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C49541700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640242762;
	bh=EzQ75FlGoi7auE3z70CQ4I37sP8CGTCjYus3IThKn/w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l5brmBHS+l232ThnTL9MdSteuS+z9SOyJIGQHDoIBfTy9Cv0G781txeh+YY7LK/12
	 ra3Fu9+TYmUnEgDpUOPK4/T8usOL1pHU3cSa0rfm/tJ6GVKLsjIsEmqnUw5dU/kOWk
	 d/T+M2BX6zKBljfW9nl68ReoiGD2PqctRQcPoj3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61F2AF80115;
	Thu, 23 Dec 2021 07:58:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86062F80105; Thu, 23 Dec 2021 07:58:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F14EF80084
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 07:58:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F14EF80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WyFNywQh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8E8EC61DC8;
 Thu, 23 Dec 2021 06:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD26C36AE9;
 Thu, 23 Dec 2021 06:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640242684;
 bh=EzQ75FlGoi7auE3z70CQ4I37sP8CGTCjYus3IThKn/w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WyFNywQhsRhKX4zrOb0FMUOoVf5QlZCAYU21WCoLjDQjraAXHYYiJJCxAVohR6Ls1
 zgldUacvdHGfe3aWUR33MMa80gxKPehT1qpZ6A5jdlxXfzFXiru/mFG8/aXn8COZnt
 p8Kusleb31RMVIq4RTVeiwtRoddnw0rnP4QBUBT7hrmxitZwwh1MecaoCf+E9ISDOo
 zg4NJL4aXEsa3cXnIW2N+rHsJoTI+ij6SCS2QzvCdh8VptVPvJ2QCYoej45zOA1v1O
 IWEF3rlnr2GDE0uWXfuy1QTMhxCX5OmaHHE0/J0YR2TCIaEJOu+Dy/yL8D085ZRadQ
 phxi6arp/e32w==
Date: Thu, 23 Dec 2021 12:28:00 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 6/7] soundwire: intel: remove unnecessary init
Message-ID: <YcQd+FTe+C4/Xpt1@matsya>
References: <20211213054634.30088-1-yung-chuan.liao@linux.intel.com>
 <20211213054634.30088-7-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211213054634.30088-7-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com,
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

On 13-12-21, 13:46, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> cppcheck warning:
> 
> drivers/soundwire/intel.c:1487:10: style: Variable 'ret' is assigned a
> value that is never used. [unreadVariable]
>  int ret = 0;
>          ^
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Rander Wang <rander.wang@intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
>  drivers/soundwire/intel.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index e946d1283892..45ea55a7d0c8 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -1613,7 +1613,7 @@ static int __maybe_unused intel_pm_prepare(struct device *dev)
>  	struct sdw_intel *sdw = cdns_to_intel(cdns);
>  	struct sdw_bus *bus = &cdns->bus;
>  	u32 clock_stop_quirks;
> -	int ret = 0;
> +	int ret;

Ideally this should not be part of this series!

If Mark wants to pick:

Acked-By: Vinod Koul <vkoul@kernel.org>

>  
>  	if (bus->prop.hw_disabled || !sdw->startup_done) {
>  		dev_dbg(dev, "SoundWire master %d is disabled or not-started, ignoring\n",
> -- 
> 2.17.1

-- 
~Vinod
