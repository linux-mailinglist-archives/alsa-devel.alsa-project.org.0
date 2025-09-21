Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B85B8E245
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Sep 2025 19:40:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E432601F9;
	Sun, 21 Sep 2025 19:40:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E432601F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1758476414;
	bh=RS2IMYtfMHolePNCT9BgX/0nITr9aWO+yAOaOzoOZJw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=aOLPPTJQDJbv4CzMKj7DMKDRRq0n5qJdhrB71wr5Uh8pwBEaOGdw+UJJXfxeuR2JY
	 X1zH7x/JOItsMnFGNCm3VwpZxxPU84cW1rbgAitnbZMe1g5AbiN9Gm9hqgGkF59DsZ
	 moQpPtxhFsuwmr4AZKy8MJFgR6zpKSuTlUDWYgrY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDAC4F805D5; Sun, 21 Sep 2025 19:39:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD8F7F805C4;
	Sun, 21 Sep 2025 19:39:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53313F80494; Sun, 21 Sep 2025 19:39:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id A8B1AF800F8
	for <alsa-devel@alsa-project.org>; Sun, 21 Sep 2025 19:39:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8B1AF800F8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18675cf06ee6cf00-webhooks-bot@alsa-project.org>
In-Reply-To: <18675cf06e5dfc00-webhooks-bot@alsa-project.org>
References: <18675cf06e5dfc00-webhooks-bot@alsa-project.org>
Subject: Debian 13, MacBookPro 13, T2,
 6.16.6. Steroe Line SSL2 Alsa UCM error but working fine
Date: Sun, 21 Sep 2025 19:39:31 +0200 (CEST)
Message-ID-Hash: 5VEAMPRROYSOSBXNGLXHF33GFEH7TLOA
X-Message-ID-Hash: 5VEAMPRROYSOSBXNGLXHF33GFEH7TLOA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5VEAMPRROYSOSBXNGLXHF33GFEH7TLOA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #616 was opened from brandtan:

Hi all,

I am using debian 13 on my macbook pro 15,2 T2. Audio subsystem is working fine.

However, there is the issue appearing: UCM error  
These are my alsa information:
http://alsa-project.org/db/?f=e4cf3e09c303e10315cb2a970c85af98ccb80a53

Hope that there will be a bugfix soon.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/616
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
