Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF49567D9F
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 07:12:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68F62164D;
	Wed,  6 Jul 2022 07:11:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68F62164D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657084342;
	bh=VTVDAzmvFZeLwmVSF2l4CuD4DI0rMKlYWh26whbQ5dw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NC9XVNMKtY4MVW4EvrDk3EkOiG79jJveYA6tK4yd4SEKVT1/Kb7m+/rt3lSKqtZFy
	 Bu5afbyF3XSqZHgQdsuZY/0TrGqNkR2uMUX5G5Y3F5LVQpXbGtOUKT7kZyby4WJzY/
	 mgNjz7CwCQoqFLj7NJm5jYkCS5dHiT2v6yNxy3P0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7507F8032B;
	Wed,  6 Jul 2022 07:11:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE765F8023A; Wed,  6 Jul 2022 07:11:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C41EF800C5
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 07:11:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C41EF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RZxdkOx0"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 505C7CE1BE3;
 Wed,  6 Jul 2022 05:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D39F3C3411C;
 Wed,  6 Jul 2022 05:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657084267;
 bh=VTVDAzmvFZeLwmVSF2l4CuD4DI0rMKlYWh26whbQ5dw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RZxdkOx0vdbUwkuiphEfMul7Tvcnq0bhvIHfYtZY5tO+aEpVmCTep8DiymI9FVWGB
 cQb/sWYI1pGeOCkvMh2jfQoP+imE9qefA58JaGOlK7K27cEpaHysUj9wIN5jUiLJL3
 AFJu2WqcfLiVSJhLPZUL4L2gd/uSZdxLfKQz2cX/fdeM31712yryWKai3UyLtp+PaX
 2A+I2nYt9t6tnlAUETWbb9mAHjUAHlTUglPduuGaLTVDlw4i0m89u+F7HL7WZVdDIs
 1jAOuu8TIUTRdeHB81BBvjGujdfqeQp3HapYm1jDIaIK2q9MJM62b1JBLlhYAdoGB7
 Pm0oIgLVqk1aw==
Date: Wed, 6 Jul 2022 10:41:02 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/3] soundwire: revisit peripheral driver bind/unbind
Message-ID: <YsUZZmQsz25YNfM/@matsya>
References: <20220621225641.221170-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621225641.221170-1-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org,
 Bard liao <yung-chuan.liao@linux.intel.com>
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

On 21-06-22, 17:56, Pierre-Louis Bossart wrote:
> This patchset fixes the driver bind/unbind cases which are not
> well-supported today. I initially reported a race condition in March
> 2022 [1] and the more tests I ran the more timing assumptions crept to
> the surface.
> 
> With this patchset, I've been able to bind the drivers in any order,
> and when all dependencies were available the card is
> created/registered. Likewise I was able to remove codec drivers while
> the bus was still running. The initial suggestion to use
> device_lock()/unlock() led to system hangs in suspend-resume that I
> was unable to root-cause after weeks of tests, hence this patchset
> relies on a SoundWire-specific lock doesn't interfere with other core
> device locking.

Applied, thanks for this cleanup.

-- 
~Vinod
