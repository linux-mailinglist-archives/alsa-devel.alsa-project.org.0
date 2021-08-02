Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEA43DD016
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 07:40:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13C7D17D7;
	Mon,  2 Aug 2021 07:39:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13C7D17D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627882844;
	bh=PUPqiGY1Lqs3wceq2cbTWPaFQYK7+AacH8oW093jjTc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nimYUE5IU04wCAKVhh7XScNlDiur1K9WmS5RtZ5ZxKKl0tQL1qN/PkTqBC9gzxpUN
	 DTiTpv/1eYbyRdJmcvF+BuxLh728Zo0Z9BeUav0W6y2XMJLSbjSF5AI/qQc6zV0Ai0
	 ORuMYhFK05lb1MmiDW3YW+UROGFkl4D3okAl13ZE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E91C8F80279;
	Mon,  2 Aug 2021 07:39:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EC6BF80271; Mon,  2 Aug 2021 07:39:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2D6BF800BF
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 07:39:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2D6BF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HokkQCmn"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D61561029;
 Mon,  2 Aug 2021 05:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627882760;
 bh=PUPqiGY1Lqs3wceq2cbTWPaFQYK7+AacH8oW093jjTc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HokkQCmnsDlrMTzwbz9oR8wymqUwjm8+08bU9fyRSBmadtgrKc4fBMe+jKa4FFmG7
 wJPTl6m5lIJc7CBy1YyvdSd0VjnWCvIIPy42ax44SXGg3qzUOoa0xJPoLsa5wlDYCL
 WeXbqXDRVzpAaTfO0wiSKxA/45hfOsShy/qzC/C/yNqfl2JulQpsfJYrz9/zZZhyJv
 La1UL4girGVTgq/vuD5jXW2d5ivid4mC/ledo1U7IbWsmc8/47zcfF0PaLD/Czelco
 izc6tAn8P07YPn4ILECDxK5GtFXtdblXlGpvSYE5crTdRGSOxCLEJ31duhLV8oWrhi
 iZHumL7DOaC2w==
Date: Mon, 2 Aug 2021 11:09:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 00/10] soundwire/ASoC: add mockup codec support
Message-ID: <YQeFA9/+OfLEftB2@matsya>
References: <20210714032209.11284-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714032209.11284-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

On 14-07-21, 11:21, Bard Liao wrote:
> Adding mockup SoundWire codec is useful to debug driver/topology changes
> without having any actual device connected.

Applied sdw patches to sdw-next, thanks

-- 
~Vinod
