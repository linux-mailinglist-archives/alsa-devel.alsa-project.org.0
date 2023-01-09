Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 937F5662AD0
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 17:07:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93B1FAEE8;
	Mon,  9 Jan 2023 17:06:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93B1FAEE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673280439;
	bh=0AchH1x0f1OvcHS9WNHJGjFwXU2i6hh2/u1j9Soj5oU=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NG0cbYIGq0RuvVSxI/tIC337P9sIZFou8pfIvAM63ExzdugxkbHc0KRbEB8O6gFEO
	 Tr8qVsXxTFSVvp+gjYlmw60MlYpQzXWooRRrnNCsw04xctIdJaIkxk71FxC4+jQOrX
	 nBi3nvVYj/9ZLJn3Wvoy3ShYPmKMxqD5u3sHNC+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 248D1F80245;
	Mon,  9 Jan 2023 17:06:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 217EBF804D2; Mon,  9 Jan 2023 17:06:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DD39F8026A
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 17:06:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DD39F8026A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ECf7exAt
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC1A1611BD;
 Mon,  9 Jan 2023 16:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC540C433D2;
 Mon,  9 Jan 2023 16:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673280383;
 bh=0AchH1x0f1OvcHS9WNHJGjFwXU2i6hh2/u1j9Soj5oU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ECf7exAtfn/G07XAVlAPqATorHAJ7bSVuiceiebmNIh2ZfNuJlb1DV+jkdJBramFl
 fbz98uRYzhbBNO73i6EMs2YF0Xj2l71QUe6tlB+GTnSENEPU9KXhzgUktT0RRVQgyX
 w8WQOY0wcKlGp8WkXA1JDaA6RnLdk7xCxSk45EmLkfR40/9oth/cqwIW5aAXcUyRsU
 pDerYvlMoUItRUYcl2dW8ied4nkw3zXr8AjaDmuPsOOfzRNIDzygix6Haq6+L9bJIB
 tgzxMwy1QOYpvaRY/prSqlTM9cnl6HB1DxjkXhdk6/VxdpxKn4Zs472noQ1TPj7mcH
 KPEqHj5rb1B5A==
Date: Mon, 9 Jan 2023 21:36:19 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH v2 0/3] soundwire: cadence: Fix oversized FIFO size define
Message-ID: <Y7w7ex/r1Z95gyt/@matsya>
References: <20221202161812.4186897-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202161812.4186897-1-rf@opensource.cirrus.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 02-12-22, 16:18, Richard Fitzgerald wrote:
> As determined by experimentation and asking a hardware person, the FIFO
> in the Cadence IP is actually only 8 entries long, not 32. This is fixed
> in patch #1.
> 
> As a bonus, patches #2 and #3 fix two other things I noticed while
> debugging this.

Applied, thanks

-- 
~Vinod
