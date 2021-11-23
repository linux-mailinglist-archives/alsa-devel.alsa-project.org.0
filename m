Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4732F45A135
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 12:19:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABBA01671;
	Tue, 23 Nov 2021 12:18:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABBA01671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637666345;
	bh=QxYCZAbgMwLXECF0bLGBf0vyZ1zfRIbCiIXqUHIPujA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oj2tJoovs5aib/zsEAwYffHWz+wpvl3BO+1PRNNF5aaq8uFn+CTxdYwPtK3SrR5Aj
	 ex4BTc4Gu43MreNunzkdVXBqI8KEW3DMKW3NUu+HxueioUXaM2Adfk3EWMp9+nrVLZ
	 gF9IvGIcpWlQXkjSwT6JUkarKmUaSKwgiUgdxS88=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BABA2F804AB;
	Tue, 23 Nov 2021 12:17:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64511F8049E; Tue, 23 Nov 2021 12:17:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A195BF80154
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 12:17:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A195BF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="goXXfyqz"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99B9861075;
 Tue, 23 Nov 2021 11:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637666240;
 bh=QxYCZAbgMwLXECF0bLGBf0vyZ1zfRIbCiIXqUHIPujA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=goXXfyqzXqVD74bQVU8SQxMDBuOolsSvUA3yro3cbI6jRoJ1E/dxlW4AmNSfVQjml
 y/p5Eq53bb3kmZ79EC7WqGmMq3MFOxsPP6YMQbbXOl8brYtAJfjX+/8EkTZ7Hwk7fO
 iowdPs7EH1OQpCbYluhkbe8DNeltE013IBqtC5JLMjtqrm+XVcdyXssUQ1GJ4KdZeh
 xW1hQoSB4ogwBnOHikD+hadly5pIpq4aK9KZAbuBVCrp88zI12pbFeyOahqIzZbi3w
 LbjFBc92eSn2RUUejusmYKJUpXO56RlAs6/EWIi9pQ9boUGO14LcChhBPqnvDi9Rhj
 YEgoV3dbAKC7w==
Date: Tue, 23 Nov 2021 16:47:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] soundwire: qcom: remove redundant version number read
Message-ID: <YZzNuyDUxE+UXAG2@matsya>
References: <20211116105017.12010-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116105017.12010-1-srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org
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

On 16-11-21, 10:50, Srinivas Kandagatla wrote:
> Controller version is already available in struct qcom_swrm_ctrl, Just make use
> of it instead of reading this again.

Applied, thanks

-- 
~Vinod
