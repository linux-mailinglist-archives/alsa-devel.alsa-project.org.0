Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 422C553D09E
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 20:08:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD51A189F;
	Fri,  3 Jun 2022 20:07:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD51A189F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654279694;
	bh=7uGS5FftIUoeCqNlgegTrMTjnf2VgaQxUalDgsNmbRo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q/jiWCYUzYTd7FjQxDFjMkM6dDpCk0yP4hC/X12dgYkBZaQzyDOZowYFpT77+1NfO
	 NyBlEmSeq5b8o/efG0+qkrfsutncCFfKX24BMC/U1kfq2WJWAelxpj1vOG3Gv7hdF7
	 Tq98vD4ZVwxQKDYtpqUz7obHfxCumqsIGUofvP/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1F1AF80089;
	Fri,  3 Jun 2022 20:07:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CF76F804CC; Fri,  3 Jun 2022 20:07:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BCDDF80124
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 20:06:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BCDDF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="pYJS6YCH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1654279610;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=W0zLWbkTHHDH0iI0Y3QB9pk4VW+9pPQV3k8LcemuFF4=;
 b=pYJS6YCHpweybvsrVNZNXAsxkI5rzK4/zWclFd7weZ1Qnc/lPxo41Ty8ah4CMiEnOI
 ZaPHFjKRNZ4oVB8CiYRc9XjC57ylnB2bYRrb6iKZsqu76UlB8bmEMFHEVs3+z34YHYl5
 wvBtLcVMooMejLMjIGV1fW1TsinV6qGUatpYgYOaoYgvRD0rJTFI/btn0dV1AcpsCINp
 nqhaBNya5zv3lbRF+0fAcEv5tqLowMkkC+y42Dze0EMuwnqZVT5staAMha6d8V3FxEdT
 2AR6tBpKY5dZW5FbMgAj5aobTvtfhFCAQa48UcXu8NSx8U/HzhfAdky1u7F9FBrwwliO
 3LiA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLVrKw7/aY="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 47.45.0 AUTH)
 with ESMTPSA id 9056edy53I6nwkU
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 3 Jun 2022 20:06:49 +0200 (CEST)
Date: Fri, 3 Jun 2022 20:06:39 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Alexander Martinz <amartinz@shiftphones.com>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: nxp,tfa989x: Add tfa9890 support
Message-ID: <YppNaL5r5EN3SUsU@gerhold.net>
References: <20220602164504.261361-1-amartinz@shiftphones.com>
 <20220602164504.261361-2-amartinz@shiftphones.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220602164504.261361-2-amartinz@shiftphones.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Dylan Van Assche <me@dylanvanassche.be>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Caleb Connolly <caleb@connolly.tech>,
 Mark Brown <broonie@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org
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

On Thu, Jun 02, 2022 at 06:45:04PM +0200, Alexander Martinz wrote:
> Document TFA9890 binding for tfa989x.
> 
> Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>

The dt-bindings patch should usually come first in the patch series.
Anyway, no need to resend just for that IMO:

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

> ---
>  Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml b/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
> index b9b1dba40856..7f2e68ff6d34 100644
> --- a/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
> +++ b/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
> @@ -15,6 +15,7 @@ allOf:
>  properties:
>    compatible:
>      enum:
> +      - nxp,tfa9890
>        - nxp,tfa9895
>        - nxp,tfa9897
>  
> -- 
> 2.36.1
> 
