Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ED4B89407
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Sep 2025 13:24:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DA28601E5;
	Fri, 19 Sep 2025 13:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DA28601E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1758281050;
	bh=GkmDh0iO/QWGgJpcRoI1TyqaLeLdhzXUD4x8LWxu5yg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=dZTbTeXCD1g6PL2iDncISRAdBnBL2lSQKaXiXKdqYgHunSC3iwogNAlwg1BHo/Mvm
	 inPhozbvkOehN/1Qj8Dc1cczcEG8olzXZm84sqUbmkxWUAa+tIuNO0/qB+13LsuHT2
	 1wJcQqIMDss1ao/TEPbl23b7ZHPg1RX4CsEv3yMs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D082F805C2; Fri, 19 Sep 2025 13:23:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22359F805C8;
	Fri, 19 Sep 2025 13:23:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69A03F8027B; Fri, 19 Sep 2025 13:23:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 55F5DF80169
	for <alsa-devel@alsa-project.org>; Fri, 19 Sep 2025 13:23:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55F5DF80169
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1866ab3e10532000-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/613@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/613@alsa-project.org>
Subject: Qualcomm: Kaanapali: Add Kaanapali MTP HiFi config
Date: Fri, 19 Sep 2025 13:23:10 +0200 (CEST)
Message-ID-Hash: 5QXMXGXP57D7JWGWLLV5SDRYLZGRU36U
X-Message-ID-Hash: 5QXMXGXP57D7JWGWLLV5SDRYLZGRU36U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5QXMXGXP57D7JWGWLLV5SDRYLZGRU36U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #613 was opened from PrasadKumpatla:

Add UCM2 configs for the Qualcomm Kaanapali-MTP Board. Tested on-board Speakers playback, on-board Microphones.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/613
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/613.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
