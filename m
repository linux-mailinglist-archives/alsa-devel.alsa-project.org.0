Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A081B3F4A68
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 14:14:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26BCB1612;
	Mon, 23 Aug 2021 14:13:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26BCB1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629720860;
	bh=yOn8Q96b3ZWPNpYdY73Ssh2UrArfVzWgJCKc29O5j8g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fkxe/Hiw9kWRgNydO2X/mvjYHezDT/O0c65tHYhM9ATgs8alZQTRB+SP2srtbgmXu
	 HW+HrKemG8uj2SMqe/vWGJy1tOfhMjwYmcjWmcEXjcezmSzXpjpfSNF9XWYTjPGipr
	 44AiFIhn91mKADfdXqRoDKH9wF/V6+ZfmqmRp17o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72FAEF800E7;
	Mon, 23 Aug 2021 14:13:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1449F800B6; Mon, 23 Aug 2021 14:12:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55ADFF800B6
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 14:12:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55ADFF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="h3GgEMa+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A237B6138F;
 Mon, 23 Aug 2021 12:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629720761;
 bh=yOn8Q96b3ZWPNpYdY73Ssh2UrArfVzWgJCKc29O5j8g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h3GgEMa+cB1Q418qtCyrUcTzEKX36r5L7sd7nCAiC/9ImMWFd0nmCjCukyi1ziZRU
 HjB886n3odrZKnxNssvJEZ+Mh+uqujyY7PPc5hCD6dhnvbtI3rdTz/J2G3JsNGrKyq
 PyjavIB4RRcCGvybOt8vHd6yG0zZHquwt5srmzSIkBNL3wHp9TV3leuANMcvnl1hPV
 lQL2YKNE3hkLCOVok8JUaPAh3Yf6kxWRv+cz1MynkaQu3v5wLw6uu71hvOVLG/1GI5
 fsmZS9B3FHukpjwbMYj4uo8OCQc5JJUFmL2KpR2+Do/AzYRCLDKp9+iXdJ9+ZKun86
 8X0iK4iUzUVlQ==
Date: Mon, 23 Aug 2021 17:42:37 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2 0/3] soundwire: intel: exit clock-stop mode before
 system suspend
Message-ID: <YSOQtUrFKzKZtDRf@matsya>
References: <20210818024954.16873-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818024954.16873-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
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

On 18-08-21, 10:49, Bard Liao wrote:
> Intel validation reported an issue where the HW_RST self-clearing bit
> is not cleared in hardware, which as a ripple effect creates issues
> with the clock stop mode.
> 
> This happens is a specific sequence where the Intel manager is
> pm_runtime suspended with the clock-stop mode enabled. During the
> system suspend, we currently do nothing, which can lead to potential
> issues on system resume and the following pm_runtime suspend,
> depending on the hardware state.
> 
> This patch suggests a full resume if the clock-stop mode is used. This
> may require extra time but will make the suspend/resume flows
> completely symmetric. This also removes a race condition where we
> could not access SHIM registers if the parent was suspended as
> well. Resuming the link also resumes the parent by construction.

Applied all, thanks

-- 
~Vinod
