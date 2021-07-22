Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 539483D1D7D
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 07:37:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBEDF16AA;
	Thu, 22 Jul 2021 07:36:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBEDF16AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626932237;
	bh=C3/sB3KIQdXerrbRx53jwbSMzLwztjGHorkS8bXkBZY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eJ/53kR8RxtarJsYGjukszuNQFbWqAOAb0x2QqNORtUwAbdvLXcDXTieeosCBY+KG
	 7+KMvOwmV3tJMfyxz97GKR6Fv4LAK7+u/dhHsOlg46qVRHsG9SE7XJ3hT4+C1JPM71
	 /cv4kXtVXjRaBQ9k2ZikskGG/BQXA4GCl51wn4LI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50448F800DA;
	Thu, 22 Jul 2021 07:35:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4512F80227; Thu, 22 Jul 2021 07:35:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7F9DF800F2
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 07:35:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7F9DF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="sEKmNLWA"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="A+xZzKOW"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id C7A3F5817C4;
 Thu, 22 Jul 2021 01:35:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 22 Jul 2021 01:35:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=V
 CC4K9x1L+piLdGylx5VSb6j9aBuZqYFN90RmCaQeGo=; b=sEKmNLWAyx48HvAqT
 Ss0Mb3HT5+R0vNtH4+N9joLnr+3tw7GFRFJHX3290nLC14FPTZ9lL7M8greiY2j+
 zWh0e6M1kwVPHKLQOZajYKJnHIHxjey7g38+l9DlTJC3t5P4k7Xm+6eh/v4jaaz2
 9CL+3EFl5l1YJBfFDktIdo4VamYxqKqdMW/q+6ZQy6lq4BAhooF5d0wkyoyahnM0
 rS5k1Lng7PGN6BYCkMzcszj8sgEP3dU/pEoc6/fw0yrspHsloj+ITc9XrPCOp0V6
 gHkhfai0evRoVNxFkAZxOtSBcvWByweP3uV8fWsdLzVTL/6yx5qjOFoL82f+OAov
 K9SBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=VCC4K9x1L+piLdGylx5VSb6j9aBuZqYFN90RmCaQe
 Go=; b=A+xZzKOWyCd51gjW6RrbQeLx28tMX3azdF+DZ3+yibbvXmfAwX3mo7Gfl
 dsam3XDkyEyBFJ5nEOMeJLgmy0lgjWKue4XX6LNwf1lpmZ5rH+67tKCBeTUsq3F0
 iHhjzAc/yu/NeqSnM/G6AT88pbAY8f5DjQ14uWgsQCdJSOwsYu3oxryOqm/36Y6+
 jWyohMXSf8khi/iM15lUaZrln070tQfhsGqefYK6XRFrtyTJQHRrHUkOGCkFGHnq
 5sV2d1tjJcTTojKSH449sFK9HKV0Uqr/Jz/5Rg6IrS7Z+eBdsROToG8CPY6dIiju
 N2TxMMM7gS6TVl5CFH35jeeQSieZg==
X-ME-Sender: <xms:pgP5YA_dUkO4RWZOVmqHrnCH-514lOd7oM1w03uZ18OGEFjRGp68Eg>
 <xme:pgP5YIu1rTCIwgLQOUGhRKwWPhW113XHcGz1ZnJRgTSP32CWCZxDwYVucarsz_cNQ
 uEDMurb6yHYQSryUw>
