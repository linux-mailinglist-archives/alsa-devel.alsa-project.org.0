Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A93587137
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 07:03:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 911BE1612;
	Fri,  9 Aug 2019 07:02:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 911BE1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565326987;
	bh=tExmmET5Wf85ecBhfclOQC+GxsNZDMjftTbw3DcvbCM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V0r8ByblD48ExeBqOSAntLw41xfIvs+rsu0atCz/56MbFuShKQeDmX0dBAokuNhs+
	 HsQMOfXQOsz0k98pyF7Xgva8MT3NGXl9OSeS9jCRTFfK/HbKW/WEGDGJedXsutTgDh
	 CaMU2iUX8ndvxwuoMUGe4enyFMYTWszT5UjgBsx4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06152F8036B;
	Fri,  9 Aug 2019 07:01:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BED1F803F3; Fri,  9 Aug 2019 07:01:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FA23F8036B
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 07:01:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FA23F8036B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cwaTFUMU"
Received: from localhost (unknown [106.51.111.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 71BE2214C6;
 Fri,  9 Aug 2019 05:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565326876;
 bh=55Gs1G9Rz04Gs41D1M4WjTdna+61wD7lIipwnYMQUFY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cwaTFUMUPfzNaN/PYEWqdDYZ+GJMRCu5TiiLR7EnQoxnGsSVl8Z+09Q7JAHTOXjeL
 jvlwUdLeiND0cIP93SeVPyFcKaXUVGw4Wrk+JstNZmj+yvQLLlJ/C+OWjE+2ATQFcr
 E4DCh5p77RxazIhzmgohj63LIDqUX/RbUlnBn12Y=
Date: Fri, 9 Aug 2019 10:30:04 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20190809050004.GI12733@vkoul-mobl.Dlink>
References: <20190808144504.24823-1-srinivas.kandagatla@linaro.org>
 <20190808144504.24823-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808144504.24823-2-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, robh+dt@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v2 1/4] dt-bindings: soundwire: add slave
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

On 08-08-19, 15:45, Srinivas Kandagatla wrote:
> This patch adds bindings for Soundwire Slave devices which includes how
> SoundWire enumeration address is represented in SoundWire slave device
> tree nodes.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../devicetree/bindings/soundwire/slave.txt   | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soundwire/slave.txt
> 
> diff --git a/Documentation/devicetree/bindings/soundwire/slave.txt b/Documentation/devicetree/bindings/soundwire/slave.txt
> new file mode 100644
> index 000000000000..b8e8d34bbc92
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soundwire/slave.txt
> @@ -0,0 +1,46 @@
> +SoundWire slave device bindings.
> +
> +SoundWire is a 2-pin multi-drop interface with data and clock line.
> +It facilitates development of low cost, efficient, high performance systems.
> +
> +SoundWire slave devices:
> +Every SoundWire controller node can contain zero or more child nodes
> +representing slave devices on the bus. Every SoundWire slave device is
> +uniquely determined by the enumeration address containing 5 fields:
> +SoundWire Version, Instance ID, Manufacturer ID, Part ID and Class ID
> +for a device. Addition to below required properties, child nodes can

It would help to list them rather than free flowing text

> +have device specific bindings.
> +
> +Required property for SoundWire child node if it is present:

As said earlier, lets make it "Required properties:"

> +- compatible:	 "sdwVER,MFD,PID,CID". The textual representation of
> +		  SoundWire Enumeration address comprising SoundWire
> +		  Version, Manufacturer ID, Part ID and Class ID,
> +		  shall be in lower-case hexadecimal with leading
> +		  zeroes suppressed.
> +		  Version number '0x10' represents SoundWire 1.0
> +		  Version number '0x11' represents SoundWire 1.1
> +		  ex: "sdw10,0217,2010,0"
> +
> +- sdw-instance-id: Should be ('Instance ID') from SoundWire
> +		  Enumeration Address. Instance ID is for the cases
> +		  where multiple Devices of the same type or Class
> +		  are attached to the bus.
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
