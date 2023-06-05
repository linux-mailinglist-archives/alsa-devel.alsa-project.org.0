Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCF4722924
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 16:46:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DED1D820;
	Mon,  5 Jun 2023 16:45:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DED1D820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685976409;
	bh=W29DiFd00K8hukRzh7m2tWsdPBE9ZZWXYOwuKdLzUOM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=keRo+4rgr8T0MQyypns3jGEwMq3TUY3Ni+/7KFRNZTtC402F1H5tfHgIOVALoe8uu
	 e+N0qZi5kCroU/RsE1h9pYGUZp6DHL4m5DW8xSPAADqmyS61FNrEDkA2Skqj6+N/vx
	 UdEQcMV8fjUshBokDv/xWZ1n83LHLXM1Y0706EkY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53741F80544; Mon,  5 Jun 2023 16:45:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6A82F8016C;
	Mon,  5 Jun 2023 16:45:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BEC5F80199; Mon,  5 Jun 2023 16:45:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6BFBFF80155
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 16:45:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BFBFF80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JaVIG1v4
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6B23262605;
	Mon,  5 Jun 2023 14:45:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5148C433D2;
	Mon,  5 Jun 2023 14:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685976345;
	bh=W29DiFd00K8hukRzh7m2tWsdPBE9ZZWXYOwuKdLzUOM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JaVIG1v4rnNauxEFhjHpUvkm8iUPJoZmdzYPWadpgRZzAlfu2SzMTdt3iLmsLsbcF
	 WnNI3LYmykUmviomBVf1KPJr9dTMls3dyAo3YB/pjePzaIcP9nVTIAl7Kp7T7HSo0K
	 aTsOL0veP2X/YvXjgT73JhicFhMHtmV2pgrn/bsj9iyLpqWY69bSOgIk+SWi8/byKd
	 Md0hhTIzirzyu7/tXH25UWzZwhOUz82jfuGY5rvpIz+Vzp5/xwb9bRvMayDlVo9EP6
	 0lpvzFPNJi3rjzzeIJTZkIVBAOV4qHtX3Xu9R/QnwZgbG2glDuBa02l/pf/G9gp05M
	 /rhDQdltDH3Tw==
Message-ID: <118d13ef-a247-cf88-5084-afdebc6b7651@kernel.org>
Date: Mon, 5 Jun 2023 16:45:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 3/3] ASoC: dt-bindings: Add support for Loongson audio
 card
To: YingKun Meng <mengyingkun@loongson.cn>, lgirdwood@gmail.com,
 broonie@kernel.org
Cc: alsa-devel@alsa-project.org, loongarch@lists.linux.dev,
 loongson-kernel@lists.loongnix.cn
References: <20230605120934.2306548-1-mengyingkun@loongson.cn>
 <20230605120934.2306548-3-mengyingkun@loongson.cn>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230605120934.2306548-3-mengyingkun@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PKGMICDNUMHIAW34GKLODHGQTT7YR6ZI
X-Message-ID-Hash: PKGMICDNUMHIAW34GKLODHGQTT7YR6ZI
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PKGMICDNUMHIAW34GKLODHGQTT7YR6ZI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 05/06/2023 14:09, YingKun Meng wrote:
> From: Yingkun Meng <mengyingkun@loongson.cn>
> 
> The audio card uses loongson I2S controller present in 7axxx/2kxxx chips
> to transfer audio data.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

You missed at least DT list (maybe more), so this won't be tested.
Please resend and include all necessary entries.

> 
> Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
> ---
>  .../sound/loongson,ls-audio-card.yaml         | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
> new file mode 100644
> index 000000000000..f1d6ee346bb3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/loongson-audio-card.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson generic ASoC audio sound card.

What is a "generic audio card"? Does it even match hardware? Bindings
are supposed to describe hardware, which is usually very specific.

Also: Drop full stop. It's a title.


> +
> +maintainers:
> +  - Yingkun Meng <mengyingkun@loongson.cn>
> +
> +description:
> +  Generic ASoC audio device for loongson platform.
> +
> +properties:
> +  compatible:
> +    const: loongson,ls-audio-card
> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: User specified audio sound card name
> +
> +  mclk-fs:
> +    $ref: simple-card.yaml#/definitions/mclk-fs
> +
> +  cpu:
> +    description: Holds subnode which indicates cpu dai.
> +    type: object
> +    additionalProperties: false
> +    properties:
> +      sound-dai:
> +        maxItems: 1

In the cpu: required with sound-dai

> +
> +  codec:
> +    description: Holds subnode which indicates codec dai.
> +    type: object
> +    additionalProperties: false
> +    properties:
> +      sound-dai:
> +        maxItems: 1

In the codec: required with sound-dai

No multiple dai links? Are you sure this card is so limited?


Best regards,
Krzysztof