X-ME-Received: <xmr:pgP5YGCGlajFviHI3hsL_lEkP3pn4YFHTFNx5NyJHVDwH9PqklAyCmTnZN44uXjXmCnzM0op0WxohDlkhzpOSSbw10dMjjeXxDX_mvZbeJeYxDI1qNfBB3G6EA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeehgdeliecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeffiefgledvgfdtteeludevvefguddtiedutdevtedvhfffjeelhfeh
 teejtedvleenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhho
 lhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:pgP5YAfjx4O6wOw1mqlFjlXfEqDOlg4X9uGc1wTpXzxrq2odRHA_BQ>
 <xmx:pgP5YFO4y0oxmNIt8Uu7WsxLzmoMMq1ar4QOvFjHgkv-dE5Z5iyefg>
 <xmx:pgP5YKmpwkfgqV83TnoZo8md2caj_T0yi0H_KWAS3NKi5Rni0V9hSg>
 <xmx:pwP5YIrTx6FJ9su8nN_v0fDTGgc8LadDFL_0Gji8QW3Jdf3TavkoGQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jul 2021 01:35:34 -0400 (EDT)
Subject: Re: [PATCH 02/54] ASoC: dt-bindings: Convert Bluetooth SCO Link
 binding to a schema
To: Maxime Ripard <maxime@cerno.tech>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
References: <20210721140424.725744-1-maxime@cerno.tech>
 <20210721140424.725744-3-maxime@cerno.tech>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <e0ba4dab-abe9-9f4b-2795-e85041efa451@sholland.org>
Date: Thu, 22 Jul 2021 00:35:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210721140424.725744-3-maxime@cerno.tech>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: linux-sunxi@googlegroups.com, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 Liam Girdwood <lgirdwood@gmail.com>
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

On 7/21/21 9:03 AM, Maxime Ripard wrote:
> Bluetooth SCO Link are supported by Linux with a matching device tree
> binding.
> 
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
> 
> The value expected for #sound-dai-cells wasn't documented though, and
> the users were inconsistent. The example didn't list it, and across the
> 4 users we have in tree:
>   - 1 had a cells value of 1, but using only 0 as argument
>   - 1 had a cells value of 0,
>   - 2 didn't have this property at all, behaving as if it was 0,
> 
> It seems like the consensus seems to be that it should be 0, so let's
> enforce it.

The driver has two DAIs: "bt-sco-pcm" and "bt-sco-pcm-wb". If
#sound-dai-cells is 0, only the first DAI can be referenced from a
device tree. So to declare support for wideband PCM, or explicitly
declare a lack of support for it, #sound-dai-cells must be 1.

Regards,
Samuel

> Cc: alsa-devel@alsa-project.org
> Cc: devicetree@vger.kernel.org
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../devicetree/bindings/sound/bt-sco.txt      | 13 -------
>  .../bindings/sound/linux,bt-sco.yaml          | 34 +++++++++++++++++++
>  2 files changed, 34 insertions(+), 13 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/bt-sco.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/linux,bt-sco.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/bt-sco.txt b/Documentation/devicetree/bindings/sound/bt-sco.txt
> deleted file mode 100644
> index 641edf75e184..000000000000
> --- a/Documentation/devicetree/bindings/sound/bt-sco.txt
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -Bluetooth-SCO audio CODEC
> -
> -This device support generic Bluetooth SCO link.
> -
> -Required properties:
> -
> -  - compatible : "delta,dfbmcs320" or "linux,bt-sco"
> -
> -Example:
> -
> -codec: bt_sco {
> -	compatible = "delta,dfbmcs320";
> -};
> diff --git a/Documentation/devicetree/bindings/sound/linux,bt-sco.yaml b/Documentation/devicetree/bindings/sound/linux,bt-sco.yaml
> new file mode 100644
> index 000000000000..334b508205cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/linux,bt-sco.yaml
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/linux,bt-sco.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bluetooth SCO Audio Codec Device Tree Bindings
> +
> +maintainers:
> +  - Mark Brown <broonie@kernel.org>
> +
> +properties:
> +  '#sound-dai-cells':
> +    const: 0
> +
> +  compatible:
> +    enum:
> +      - delta,dfbmcs320
> +      - linux,bt-sco
> +
> +required:
> +  - '#sound-dai-cells'
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    codec {
> +        #sound-dai-cells = <0>;
> +        compatible = "linux,bt-sco";
> +    };
> +
> +...
> 

