Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5879D2CB5BC
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Dec 2020 08:21:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E32B61757;
	Wed,  2 Dec 2020 08:20:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E32B61757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606893695;
	bh=X4r+iT7gA+qhcSzwcOzyTZ4y8Ixf+TG2omJrcZ75MQI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sqPsg4I44pDyxW2oTlKjPiqR+rTB1L3iIP3kVQLzPDfM/T5EUC+w/0xrWR2x9MRHQ
	 AGkxnehTba9ZasK7BvmjVzI68Xkx5vzdto7WIuh9740Ql1VLGd2htp96/yTkatX5ML
	 UKkI/5wb9ibPsN2VQWB4FmzBgCdrOBgL2g1r0I7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18417F80158;
	Wed,  2 Dec 2020 08:20:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A919F8026B; Wed,  2 Dec 2020 08:19:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98FEEF80158
 for <alsa-devel@alsa-project.org>; Wed,  2 Dec 2020 08:19:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98FEEF80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vZHIb0b5"
Date: Wed, 2 Dec 2020 12:49:42 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606893587;
 bh=X4r+iT7gA+qhcSzwcOzyTZ4y8Ixf+TG2omJrcZ75MQI=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=vZHIb0b5Hs/sFJWT6xZsyHskbCCcI1rZC8lJtJ/hWPaXKPn7ZjXC8AR599zWRNAxk
 0qyp0ewnCHhC5ex8Xu3MNTbOMaTJIBowrTfCH9Qt1WS00iH4wEjRolFUpP8XXFVA3x
 dFOIOUphIrKPAo8dtVhBy0MfB8Ysp3akf4b/vTro=
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: master: use pm_runtime_set_active() on add
Message-ID: <20201202071942.GH8403@vkoul-mobl>
References: <20201124130742.10986-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124130742.10986-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
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

On 24-11-20, 21:07, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> The 'master' device acts as a glue layer used during bus
> initialization only, and it needs to be 'transparent' for pm_runtime
> management. Its behavior should be that it becomes active when one of
> its children becomes active, and suspends when all of its children are
> suspended.
> 
> In our tests on Intel platforms, we routinely see these sort of
> warnings on the initial boot:
> 
> [ 21.447345] rt715 sdw:3:25d:715:0: runtime PM trying to activate
> child device sdw:3:25d:715:0 but parent (sdw-master-3) is not active
> 
> This is root-caused to a missing setup to make the device 'active' on
> probe. Since we don't want the device to remain active forever after
> the probe, the autosuspend configuration is also enabled at the end of
> the probe - the device will actually autosuspend only in the case
> where there are no devices physically attached. In practice, the
> master device will suspend when all its children are no longer active.

Applied, thanks

-- 
~Vinod
