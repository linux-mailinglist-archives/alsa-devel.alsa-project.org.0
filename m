Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F133AE9C
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2019 07:34:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BFCD16A4;
	Mon, 10 Jun 2019 07:33:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BFCD16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560144880;
	bh=vkYfAPggSrjtibJCfDY9WhOy4g8SL6GFYyyE4FEEMLQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ojZuagNZC2jUaikpO6mkaiUG0oRm5vjfrryIMM4NNvjk13Azs2l9NWTbo/e0/kXX1
	 kXEkxhtF3xiQUJE98pQEfTF3B0DO10ecEEcm2a5+OWVzOk7hOkRercghvWT1UBAg58
	 imGXrl2zjD4LsmKO4HEjQ3T8D/Itw5iZO8AeE5V0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A828AF896E3;
	Mon, 10 Jun 2019 07:32:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06B92F896C7; Mon, 10 Jun 2019 07:32:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75491F896C7
 for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2019 07:32:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75491F896C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KTw7EhRn"
Received: from localhost (unknown [122.182.223.237])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0AAEE207E0;
 Mon, 10 Jun 2019 04:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560142499;
 bh=pNVtwDi1EOVr8B79cvvDcqYTcIy9EArIA8yhGGfUK+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KTw7EhRntHexBM4QG2iHqWsly9oEVnROvuplzi0KrEIcXo/VAGLOAwdezCKeKbw+A
 7+UkZAQrAkWlvgsVhIfNVUIS4+SfVPT8bzCEpYHDJm1WhrjW34GBxGo/yojiyDLzTx
 lCF+LkLtz34CdJoE6zX00mQbSPF8ZwS6FJJtzAg0=
Date: Mon, 10 Jun 2019 10:21:50 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20190610045150.GJ9160@vkoul-mobl.Dlink>
References: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
 <20190607085643.932-6-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190607085643.932-6-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org
Subject: Re: [alsa-devel] [RFC PATCH 5/6] dt-bindings: soundwire: add
 bindings for Qcom controller
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
> This patch adds bindings for Qualcomm soundwire controller.
> 
> Qualcomm SoundWire Master controller is present in most Qualcomm SoCs
> either integrated as part of WCD audio codecs via slimbus or
> as part of SOC I/O.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/soundwire/qcom,swr.txt           | 62 +++++++++++++++++++

So I was expecting to see bus support patches for OF first. I think you
have missed those changes. Please do include those in v2 with bindings
and OF support for bus.

>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soundwire/qcom,swr.txt
> 
> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,swr.txt b/Documentation/devicetree/bindings/soundwire/qcom,swr.txt
> new file mode 100644
> index 000000000000..eb84d0f4f36f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soundwire/qcom,swr.txt
> @@ -0,0 +1,62 @@
> +Qualcomm SoundWire Controller
> +
> +This binding describes the Qualcomm SoundWire Controller Bindings.
> +
> +Required properties:
> +
> +- compatible:		Must be "qcom,soundwire-v<MAJOR>.<MINOR>.<STEP>",
> +	 		example:
> +			"qcom,soundwire-v1.3.0"
> +			"qcom,soundwire-v1.5.0"
> +			"qcom,soundwire-v1.6.0"
> +- reg:			SoundWire controller address space.
> +- interrupts:		SoundWire controller interrupt.
> +- clock-names:		Must contain "iface".
> +- clocks:		Interface clocks needed for controller.
> +- #sound-dai-cells:	Must be 1 for digital audio interfaces on the controllers.
> +- #address-cells:	Must be 1 for SoundWire devices;
> +- #size-cells:		Must be <0> as SoundWire addresses have no size component.
> +- qcom,dout-ports: 	Must be count of data out ports
> +- qcom,din-ports: 	Must be count of data in ports

On these I think we should have specified dpn properties as specified in
DisCo, but then looking at spec we do not define that for master, but
bus seems to have it.

Pierre do you why master does not have dpn properties in DisCo?

> +- qcom,ports-offset1:	Must be frame offset1 of each data port.
> +			Out followed by In. Used for Block size calculation.
> +- qcom,ports-offset2: 	Must be frame offset2 of each data port.
> +			Out followed by In. Used for Block size calculation.
> +- qcom,ports-sinterval-low: Must be sample interval low of each data port.
> +			Out followed by In. Used for Sample Interval calculation.

These are software so do not belong here
-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
