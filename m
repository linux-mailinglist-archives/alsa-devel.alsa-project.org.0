Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 596EC354BDB
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 06:56:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E0CD16BB;
	Tue,  6 Apr 2021 06:55:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E0CD16BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617685007;
	bh=Nzff4uwl0rkRttRQxit2T76kcWXchsz3Qc/XR4s5uDQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A+DoPF3NnRkWFI+sRHW25VR/EsfNQLUKMN3msEO+aXceBqq7IwqgNvd6/v6qnxE8n
	 u0zjQj4nnuOMCKA4h5brmWXEhhb8yf+D3CHsGK2bD9j93wa0nlBdYIf1j3kp0RZHEf
	 mVco7yZ3Xaz4iGL767TIfufO1yvrw4SW0ALo8c7w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDA6EF80249;
	Tue,  6 Apr 2021 06:55:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47722F80246; Tue,  6 Apr 2021 06:55:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C936AF80124
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 06:55:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C936AF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="danws+v0"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EAE4613B8;
 Tue,  6 Apr 2021 04:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617684950;
 bh=Nzff4uwl0rkRttRQxit2T76kcWXchsz3Qc/XR4s5uDQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=danws+v0AAa1UVEGWEsIYHP3YAhivhh+N6UlcZa93XYJc+yKgb52tFb2egktQnYXK
 v7ymCHzqU5cOr+uFHWp0Ed/kxLMWFgyvq6psQajqvisn7E/ylZ1i9cznXz3SdqzxU9
 /b0RtKmnI4eLKmc0jLv4NF9m5cOT2/70z8m9xwP1wdR1WhVcZtrVv96+5eIK/cUWab
 VD+YWz6vIC/W+peQS0MuDNKI7gezaP4951cNZQgwqC1pIjVE9JiYlJQn4wGELXQT4i
 ftJ+6+Omz23ABz5b0P8HjUieqBckfoib8vV1dTwiCyeG7mM8d2+vzyYK8z4Q7sgvyy
 o/+VUHqchUoJw==
Date: Tue, 6 Apr 2021 10:25:46 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] soundwire: qcom: handle return correctly in
 qcom_swrm_transport_params
Message-ID: <YGvp0lbNkaukGxmE@vkoul-mobl.Dlink>
References: <20210401091502.15825-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401091502.15825-1-srinivas.kandagatla@linaro.org>
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com,
 coverity-bot <keescook+coverity-bot@chromium.org>,
 linux-kernel@vger.kernel.org, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com
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

On 01-04-21, 10:15, Srinivas Kandagatla wrote:
> Looks like return from reg_write is set but not checked.
> Fix this by adding error return path.

Applied, thanks

-- 
~Vinod
