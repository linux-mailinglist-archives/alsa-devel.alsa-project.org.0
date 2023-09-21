Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 405BF7A932F
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 11:40:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C33DAEA;
	Thu, 21 Sep 2023 11:39:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C33DAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695289200;
	bh=C4un4gYxCr/CUvb+/OQ1fTPtd4znlJYmidwWhyiPGtU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZgxUXyELfTGVrd2U9ZVOFpXs+X59GC/VfMV/W4ZT1gCeA9BTw/eksYm62TCphbCB7
	 GE5DfoaQ60QHSoU6MDskqvpMFvG1iIBtnxhA7atMEEn74YgFyqQftHxomzp40gBdQK
	 J2aKApYmwCdaSTMvxl+xjg+MUk5tFrJjZv1Rgnu4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53876F80568; Thu, 21 Sep 2023 11:38:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9D29F8055B;
	Thu, 21 Sep 2023 11:38:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 383BFF8025A; Thu, 21 Sep 2023 11:38:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A41F9F800AA
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 11:38:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A41F9F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=d0HpfYzo
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 61C71CE1D4C;
	Thu, 21 Sep 2023 09:38:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26713C32784;
	Thu, 21 Sep 2023 09:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695289087;
	bh=C4un4gYxCr/CUvb+/OQ1fTPtd4znlJYmidwWhyiPGtU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=d0HpfYzobyg8jx7fPPVL5WntNltqZx9usHaRcy9vjWuXQGA/nvs9gFdsiBwYJD91m
	 0kr/oaqLLDtvrwDqEeE0CUCCjaLRp2s53UbI2pkT0vF77i1RqpZMUMh28EWlkUZLWk
	 sUGmAnhIxapCI9JT1zJK7W5snh2t0jOKajrHK1g/UL71wdMWy/NgAVyHjxp7e3BJNC
	 3/X+PbMykegQr0QQhurtrXO3Wc7AdeSDDmfxikFC4pQcVWN12lfceRi75O8gqjBkeX
	 h9pXlDTofyeq0S8DWpT/mL73Iw1LT3v5NPBtNyImpod9dbH6BhE7/v3c8+sJN1p5CU
	 2drPD/S3ahN7w==
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230721164901.2155287-1-quic_bjorande@quicinc.com>
References: <20230721164901.2155287-1-quic_bjorande@quicinc.com>
Subject: Re: [PATCH] soundwire: qcom: Log clk_get("iface") failures
Message-Id: <169528908579.97319.3591383647900607937.b4-ty@kernel.org>
Date: Thu, 21 Sep 2023 11:38:05 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Message-ID-Hash: M2UW4YYAMTO2J32LZWKKAZLWNEEJML6X
X-Message-ID-Hash: M2UW4YYAMTO2J32LZWKKAZLWNEEJML6X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M2UW4YYAMTO2J32LZWKKAZLWNEEJML6X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 21 Jul 2023 09:49:01 -0700, Bjorn Andersson wrote:
> Failing to acquire the iface clock makes probing of the Qualcomm
> SoundWire driver fail without providing any indication to the user. Make
> the driver log the error to aid debugging system configuration issues.
> 
> 

Applied, thanks!

[1/1] soundwire: qcom: Log clk_get("iface") failures
      commit: 95b0f3aa71eb09d067d89395fdb7f2dd87feae18

Best regards,
-- 
~Vinod


