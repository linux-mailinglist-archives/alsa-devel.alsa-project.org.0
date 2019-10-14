Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5E8D681E
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 19:14:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 115ED1674;
	Mon, 14 Oct 2019 19:13:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 115ED1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571073278;
	bh=2p1ilqHGSsKbOsVMtrYU9EjlgBRw6LWgWlHp93hxgTM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aBm2ocpvSr/S+zwmdrqZGJOcMBn/2obnIBvlzxIG8dkKx3oTnyaJPBTeRisNWlKm0
	 WhZjDmSINPy7Wh2B8g6WoG12JFmbxElORYmEjp9j7ViAFJV8Kruwutsxjptqszt3+4
	 BPOJPDhYSuvDyhtddkci4SPgI+vFBkCZUw+eem2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52D86F80322;
	Mon, 14 Oct 2019 19:12:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBD59F80362; Mon, 14 Oct 2019 19:12:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1912EF8011D
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 19:12:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1912EF8011D
Received: by mail-ot1-f68.google.com with SMTP id e11so14426628otl.5
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 10:12:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3ZnoujlKTwiwmEY9FI0zWDU67daL9913J5sT0svGqzM=;
 b=tizRQxezLFOybxL2kdqXV0H3A9kW69bZlqCzhWjyacAJxPAGpvaZ0LPmt0t2m2vxd8
 xdp+FgepqCisGvdMEn9ub9xE8QFqQ5PESZ6oYe6ouUgTtDjhvqcszV5CgDvHeyqC4nDr
 stIBSryTM+ctwviZzdXNcwQ9HhnJSasxznmEKEeqKuvaY44CFlX6g4e9M3A3uXK0/LJu
 +e8z2e5f3w9uTDn1uiBQzAWm+TErRgqTyGBRdvPe1iXRp6PMNdk/8MMuiAzi5g132+Cl
 Ytmgs7Jmob5knSRjOcG84bB4b2+BR/5T3kV+5MeQeXA6hhI+V+UaC8gK9y1pDU2V6N/j
 EECg==
X-Gm-Message-State: APjAAAUHufttgLdqohFIqJ/hwYw3j378OvYVdfpDp8BXWu1N2vAvHHqd
 k6iWtu9vh6zcztvngvFZ1Q==
X-Google-Smtp-Source: APXvYqyIb1FLv7/3zxJW43drLgoBfkwz/dbgzFnccw5D0lgTY+KQu3bizoMtyKSuptfPur62KU7D7w==
X-Received: by 2002:a9d:6f85:: with SMTP id h5mr19262238otq.54.1571073162881; 
 Mon, 14 Oct 2019 10:12:42 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u141sm5671461oie.40.2019.10.14.10.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 10:12:41 -0700 (PDT)
Date: Mon, 14 Oct 2019 12:12:41 -0500
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20191014171241.GA24989@bogus>
References: <20191011154423.2506-1-srinivas.kandagatla@linaro.org>
 <20191011154423.2506-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011154423.2506-2-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, spapothi@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, vkoul@kernel.org,
 broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v3 1/2] dt-bindings: soundwire: add
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

On Fri, Oct 11, 2019 at 04:44:22PM +0100, Srinivas Kandagatla wrote:
> This patch adds bindings for Qualcomm soundwire controller.
> 
> Qualcomm SoundWire Master controller is present in most Qualcomm SoCs
> either integrated as part of WCD audio codecs via slimbus or
> as part of SOC I/O.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/soundwire/qcom,sdw.txt           | 167 ++++++++++++++++++
>  1 file changed, 167 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soundwire/qcom,sdw.txt

Next time, do a DT schema.

> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
> new file mode 100644
> index 000000000000..436547f3b155
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
> @@ -0,0 +1,167 @@
> +Qualcomm SoundWire Controller Bindings
> +
> +
> +This binding describes the Qualcomm SoundWire Controller along with its
> +board specific bus parameters.
> +
> +- compatible:
> +	Usage: required
> +	Value type: <stringlist>
> +	Definition: must be "qcom,soundwire-v<MAJOR>.<MINOR>.<STEP>",
> +		    Example:
> +			"qcom,soundwire-v1.3.0"
> +			"qcom,soundwire-v1.5.0"
> +			"qcom,soundwire-v1.6.0"

This needs to be the actual versions supported, not examples. Elsewhere 
in QCom bindings, we've used standard SoC specific compatibles as there 
never tends to be many SoCs with the same version. Anything different 
here?

> +- reg:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: the base address and size of SoundWire controller
> +		    address space.
> +
> +- interrupts:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: should specify the SoundWire Controller IRQ
> +
> +- clock-names:
> +	Usage: required
> +	Value type: <stringlist>
> +	Definition: should be "iface" for SoundWire Controller interface clock
> +
> +- clocks:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: should specify the SoundWire Controller interface clock
> +
> +- #sound-dai-cells:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: must be 1 for digital audio interfaces on the controller.
> +
> +- qcom,dout-ports:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: must be count of data out ports

