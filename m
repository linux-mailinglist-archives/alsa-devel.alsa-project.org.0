Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F1E1CD1C0
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 08:17:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A197C1614;
	Mon, 11 May 2020 08:16:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A197C1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589177862;
	bh=YmpQqO+voOin9Eh8PZUZNka6aTn/VjZ8uHlXHkUb+QU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iMU87k8dJ1yXO+ECDMFnbucYGs3G+50CebyBrtyUzGzpMYwOAG3nA/NDRxWYxeFu/
	 egX4OfWp9sPFtwRduANM5Lqx3gQ3iPUv/M5VaDr3+tN5nzAxievi/NX6J27dftqDFi
	 vAVoP/f54Zx4EFC/5kpxSOjQrOAeDzdGIAP4vn8M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A82A0F800B7;
	Mon, 11 May 2020 08:16:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 168ACF8014C; Mon, 11 May 2020 08:15:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D3B9F800E3
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 08:15:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D3B9F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KTb3jHj7"
Received: from localhost (unknown [122.167.117.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7122B20708;
 Mon, 11 May 2020 06:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589177752;
 bh=YmpQqO+voOin9Eh8PZUZNka6aTn/VjZ8uHlXHkUb+QU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KTb3jHj7c+P9BCBcaBUICxIuo2mSN1YH2hwV2iRlIlo13WQbJ2Vhe0uLpiuVOQnpm
 mXAJvVrP6oBmeg4OcXEqo4N9/qECck8o+t+LDGAFZPwI8x0AxXQ2kcsQCn5sr+eqFs
 2nTKox51G6EWKiHRs33ENWPWggZ6pPLWfEAvK6+g=
Date: Mon, 11 May 2020 11:45:46 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Samuel Zou <zou_wei@huawei.com>
Subject: Re: [PATCH -next] soundwire: qcom: Use IRQF_ONESHOT
Message-ID: <20200511061546.GQ1375924@vkoul-mobl>
References: <1588735553-34219-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588735553-34219-1-git-send-email-zou_wei@huawei.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bjorn.andersson@linaro.org,
 agross@kernel.org, sanyog.r.kale@intel.com, linux-kernel@vger.kernel.org
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

On 06-05-20, 11:25, Samuel Zou wrote:
> Fixes coccicheck error:
> 
> drivers/soundwire/qcom.c:815:7-32: ERROR: Threaded IRQ with
> no primary handler requested without IRQF_ONESHOT

Applied, thanks

-- 
~Vinod
