Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC476BC5F5
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 07:05:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC4CB114B;
	Thu, 16 Mar 2023 07:04:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC4CB114B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678946741;
	bh=ww0ZocYsI+02bKy+ETdHwsgDsAG5ndYxat5xHnfTfiI=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=olH4rMI9428YRj9SPnpOe6RtIusawijVXFp58N0j8nuBtsfVRdrShBmxyV+XOzzk6
	 ZX+mzQhu+fAjNK5hTZdlKtR0K+1TY7Cdu/CrjHPyKuO84ehoOEqV/X0cQukLRvub8R
	 H4GkEQ9pNwo+yC8eIvZduTpFXLvTmUCpVDNP9aTg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B54D7F80482;
	Thu, 16 Mar 2023 07:04:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21E83F80423; Thu, 16 Mar 2023 07:03:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 792AAF80272
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 07:03:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 792AAF80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=b4VG7dnf
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EA378B81F15;
	Thu, 16 Mar 2023 06:03:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D33CC433D2;
	Thu, 16 Mar 2023 06:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678946621;
	bh=ww0ZocYsI+02bKy+ETdHwsgDsAG5ndYxat5xHnfTfiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b4VG7dnf/DqeAEPohsBa/rE5su759zx0QSzs+nvK/FkE6yTEKDy6VdaHXfJVb8ATZ
	 xsn/DNhc70ePNYS/OAHJKbwIJnHR1Co1kUHYHu/2TgNAjVT8AEGaFj2WgrdMBRsYWc
	 1ue1ia4lNt1ptuNMA+86kZw7jrB34vNFFmTy3lgc+kzu54cuMpDytmf3xG2Asf+hho
	 WCuGj/pwFoAB6kdugkw2UiWGoe5qho7yJK9eBfgjmtWrMPzUt4Q4sGQes/pp0ubxpD
	 7ujHyh9zjfX+ShBA+ZVl7xwj22vCzYDwjavZyPL4imnPREJT5O8cxMoSgwkdZ8GM9t
	 ZLDhWjltcGZ/A==
Date: Thu, 16 Mar 2023 11:33:37 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: stream: restore cumulative bus bandwidth when
 compute_params callback failed
Message-ID: <ZBKxObsivQKtGOhP@matsya>
References: <20230316013041.1008003-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316013041.1008003-1-yung-chuan.liao@linux.intel.com>
Message-ID-Hash: 5RHQPP2ER2HHYID2T4VXW726KIC6S62N
X-Message-ID-Hash: 5RHQPP2ER2HHYID2T4VXW726KIC6S62N
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5RHQPP2ER2HHYID2T4VXW726KIC6S62N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16-03-23, 09:30, Bard Liao wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> The _sdw_prepare_stream function just returns the error code when
> compute_params callback failed.
> The cumulative bus bandwidth will keep the value and won't be decreased
> by sdw_deprepare_stream function.
> We should restore the value of cumulative bus bandwidth when
> compute_params callback failed.

Applied, thanks

-- 
~Vinod
