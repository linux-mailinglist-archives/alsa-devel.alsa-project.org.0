Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC17D822177
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 19:55:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91C1FF73;
	Tue,  2 Jan 2024 19:55:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91C1FF73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704221741;
	bh=wVhTpALcMiNCntelNMpcmyS353uCxC0tr69XZxUeP7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FLMeo52+NILWGZyRIL65jnit0rzP6LAGhuoQduhCMjx9JjQMGzLNwZjzTeo6zMbkb
	 gMfYhJ0avfYEN9iXopxGEucTYNFyrtMusG7I6o2wSobCsJfkzUSwvi4GXWjXv7LnM0
	 iNC7MsIFUJxN2ZQcsunihulQstcPoupfO/tdOi7E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF35FF80C0F; Tue,  2 Jan 2024 19:51:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8AF3F80862;
	Tue,  2 Jan 2024 19:51:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79345F80153; Thu, 21 Dec 2023 22:51:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89AB7F800BD
	for <alsa-devel@alsa-project.org>; Thu, 21 Dec 2023 22:51:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89AB7F800BD
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=grvlhMPd
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0D95ACE210F;
	Thu, 21 Dec 2023 21:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E29B9C433C9;
	Thu, 21 Dec 2023 21:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703195502;
	bh=wVhTpALcMiNCntelNMpcmyS353uCxC0tr69XZxUeP7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=grvlhMPdSPsEsMrM435z6Ee777r4kKrlEfU5VJO4IHAn4V7pnANe2YaPn9yqlGBHg
	 U7IjIExcXlK1D9VjptD8QyQ+42pMJbqVtaZr9Lh6/W9NcKiHa/4Pi1lg/vqCN4EdnL
	 6kO0lUSi+dNbPKTQgm7u7+8N5icMjEm+Xx0mdV8DwQ4PENu1D0ga/Kb1YDb+J4XM0f
	 ANsuXOYE3cY800vWiRTMZq07yWnLPeaBKYK201IO8zMr9PmgVqaDHP5agM0fLCgIzx
	 SLr/TsqKDLJRLArQCYcVOAdjwxzBrLiXnruS1js2v2YjfWlxH3LNi3VupaDmJHLxBr
	 igbLYfklcAyjA==
Received: (nullmailer pid 153686 invoked by uid 1000);
	Thu, 21 Dec 2023 21:51:38 -0000
Date: Thu, 21 Dec 2023 15:51:38 -0600
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: pabeni@redhat.com, netdev@vger.kernel.org, lars@metafoo.de,
	linux-media@vger.kernel.org, hugues.fruchet@foss.st.com,
	olivier.moysan@foss.st.com, lee@kernel.org,
	alexandre.torgue@foss.st.com, catalin.marinas@arm.com,
	peng.fan@oss.nxp.com, linux-mmc@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-serial@vger.kernel.org,
	robh+dt@kernel.org, wg@grandegger.com, arnaud.pouliquen@foss.st.com,
	alsa-devel@alsa-project.org, linux-iio@vger.kernel.org,
	vkoul@kernel.org, conor+dt@kernel.org, mkl@pengutronix.de,
	Frank Rowand <frowand.list@gmail.com>, linux-crypto@vger.kernel.org,
	edumazet@google.com, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, arnd@kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, davem@davemloft.net,
	krzysztof.kozlowski+dt@linaro.org, ulf.hansson@linaro.org,
	will@kernel.org, rcsekar@samsung.com,
	linux-arm-kernel@lists.infradea, d.org@alsa-project.org,
	kuba@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	jic23@kernel.org, devicetree@vger.kernel.org,
	richardcochran@gmail.com, Oleksii_Moisieiev@epam.com,
	andi.shyti@kernel.org, herbert@gondor.apana.org.au,
	fabrice.gasnier@foss.st.com
Subject: Re: [PATCH v8 01/13] dt-bindings: document generic access controllers
Message-ID: <170319549389.153568.1692332156021513651.robh@kernel.org>
References: <20231212152356.345703-1-gatien.chevallier@foss.st.com>
 <20231212152356.345703-2-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212152356.345703-2-gatien.chevallier@foss.st.com>
X-MailFrom: robh@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: FC64QRXJ6JS3CQQ76BHSYQCHPAOXKAYY
X-Message-ID-Hash: FC64QRXJ6JS3CQQ76BHSYQCHPAOXKAYY
X-Mailman-Approved-At: Mon, 01 Jan 2024 13:18:25 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FC64QRXJ6JS3CQQ76BHSYQCHPAOXKAYY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 12 Dec 2023 16:23:44 +0100, Gatien Chevallier wrote:
> From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
> 
> Introducing of the generic access controllers bindings for the
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
> ---
> 
> Changes in V6:
> 	- Renamed access-controller to access-controllers
> 	- Example updated
> 	- Removal of access-control-provider property
> 
> Changes in V5:
> 	- Diffs with [1]
> 	- Discarded the [IGNORE] tag as the patch is now part of the
> 	  patchset
> 
>  .../access-controllers.yaml                   | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/access-controllers/access-controllers.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

