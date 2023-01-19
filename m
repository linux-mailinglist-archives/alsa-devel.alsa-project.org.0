Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C6B673831
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 13:18:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C61487172;
	Thu, 19 Jan 2023 13:17:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C61487172
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674130702;
	bh=OQ7G27C7bJn8FV47yuIHXL1oUJJyi39FrG+lKjbaQn0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jz/M+KzBIoALH5+roNEdQvnsB/H06WUmr09Kq4yueEVEVlhNxNL/y1gGdLOU3CeNm
	 rs5HHtOBjqbONrCK701V1uSTYkkseopRdQaITizDBYN961H8eDLz8peZNCtGjXkbwd
	 VXi95CN+mD2UkFmFtJQh258aQjDjGzFGIQ8CUjb0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DFACF80083;
	Thu, 19 Jan 2023 13:17:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61136F8047B; Thu, 19 Jan 2023 13:17:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 917B4F80083
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 13:17:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 917B4F80083
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ztb/W1xJ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DF381B8228E;
 Thu, 19 Jan 2023 12:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5BF2C433EF;
 Thu, 19 Jan 2023 12:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674130639;
 bh=OQ7G27C7bJn8FV47yuIHXL1oUJJyi39FrG+lKjbaQn0=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Ztb/W1xJp8LiuoztVHp4ezbV944o7p8Kx6NHA0Kp5zNsvO7lalCoR0omE+0YAfEl1
 kwgZwiuJLVgt/y3dyU12V3CHn/T0+CyCgXslOeHeWjcpHQWijkH3xdBmvl4KYpjW3E
 da6cuvA+0pfry1RY3oVWaz3oGVqDgrTBdrL93kx5tgCvYgiNBZVZ3DKt3UCH7bNzqg
 Sgnj8HuJATSbQdzWwuGcuhDgHttJcdUotXPsjL6YugrRiDfQ3VjDu5tOE3erNObXYj
 IN4LjMwtlTzhn6G4iyZkq6qmOl3nDOsr2ROKDNZpRrwgZ+EauVn6IgRqrQ1+OBUmKj
 x+5anT071WAcw==
Message-ID: <452b332a-d796-119c-e80a-e68914f46702@kernel.org>
Date: Thu, 19 Jan 2023 13:17:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 3/3] ASoC: google: dt-bindings: sc7280: Add
 #sound-dai-cells property
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@quicinc.com,
 perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org, devicetree@vger.kernel.org
References: <1674108674-8392-1-git-send-email-quic_srivasam@quicinc.com>
 <1674108674-8392-4-git-send-email-quic_srivasam@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <1674108674-8392-4-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

On 19/01/2023 07:11, Srinivasa Rao Mandadapu wrote:
> Update sc7280 machine driver bindings with #sound-dai-cells property.
> This is to fix dtbs_check errors.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Ratna Deepthi Kudaravalli <quic_rkudarv@quicinc.com>
> ---
>  Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
> index ccf1b1d..be5c60a 100644
> --- a/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
> +++ b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
> @@ -35,6 +35,9 @@ properties:
>    "#size-cells":
>      const: 0
>  
> +  "#sound-dai-cells":
> +    const: 0

That's not correct property for the sound card. Does the sound card
exposes DAIs? Who uses these?

> +
>  patternProperties:
>    "^dai-link@[0-9a-f]$":
>      description:

Best regards,
Krzysztof

