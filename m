Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A1BBECEED
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Oct 2025 13:59:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFA8F60253;
	Sat, 18 Oct 2025 13:59:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFA8F60253
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1760788781;
	bh=LAYjZfhWmXdGjeWdghXpF3RNjVkvBuzOirIgpB9tXS8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=C6H+Qen8nSER/1iyBQwVVTMS15QzhE9nEfV9ThRG0ePozIvd4onl7ThVlzFtdA7F+
	 4GjzAIyHbCPXyAEmD5Bubll+PFwMZysPPcIwsIrsRH9tnSfWCqrHxC8+r+ctPR2hY/
	 0FKVQkvVqKgs7EH+dX+3bQZsMy08Zci8grLj3sKc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A5D7F806D5; Sat, 18 Oct 2025 13:57:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC602F806D5;
	Sat, 18 Oct 2025 13:57:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E226F805BF; Tue, 14 Oct 2025 19:16:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F2A4F80100
	for <alsa-devel@alsa-project.org>; Tue, 14 Oct 2025 19:16:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F2A4F80100
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <186e6b06a1e0f800-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/624@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/624@alsa-project.org>
Subject: ucm2: Qualcomm: Radxa: fix Displayport SectionDevice
Date: Tue, 14 Oct 2025 19:16:23 +0200 (CEST)
Message-ID-Hash: TRRVELY3TDFG6YUJZGCJ3F3LLR2D2PXT
X-Message-ID-Hash: TRRVELY3TDFG6YUJZGCJ3F3LLR2D2PXT
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
Content-Transfer-Encoding: 7bit

alsa-project/alsa-ucm-conf pull request #624 was opened from Srinivas-Kandagatla:

for some reason this ucm endedup using DisplayPort for SectionDevice instead of HDMI. This was resulting in below failures of any PR against Qualcomm devices.

Run cd alsa-tests/python/ucm-validator2
./ucm.py configs --level=0 --ucmdir=../../../alsa-ucm-conf/ucm2 ./Qualcomm/qcs6490/QCS6490-Radxa-Dragon-Q6A/HiFi.conf: Device name DisplayPort
 /'SectionDevice'.'DisplayPort'/ is not valid
(see https://github.com/alsa-project/alsa-lib/blob/master/include/use-case.h) total errors: 1
make: *** [Makefile:10: configs] Error 1
Error: Process completed with exit code 2.

Fix this by using known devices from use-case.h

Fixes: 67628fb4871e ("ucm2: Qualcomm: add Radxa Dragon Q6A")

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/624
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/624.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
_______________________________________________
Alsa-devel mailing list -- alsa-devel@alsa-project.org
To unsubscribe send an email to alsa-devel-leave@alsa-project.org
