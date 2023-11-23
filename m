Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 504047F591F
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Nov 2023 08:23:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7C34A4D;
	Thu, 23 Nov 2023 08:23:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7C34A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700724216;
	bh=OP0/bY80RUPFBGCPYyA8H/XM+iSF8+mpGICoK9yfeTw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=M/cvQfvof3PexK77eNv9VqUcu5btTiVnatWYNgZoAEegYezjlcr2oiFCkumohLOLZ
	 NjAYI0YXlGrSUCf58wJn1wRimeGiGzv8mXppPnBw8uNFg56RNlNhsAVFmEgPFzGUU7
	 6/wk30b+ktO/TDsLWPdqvTS/z9bisXo3fGy1ic3E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13BCBF80564; Thu, 23 Nov 2023 08:23:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29047F80579;
	Thu, 23 Nov 2023 08:23:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3860F80310; Thu, 23 Nov 2023 08:21:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF637F80093
	for <alsa-devel@alsa-project.org>; Thu, 23 Nov 2023 08:21:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF637F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=a2QxUt5h
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1290460F30;
	Thu, 23 Nov 2023 07:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6922C433C7;
	Thu, 23 Nov 2023 07:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700724079;
	bh=OP0/bY80RUPFBGCPYyA8H/XM+iSF8+mpGICoK9yfeTw=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=a2QxUt5hPAYdSv3pkgDlCmYd9J5S4ZvTSjKklcxb5FgAe7kl18KTTEF4Ph1gci4ln
	 HpTNFH/hIzzIhKo9r+ZGXOK8+u4TV11OtiJ9uly8uIAlsc0/vUpjeUt5hWGYESEQEr
	 AMbdENmDoT6CrFeJf1Wa/Kj6JiUPH6WisQ1d6ubpCAVcexlPZzarCoWDfHv+T/uGpJ
	 Pzv7njLLnnQkl096K9LDtGD6dEAG+2BKUHGifkYM48tZ9w9byE++8r22bf3fdAhYT9
	 etbuG78QaUrCmBzPP/VT+fgZbJl++nnG4FT8xwzwyYQheWscFCdhBJ4z7k069pIASO
	 ZIIRlikA3suwQ==
From: Vinod Koul <vkoul@kernel.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231120190740.339350-1-krzysztof.kozlowski@linaro.org>
References: <20231120190740.339350-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] soundwire: qcom: drop unneeded
 qcom_swrm_stream_alloc_ports() cleanup
Message-Id: <170072407531.674978.2652900488518504446.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 12:51:15 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Message-ID-Hash: PYQA52PWIAGALOYCLLARPFDJEGIFWAQL
X-Message-ID-Hash: PYQA52PWIAGALOYCLLARPFDJEGIFWAQL
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PYQA52PWIAGALOYCLLARPFDJEGIFWAQL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 20 Nov 2023 20:07:39 +0100, Krzysztof Kozlowski wrote:
> The cleanup in "err" goto label clears bits from pconfig array which is
> a local variable.  This does not have any effect outside of this
> function, so drop this useless code.
> 
> 

Applied, thanks!

[1/2] soundwire: qcom: drop unneeded qcom_swrm_stream_alloc_ports() cleanup
      commit: 5c68b66d4d7eff8cdb6f508f8537faa30c5faa6d
[2/2] soundwire: qcom: move sconfig in qcom_swrm_stream_alloc_ports() out of critical section
      commit: 5bdc61ef45007908df9d8587111c7a5a552bdd46

Best regards,
-- 
~Vinod


