Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E765E71341F
	for <lists+alsa-devel@lfdr.de>; Sat, 27 May 2023 12:42:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D41E1FE;
	Sat, 27 May 2023 12:41:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D41E1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685184143;
	bh=8Isxwih0uAr3zq1l6ccw91UiAglHni0Ws5Oq5epCgug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dpMbV14qhLdkATsi/tF0xAkyh0B2cTfQ8r9pg13zZB+9Ixh0ARu7K1+QOqJnBgLEc
	 WmLPBpw2/LFLmVqS6jWwKxX4o+byuEsu4DWnIa8iWZIkfm9nl/YFIxNML01MmYegyu
	 4xydsxPCHpDfcyUQWJ1WHjfQ51kr8HQNENLBkS6Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1AFFCF8056F; Sat, 27 May 2023 12:40:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD5C1F80563;
	Sat, 27 May 2023 12:40:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92B3AF80564; Sat, 27 May 2023 12:40:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 20B43F800DF
	for <alsa-devel@alsa-project.org>; Sat, 27 May 2023 12:40:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20B43F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=P63HBa+p
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CA3336118D;
	Sat, 27 May 2023 10:40:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE54C433EF;
	Sat, 27 May 2023 10:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685184007;
	bh=8Isxwih0uAr3zq1l6ccw91UiAglHni0Ws5Oq5epCgug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P63HBa+pLzOSxeK2Gt8+V/G29qLAkj0FIWwT177wpeWTv2OkzRyq32e76VRWeslf7
	 LxMq6VtYf5JWwZzcUWcLr0hL77u/wVniZPbPIzh8qMo/GWBvRWWPqWcXRHVcMgib+G
	 FdpWXzXw5uTUTbMTgVZXyAX70wF31rqXNZyxyoFq9aTxR8/PJ7Mf+kb1GxTLcCCWlm
	 /DTFbLtGTRNV2TIOzh+MPk1bpb6fndhXhBPsRHIpjiZBUCO9i8lk35F1hAueFDmzfi
	 kMA/NMtPksWOifI65yHktvH0phKq3UPmmM/GDy7jmLIm7MXvcSLiIphUad1ipofu2G
	 eDUPMnTeGTOPg==
Date: Sat, 27 May 2023 16:10:03 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] soundwire: qcom: drop unused struct
 qcom_swrm_ctrl members
Message-ID: <ZHHeA7TU3YQS5Bib@matsya>
References: <20230515132000.399745-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230515132000.399745-1-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: JA7UADYDISXQ2PUQQDNLLCA6N2RGIHKP
X-Message-ID-Hash: JA7UADYDISXQ2PUQQDNLLCA6N2RGIHKP
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JA7UADYDISXQ2PUQQDNLLCA6N2RGIHKP/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 15-05-23, 15:20, Krzysztof Kozlowski wrote:
> Drop unused members from the driver state container: struct qcom_swrm_ctrl.

Applied, thanks

-- 
~Vinod
