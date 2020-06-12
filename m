Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 109791F7842
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 15:01:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B062D168B;
	Fri, 12 Jun 2020 15:00:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B062D168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591966907;
	bh=MKQQpvr7EQJhmEioJJE4VZbRGd6MocMRhIpMoJJ7U60=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OYPkL4glcSJSzi5B2jVhJp+nHa/Rn1eLMq4o5ATI0YVku8shpo4AajK35eWas8FXY
	 DTijNHsVGZriDARPNNiO+ngBpP26szplOHAsY0BiERZtbuU9y2woJZS1pgMeahryNT
	 h3y/WBwEkOjfk5K6aYuAK/BdJMxIDOxUCeimCivs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BEB6F80252;
	Fri, 12 Jun 2020 14:59:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BFF8F8024A; Fri, 12 Jun 2020 14:59:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D93FDF800C7
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 14:59:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D93FDF800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="1erF+Gnz"
Received: from localhost (unknown [171.61.66.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6BEBB20792;
 Fri, 12 Jun 2020 12:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591966792;
 bh=MKQQpvr7EQJhmEioJJE4VZbRGd6MocMRhIpMoJJ7U60=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1erF+Gnz10eFlYO5+Gpah2ueDrWqubNymiRTSfA6na+vakPD8ZmpEbDufK7C04M7H
 sDVGiR0doXlAxrBzXjGQ42xREvMlrDywEIOJwsIJ9gUamRRKYfe2mozRngC+P4GAcG
 vFknS9PLCrY7qm6VNDwDU9OY7rsoqlJdsi9812Ak=
Date: Fri, 12 Jun 2020 18:29:48 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 2/2] ASoC: qcom: common: set correct directions for
 dailinks
Message-ID: <20200612125948.GH1393454@vkoul-mobl>
References: <20200612123711.29130-1-srinivas.kandagatla@linaro.org>
 <20200612123711.29130-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200612123711.29130-2-srinivas.kandagatla@linaro.org>
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
> Currently both FE and BE dai-links are configured bi-directional,
> However the DSP BE dais are only single directional,
> so set the directions as supported by the BE dais.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
