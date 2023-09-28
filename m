Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AB67B1B69
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 13:49:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD5C5DE5;
	Thu, 28 Sep 2023 13:48:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD5C5DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695901755;
	bh=6ffAfHbytTsNdmlLHrNIA44Bup6fwjTt6W3tUOSKgaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q/SKxbDmiJg641Vnma++q8DRQ1UwfAUgN3g7mLF7S9ixKgdrQmm6GCoUydCVF8mCF
	 2qbmVXr3vMCI6Hjpw68+L0i01I5N0BCWYUDKrSmW5L3eX2q+5bMw0nGygZ52+M2CMM
	 NAVTnmgLmI9HjyzUIiCvBObopIcNCRfPnWZs+6vg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35DF9F800AE; Thu, 28 Sep 2023 13:48:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF9B3F8016A;
	Thu, 28 Sep 2023 13:48:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E8B5F801D5; Thu, 28 Sep 2023 13:48:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3927F800AE
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 13:47:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3927F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=W0EO8zyE
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 6C91AB81BDD;
	Thu, 28 Sep 2023 11:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A614C433CA;
	Thu, 28 Sep 2023 11:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695901673;
	bh=6ffAfHbytTsNdmlLHrNIA44Bup6fwjTt6W3tUOSKgaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W0EO8zyEEW16H9lVMy+eOLO1IpcUt8T0MpdJd+U3pcuk7m0R9vkMlKY8X01X8bKHU
	 Toy5XwhNroQ8LgAL8j747cDs1DP8jGOp8IUWu8qHRXEMMUAn2jdh/TYsQyRvm5DHJm
	 q0f5Ncca2ea7Zn0agtzxM4Va7hJ8l1GmI8lx+HeaR3Z5jdtf4wD2G0QcXBYz9N5BQA
	 IIU/AyqVTcxbOIaqJun/7pi6NcBgISORIFMd/KT0g4fGnr6u3XKEx7tCvY0H9vTeI7
	 X2SftrXWQQskrkbxKHnAuc7WkD67Ku3d9+ERhO7GUIo1cJbKsTxxHSGf5crM+va5dx
	 IoiI6ub7al7yA==
Date: Thu, 28 Sep 2023 07:47:52 -0400
From: Sasha Levin <sashal@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 6.4, 6.5] ASoC: cs35l56: Disable low-power hibernation
 mode
Message-ID: <ZRVn6B6kFnuyjAcM@sashalap>
References: <20230925151443.28956-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230925151443.28956-1-rf@opensource.cirrus.com>
Message-ID-Hash: ICEZKIKBOYJT2PV6YA4JX3X7MW64ZGUG
X-Message-ID-Hash: ICEZKIKBOYJT2PV6YA4JX3X7MW64ZGUG
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ICEZKIKBOYJT2PV6YA4JX3X7MW64ZGUG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Sep 25, 2023 at 04:14:43PM +0100, Richard Fitzgerald wrote:
>commit 18789be8e0d9fbb78b2290dcf93f500726ed19f0 upstream.
>Please apply to 6.4 and 6.5.
>
>Do not allow the CS35L56 to be put into its lowest power
>"hibernation" mode. This only affects I2C because "hibernation"
>is already disabled on SPI and SoundWire.
>
>Recent firmwares need a different wake-up sequence. Until
>that sequence has been specified, the chip "hibernation" mode
>must be disabled otherwise it can intermittently fail to wake.
>
>Backport note: This is the same change as upstream commit, to delete
>one line, but the upstream commit would not apply cleanly on older
>branches because of minor differences to the surrounding code.

Queued up for 6.5. 6.4 is EOL.

-- 
Thanks,
Sasha
