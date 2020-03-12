Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E162182BA4
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 09:57:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9F4716CC;
	Thu, 12 Mar 2020 09:56:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9F4716CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584003467;
	bh=7uLHZCwr2uy8ELI0MtJo8bX0vwz17MKh1tX4ACPw7eY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GXaILeZDO4L9hmRSah88MTH2vAW3WxvvIDWpPIQ9XXSwECQSqvGZwaD+5JLe/COA8
	 5QWkS1I1+ItoUK3iUhv2dFGwLUQ9tvTtf5uWGE/f7jpaBSUJv9Ix8wK7iaMkL0Oc51
	 6C7Qq7gFbHZpJafKr3EZ1u3DJycALaBEeOGI6hRg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C21AEF80086;
	Thu, 12 Mar 2020 09:56:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CD0DF8020C; Thu, 12 Mar 2020 09:56:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70C73F80086
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 09:56:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70C73F80086
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 47F8C29642E
Subject: Re: [PATCH] ASoC: dt-bindings: google, cros-ec-codec: Fix dtc warnings
 in example
To: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20200311205841.2710-1-robh@kernel.org>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <d6c612db-d4fd-e0e5-aff0-c3963322830c@collabora.com>
Date: Thu, 12 Mar 2020 09:55:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200311205841.2710-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

Hi Rob,

On 11/3/20 21:58, Rob Herring wrote:
> Extra dtc warnings (roughly what W=1 enables) are now enabled by default
> when building the binding examples. These were fixed treewide in
> 5.6-rc5, but the newly added google,cros-ec-codec schema adds some new
> warnings:
> 
> Documentation/devicetree/bindings/sound/google,cros-ec-codec.example.dts:17.28-21.11:
> Warning (unit_address_vs_reg): /example-0/reserved_mem: node has a reg or ranges property, but no unit name
> Documentation/devicetree/bindings/sound/google,cros-ec-codec.example.dts:22.19-32.11:
> Warning (unit_address_vs_reg): /example-0/cros-ec@0: node has a unit name, but no reg property
> Documentation/devicetree/bindings/sound/google,cros-ec-codec.example.dts:26.37-31.15:
> Warning (unit_address_vs_reg): /example-0/cros-ec@0/ec-codec: node has a reg or ranges property, but no unit name
> 
> Fixing the above, then results in:
> 
> Documentation/devicetree/bindings/sound/google,cros-ec-codec.example.dts:26.13-23:
> Warning (reg_format): /example-0/cros-ec@0:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
> Documentation/devicetree/bindings/sound/google,cros-ec-codec.example.dts:27.37-32.15:
> Warning (unit_address_vs_reg): /example-0/cros-ec@0/ec-codec: node has a reg or ranges property, but no unit name
> 
> Fixes: eadd54c75f1e ("dt-bindings: Convert the binding file google, cros-ec-codec.txt to yaml format.")
> Cc: Cheng-Yi Chiang <cychiang@chromium.org>
> Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Just a minor nit, but the patch looks good to me, so:

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>


> ---
>  .../bindings/sound/google,cros-ec-codec.yaml  | 27 +++++++++++--------
>  1 file changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
> index 94a85d0cbf43..c84e656afb0a 100644
> --- a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
> +++ b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
> @@ -44,19 +44,24 @@ additionalProperties: false
>  
>  examples:
>    - |
> -    reserved_mem: reserved_mem {
> +    reserved_mem: reserved-mem@52800000 {
>          compatible = "shared-dma-pool";
> -        reg = <0 0x52800000 0 0x100000>;
> +        reg = <0x52800000 0x100000>;
>          no-map;
>      };
> -    cros-ec@0 {
> -        compatible = "google,cros-ec-spi";
> -        #address-cells = <2>;
> -        #size-cells = <1>;
> -        cros_ec_codec: ec-codec {
> -            compatible = "google,cros-ec-codec";
> -            #sound-dai-cells = <1>;
> -            reg = <0x0 0x10500000 0x80000>;
> -            memory-region = <&reserved_mem>;
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        cros-ec@0 {
> +            compatible = "google,cros-ec-spi";
> +            #address-cells = <2>;
> +            #size-cells = <1>;
> +            reg = <0>;
> +            cros_ec_codec: ec-codec@10500000 {

nit: shouldn't this be just codec@105500000 to match the class? However I am not
sure codec is a class itself.

> +                compatible = "google,cros-ec-codec";
> +                #sound-dai-cells = <1>;
> +                reg = <0x0 0x10500000 0x80000>;
> +                memory-region = <&reserved_mem>;
> +            };
>          };
>      };
> 
