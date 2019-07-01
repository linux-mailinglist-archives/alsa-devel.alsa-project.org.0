Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 431125B559
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2019 08:54:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A36E71683;
	Mon,  1 Jul 2019 08:54:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A36E71683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561964097;
	bh=j79vK4YxplqdqE8au5nbK3dR7wvMnFNfKjf5U3huJbE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WYwdAywon76LdzpzY0dcuObEeV4RXvAJlLEpBcz8XjiYgitxgve69VGV5uSgSUfHU
	 vGJvvd2vV3B/gm2x8jNIINECnVE//si+btNSuBGjcf0ZFOjw5PTlXeJ2H6GTG6ailg
	 /WfaQ9Txz+khZfNXOjnJT5WVxBPcQ9Tb3qYt3LpY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 557D8F89709;
	Mon,  1 Jul 2019 08:53:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D60EF896EC; Mon,  1 Jul 2019 08:53:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E645F89670
 for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2019 08:53:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E645F89670
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GAf+PQ1a"
Received: from localhost (unknown [122.167.76.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B9C3E208C4;
 Mon,  1 Jul 2019 06:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561961704;
 bh=ilZV0SIdnC6KQqrECJ2dASQKpsEhCCtdERzUguOYjcA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GAf+PQ1aK5gG8O9JVySIOpgQEJ8f9g9ZfUmlv6r8WjKTMOjeULrpPNIVfq15xlQ1V
 NOR2z3AxNvyc5pI0OaLi2fNPY6mV2Nq4axdv83Vuh6qDDv2WIC99gjUr++chXDzvwV
 4ne8obQJ3drV7hN9RcgP4oJHZlHUwzrVrkTbSoig=
Date: Mon, 1 Jul 2019 11:41:55 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20190701061155.GJ2911@vkoul-mobl>
References: <20190611104043.22181-1-srinivas.kandagatla@linaro.org>
 <20190611104043.22181-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611104043.22181-2-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 bgoswami@quicinc.com
Subject: Re: [alsa-devel] [RFC PATCH 1/5] dt-bindings: soundwire: add slave
	bindings
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

On 11-06-19, 11:40, Srinivas Kandagatla wrote:
> This patch adds bindings for Soundwire Slave devices which includes how
> SoundWire enumeration address is represented in SoundWire slave device
> tree nodes.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../devicetree/bindings/soundwire/bus.txt     | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soundwire/bus.txt
> 
> diff --git a/Documentation/devicetree/bindings/soundwire/bus.txt b/Documentation/devicetree/bindings/soundwire/bus.txt
> new file mode 100644
> index 000000000000..19a672b0d528
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soundwire/bus.txt

The bindings are for slave right and the file is bus.txt?

> @@ -0,0 +1,48 @@
> +SoundWire bus bindings.
> +
> +SoundWire is a 2-pin multi-drop interface with data and clock line.
> +It facilitates development of low cost, efficient, high performance systems.
> +
> +SoundWire controller bindings are very much specific to vendor.
> +
> +Child nodes(SLAVE devices):
> +Every SoundWire controller node can contain zero or more child nodes
> +representing slave devices on the bus. Every SoundWire slave device is
> +uniquely determined by the enumeration address containing 5 fields:
> +SoundWire Version, Instance ID, Manufacturer ID, Part ID and Class ID
> +for a device. Addition to below required properties, child nodes can
> +have device specific bindings.
> +
> +Required property for SoundWire child node if it is present:
> +- compatible:	 "sdwVER,MFD,PID,CID". The textual representation of
> +		  SoundWire Enumeration address comprising SoundWire
> +		  Version, Manufacturer ID, Part ID and Class ID,
> +		  shall be in lower-case hexadecimal with leading
> +		  zeroes suppressed.
> +		  Version number '0x10' represents SoundWire 1.0
> +		  Version number '0x11' represents SoundWire 1.1
> +		  ex: "sdw10,0217,2010,0"

any reason why we want to code version number and not say sdw,1.0,...
and so on?

> +
> +- sdw-instance-id: Should be ('Instance ID') from SoundWire
> +		  Enumeration Address. Instance ID is for the cases
> +		  where multiple Devices of the same type or Class
> +		  are attached to the bus.

instance id is part of the 48bit device id, so wont it make sense to add
that to compatible as well?

> +
> +SoundWire example for Qualcomm's SoundWire controller:
> +
> +soundwire@c2d0000 {
> +	compatible = "qcom,soundwire-v1.5.0"
> +	reg = <0x0c2d0000 0x2000>;
> +
> +	spkr_left:wsa8810-left{
> +		compatible = "sdw10,0217,2010,0";
> +		sdw-instance-id = <1>;
> +		...
> +	};
> +
> +	spkr_right:wsa8810-right{
> +		compatible = "sdw10,0217,2010,0";
> +		sdw-instance-id = <2>;
> +		...
> +	};
> +};
> -- 
> 2.21.0

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
