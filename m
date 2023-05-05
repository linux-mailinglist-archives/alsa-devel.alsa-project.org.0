Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C07656F8107
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 12:49:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A3ED2C67;
	Fri,  5 May 2023 12:49:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A3ED2C67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683283792;
	bh=LYU3eMcbAH2g5h+qJiLHEi5BDiIgXDe+6i6ZvZ1UUO8=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U1oCkCKONWE9YzMMXzuJ/NKqEqqiFbd3JMU4zQMfU0laKMW+P7yQ9MfAt91Z0YITa
	 CJoong4uIg4sVJ+aousIw6wO/Ei2zncsuKyCvFLMggiV2CF2BvlVaq5jGcTU8wpHUK
	 liLL2LSe2VTjIl3K9QxATq0acEmsv6vXA1ZobQb8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BCCACF80529;
	Fri,  5 May 2023 12:49:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA713F8052D; Fri,  5 May 2023 12:48:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94D46F80520
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 12:48:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94D46F80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kfT7NabL
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 14BDB60C94;
	Fri,  5 May 2023 10:48:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D30EC433EF;
	Fri,  5 May 2023 10:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683283730;
	bh=LYU3eMcbAH2g5h+qJiLHEi5BDiIgXDe+6i6ZvZ1UUO8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kfT7NabLog3ITolk00hU6G1embvhIs6zENaidhGCHa3p7pBn+fMuP7cgT1EbUrt2w
	 q3jDKxg9AUSRMV8u5ejn43AnF1c50BBHrB1J/sIuwll8nu3Y4gQZpyUnA9F7JTkutL
	 1IBTBsCipJYic56bXjoQiUi2fhhqHhBUeS1HX+eQEY2uZ7/UAToIDUM6gOdSosu3Dn
	 i+8/U2jH2m8I+isy3J5Lw0aofdpoQA60PCQ5tG7c4opwl5kIpkHrHf36i2FAu58Cdp
	 TYKnqhLfQ6xSVGPYMdsi9lJNy9iM+gHlwMig+zJkApmgByMAHX/+a++vMywlDC5ZoR
	 +Qr7d6QQnnLGQ==
Message-ID: <951ee8b3-9764-c7aa-019b-6a181149d6f3@kernel.org>
Date: Fri, 5 May 2023 12:48:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 2/2] ASoC: dt-bindings: designware-i2s: add optional
 resets
Content-Language: en-US
To: Maxim Kochetkov <fido_max@inbox.ru>, alsa-devel@alsa-project.org
References: <20230504071618.52012-1-fido_max@inbox.ru>
 <20230504071618.52012-2-fido_max@inbox.ru>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230504071618.52012-2-fido_max@inbox.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VLWF6QFLNNK5GH3HHGVOUBNHFV3RBOB3
X-Message-ID-Hash: VLWF6QFLNNK5GH3HHGVOUBNHFV3RBOB3
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 p.zabel@pengutronix.de, ckeepax@opensource.cirrus.com,
 u.kleine-koenig@pengutronix.de, nicolas.ferre@microchip.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VLWF6QFLNNK5GH3HHGVOUBNHFV3RBOB3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 04/05/2023 09:16, Maxim Kochetkov wrote:
> Some SoC may have resets for I2S subsystem. So add optional resets support.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

You missed at least DT list (maybe more), so this won't be tested.
Please resend and include all necessary entries.

> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  .../devicetree/bindings/sound/snps,designware-i2s.yaml         | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml b/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
> index 56e623d4e168..a970fd264b21 100644
> --- a/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
> +++ b/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
> @@ -36,7 +36,8 @@ properties:
>      const: i2sclk
>  
>    resets:
> -    maxItems: 1
> +    items:
> +      - description: Optional controller resets


This does not make much sense. Your change does nothing. NAK.

Best regards,
Krzysztof

