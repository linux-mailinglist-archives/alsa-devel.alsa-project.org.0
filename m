Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A803ADE21
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Jun 2021 13:19:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54AFF16D9;
	Sun, 20 Jun 2021 13:18:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54AFF16D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624187944;
	bh=OfUiVNmBFTHlrsfW6CzlrHT/dZVKq3gESxQTYa6X/WY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q4gcl8dpquSbz8Y4TlEqucpPXUGhT1mxja0azLO5coyrCqdqtZ3hrZo9PYZuuTaQg
	 vx+RhRXLcWabQFEJ231fDqY6DvNgrTDSaUt+RdwG38zW/otq1t5VOL/KRU1J9oeh17
	 JpnKsw/ykrMW54AlO7c+GAW/dh/vyaAaARzy8fSE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF6B7F8016D;
	Sun, 20 Jun 2021 13:17:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A555F80268; Sun, 20 Jun 2021 13:17:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE936F80137
 for <alsa-devel@alsa-project.org>; Sun, 20 Jun 2021 13:17:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE936F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="i2ZZhgWR"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1FB9F6108E;
 Sun, 20 Jun 2021 11:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624187847;
 bh=OfUiVNmBFTHlrsfW6CzlrHT/dZVKq3gESxQTYa6X/WY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i2ZZhgWRRC+5tj5S8vgp2GEx3lnCTHSrIFOckDydhZ/zi115ukcX6jOyTWF+WkTx/
 95tna5wknOSf3FkZXvkbpuHG9xsHocZYpFtajSTFeoXS5at8ziNxiDGerw9t5o5Nyb
 NY8ou0pqspqxQvQT5Xz9R3R37NFKhUyZHYhMbDBAiXBLx1NND+9ZQXdqwiZhA35r0y
 An2kCwRin5WZ1fSQe3idUA7TMoDcP2oTm1lh03mDD6PrlfH5g3RM8SGjeLyq8uIVDz
 UCAzVnHkvGTXwHNxNDzqiFdBgpc+AtfPIa2mXHrakRyuYY4Eqa17D1V1XKER16apyX
 Lz2C+vQ7c3/uA==
Date: Sun, 20 Jun 2021 16:47:22 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH v2] soundwire: bus: Make sdw_nwrite() data pointer
 argument const
Message-ID: <YM8jwosKEbNlVXkp@vkoul-mobl>
References: <20210616145901.29402-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210616145901.29402-1-rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
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

On 16-06-21, 15:59, Richard Fitzgerald wrote:
> Idiomatically, write functions should take const pointers to the
> data buffer, as they don't change the data. They are also likely
> to be called from functions that receive a const data pointer.
> 
> Internally the pointer is passed to function/structs shared with
> the read functions, requiring a cast, but this is an implementation
> detail that should be hidden by the public API.

Applied, thanks

-- 
~Vinod
