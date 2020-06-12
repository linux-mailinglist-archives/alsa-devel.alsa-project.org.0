Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CAD1F7840
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 15:01:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 066331678;
	Fri, 12 Jun 2020 15:00:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 066331678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591966861;
	bh=MOisnVR7xN196Vij8YxIMm0XOUOnJWc3H0WUG7ZRCII=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PcERb8WJUc9KEzRHurwvsuvYZzzgi4zPA4O/ht92Aehl5rOgyi1YXiSCBQuE8ypYK
	 CymA8PC5eHPgLwsrdH5e0E8CW39JMawD3bmhxH6PFIzf9CMNtCqMoKnut4xDAbBnj1
	 2aEOYFITzn/mS3hGZtGIetYaQxAiB7pHQF/fIuPg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13E05F80058;
	Fri, 12 Jun 2020 14:59:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E858DF8021C; Fri, 12 Jun 2020 14:59:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B018F800C7
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 14:59:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B018F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kQsq7Joz"
Received: from localhost (unknown [171.61.66.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A9EF120792;
 Fri, 12 Jun 2020 12:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591966752;
 bh=MOisnVR7xN196Vij8YxIMm0XOUOnJWc3H0WUG7ZRCII=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kQsq7JozANtrHKWLEFccqZ89ztT9sqw2oRX2EqEwJbncOTSnQP8cp0wnGtV1rAplx
 wAw6BBieie+gUNDWzcacm30OttEHw7HyE6gd27PwDXGYDMCCiF4SB73sZsljKZ18ok
 7CDQCvAj5yWKKxh503YfDlqUCFha0CFkv3V4eXH0=
Date: Fri, 12 Jun 2020 18:29:07 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/2] ASoc: q6afe: add support to get port direction
Message-ID: <20200612125907.GG1393454@vkoul-mobl>
References: <20200612123711.29130-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200612123711.29130-1-srinivas.kandagatla@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, broonie@kernel.org,
 John Stultz <john.stultz@linaro.org>
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

On 12-06-20, 13:37, Srinivas Kandagatla wrote:
> This patch adds support to q6afe_is_rx_port() to get direction
> of DSP BE dai port, this is useful for setting dailink
> directions correctly.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
