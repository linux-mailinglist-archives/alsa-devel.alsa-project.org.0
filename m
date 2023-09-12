Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 588CB79D626
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 18:22:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33E2A93A;
	Tue, 12 Sep 2023 18:21:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33E2A93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694535752;
	bh=4hOm+2OJehvueAvzDQRvNaUQyTECGiJcEkEuYx0W5Yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iw/SNg31nTCrdh14PcfOJxNwGm4CHs24R4q15PrAomVIofXd3d5t9quTOB7GJlkCM
	 E67alnsCQB4B4LLZy3va5PqEntYZ3JqOz2PSHOczGIJp8Y3dZQ3tm530a/qSv6Wa50
	 qiWw2wElnwbwIPOEFYnnhgIXrXMjSpVKUfFZ86PM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86479F8047D; Tue, 12 Sep 2023 18:21:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E8FAF80246;
	Tue, 12 Sep 2023 18:21:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEDEBF80425; Tue, 12 Sep 2023 18:21:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD2ABF80212
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 18:21:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD2ABF80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jQkFWGdp
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 315F061538;
	Tue, 12 Sep 2023 16:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CC4AC433C8;
	Tue, 12 Sep 2023 16:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694535685;
	bh=4hOm+2OJehvueAvzDQRvNaUQyTECGiJcEkEuYx0W5Yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jQkFWGdpQipDRXUX/TXqCdZCefG/lNErl9W+iLkCzCkCQatTcSH5PH/xEEtwyYk4m
	 0t5P4ERwzAczSVRzz5T04qokwZCI2pFmBZmPY5gOSUTQ+CQrfp1KnzAEWowaW8XVk8
	 t13ClcE3LCMA0qSWwD9DqI1gcS4+FdOUGLUvnDVpvG4P8SHkUosEFbH7gstyV5bY/2
	 5dHPsfG1sbLW312Xcy4aAepu3fVjMaxELKvsa4EWGTgdMaQr2dkNt1EU+rMYpDkfVB
	 RPFh6TIbIJCpWa0etojhH0vL941RKx1+UAKX8O3iK+1cvt35pRHtUVxPSpAXa1YHya
	 hVQqCHjtT0zaw==
Received: (nullmailer pid 885111 invoked by uid 1000);
	Tue, 12 Sep 2023 16:21:22 -0000
Date: Tue, 12 Sep 2023 11:21:22 -0500
From: Rob Herring <robh@kernel.org>
To: wangweidong.a@awinic.com
Cc: lgirdwood@gmail.com, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, perex@perex.cz,
 tiwai@suse.com, rf@opensource.cirrus.com, shumingf@realtek.com,
 ckeepax@opensource.cirrus.com, herve.codina@bootlin.com, 13916275206@139.com,
 ryans.lee@analog.com, linus.walleij@linaro.org,
 sebastian.reichel@collabora.com, fido_max@inbox.ru, povik+lin@cutebit.org,
 arnd@arndb.de, harshit.m.mogalapalli@oracle.com, liweilei@awinic.com,
 yijiangtao@awinic.com, colin.i.king@gmail.com, trix@redhat.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/5] ASoC: dt-bindings: Adds properties to
 "awinic,aw88395"
Message-ID: <20230912162122.GA880119-robh@kernel.org>
References: <20230912065852.347000-1-wangweidong.a@awinic.com>
 <20230912065852.347000-2-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912065852.347000-2-wangweidong.a@awinic.com>
Message-ID-Hash: JN4LWGNTKDFDAP765XUAYQV23P5YBPXH
X-Message-ID-Hash: JN4LWGNTKDFDAP765XUAYQV23P5YBPXH
X-MailFrom: SRS0=xM+6=E4=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JN4LWGNTKDFDAP765XUAYQV23P5YBPXH/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Sep 12, 2023 at 02:58:48PM +0800, wangweidong.a@awinic.com wrote:
> From: Weidong Wang <wangweidong.a@awinic.com>

The subject is still pretty generic. Ideally, we'd never have the same 
subject twice. I'd do something like this:

ASoC: dt-bindings: awinic,aw88395: Add properties for multiple PA support

> 
> Adds properties to "awinic,aw88395" to make files more complete

Complete in what way? multiple PAs, right. It's not really clear 
to me though how these properties enable support for multiple PAs.

> 
> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
> ---
>  .../bindings/sound/awinic,aw88395.yaml        | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
> index 4051c2538caf..4965aa4a5370 100644
> --- a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
> +++ b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
> @@ -32,11 +32,28 @@ properties:
>    reset-gpios:
>      maxItems: 1
>  
> +  awinic,audio-channel:
> +    description:
> +      It is used to distinguish multiple PA devices, so that different
> +      configurations can be loaded to different PA devices
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 7
> +
> +  awinic,sync-flag:
> +    description:
> +      Flag bit used to keep the phase synchronized in the case of multiple PA
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 1
> +
>  required:
>    - compatible
>    - reg
>    - '#sound-dai-cells'
>    - reset-gpios
> +  - awinic,audio-channel
> +  - awinic,sync-flag
>  
>  unevaluatedProperties: false
>  
> @@ -51,5 +68,7 @@ examples:
>              reg = <0x34>;
>              #sound-dai-cells = <0>;
>              reset-gpios = <&gpio 10 GPIO_ACTIVE_LOW>;
> +            awinic,audio-channel = <0>;
> +            awinic,sync-flag = <0>;
>          };
>      };
> -- 
> 2.41.0
> 
