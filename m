Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC735245C90
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 08:36:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AC201683;
	Mon, 17 Aug 2020 08:36:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AC201683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597646217;
	bh=WOzCSas7pYUPfYTUIGe5up6ZYyAXxS4L+F4vNZkQK1U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sqmyHKz1hnc+PHANyywV7ezMO0SHVczH5EcD7eFoR1vEvwLgcDWL+lszeYVtBrjhA
	 tzc7cVRfYaWB3lnD3eIclsfEvN9z2BS8MlsIMzaqRQv81xuP9lU64OsfKafd9lJsSj
	 YCLTpRz+GPvj6g2xZhefvEeRz2y5un/SKp6Shafw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD74AF80255;
	Mon, 17 Aug 2020 08:35:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C43C8F80216; Mon, 17 Aug 2020 08:35:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AEA0F80218
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 08:35:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AEA0F80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HJSo0/n5"
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 21A2020716;
 Mon, 17 Aug 2020 06:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597646104;
 bh=WOzCSas7pYUPfYTUIGe5up6ZYyAXxS4L+F4vNZkQK1U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HJSo0/n5Vd+zD+WAvL5Oe4jBG6FUznp0lkrzbUYzWnyu6IdsAu8CI9w4qXsY1yqtY
 FRK8CCbq2YfnqLCRsvw674uYtvZP1LZRvU+ZIsGMwuad903CNp2et/MD2TQvfdmwdF
 qABh28s3r9qwEgA5W3q8UhHP/apIdSeKB85GYJg4=
Date: Mon, 17 Aug 2020 12:04:55 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2] soundwire: master: enable pm runtime
Message-ID: <20200817063455.GN2639@vkoul-mobl>
References: <20200726215945.3119-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200726215945.3119-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
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

On 27-07-20, 05:59, Bard Liao wrote:
> The hierarchy of soundwire devices is platform device -> M device -> S
> device. A S device is physically attached on the platform device. So the
> platform device should be resumed when a S device is resumed. As the
> bridge of platform device and S device, we have to implement runtime pm
> on M driver. We have set runtime pm ops in M driver already, but still
> need to enable runtime pm.

Applied, thanks

-- 
~Vinod
