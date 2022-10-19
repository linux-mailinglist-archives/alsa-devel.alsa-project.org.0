Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9635660459F
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 14:43:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC28A88A2;
	Wed, 19 Oct 2022 14:43:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC28A88A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666183431;
	bh=i/Cu5U/Xet7ebdYmSbaNMXByAHvT+YncsFj32GG7S0o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=necnnBYN0EfxsuPI/qjUL5Hrn2WhIDBcwHexUXQwVC5aBCG+pn5JWuWF4eSY/qQ9t
	 xUMQX99hflmVHWRM0QDGNP9pV7UAn1vk2SlnBNFMH8ov9zkJn4PiKlTymLLM39Aw3P
	 2jfHssiakLLa9eOpEgxt4Db+uGmlmQsHr13w4xDI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25408F804FA;
	Wed, 19 Oct 2022 14:43:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B149F80528; Wed, 19 Oct 2022 14:43:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26844F80087
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 14:42:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26844F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OcSAoZfE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 99F67B822BE;
 Wed, 19 Oct 2022 12:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22831C433C1;
 Wed, 19 Oct 2022 12:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666183370;
 bh=i/Cu5U/Xet7ebdYmSbaNMXByAHvT+YncsFj32GG7S0o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OcSAoZfEAnWrToJtuxk86IaCV4JTCOO8uK1I5tTS2niwriB7OkSorEfsS8mZsLndK
 fyJi5YpNTkCGwkR7fyUcbXmo1s3LNaQcySZQJUKX4cCIGKlXr5G74oXnoA8COPrQSl
 xp3GG5D4DnysPdWs0qsul6IF3EPtDyrgYE5f/KZa3hTA2DJPmN2Qtrclh0eP+fAx0i
 cCic0Hw0fEMLrlBO2q0ko/nkk/i43DexpD5e//2GVBFAAiqfnMMyZmslXZU82Y2boJ
 WgrS6suN1jEa+/vPJGBW3LYx2xAo6pKZ1KhlyGjGjMfOjNtDksmEwb8JrDOv/LsGnV
 PZF3RcnL0Im3w==
Date: Wed, 19 Oct 2022 18:12:46 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: dmi-quirks: add quirk variant for LAPBC710
 NUC15
Message-ID: <Y0/wxvySyEn6LyyF@matsya>
References: <20221018012500.1592994-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221018012500.1592994-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 bard.liao@intel.com, pierre-louis.bossart@linux.intel.com
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

On 18-10-22, 09:25, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> Some NUC15 LAPBC710 devices don't expose the same DMI information as
> the Intel reference, add additional entry in the match table.

Applied, thanks

-- 
~Vinod
