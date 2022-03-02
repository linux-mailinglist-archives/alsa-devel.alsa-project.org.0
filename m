Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B09CB4CA98B
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 16:49:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 367EB1F11;
	Wed,  2 Mar 2022 16:48:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 367EB1F11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646236179;
	bh=FPM8oLhYd2J9SAy75EjN4wmweoyxo+whfwBwWJUBtuQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PKxz7oapJPeeEraO/Mjkd19Q4FlBCNmzDLmJhjCpoIo4n09NGzKEP66o2u+vkpT7i
	 shz36SZxgMEshvYxWB3gThahgStiAUiFwAA1gcp3a+yYjGDXUd+CPt6JsiUOm9mpIz
	 papa8X0J8chqiIa7fRAX01kgyvkgLyPBtSnLL5x0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B2C0F8027D;
	Wed,  2 Mar 2022 16:48:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 172D5F801D5; Wed,  2 Mar 2022 16:48:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15FA1F80167
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 16:48:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15FA1F80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="myPLF2jO"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E9611B8207F;
 Wed,  2 Mar 2022 15:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E107AC004E1;
 Wed,  2 Mar 2022 15:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646236101;
 bh=FPM8oLhYd2J9SAy75EjN4wmweoyxo+whfwBwWJUBtuQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=myPLF2jOHPfJ7wFo15FmKJiSOlPBb04iVcqudXs8T88MFCKgYVdaGOjm7j13MEsDl
 ad8YcetwU7+LvNgFa2NDbq62p0L9fjVhb70axCckQy7A8cNKdsLRyF+MXZ/DIF3gmp
 jRd0DRrOii+Ihe+TmX9omRZkK8CneEa2p/Dxotg6XMI03gqSW7E3l3fcxe0f8Xrr1X
 4eBth5y0u4eKnv/sfg81mv3eLIRfg6WRNdR6HKQXqL1I1D8IRYlJ+LueE/KrT+SnqW
 sZS/ib+p5PKKMIyoTUwcdpH5oMd9zPro5rPw+fd8n/GichDN3ymgW8OVma/tMKS0eR
 xQUN87mED8aQA==
Date: Wed, 2 Mar 2022 21:18:17 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v6 3/3] dt-bindings: soundwire: qcom: Add bindings for
 audio CSR reset control property
Message-ID: <Yh+RwQS1Cyeuq4Jf@matsya>
References: <1646224982-3361-1-git-send-email-quic_srivasam@quicinc.com>
 <1646224982-3361-4-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1646224982-3361-4-git-send-email-quic_srivasam@quicinc.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, yung-chuan.liao@linux.intel.com,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, tiwai@suse.com,
 agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, rohitkr@codeaurora.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, quic_plai@quicinc.com,
 sanyog.r.kale@intel.com, bjorn.andersson@linaro.org, judyhsiao@chromium.org,
 Venkata Prasad Potturu <quic_potturu@quicinc.com>,
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

On 02-03-22, 18:13, Srinivasa Rao Mandadapu wrote:
> Update description for audio CSR reset control property, which is
> required for latest chipsets to allow software enabling in CGCR HCLK register.

too many acronyms pls explain!

> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  Documentation/devicetree/bindings/soundwire/qcom,sdw.txt | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
> index b93a2b3..84c8f54 100644
> --- a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
> +++ b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
> @@ -150,6 +150,18 @@ board specific bus parameters.
>  		    or applicable for the respective data port.
>  		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>  
> +- reset:
> +	Usage: optional
> +	Value type: <prop-encoded-array>
> +	Definition: Should specify the SoundWire audio CSR reset controller interface,
> +		    which is required for SoundWire version 1.6.0 and above.
> +
> +- reset-names:
> +	Usage: optional
> +	Value type: <stringlist>
> +	Definition: should be "swr_audio_cgcr" for SoundWire audio CSR reset
> +		    controller interface.
> +

We should add these in example as well...

>  Note:
>  	More Information on detail of encoding of these fields can be
>  found in MIPI Alliance SoundWire 1.0 Specifications.
> -- 
> 2.7.4

-- 
~Vinod
