Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44559311C98
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Feb 2021 11:28:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A11E815E5;
	Sat,  6 Feb 2021 11:27:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A11E815E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612607309;
	bh=T+7tJ8N28DhBC0FiHzy9b548DcuDktyP9XhUL1tWkYo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zahux1hoie+tTvKjtTDXvhRcwgtGVmW/5VmpdLVOkae0qVlUOd9g0ATvUMTfk2w0p
	 PDfbTOkqn1la0Fr8NxQtMfb16FkoSBUuAByNhv7xGDMli9DGdRMHaykF3UrKXC1DKS
	 HMAfQJFYKWh4o3Q0/rtpEC2mDKHq+S4NE9FiqQok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4585F801F7;
	Sat,  6 Feb 2021 11:26:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F3C7F80171; Sat,  6 Feb 2021 11:26:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A93AFF80095
 for <alsa-devel@alsa-project.org>; Sat,  6 Feb 2021 11:26:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A93AFF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="J/XcP4g/"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9CF7B64E30;
 Sat,  6 Feb 2021 10:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612607209;
 bh=T+7tJ8N28DhBC0FiHzy9b548DcuDktyP9XhUL1tWkYo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J/XcP4g/U9mFvg324pexE9yyBaNcn+AX0V2hEa3UcbfSPCsvgmyH5xCpDu3nut+hL
 d4Zp9fhtqx1ieRP2AH7g7A/v1/cxfNckyq9cjYV1mP8Prq1wqAlC3TcRsuWXGmVMNe
 c9bStB+KS3ukTrm7U0BB9RqTkBWpd8LOgSNU/7cFvaAAv25Hbt6LbdhWtNpLf4nBhS
 pJNcISwFvMIso4J5IFFc2P8z6t8qiOF3gmDlGgIMUtyhHc/QEt76DXj6B0VCjRYS4E
 0s3m+s++d9o/TJ9219EpOE2KoTfEqVtCTnZ2OWhjoZkqsvodF/hQ0WSB4nKaKf+PZt
 h6Pdkz7nsSuag==
Date: Sat, 6 Feb 2021 15:56:44 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [RESEND PATCH v2 0/9] soundwire/regmap: use _no_pm routines
Message-ID: <20210206102644.GN2656@vkoul-mobl.Dlink>
References: <20210122070634.12825-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210122070634.12825-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
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

On 22-01-21, 15:06, Bard Liao wrote:
> When a Slave device is resumed, it may resume the bus and restart the
> enumeration. And Slave drivers will wait for initialization_complete
> complete in their resume function, however initialization_complete will
> complete after sdw_update_slave_status function is finished and codec
> driver usually call some IO functions in the update_status callback
> function.
> It will become a deadlock if we use regular read/write routines during
> the resuming process.

Applied all sdw patches, thanks
-- 
~Vinod
