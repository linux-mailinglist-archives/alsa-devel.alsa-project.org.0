Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DE99D71A3
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Nov 2024 14:52:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20CF41FE;
	Sun, 24 Nov 2024 14:51:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20CF41FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732456328;
	bh=yqUYQVzRB5lqf5s1Kn4DplXjzZ66WhAqsW7uzghifsI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=QZhrDj/pboSjEfy85E7BWGEQ4QU9VRSGjo0n1kwBgAxKNE5qo28qtRiPtU7oJyiZY
	 IuK9li+svB5LLzeeXCap+OcTKWTuYFv+62OlnzD/9YUH1ve8Ktyciq4Z0t71jAp45M
	 kA1DtHe0dyeaZg6v/evwXl7DlBSYWLB6FXpApVtM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 458A0F805BB; Sun, 24 Nov 2024 14:51:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2753F805AC;
	Sun, 24 Nov 2024 14:51:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70D33F80496; Sun, 24 Nov 2024 14:51:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id C03ABF80073
	for <alsa-devel@alsa-project.org>; Sun, 24 Nov 2024 14:51:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C03ABF80073
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1732456290994635820-webhooks-bot@alsa-project.org>
References: <1732456290994635820-webhooks-bot@alsa-project.org>
Subject: No sound and alsactl init errors after updating to 1.2.13
Message-Id: <20241124135133.70D33F80496@alsa1.perex.cz>
Date: Sun, 24 Nov 2024 14:51:33 +0100 (CET)
Message-ID-Hash: TU7NKPNMMVRPJD4Q2ALAFFHH3CFWOUSG
X-Message-ID-Hash: TU7NKPNMMVRPJD4Q2ALAFFHH3CFWOUSG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TU7NKPNMMVRPJD4Q2ALAFFHH3CFWOUSG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #283 was edited from wastlnd:

I think I have kind of a regression after updating to the latest version. I have this error at startup:
```
Found hardware: "acp" "" "" "" ""
Hardware is initialized using a generic method
```
And I have no sound at all. I have tried to apply the latest commit fixing the udev rule, but it didn't work. Downgrading to 1.2.12 fixes the issue.
I am running an Arch based distro on AMD Ryzen 7 5825U CPU with Radeon graphics. My soundcard is Realtek and I have an AMD microphone array.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/283
Repository URL: https://github.com/alsa-project/alsa-utils
