Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2BD18448F
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 11:14:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B519817D3;
	Fri, 13 Mar 2020 11:13:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B519817D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584094470;
	bh=iAw9u4aWzxZM6fbv9mNZZWBz2qN7xEeu3pNeidvP1nc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cEnyuSjq5yFCjTueUaGyuX3zxasfwkpqEdx/WnOfuujxgBTQXGQohaD5CcY0RUfBj
	 pwsBeIMm0hGP3P0WUAEaHHxyOSrUbXnxxE6yChsqjvQava2+8hhaaW8b+6qmXQIaMJ
	 f3MgltlVxKVQv+6hlbFxZIPaxenCywlYrAODB9HM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 303E8F8023E;
	Fri, 13 Mar 2020 11:13:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 255EDF801F7; Fri, 13 Mar 2020 11:13:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80890F8013E
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 11:13:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80890F8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hdWB4E7D"
Received: from localhost (unknown [171.76.107.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 243C120724;
 Fri, 13 Mar 2020 10:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584094408;
 bh=iAw9u4aWzxZM6fbv9mNZZWBz2qN7xEeu3pNeidvP1nc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hdWB4E7DDe2h/L1sWI4v//sZDt38tFF5fk3wkVcvt8f39IE4vTDqME+1hNpGrmU5k
 M9bf48iynKaHV+2Q6OjmD0eUQTIcTkIoJrWF8bDrQOxQlZtFEpfx628OOa4K7d0JUd
 PY7K4M6owViHUmRKjJU36Pi0XXDmXySWa3EnMgt4=
Date: Fri, 13 Mar 2020 15:43:24 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v2 0/9] ALSA: compress: Add wma, alac and ape support
Message-ID: <20200313101324.GB4885@vkoul-mobl>
References: <20200313095318.1555163-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200313095318.1555163-1-vkoul@kernel.org>
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org
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

On 13-03-20, 15:23, Vinod Koul wrote:
> This series adds more WMA profiles and WMA decoder parameters to UAPI and
> then support for these in qcom driver. It also adds FLAC and APE IDs and
> decoder parameters to UAPI and then support in qcom driver
> 
> This was tested on Dragon board RB3.
> 
> Last, bump up the compressed version so that userspace can check for the
> support.
> 
> Since the series touches compress uapi and asoc, it would make sense to go
> thru asoc tree with acks.

Oops threading is broken b/w cover and patches. I will resend this

Apologies for the mess!

> 
> Changes in v2:
>  - use bitflags for wma profiles
> 
> Vinod Koul (9):
>   ALSA: compress: add wma codec profiles
>   ALSA: compress: Add wma decoder params
>   ASoC: qcom: q6asm: pass codec profile to q6asm_open_write
>   ASoC: qcom: q6asm: add support to wma config
>   ASoC: qcom: q6asm-dai: add support to wma decoder
>   ALSA: compress: add alac & ape decoder params
>   ASoC: qcom: q6asm: add support for alac and ape configs
>   ASoC: qcom: q6asm-dai: add support for ALAC and APE decoders
>   ALSA: compress: bump the version
> 
>  include/uapi/sound/compress_offload.h |   2 +-
>  include/uapi/sound/compress_params.h  |  37 +++-
>  sound/soc/qcom/qdsp6/q6asm-dai.c      | 136 +++++++++++++-
>  sound/soc/qcom/qdsp6/q6asm.c          | 243 +++++++++++++++++++++++++-
>  sound/soc/qcom/qdsp6/q6asm.h          |  51 +++++-
>  5 files changed, 462 insertions(+), 7 deletions(-)
> 
> -- 
> 2.24.1

-- 
~Vinod
