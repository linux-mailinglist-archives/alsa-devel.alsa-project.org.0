Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6870734E3DC
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Mar 2021 11:03:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 030C41682;
	Tue, 30 Mar 2021 11:03:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 030C41682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617095030;
	bh=hAv6DilAIxtCgBbhv9FLZwO8QDhSFQHMKU2AEqrqDRg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qgsr5x6sejsYcxDYfMcrFJzzxAPP1cyvh7qHbNHfKhlSZfxWhKseuiuHXQ61hOv9y
	 Jm9cfYgZkpnSbZ4ugBD7PjWYcHvaK8xka+oeftDQ1/y9bbQQGGFtZ9UJW8DZmVKghR
	 OMaN/0nQqMvTeWz7YXCXuBrefDJAsZdUTAK9VmZo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F334F80141;
	Tue, 30 Mar 2021 11:02:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04E5CF80240; Tue, 30 Mar 2021 11:02:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32F7DF80141
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 11:02:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32F7DF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ij2Ecc32"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7338D6195D;
 Tue, 30 Mar 2021 09:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617094924;
 bh=hAv6DilAIxtCgBbhv9FLZwO8QDhSFQHMKU2AEqrqDRg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ij2Ecc32OujdOVJlnOlW3Cr1yRgdFLx7hGTtQqIF677yJvrk4vxx9AC1aCvSm2Aa6
 UJXoFPgy+fWr5MY/s/PFvyB57770/kvZYRtxr1V2z5rJxbOrshEQb7Z1vYX2l2kjAd
 DMpECWGyE2xAPcRR/KtSvnBKPvyzMgGqd+SSI7mg5odbNKi3Eooc0qeSyZFlpslqJO
 pub1Dgq9VyEtqL/Rg89jJjv9bHLDL++ZimXhx00aIq1UjvdQl3VfyVprxOqiiCg8PI
 3PGk0waLway+WDS8oadOa6fKKy2HIP0cCcUUJvytxZFxrcgFtLtgoQIWr9vKL0jAK0
 zYiZFRuVtRLGQ==
Date: Tue, 30 Mar 2021 14:31:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: broonie@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v4 4/5] ASoC: dt-bindings: wsa881x: add bindings for port
 mapping
Message-ID: <YGLpBxw0DV3km1wM@vkoul-mobl.Dlink>
References: <20210315165650.13392-1-srinivas.kandagatla@linaro.org>
 <20210315165650.13392-5-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210315165650.13392-5-srinivas.kandagatla@linaro.org>
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
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

On 15-03-21, 16:56, Srinivas Kandagatla wrote:
> WSA881x SoundWire device ports are statically assigned to master ports
> at design time. So add bindings required to specify these mappings!

Mark, are you okay for 4, 5 to go thru sdw tree with your ack? The
patches lgtm

-- 
~Vinod
