Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 636EB975A4
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 11:11:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2526166B;
	Wed, 21 Aug 2019 11:10:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2526166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566378693;
	bh=vMdzL8iSyEUIH6uIvNVNL3WQzNmygxsgOddyses45Uc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FskTnuJVRNV2evY0xrJvmDihL5pDa5qIkjPt7plSfxBQvRlIM73XjTnq0AjGxcvD9
	 wPh77OiAJHKw0a1QPhPr8YSUqhF7lyQnqyJUHmfxL/2tU748m+xI1ihFvw0ELv7wQY
	 9KR86DwbGEIgeQMYfmnNtuPz0wJU27dNJ2hvHyYk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84B40F80157;
	Wed, 21 Aug 2019 11:10:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E1AFF80322; Wed, 21 Aug 2019 11:10:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F130F80157
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 11:10:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F130F80157
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lGxA0HKW"
Received: from localhost (unknown [106.201.100.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8F9B622CF7;
 Wed, 21 Aug 2019 09:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566378621;
 bh=W9CJXEr9ZkiNKd2KgCE+lVmTvH2ChSyocXu1r1dXMXM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lGxA0HKW+pO5EmaAU5VHVO9k08vuiGjEf0lotHaARtvj8B27zro+4/zK1TGcH9V4y
 2wKV+KmxOtiolr/P4cIowle0i+7VrHfuttRd2hvF1R7eyr4vkobK28CzGkzPMm7gob
 RFHJt/LPOe1e3p92Jo7PqbooGHa9h4V/5smLax7E=
Date: Wed, 21 Aug 2019 14:39:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: robh+dt@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20190821090909.GJ12733@vkoul-mobl.Dlink>
References: <20190809133407.25918-1-srinivas.kandagatla@linaro.org>
 <20190809133407.25918-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809133407.25918-2-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v3 1/4] dt-bindings: soundwire: add slave
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

On 09-08-19, 14:34, Srinivas Kandagatla wrote:
> This patch adds bindings for Soundwire Slave devices that includes how
> SoundWire enumeration address and Link ID are used to represented in
> SoundWire slave device tree nodes.

Rob does this look good to you, I intent to apply the soundwire parts

> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../devicetree/bindings/soundwire/slave.txt   | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soundwire/slave.txt
> 
> diff --git a/Documentation/devicetree/bindings/soundwire/slave.txt b/Documentation/devicetree/bindings/soundwire/slave.txt
> new file mode 100644
> index 000000000000..201f65d2fafa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soundwire/slave.txt
> @@ -0,0 +1,51 @@
> +SoundWire slave device bindings.
> +
> +SoundWire is a 2-pin multi-drop interface with data and clock line.
> +It facilitates development of low cost, efficient, high performance systems.
> +
> +SoundWire slave devices:
> +Every SoundWire controller node can contain zero or more child nodes
> +representing slave devices on the bus. Every SoundWire slave device is
> +uniquely determined by the enumeration address containing 5 fields:
> +SoundWire Version, Instance ID, Manufacturer ID, Part ID
> +and Class ID for a device. Addition to below required properties,
> +child nodes can have device specific bindings.
> +
> +Required properties:
> +- compatible:	 "sdw<LinkID><VersionID><InstanceID><MFD><PID><CID>".
> +		  Is the textual representation of SoundWire Enumeration
> +		  address along with Link ID. compatible string should contain
> +		  SoundWire Link ID, SoundWire Version ID, Instance ID,
> +		  Manufacturer ID, Part ID and Class ID in order
> +		  represented as above and shall be in lower-case hexadecimal
> +		  with leading zeroes. Vaild sizes of these fields are
> +		  LinkID is 1 nibble,
> +		  Version ID is 1 nibble
> +		  Instance ID in 1 nibble
> +		  MFD in 4 nibbles
> +		  PID in 4 nibbles
> +		  CID is 2 nibbles
> +
> +		  Version number '0x1' represents SoundWire 1.0
> +		  Version number '0x2' represents SoundWire 1.1
> +		  ex: "sdw0110217201000" represents 0 LinkID,
> +		  SoundWire 1.0 version slave with Instance ID 1.
> +		  More Information on detail of encoding of these fields can be
> +		  found in MIPI Alliance DisCo & SoundWire 1.0 Specifications.
> +
> +SoundWire example for Qualcomm's SoundWire controller:
> +
> +soundwire@c2d0000 {
> +	compatible = "qcom,soundwire-v1.5.0"
> +	reg = <0x0c2d0000 0x2000>;
> +
> +	spkr_left:wsa8810-left{
> +		compatible = "sdw0110217201000";
> +		...
> +	};
> +
> +	spkr_right:wsa8810-right{
> +		compatible = "sdw0120217201000";
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
