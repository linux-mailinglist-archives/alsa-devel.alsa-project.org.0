Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 921D62B7663
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 07:40:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 200BA178B;
	Wed, 18 Nov 2020 07:39:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 200BA178B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605681630;
	bh=lBuS2tDIdGTb/fQxn6fB/oCb7deDJq2ZwxTMYlGmMLM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o9KFYrOg9dJgFbxr81GhuWgag0G9BwaLUnQKT/+fNIM2sbFdtbpTm2wF1JY0HiQCc
	 QrxzO5no7qBAGT4whiO38Mcc+UteC2t3zQ2lv50J91G2D1ZvgOZgim90kQBA23oLGw
	 DtsikZ/JP7hvE6d8OOHJH/TMXq1ij4m2/ETPC3r0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FB9EF800EE;
	Wed, 18 Nov 2020 07:38:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DB10F8016C; Wed, 18 Nov 2020 07:38:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from shell.v3.sk (mail.v3.sk [167.172.186.51])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6B9CF800EE
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 07:38:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6B9CF800EE
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 38C32DF8A5;
 Wed, 18 Nov 2020 06:35:58 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id NqEWOd0Kgx6T; Wed, 18 Nov 2020 06:35:57 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 079A0E0190;
 Wed, 18 Nov 2020 06:35:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 2RffOTGIp8l2; Wed, 18 Nov 2020 06:35:56 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id B17DDDF8A5;
 Wed, 18 Nov 2020 06:35:56 +0000 (UTC)
Date: Wed, 18 Nov 2020 07:38:36 +0100
From: Lubomir Rintel <lkundrak@v3.sk>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4] ASoC: dt-bindings: marvell,mmp-sspa: Use
 audio-graph-port schema
Message-ID: <20201118063836.GA5540@demiurge.local>
References: <20201117013349.2458416-1-robh@kernel.org>
 <20201117013349.2458416-4-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117013349.2458416-4-robh@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Sameer Pujar <spujar@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
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

On Mon, Nov 16, 2020 at 07:33:48PM -0600, Rob Herring wrote:
> Now that we have a graph schema, reference it from the marvell,mmp-sspa
> schema.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Lubomir Rintel <lkundrak@v3.sk>

Thank you
Lubo

> ---
>  .../bindings/sound/marvell,mmp-sspa.yaml      | 25 +++----------------
>  1 file changed, 3 insertions(+), 22 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/marvell,mmp-sspa.yaml b/Documentation/devicetree/bindings/sound/marvell,mmp-sspa.yaml
> index 6d20a24a2ae9..234f64a32184 100644
> --- a/Documentation/devicetree/bindings/sound/marvell,mmp-sspa.yaml
> +++ b/Documentation/devicetree/bindings/sound/marvell,mmp-sspa.yaml
> @@ -9,6 +9,9 @@ title: Marvel SSPA Digital Audio Interface Bindings
>  maintainers:
>    - Lubomir Rintel <lkundrak@v3.sk>
>  
> +allOf:
> +  - $ref: audio-graph-port.yaml#
> +
>  properties:
>    $nodename:
>      pattern: "^audio-controller(@.*)?$"
> @@ -58,29 +61,9 @@ properties:
>          type: object
>  
>          properties:
> -          remote-endpoint: true
> -
> -          frame-master:
> -            type: boolean
> -            description: SoC generates the frame clock
> -
> -          bitclock-master:
> -            type: boolean
> -            description: SoC generates the bit clock
> -
>            dai-format:
> -            $ref: /schemas/types.yaml#/definitions/string
> -            description: The digital audio format
>              const: i2s
>  
> -        required:
> -          - remote-endpoint
> -
> -    required:
> -      - endpoint
> -
> -    additionalProperties: false
> -
>  required:
>    - "#sound-dai-cells"
>    - compatible
> @@ -112,8 +95,6 @@ examples:
>        port {
>          endpoint {
>            remote-endpoint = <&rt5631_0>;
> -          frame-master;
> -          bitclock-master;
>            dai-format = "i2s";
>          };
>        };
> -- 
> 2.25.1
> 
