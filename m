Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A837A27A717
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 07:51:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A0061ED5;
	Mon, 28 Sep 2020 07:50:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A0061ED5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601272291;
	bh=DZwNX7Zm7AQR4iYmxgQo4rofJ2VIk5bvpkNSoYmOCxc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a80RaXvZYTC+wZMWihGpCmspLgY6UmOoo0FIKZfEEohleE48zw4Aq4LkqEsKAQknJ
	 9uBzNArJn4eFzCy8MhbpkWDV4zK9kNxSXAGun4i37ypnHZroOFo3Ylzlc1REPF1ptW
	 bjnZyxD6I7CQqdgM/6D0bm1RFIr5ew4wfxJfyRHg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F7BFF80228;
	Mon, 28 Sep 2020 07:49:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7DC5F801F9; Mon, 28 Sep 2020 07:49:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FCF9F800DF
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 07:49:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FCF9F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ja+P0jxP"
Received: from localhost (unknown [122.179.43.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E17F2068E;
 Mon, 28 Sep 2020 05:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601272174;
 bh=DZwNX7Zm7AQR4iYmxgQo4rofJ2VIk5bvpkNSoYmOCxc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ja+P0jxPMmj/pz97W1p9rHlsI9o7u08LpR7gBW+v8unF3/b/FfgypDB2d/KRcmgX7
 ubZbVcvqrfGkcdsWSjoAHiCnGty5IfYCZNqOx7N2M9SJy6ybF4CjLrSuwaLO3FEV4C
 JGY8oAQfIpL3W0o7DIYGzd9JclAN+f74G6HbnMz0=
Date: Mon, 28 Sep 2020 11:19:22 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v3 0/2] soundwire: sysfs: expose device number and status
Message-ID: <20200928054922.GI2968@vkoul-mobl>
References: <20200924194430.121058-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924194430.121058-1-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
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

On 24-09-20, 14:44, Pierre-Louis Bossart wrote:
> This patchset combines three contributions:
> 
> Srinivas Kandagalta suggested creating a device even it's detected on
> the bus but not described in platform firmware. I suggested adding the
> device number and status to show the difference with 'ghost' devices,
> described in firmware but not physically present. Vinod suggested a
> simpler way to report the status.
> 
> I did not keep Vinod's patch separate since it was using the same
> group attribute as the other properties, which prevents status and
> device number from being reported if there is no firmware and no
> driver.
> 
> These patches were tested on Qualcomm and Intel platforms.

Applied, thanks

-- 
~Vinod