Up to how many?

> +
> +- qcom,din-ports:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: must be count of data in ports

Up to how many?

> +
> +- qcom,ports-offset1:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: should specify payload transport window offset1 of each
> +		    data port. Out ports followed by In ports.
> +		    More info in MIPI Alliance SoundWire 1.0 Specifications.
> +
> +- qcom,ports-offset2:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: should specify payload transport window offset2 of each
> +		    data port. Out ports followed by In ports.
> +		    More info in MIPI Alliance SoundWire 1.0 Specifications.
> +
> +- qcom,ports-sinterval-low:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: should be sample interval low of each data port.
> +		    Out ports followed by In ports. Used for Sample Interval
> +		    calculation.
> +		    More info in MIPI Alliance SoundWire 1.0 Specifications.
> +
> +- qcom,ports-word-length:
> +	Usage: optional
> +	Value type: <prop-encoded-array>
> +	Definition: should be size of payload channel sample.
> +		    More info in MIPI Alliance SoundWire 1.0 Specifications.
> +
> +- qcom,ports-block-pack-mode:
> +	Usage: optional
> +	Value type: <prop-encoded-array>
> +	Definition: should be 0 or 1 to indicate the block packing mode.
> +		    0 to indicate Blocks are per Channel
> +		    1 to indicate Blocks are per Port.
> +		    Out ports followed by In ports.
> +		    More info in MIPI Alliance SoundWire 1.0 Specifications.
> +
> +- qcom,ports-block-group-count:
> +	Usage: optional
> +	Value type: <prop-encoded-array>
> +	Definition: should be in range 1 to 4 to indicate how many sample
> +		    intervals are combined into a payload.
> +		    Out ports followed by In ports.
> +		    More info in MIPI Alliance SoundWire 1.0 Specifications.
> +
> +- qcom,ports-lane-control:
> +	Usage: optional
> +	Value type: <prop-encoded-array>
> +	Definition: should be in range 0 to 7 to identify which	data lane
> +		    the data port uses.
> +		    Out ports followed by In ports.
> +		    More info in MIPI Alliance SoundWire 1.0 Specifications.
> +
> +- qcom,ports-hstart:
> +	Usage: optional
> +	Value type: <prop-encoded-array>
> +	Definition: should be number identifying lowerst numbered coloum in
> +		    SoundWire Frame, i.e. left edge of the Transport sub-frame
> +		    for each port. Values between 0 and 15 are valid.
> +		    Out ports followed by In ports.
> +		    More info in MIPI Alliance SoundWire 1.0 Specifications.
> +
> +- qcom,ports-hstop:
> +	Usage: optional
> +	Value type: <prop-encoded-array>
> +	Definition: should be number identifying highest numbered coloum in
> +		    SoundWire Frame, i.e. the right edge of the Transport
> +		    sub-frame for each port. Values between 0 and 15 are valid.
> +		    Out ports followed by In ports.
> +		    More info in MIPI Alliance SoundWire 1.0 Specifications.
> +
> +- qcom,dports-type:
> +	Usage: optional
> +	Value type: <prop-encoded-array>
> +	Definition: should be one of the following types
> +		    0 for reduced port
> +		    1 for simple ports
> +		    2 for full port
> +		    Out ports followed by In ports.
> +		    More info in MIPI Alliance SoundWire 1.0 Specifications.
> +
> +Note:
> +	More Information on detail of encoding of these fields can be
> +found in MIPI Alliance SoundWire 1.0 Specifications.
> +
> += SoundWire devices
> +Each subnode of the bus represents SoundWire device attached to it.
> +The properties of these nodes are defined by the individual bindings.

Is there some sort of addressing that needs to be defined?

> +
> += EXAMPLE
> +The following example represents a SoundWire controller on DB845c board
> +which has controller integrated inside WCD934x codec on SDM845 SoC.
> +
> +soundwire: soundwire@c85 {
> +	compatible = "qcom,soundwire-v1.3.0";
> +	reg = <0xc85 0x20>;
> +	interrupts = <20 IRQ_TYPE_EDGE_RISING>;
> +	clocks = <&wcc>;
> +	clock-names = "iface";
> +	#sound-dai-cells = <1>;
> +	qcom,dports-type = <0>;
> +	qcom,dout-ports	= <6>;
> +	qcom,din-ports	= <2>;
> +	qcom,ports-sinterval-low = /bits/ 8  <0x07 0x1F 0x3F 0x7 0x1F 0x3F 0x0F 0x0F>;
> +	qcom,ports-offset1 = /bits/ 8 <0x01 0x02 0x0C 0x6 0x12 0x0D 0x07 0x0A >;
> +	qcom,ports-offset2 = /bits/ 8 <0x00 0x00 0x1F 0x00 0x00 0x1F 0x00 0x00>;
> +
> +	/* Left Speaker */
> +	left{

space       ^
> +		....
> +	};
> +
> +	/* Right Speaker */
> +	right{

ditto

> +		....
> +	};
> +};
> -- 
> 2.21.0
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
