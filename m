Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AA47B9B7A
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 09:47:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF21EAE8;
	Thu,  5 Oct 2023 09:46:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF21EAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696492060;
	bh=n8c5VPqof5cSz/xeEzUcmLspOpPdFu7ZTPAoFiNDi+g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DieXa62/uBHOxzMSlhnwsREqqDKaRAyWzvGO1Onv3h6hYHYlVzXzUJRBgRLMXrzhW
	 dIGATBg5t32zKubUYHeAtlhkE1nT7ZjPmNMMtzaj+HXp3CLrLs2OaLOvMbDeFGSDE6
	 pfy83j1ELqdP7C7nXKgfHWeQsxcjOKOrYiE0PDeY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 790CEF80552; Thu,  5 Oct 2023 09:46:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3BE9F80310;
	Thu,  5 Oct 2023 09:46:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B827CF801D5; Fri, 29 Sep 2023 17:35:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0734FF8007C
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 17:35:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0734FF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dLE9nEAz
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 68E34B81FF3;
	Fri, 29 Sep 2023 15:35:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4186C433C7;
	Fri, 29 Sep 2023 15:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696001729;
	bh=n8c5VPqof5cSz/xeEzUcmLspOpPdFu7ZTPAoFiNDi+g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dLE9nEAz7xekqFIavm5dEJULK3Af4aiyLsSYoYDepzYMqvw4BVd56r19mCA7b5ove
	 YEWaLF6IxaIZpcLVg07pFTX5C8bu2DWEUlQy2TM3PZMnRVQ1eHzv7tZChTjYGAUpYK
	 5rjIOl+kGt9fV0ruN3IkDiHN78H0wW6m4rxcLIxHP5bueH1MbBWdJXCW8KclvSlw/E
	 NyyDtTE8ZoMz1nJRKZNonHppUVkdK7mv+8Px297LBx1RECgAPUEcg8MHOP+sQ7uVJd
	 hyYm5Soq2Y0bJvcEGJBidVI1rjZAkeY+3gKimZgrdAkVdAKaNqrCsbYjhbO2zPKadh
	 ox3UJzGXhqyQQ==
Received: (nullmailer pid 3601354 invoked by uid 1000);
	Fri, 29 Sep 2023 15:35:24 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: arnd@kernel.org, linux-phy@lists.infradead.org,
	linux-mmc@vger.kernel.org, dmaengine@vger.kernel.org,
	robh+dt@kernel.org, jic23@kernel.org, davem@davemloft.net,
	kuba@kernel.org, pabeni@redhat.com, linux-spi@vger.kernel.org,
	linux-i2c@vger.kernel.org, olivier.moysan@foss.st.com,
	linux-media@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, edumazet@google.com,
	linux-stm32@st-md-mailman.stormreply.com, ulf.hansson@linaro.org,
	richardcochran@gmail.com, will@kernel.org,
	linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, arnaud.pouliquen@foss.st.com,
	linux-serial@vger.kernel.org, alexandre.torgue@foss.st.com,
	Frank Rowand <frowand.list@gmail.com>, andi.shyti@kernel.org,
	linux-usb@vger.kernel.org, peng.fan@oss.nxp.com, lee@kernel.org,
	fabrice.gasnier@foss.st.com, conor+dt@kernel.org,
	Oleksii_Moisieiev@epam.com, herbert@gondor.apana.org.au,
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	al@alsa-project.org, sa-devel@alsa-project.org,
	hugues.fruchet@foss.st.com, devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org, mchehab@kernel.org, vkoul@kernel.org,
	gregkh@linuxfoundation.org
In-Reply-To: <20230929142852.578394-2-gatien.chevallier@foss.st.com>
References: <20230929142852.578394-1-gatien.chevallier@foss.st.com>
 <20230929142852.578394-2-gatien.chevallier@foss.st.com>
Message-Id: <169600172184.3601218.2121908606358610119.robh@kernel.org>
Subject: Re: [PATCH v5 01/11] dt-bindings: document generic access
 controller
Date: Fri, 29 Sep 2023 10:35:24 -0500
X-MailFrom: SRS0=CpPV=FN=robh_at_kernel.org=rob@kernel.org
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
Message-ID-Hash: CGWEAT4TLYYYV3AMKZFVM2F7UFGLO6OO
X-Message-ID-Hash: CGWEAT4TLYYYV3AMKZFVM2F7UFGLO6OO
X-Mailman-Approved-At: Thu, 05 Oct 2023 07:46:43 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CGWEAT4TLYYYV3AMKZFVM2F7UFGLO6OO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 29 Sep 2023 16:28:42 +0200, Gatien Chevallier wrote:
> From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
> 
> Introducing of the generic access controller bindings for the
> access controller provider and consumer devices. Those bindings are
> intended to allow a better handling of accesses to resources in a
> hardware architecture supporting several compartments.
> 
> This patch is based on [1]. It is integrated in this patchset as it
> provides a use-case for it.
> 
> Diffs with [1]:
> 	- Rename feature-domain* properties to access-control* to narrow
> 	  down the scope of the binding
> 	- YAML errors and typos corrected.
> 	- Example updated
> 	- Some rephrasing in the binding description
> 
> [1]: https://lore.kernel.org/lkml/0c0a82bb-18ae-d057-562b
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> 
> ---
> Changes in V5:
> 	- Diffs with [1]
> 	- Discarded the [IGNORE] tag as the patch is now part of the
> 	  patchset
> 
>  .../access-controllers/access-controller.yaml | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/access-controllers/access-controller.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/access-controllers/access-controller.yaml: access-control-provider: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230929142852.578394-2-gatien.chevallier@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

