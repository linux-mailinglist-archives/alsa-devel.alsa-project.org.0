Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D3C42FA7D
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 19:46:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC945186E;
	Fri, 15 Oct 2021 19:45:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC945186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634319991;
	bh=jtXjDYbKJ13APEAxmrnAhG1SXAyRv8409pBhbGOUj+o=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GnRsOnTaWp2WslCT3s0sEtT/H1YRlXIs3cwS2MMFBaICCobx1j/BMyRebE19INzpo
	 aW6bH77McEx0g5u1YanXTjhrmncL4RZDpi8dCVjaFUoovhj5KJcAMJMSXtW/g6Dulj
	 u47vro29bs+nsVGHyk9deGTH39AlqlnUT2hMG6CM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35182F8028D;
	Fri, 15 Oct 2021 19:45:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70B9FF80269; Fri, 15 Oct 2021 19:45:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id CF38FF8012E
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 19:45:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF38FF8012E
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6344B11D4;
 Fri, 15 Oct 2021 10:45:05 -0700 (PDT)
Received: from [10.57.95.157] (unknown [10.57.95.157])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA7CF3F70D;
 Fri, 15 Oct 2021 10:45:03 -0700 (PDT)
Subject: Re: [PATCH] ASoC: dt-bindings: rockchip: i2s-tdm: fix rockchip, cru
 requirement
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
References: <20211015143115.1445707-1-frattaroli.nicolas@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <8553b0cd-95e4-c3db-c75a-d3b28e99f131@arm.com>
Date: Fri, 15 Oct 2021 18:44:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211015143115.1445707-1-frattaroli.nicolas@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

On 2021-10-15 15:31, Nicolas Frattaroli wrote:
> The behaviour described in the bindings is exactly the opposite
> of what it should be, so this patch fixes the description and
> adjusts the if conditions for adding rockchip,cru to required.
> 
> Fixes: 510f1c133aed ("ASoC: dt-bindings: rockchip: add i2s-tdm bindings")
> Signed-off-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
> ---
>   .../devicetree/bindings/sound/rockchip,i2s-tdm.yaml   | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
> index ce3e18b50230..93f5221e9381 100644
> --- a/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
> +++ b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
> @@ -86,7 +86,7 @@ properties:
>       $ref: /schemas/types.yaml#/definitions/phandle
>       description:
>         The phandle of the cru.
> -      Required if neither trcm-sync-tx-only nor trcm-sync-rx-only are specified.
> +      Required if either trcm-sync-tx-only or trcm-sync-rx-only are specified.
>   
>     rockchip,grf:
>       $ref: /schemas/types.yaml#/definitions/phandle
> @@ -147,8 +147,13 @@ required:
>   allOf:
>     - if:
>         properties:
> -        rockchip,trcm-sync-tx-only: false
> -        rockchip,trcm-sync-rx-only: false
> +        rockchip,trcm-sync-tx-only: true
> +    then:
> +      required:
> +        - rockchip,cru
> +  - if:
> +      properties:
> +        rockchip,trcm-sync-rx-only: true

FWIW, isn't this just a long-winded way to say

   if:
     anyOf:
       - properties:
           rockchip,trcm-sync-tx-only: true
       - properties:
           rockchip,trcm-sync-rx-only: true

which itself could still be more concisely

   if:
     not:
       properties:
         rockchip,trcm-sync-tx-only: false
         rockchip,trcm-sync-rx-only: false

?

Robin.

>       then:
>         required:
>           - rockchip,cru
> 
