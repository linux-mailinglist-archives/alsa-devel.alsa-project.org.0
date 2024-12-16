Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 673DF9F3853
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Dec 2024 19:05:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E3E61FC;
	Mon, 16 Dec 2024 19:05:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E3E61FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734372337;
	bh=SJHwaxtH9GGpMQaPtoMoTH8kvn5aRLCLXM6g7iTtAwY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=GL5WNBp89ET1PaDlykI/Tg6Mz+D/6gxEwONmuPqZq2ZBwtwhZUm8SPBqW+l9hQA5U
	 yjcc0A8KT5VHhtbZN371TQcgZUQ4/NcuszKnNk6TNRpLehiWUtpBhoftSrnI1vg6Qj
	 myKfz9/79do9+3DVHiLRJ372Wx8I6tSdffKX5be4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7ED44F805BA; Mon, 16 Dec 2024 19:05:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54073F805BA;
	Mon, 16 Dec 2024 19:05:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0085F804CC; Mon, 16 Dec 2024 19:04:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id E5AA8F8001D
	for <alsa-devel@alsa-project.org>; Mon, 16 Dec 2024 19:04:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5AA8F8001D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1734372294246123791-webhooks-bot@alsa-project.org>
References: <1734372294246123791-webhooks-bot@alsa-project.org>
Subject: UCM2: Intel: sof-hda-dsp: Enable Dmic0 pre-processing and SDW speaker
 post-processing
Message-Id: <20241216180456.B0085F804CC@alsa1.perex.cz>
Date: Mon, 16 Dec 2024 19:04:56 +0100 (CET)
Message-ID-Hash: GFC3DSSNXJ4F7TE6JFKMG2V5PZHXOGHS
X-Message-ID-Hash: GFC3DSSNXJ4F7TE6JFKMG2V5PZHXOGHS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GFC3DSSNXJ4F7TE6JFKMG2V5PZHXOGHS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #481 was edited from singalsu:

This patch adds enable of the microphone capture pre-processing features as BootSequence inital values if the controls for them are available. If the user later switches these off, they will remain off.

The DRC is dynamic range control that boosts the capture level, and the TDFB (time-domain fixed beamformer) improves capture signa-to-noise ratio for set beam angle direction. The used 0 degrees angle is defined as angle towards notebook computer user.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/481
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/481.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
