Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A5BA1354D
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jan 2025 09:30:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3939060358;
	Thu, 16 Jan 2025 09:30:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3939060358
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737016216;
	bh=lmQ8RsGRlX/DFHBdL3J1rJtgMDdIP3afri0nyBklsj4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=vIOamkDMG8PUUyLR4ntxgKpuUI42ppCi1DIbCvo7/IKPy6oCqF/VXADWPCF1BeN3M
	 a7+QS9Abkl5loJODevax2mY6DLE4pKcj+iL88Fz34FBjsPr0q46XSghKQ1i9f6n5fs
	 oozvTF0RGrme4yUFgec1wV+xdjA9hTHVheND3ov4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71F56F805AF; Thu, 16 Jan 2025 09:29:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7786F805AA;
	Thu, 16 Jan 2025 09:29:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7399F8045D; Thu, 16 Jan 2025 09:28:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BFD3F8012B
	for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2025 09:28:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BFD3F8012B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1737016121873947382-webhooks-bot@alsa-project.org>
References: <1737016121873947382-webhooks-bot@alsa-project.org>
Subject: Topology: NHLT: Intel: Fix DMA slots config in SSP blob
Message-Id: <20250116082844.C7399F8045D@alsa1.perex.cz>
Date: Thu, 16 Jan 2025 09:28:44 +0100 (CET)
Message-ID-Hash: SEUWPUCZ56JSCITDWBQWIJWULJJHQNIP
X-Message-ID-Hash: SEUWPUCZ56JSCITDWBQWIJWULJJHQNIP
X-MailFrom: github@alsa-project.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SEUWPUCZ56JSCITDWBQWIJWULJJHQNIP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #289 was opened from singalsu:

This fixes a mistake in function ssp_calculate_intern_v30(). The rx_dir[0] and tx_dir[0] value was hard-coded to 0x3 for typical stereo slots configuration. It should be instead retrieved from topology parameters for the SSP.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/289
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/289.patch
Repository URL: https://github.com/alsa-project/alsa-utils
