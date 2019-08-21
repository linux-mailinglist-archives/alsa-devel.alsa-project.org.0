Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA12986C1
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 23:46:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6BAF1607;
	Wed, 21 Aug 2019 23:45:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6BAF1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566423991;
	bh=CQAAe2W0ihk0PgP1Jxbs+ubxACZYJwKl6uowvPJ2G+I=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hJyKfR64VzWT10tXuCWQxvKFBG7EjAmmRfy0Nhjx4veZ+LFHL3VCLTywrzUMB+lJm
	 7w+Fzy1DHoSDlIN6kxXPdaTtm98u/M6bOTjNY6kLqQafuHQ/hFMiCrT4XoUj6wwEAD
	 MJ6TtvnqPH/QrsLofzlqd41eXBNIDQl2hOma7poQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C11D1F80322;
	Wed, 21 Aug 2019 23:44:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68337F80306; Wed, 21 Aug 2019 23:44:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51EB0F800BF
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 23:44:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51EB0F800BF
Received: by mail-oi1-f193.google.com with SMTP id 16so2795362oiq.6
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 14:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RLnoMCGg4aZAXQG/7EhE1lAx/LE1YZXQ51HizQcuuSk=;
 b=qwz9NQlhwOIJvEBLT8MO2Q/V3OQrIIC2IqsEa/k+YfZ/ilwcgxTXyssNC/ry9C1yPb
 l5mTVmeweGEcwlW5LCPUQgFb/+RKs2bOB73Lm9PhRvhdchUZswc9gIx0LbEhm3ClXQ+s
 qlyoxeTSPkgxdniRJaZpX0BQFzSY5G5ZqhUGJ3Py7Eg8vc3NKE/ttWJOvpmT5XAP3zAq
 udjhO9nX/b3J7KicHmO2xpw4W10xOTDpfWzYSgRYRZU/vRiCfpl5ZG4oMXCEvm/3NnQI
 Ytl5tMQs2aRqQ7Qg+Wm28YR+XkcJwb4RnmLxxnwYZSGDHVHpGR8BMNZXoEVdqxDVIgFh
 ab0w==
X-Gm-Message-State: APjAAAVV6DFIyy6w07rvWuXYVz9PZODPmnx5lXtJBXOpsi0TqPlzQvCz
 UZOdYhdbxVyrk2YH4XIJ/w==
X-Google-Smtp-Source: APXvYqwHMvNmtkabfkRrV911VbE74YYZKFohSjzXpV0vzc4tBsAYOT28isHK4N/rXNz29ZFzUCPLIA==
X-Received: by 2002:a54:4f09:: with SMTP id e9mr1583851oiy.89.1566423877964;
 Wed, 21 Aug 2019 14:44:37 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 65sm7881807otw.2.2019.08.21.14.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 14:44:37 -0700 (PDT)
Date: Wed, 21 Aug 2019 16:44:36 -0500
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20190821214436.GA13936@bogus>
References: <20190809133407.25918-1-srinivas.kandagatla@linaro.org>
 <20190809133407.25918-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809133407.25918-2-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, vkoul@kernel.org,
 broonie@kernel.org
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

On Fri, Aug 09, 2019 at 02:34:04PM +0100, Srinivas Kandagatla wrote:
> This patch adds bindings for Soundwire Slave devices that includes how
> SoundWire enumeration address and Link ID are used to represented in
> SoundWire slave device tree nodes.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../devicetree/bindings/soundwire/slave.txt   | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soundwire/slave.txt

Can you convert this to DT schema given it is a common binding.

What does the host controller look like? You need to define the node 
hierarchy. Bus controller schemas should then include the bus schema. 
See spi-controller.yaml.

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

This can all be a regex.

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

The normal way to distinguish instances is with 'reg'. So I think you 
need 'reg' with Instance ID moved there at least. Just guessing, but 
perhaps Link ID, too? And for 2 different classes of device is that 
enough? 

Rob
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
