Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B75BD7143B4
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 07:23:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 010BF208;
	Mon, 29 May 2023 07:23:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 010BF208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685337837;
	bh=OxGM0AKBIx1XvIlUi5jL9Y/t0Cuh7kuMddjsyZ2j52M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AFZBZhqJnczPsPhI+Ke3GcY1Y8dorLOz2ehQl+PCtpgJi67fTfjCMnEGA7evShz4p
	 kbYVEVmKWQGHtMoQfJO3cicD2nxDl6TpvtQf00xKmkRYHQIWTCrGPsjrosSYup/Sm5
	 naCo+zgPM39lHRwxGT+lrRMyNRTI0AvcWBKQvxHA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22BFEF80548; Mon, 29 May 2023 07:22:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1576F8026A;
	Mon, 29 May 2023 07:22:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AE93F8042F; Mon, 29 May 2023 07:14:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73FB0F80086
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 07:14:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73FB0F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Y8io3SHg
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2526E62192;
	Mon, 29 May 2023 05:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA324C433EF;
	Mon, 29 May 2023 05:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685337238;
	bh=OxGM0AKBIx1XvIlUi5jL9Y/t0Cuh7kuMddjsyZ2j52M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y8io3SHganogAgrD8ffbKmawDWKacV9I4vjf0B2uUTRup5dH5a7GA2OmxpTI0K2Ez
	 +avXfFu6Q+2bdI26UlqWnM3JBo9LCTyJ2tbSIIqC/RH+95QUQK2IC7Fysk9xaVJgLD
	 eVDTFYssWJskm7XgA1NCGlLMxYew5FvpYd+SNM7JROjFnZcPLzSaGP/46X8r0IhVSz
	 a+6ocY8eWpvb9MsGZW8ZvnxMm9FYbzMs5XCyq7yRHaZmEnFlPMRXk92vutHYPWVzae
	 jBAsca0UBWe37K8T2b9/u1brcqyxYrT0oETt2CuNd9Jwjb1DiITnNXY6XYjySXtE88
	 zhEPlDMnP+Aew==
Date: Mon, 29 May 2023 10:43:54 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: andersson@kernel.org, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, sanyog.r.kale@intel.com,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] soundwire: qcom: stablity fixes
Message-ID: <ZHQ0kosUz15P8jo+@matsya>
References: <20230525133812.30841-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230525133812.30841-1-srinivas.kandagatla@linaro.org>
Message-ID-Hash: EFL7IPHTUFN24XPA4632SXFMEE2CIYNT
X-Message-ID-Hash: EFL7IPHTUFN24XPA4632SXFMEE2CIYNT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EFL7IPHTUFN24XPA4632SXFMEE2CIYNT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 25-05-23, 14:38, Srinivas Kandagatla wrote:
> During x13s audio testing we hit few corner cases due to issues
> in codec drivers and some obvious code bugs.
> 
> Here are the fixes for those issues, mostly the issues are around
> devices loosing the sync in between runtime pm suspend resume path.

Applied, thanks

-- 
~Vinod
