Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C54C6ACA90F
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Jun 2025 07:45:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1214960183;
	Mon,  2 Jun 2025 07:45:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1214960183
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1748843151;
	bh=h++tQeOZkR/rvkOHXqJ8yj4yF0Zxz2l7sdxekhrcX/g=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=NFXG5RYWCSImRGXWK49Kip54irrA3d1x5YrrWmGaGvLm7PoxuIPgy2valkQRI1i8z
	 0LvhPcQxAaxlRa4CEHjgcV5H4oAclIlqt7OO5G5Ko24NHIZ/64WUOVPojqS5NfiTRn
	 I4LNNRbFiA0F5NS1mjIjrd5U4T9mFRWpBuzZdXnU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B03DF805B3; Mon,  2 Jun 2025 07:45:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DF31F805B5;
	Mon,  2 Jun 2025 07:45:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27E1BF80533; Mon,  2 Jun 2025 07:45:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B6AFF800F8
	for <alsa-devel@alsa-project.org>; Mon,  2 Jun 2025 07:45:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B6AFF800F8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1845238b230ec200-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/570@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/570@alsa-project.org>
Subject: ucm2: Qualcomm: add ASUS Vivobook S 15 support
Date: Mon,  2 Jun 2025 07:45:13 +0200 (CEST)
Message-ID-Hash: TFJNJSOSEZOLK7HJ6RESU6SHOK5HHJ5L
X-Message-ID-Hash: TFJNJSOSEZOLK7HJ6RESU6SHOK5HHJ5L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TFJNJSOSEZOLK7HJ6RESU6SHOK5HHJ5L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #570 was opened from binarycraft007:

S15 supports:
	- 2 speakers.
	- 2 dmics
	- headset with mic.

This patch adds support to all these, however only speakers, dmic and headset playback is tested.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/570
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/570.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
