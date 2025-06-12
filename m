Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB12AD721A
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jun 2025 15:34:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EB7760176;
	Thu, 12 Jun 2025 15:34:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EB7760176
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749735259;
	bh=wgkpI8FP5rp5yO8B+4LXz0hdTlwGJzwrgSu2yTNLHSI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=BxelmpSrxAM37KdbnmeFjWMmGHJ5EP/C6/DGkcmm2q9Vx8lVUS78ktNAiDb2D9mzj
	 sSkYblUnkP3HyG41uOPgbeSTKzIhDN2qG9sIlE0E72Spe6xfYnUNlxEz532kJJpDDB
	 LmSPk/rj1/Mz2dRQQSQc6wVzdUJlbu3AKM7whPjo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF690F805BE; Thu, 12 Jun 2025 15:33:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACB6DF805C2;
	Thu, 12 Jun 2025 15:33:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4F2EF804D6; Thu, 12 Jun 2025 15:33:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 118AFF8013D
	for <alsa-devel@alsa-project.org>; Thu, 12 Jun 2025 15:33:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 118AFF8013D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18484ee9a0c09200-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/579@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/579@alsa-project.org>
Subject: UCM2: Intel: sof-hda-dsp: HiFi: Fix handling of mono DMICs
Date: Thu, 12 Jun 2025 15:33:42 +0200 (CEST)
Message-ID-Hash: ZQQJJ26EZ32KUHRZVPHXP3FC7I7VDBNE
X-Message-ID-Hash: ZQQJJ26EZ32KUHRZVPHXP3FC7I7VDBNE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZQQJJ26EZ32KUHRZVPHXP3FC7I7VDBNE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #579 was opened from ujfalusi:

When a single DMIC is present in the system we need to set the CaptureChannels to 1 since the PCM device only supports mono, PA/PW will reject the profile since it cannot open the DMIC PCM device.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/579
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/579.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
