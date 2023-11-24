Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2747F6C8A
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Nov 2023 08:08:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09BD1A4B;
	Fri, 24 Nov 2023 08:08:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09BD1A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700809715;
	bh=U6byld8anRrkI6XoiBszDu/qVMqfQAx6ni8me6xAFng=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dr/ERWQGyZlD7a86mpFGRevIbtnWDSzB6oUuBP1X3MXKw4QiizCP7tm/Doa7uLgwc
	 NeTJ1HxkCLAYdwW6bJHDrxULndcGMZLVDnQJ0tyf6cbaNWM10d1uPJkqNIutWyIaUE
	 WIlEgwZJznMQfSz0/PsxuXi/CC3MggPUI4m5/D9k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D86FF805AD; Fri, 24 Nov 2023 08:08:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 180B1F80578;
	Fri, 24 Nov 2023 08:08:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CC35F80310; Fri, 24 Nov 2023 07:58:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 042EBF80166
	for <alsa-devel@alsa-project.org>; Fri, 24 Nov 2023 07:58:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 042EBF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BXLqPYz8
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id EE221B80FAB;
	Fri, 24 Nov 2023 06:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF380C433C7;
	Fri, 24 Nov 2023 06:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700809126;
	bh=U6byld8anRrkI6XoiBszDu/qVMqfQAx6ni8me6xAFng=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BXLqPYz8orin3Xjy69BbAjdMvVGl0eHcTTWog1tOzuJSnBjOFiNwHNKSCtaKIZaHq
	 ZhKZ/dikU7t6ItWru8SrwYzUYfcy+lOx1ztMZ81nTgzhcwbow/T8WKDlmSUqFrXH4k
	 jIlv/zq8/j1Jj06A0Rh/drdABJ3147wmu97IpQoViI6ux3Lrt6P8l7IOm3+mK9MP1L
	 8VC+1oQ1nO2stf+eqXL92YBGHgqGz+dtz4pYmoj7Ohug2QznaSOHN1U3UvHbumZMTy
	 eD/vsmpjpjCRAa3clFAbZYtu+LCdZXMJxUgEsrvbCrm26UG4Nxtupg1hJuxb15MLxf
	 y7XG9nufdkr6w==
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org, srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.de,
 yung-chuan.liao@linux.intel.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, krzysztof.kozlowski@linaro.org
In-Reply-To: <20231123105332.102167-1-srinivas.kandagatla@linaro.org>
References: <20231123105332.102167-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] soundwire: qcom: set controller id to hw master id
Message-Id: <170080912346.720753.8349008868499476969.b4-ty@kernel.org>
Date: Fri, 24 Nov 2023 12:28:43 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Message-ID-Hash: ER2KTYFBP7RT3MI5V6ZSOI6VARY3RE6L
X-Message-ID-Hash: ER2KTYFBP7RT3MI5V6ZSOI6VARY3RE6L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ER2KTYFBP7RT3MI5V6ZSOI6VARY3RE6L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Thu, 23 Nov 2023 10:53:32 +0000, srinivas.kandagatla@linaro.org wrote:
> Qualcomm Soundwire Controllers IP version after 1.3 have a dedicated
> master id register which will provide a unique id value for each
> controller instance. Use this value instead of artificially generated
> value from idr. Versions 1.3 and below only have one instance of
> soundwire controller which does no have this register, so let them use
> value from idr.
> 
> [...]

Applied, thanks!

[1/1] soundwire: qcom: set controller id to hw master id
      commit: a7ae05ef356162c2a7ff108a7ff154d7d0dcd6aa

Best regards,
-- 
~Vinod


