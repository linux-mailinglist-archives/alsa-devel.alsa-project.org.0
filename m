Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED912FB9D0
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 15:53:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CDA81877;
	Tue, 19 Jan 2021 15:52:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CDA81877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611068002;
	bh=5eQUqo35H7Bc70t3PZ/r+dVaPIenZbDCpuM9ic622SM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YsFo0F7u3l8LomFF2N0uS0e12KZHqTiGjA+P6MeHY2E2kQ8Sp/M1FnmDR3iFL4BjN
	 7XJqxPlir2FDeDHT+5HAdx38OaAGDVUGapWs2s7wi+Oc6al23bbx18cQP+JSe6bJdn
	 sW4zaYK8SWijDLmJ/eI7xgaUoWpCx0i6jXjcZ9GI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7402DF8026A;
	Tue, 19 Jan 2021 15:51:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE183F80257; Tue, 19 Jan 2021 15:51:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCAE5F80117
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 15:51:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCAE5F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ccw9Y4bb"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 23A7321D1B;
 Tue, 19 Jan 2021 14:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611067901;
 bh=5eQUqo35H7Bc70t3PZ/r+dVaPIenZbDCpuM9ic622SM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ccw9Y4bbntd0K+FTaVUEotLQDh+oix5coXndu0/+ASsrKkeKgl6zklakxcLvzGrwn
 9cw2WMXw0JeUgSy9V2MZHeam1SUU9j6YoNtyp0P98CCDYbaRZMNgUq2dHB1yMrjus9
 RB6b6XkibhfpnNsKnr1R0lK1id8XOel81lmdFrwt+j7phuY2txv1dt/F+56Sf3dMOU
 b8KzzTvycJ6hzzeIotSdjuJ7PyUb/pXp8HcLNX6EMgP24Z2KgOBrYDSqAyav+1t1gj
 4gV6W6uJXnDWpS2iMkQt8CH8FpJDv+zWyZsFU265xNTkl3HJXQHvwBD262X14W27KF
 ynFQiQOWMVrVQ==
Date: Tue, 19 Jan 2021 20:21:35 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: intel: don't return error when clock stop
 failed
Message-ID: <20210119145135.GR2771@vkoul-mobl>
References: <20210114030248.9005-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210114030248.9005-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com,
 srinivas.kandagatla@linaro.org, jank@cadence.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

On 14-01-21, 11:02, Bard Liao wrote:
> dev->power.runtime_error will be set to the return value of the runtime
> suspend callback function, and runtime resume function will return
> -EINVAL if dev->power.runtime_error is not 0.
> 
> Somehow the codec rarely doesn't return an ACK to the clock prepare
> command. If we stop the runtime suspend process and return error, we
> will not be able to resume again. Likewise, if the codec lost sync and
> did not rejoin, the resume operation will also fail. As a result, the
> SoundWire bus can not be used anymore.
> 
> This patch suggests to finish the runtime suspend process even if we fail
> to stop sdw bus clock. In the case where we do a hardware reset, the codecs
> will be reconfigured completely. In the case where we use the regular clock
> stop, the codecs keep their state and worst case will fall off the bus and
> reattach.
> 
> The only drawback is that the power consumption may be higher and
> device-initiated interrupts may be lost, but at least audio function can
> still work after resume.

Applied, thanks

-- 
~Vinod
