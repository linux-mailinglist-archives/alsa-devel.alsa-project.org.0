Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0FB5A9287
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Sep 2022 10:58:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 743291614;
	Thu,  1 Sep 2022 10:57:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 743291614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662022687;
	bh=prYcUWBTjUdLAux/fhlgeXI0aAwL5jIZ2AF09Netluw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LrskgiMn8hu9uUf01jrF5vZohItKHxpIFaZAOSV4yIfxC3xTsXYDn0MRb9vhLlzPk
	 yGUutSLQZ6FA6L+mhEwJ3uyhFuyO8NoPkitwJSNiHlDhozuUuT/yBh5EZvmAkfz7pH
	 vQ2bt30HR1Q12dFYakOgzh293uctP5Jkol++W04A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD40BF804A9;
	Thu,  1 Sep 2022 10:57:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4B02F80236; Thu,  1 Sep 2022 10:57:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C733F80236
 for <alsa-devel@alsa-project.org>; Thu,  1 Sep 2022 10:57:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C733F80236
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Jo62ltvx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 22457CE2508;
 Thu,  1 Sep 2022 08:56:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2ED1C433D6;
 Thu,  1 Sep 2022 08:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662022616;
 bh=prYcUWBTjUdLAux/fhlgeXI0aAwL5jIZ2AF09Netluw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jo62ltvxVmKObiek7Hxd5ModsYmzAK7zkenD28Ftk0MUDkuZbhJZrZWHDm8rL6hpT
 KMkgaJ2efBkigrJ7YZHJfnJokFatHcL6k5NpQpRDeIwJJMd0/s5ZRoHK9Yuba0vo4X
 UkNLjs5ukI1qyLYqAOrh0Uw2+OX/H2d5sn+4UzYSakDT+a2TKCQZbEbcN6WkNeGS/h
 9GiRRWtxltJ67WY+XcIhtLMqQsLuATd3kyT7p8g31o/HpO97YosYXacCBJtvFQXFQc
 7awIf0w6AohZ7NASvL4SstHFWelcrUkEqfiM1qyBphTcqdir2AcG/miWeL9wifILcj
 6mV1M41an5bSA==
Date: Thu, 1 Sep 2022 14:26:51 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2] soundwire: qcom: fix device status array range
Message-ID: <YxBz05JZgK38Hugt@matsya>
References: <20220708104747.8722-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708104747.8722-1-srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 dan.carpenter@oracle.com
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

On 08-07-22, 11:47, Srinivas Kandagatla wrote:
> This patch updates device status array range from 11 to 12 as we will
> be reading status from device number 0 to device number 11 inclusive.
> 
> Without this patch we can potentially access status array out of range
> during auto-enumeration.

Applied, thanks

-- 
~Vinod
