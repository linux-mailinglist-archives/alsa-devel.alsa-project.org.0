Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8342FBA45
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 15:56:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E94E1898;
	Tue, 19 Jan 2021 15:55:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E94E1898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611068168;
	bh=7gwC1eLdhmG3KdNfFN6hsRnCmJWJxzUU+7PSM1JESv8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JjidIp5SprarZKVfcW+hlPnJb8LV7YBwx6WE3ToDkDWgN1sPT2g3dvnGYNmY4TwNl
	 a294QGsVg5WhEEEFiUDtt8cBDrNo7VZkRgaLRK2ayTPWqaOxcCSXNZtFxlmmZdOYTU
	 vqn0JQBptoUocmVgc71w0BggUmmN1wCXZSy34kLY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D50B8F8026A;
	Tue, 19 Jan 2021 15:54:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8944BF80257; Tue, 19 Jan 2021 15:54:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F5CEF80117
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 15:54:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F5CEF80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IMUWL4uV"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8139E2312E;
 Tue, 19 Jan 2021 14:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611068070;
 bh=7gwC1eLdhmG3KdNfFN6hsRnCmJWJxzUU+7PSM1JESv8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IMUWL4uV09XgNu732G8H5aczRLFxmh4729od8lWZQ1VGFd6X8AsD+F2MqBC71pjME
 VBeLs7IaM+tl71NKjCvT/LI/gWScQjdiByiBZb99UQ8r+g+zNu7uuF/OdjO4tzIJyw
 uGhqifw2LnmSNPQy1Z38BdA3focQnQ0UI1nqLDoISOf0fmyNl/kEYeH09mhT+TOGBg
 Q8gfkvOrweoF4ND4eR+aaBdKT3+UqsompEoQHdWZwK37Cm7/hZclxpcPVF8qu2mkdH
 U51tDaeSuGtye2XDjE/VoxK0hJwFtQgOVkIEAOmx5+y2Kquwrndetfz4Ct73yKNstV
 ldCnRjoI9rIAQ==
Date: Tue, 19 Jan 2021 20:24:24 +0530
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Subject: Re: [PATCH] MAINTAINERS: soundwire: Add soundwire tree
Message-ID: <20210119145424.GV2771@vkoul-mobl>
References: <20210117071258.2541484-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210117071258.2541484-1-vkoul@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 17-01-21, 12:42, Vinod Koul wrote:
> Somehow the soundwire MAINTAINERS did not have the tree details, so add
> it.

Applied, thanks

-- 
~Vinod
