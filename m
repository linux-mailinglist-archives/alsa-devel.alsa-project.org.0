Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C7F8D86B6
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2024 17:57:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2243E82A;
	Mon,  3 Jun 2024 17:57:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2243E82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717430236;
	bh=futJcvAhuekfJi6Omn7IDi2rhi/asO2I+BKkZvgElD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dJp2FJYEH3CM//9ybAYSqmUDXAlxtbsNqNuD6AUv+ULs/Cin+JZx2P9Nkf3HAQYqq
	 iFBM/YOsIpafJH734oEooCO9zuHVEjv3TKfJD2xp1HoWhz0/N+QHIg36NTdrmBnUjE
	 Hv7UuFw1AokBwXctYkF/aEaxTjyXPqAvNI7tyDII=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11CEBF8059F; Mon,  3 Jun 2024 17:56:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9097F804FF;
	Mon,  3 Jun 2024 17:56:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 530CAF8025A; Mon,  3 Jun 2024 17:56:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC0AEF80088
	for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2024 17:56:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC0AEF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VljIBWF+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B34D560ED4;
	Mon,  3 Jun 2024 15:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13EADC2BD10;
	Mon,  3 Jun 2024 15:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717430179;
	bh=futJcvAhuekfJi6Omn7IDi2rhi/asO2I+BKkZvgElD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VljIBWF+dF5NH50qa7/pjnUwX8u4zmTFEdKqAtElPselZAWfTQWGquNldjtc6QorB
	 xLJIRbYv5GblmgpQVMRgzkud0jMZaO/wXyoaFCxSL4YB/8kVpXIB6/BuMirHRkTtQA
	 PSwe4ewy560D80s3uy6x9rz1FK439Z+Fjv4dSs7z5/XwT6JkLHsQnvTUjlfRObv9oH
	 O6qA5r4omEBw06am6z03aXxwI/2OCfK4uyvmypWvQ9Z2lVn7LpnAMTWZYSOoQ0xuzv
	 cli7XbUcMs7hjGScsIeJYyAx4Y3ejoybgJyEDZOCWNKhtIrpVqoFDQ1fYFJUDi1fyH
	 4IYRNNw9eqabQ==
Date: Mon, 3 Jun 2024 10:56:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh+dt@kernel.org, Xiubo.Lee@gmail.com, conor+dt@kernel.org,
	broonie@kernel.org, nicoleotsuka@gmail.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org, festevam@gmail.com,
	linux-sound@vger.kernel.org, shengjiu.wang@gmail.com,
	krzysztof.kozlowski+dt@linaro.org, tiwai@suse.com,
	lgirdwood@gmail.com, perex@perex.cz, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] ASoC: dt-bindings: fsl,xcvr: Add compatible
 string for i.MX95
Message-ID: <171743017410.508888.18301786325836336214.robh@kernel.org>
References: <1716972002-2315-1-git-send-email-shengjiu.wang@nxp.com>
 <1716972002-2315-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1716972002-2315-2-git-send-email-shengjiu.wang@nxp.com>
Message-ID-Hash: JMFZJQAZDSHFHEURBWNTLK47F3BWUAIQ
X-Message-ID-Hash: JMFZJQAZDSHFHEURBWNTLK47F3BWUAIQ
X-MailFrom: robh@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JMFZJQAZDSHFHEURBWNTLK47F3BWUAIQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 29 May 2024 16:40:01 +0800, Shengjiu Wang wrote:
> Add compatible string "fsl,imx95-xcvr" for i.MX95 platform.
> 
> The difference between each platform is in below table.
> 
> +---------+--------+----------+--------+
> |  SOC	  |  PHY   | eARC/ARC | SPDIF  |
> +---------+--------+----------+--------+
> | i.MX8MP |  V1    |  Yes     |  Yes   |
> +---------+--------+----------+--------+
> | i.MX93  |  N/A   |  N/A     |  Yes   |
> +---------+--------+----------+--------+
> | i.MX95  |  V2    |  N/A     |  Yes   |
> +---------+--------+----------+--------+
> 
> On i.MX95, there are two PLL clock sources, they are the parent
> clocks of the XCVR root clock. one is for 8kHz series rates, named
> as 'pll8k', another one is for 11kHz series rates, named as 'pll11k'.
> They are optional clocks, if there are such clocks, then the driver
> can switch between them to support more accurate sample rates.
> 
> As 'pll8k' and 'pll11k' are optional, then add 'minItems: 4' for
> clocks and clock-names properties.
> 
> On i.MX95, the 'interrupts' configuration has the same constraint
> as i.MX93.
> 
> Only on i.MX8MP, the 'resets' is required, but for i.MX95 and i.MX93
> there is no such hardware setting.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,xcvr.yaml   | 32 ++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

