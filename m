Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCA8277FDF
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 07:20:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B38AF1822;
	Fri, 25 Sep 2020 07:20:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B38AF1822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601011252;
	bh=cTqmilex+3/Mz5nqHJEwlsWNynNg/9jTtcwhNoLp1pg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KQR4YdoRWdGbEWyHDVxjaBebB8akAgG9/ZUxr7sIpNqrAqPRhzZOxk85IN9G/cYF4
	 HWiXPuIJ2K11cOcaxHZMGaql1hcPrbMMepGEo0Z4jdgcqgFAuCTxxCsFvB/SEUf4Gk
	 FkvCfr10iVmQmqzaQNPtbAqizQSvz6s1w2Tt1cBw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0E2AF801EC;
	Fri, 25 Sep 2020 07:19:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4300F801EB; Fri, 25 Sep 2020 07:19:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FAC4F800DA
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 07:18:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FAC4F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="S0VQRi/Z"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E2FA3208B6;
 Fri, 25 Sep 2020 05:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601011133;
 bh=cTqmilex+3/Mz5nqHJEwlsWNynNg/9jTtcwhNoLp1pg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S0VQRi/ZsJsTxsT6TX5HBbfhLTO69o/kwVObyyrQqcHwW+msAx0IRzMXwd6aC+9Do
 nTEK/yR5KsilXG8kZRkDerDiXXLm0lvSmf+HSI3Zn6dB/a6WGBEqhBz82jqBSkE6mb
 /W16xOKgfOrpDUicd8TkDitA8YnkZ7s9AC88pSMI=
Date: Fri, 25 Sep 2020 07:18:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v3 2/2] soundwire: sysfs: add slave status and device
 number before probe
Message-ID: <20200925051850.GB605188@kroah.com>
References: <20200924194430.121058-1-pierre-louis.bossart@linux.intel.com>
 <20200924194430.121058-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924194430.121058-3-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

On Thu, Sep 24, 2020 at 02:44:30PM -0500, Pierre-Louis Bossart wrote:
> The MIPI DisCo device properties that are read by the driver from
> platform firmware, or hard-coded in the driver, should only be
> provided as sysfs entries when a driver probes successfully.
> 
> However the device status and device number is updated even when there
> is no driver present, and hence can be updated when a Slave device is
> detected on the bus without being described in platform firmware and
> without any driver registered/probed.
> 
> As suggested by GregKH, the attribute group for Slave status and
> device number is is added by default upon device registration.
> 
> Credits to Vinod Koul for the status_show() function, shared in a
> separate patch and used as is here. The status table was modified to
> remove an unnecessary enum and status_show() is handled in a different
> group attribute than what was suggested by Vinod.
> 
> Tested-by: Srinivas Kandgatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Co-developed-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
