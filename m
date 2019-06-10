Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FF53AE49
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2019 06:44:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC25B16A4;
	Mon, 10 Jun 2019 06:43:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC25B16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560141864;
	bh=/GV06Nyx+SPz3UCxOwTRGyHKbvY0kusmoCsiTBAijAE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cYbYJP8U+XsOmsfYjuca+G0z+BPHGgAXHMlLl7cWDHoO/8zfMSrKQ7Z7o2KtBisjm
	 hNCQXtltSbU6O1mWGEMQLEUVfKAZKtK1jGi5dk2Np2hWtn0vz5I49SJ9j/nIwCc7ME
	 n7mLZyt/+rBfwEd9H4wN6d44vftTrQOpktgir92Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BC62F896EA;
	Mon, 10 Jun 2019 06:42:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAD98F896E0; Mon, 10 Jun 2019 06:40:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C53D4F896C7
 for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2019 06:37:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C53D4F896C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EdMNpnY+"
Received: from localhost (unknown [122.182.223.237])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EFC14206C3;
 Mon, 10 Jun 2019 04:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560141462;
 bh=EKzU35L2jhiqeTXyzxUrkdzKzSyRcaAAK+9gRjhGQYk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EdMNpnY+toLzZqX2HubcFOhFtq3zNekbZgGctW72IRWT4ALy41oAFS4WIbzpqHVOh
 G7hZsFF4fbgBZHNuNCbxocR0Nwmocu9EB2WWN5vzFjedgcQlc4BFGmQf8d9njT6Hnb
 1eXT++xxUIZF1uHkyqlV8XfN/ChAfFUJxIgCAJvU=
Date: Mon, 10 Jun 2019 10:04:32 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20190610043432.GI9160@vkoul-mobl.Dlink>
References: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
 <20190607085643.932-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190607085643.932-2-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org
Subject: Re: [alsa-devel] [RFC PATCH 1/6] ASoC: core: add support to
 snd_soc_dai_get_sdw_stream()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 07-06-19, 09:56, Srinivas Kandagatla wrote:
> On platforms which have smart speaker amplifiers connected via
> soundwire and modeled as aux devices in ASoC, in such usecases machine
> driver should be able to get sdw master stream from dai so that it can
> use the runtime stream to setup slave streams.
> 
> soundwire already as a set function, get function would provide more
> flexibility to above configurations.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  include/sound/soc-dai.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
> index f5d70041108f..9f90b936fd9a 100644
> --- a/include/sound/soc-dai.h
> +++ b/include/sound/soc-dai.h
> @@ -177,6 +177,7 @@ struct snd_soc_dai_ops {
>  
>  	int (*set_sdw_stream)(struct snd_soc_dai *dai,
>  			void *stream, int direction);
> +	void *(*get_sdw_stream)(struct snd_soc_dai *dai, int direction);

So who would be calling this API? Machine or someone else?

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
