Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AB77A604E
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 12:56:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABC0DE84;
	Tue, 19 Sep 2023 12:55:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABC0DE84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695120989;
	bh=IZ8QHJlzaFVxxzy8OGWmG+Rj9SpjIEfIWOgoiQgccBU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GwgmU1755rbzsnKMjO1H5wsLn9ixGwJVupac9DqkuSdvHqvClZ0PwcsS/ARsHI0yW
	 LF3tq0b3YVMsDYaCSLOfiDe7ddDnrsHV6YqJpl04KMQHBZ2tvqzq8qoPfPidw1tfw+
	 RLbYKctV2QSkxOUZ3eRHuu+0+CAe/+05K52qB4P8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52C29F8055B; Tue, 19 Sep 2023 12:55:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25A01F800F4;
	Tue, 19 Sep 2023 12:55:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A176F80494; Tue, 19 Sep 2023 12:55:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A173AF8025A
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 12:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A173AF8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JBxY5idu
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 3F86CCE12B8;
	Tue, 19 Sep 2023 10:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B8EC433CB;
	Tue, 19 Sep 2023 10:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695120926;
	bh=IZ8QHJlzaFVxxzy8OGWmG+Rj9SpjIEfIWOgoiQgccBU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JBxY5iduN7o1cY2/4GRVtfKDsiE5Czm1sRnrsmpKbPXFLKag17D1QnWrAp9D6nwC7
	 nhJX8SRi7cThfE0ydIw9yiQk6ibqbtA14P8RTON3iLJa9cmnWhWca1M76LMnHxR3SW
	 EZRqEpT6fj/hGTOgSp5+Z7z41xovqfUIgecZ1q7ls4pIc4z0YtWGNIFdzvCKrN8z1H
	 STN8vbE3QG4ksq62bVDLghmQaIRYaQdgxScC/gNRPhRXZ/1yNCMhuC7hFmbIAZm7gc
	 GSjopSPNrG7MRCWvR53hU3/5fYFTyugoqQfF+GxUnaIaK50USE3zcGVzD5RLT/pW9d
	 Fm3TVxk16BB7w==
Received: (nullmailer pid 3135077 invoked by uid 1000);
	Tue, 19 Sep 2023 10:55:23 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
Cc: alsa-devel@alsa-project.org, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 devicetree@vger.kernel.org
In-Reply-To: <20230919090739.2448-1-bragathemanick0908@gmail.com>
References: <20230919090739.2448-1-bragathemanick0908@gmail.com>
Message-Id: <169512092376.3135048.3729589976906559665.robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: tfa9879: Convert to dtschema
Date: Tue, 19 Sep 2023 05:55:23 -0500
Message-ID-Hash: UHHVSTN4A7Y3KY35Y7263J5CATDMEGAW
X-Message-ID-Hash: UHHVSTN4A7Y3KY35Y7263J5CATDMEGAW
X-MailFrom: SRS0=1Vuh=FD=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UHHVSTN4A7Y3KY35Y7263J5CATDMEGAW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 19 Sep 2023 14:37:39 +0530, Bragatheswaran Manickavel wrote:
> Convert the tfa9879 audio CODEC bindings to DT schema
> 
> Signed-off-by: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
> ---
>  .../bindings/sound/nxp,tfa9879.yaml           | 45 +++++++++++++++++++
>  .../devicetree/bindings/sound/tfa9879.txt     | 23 ----------
>  2 files changed, 45 insertions(+), 23 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/nxp,tfa9879.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/tfa9879.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/sound/nxp,tfa9879.example.dts:22.27-40 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/sound/nxp,tfa9879.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1427: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):
MAINTAINERS: Documentation/devicetree/bindings/sound/tfa9879.txt

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230919090739.2448-1-bragathemanick0908@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

