Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B5A7DADED
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Oct 2023 20:19:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 497049F6;
	Sun, 29 Oct 2023 20:18:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 497049F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698607167;
	bh=7I5OLuIkNXDkPFVH/uJQgPPb60UnXDLe9H59o8ZoUwk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Fw/d0hY/zHm1tIJ6cFjZpO4okDlb1dPq2s4mNb98e7hV3DMfQyVEpfW0DQfpYoabu
	 sOiWN7XIF7T0Ip7gPboJOQlpN+Q+5dPv6kiXyx/QC1sNBQJIaIwmoPFFMPQsPICCn7
	 rNi6OtVAolRP+0aZjKIsxLVgplbzDL8MnJfH59I0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9217BF80557; Sun, 29 Oct 2023 20:18:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78821F8016D;
	Sun, 29 Oct 2023 20:18:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C44C9F8020D; Sun, 29 Oct 2023 20:15:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FAB9F80166
	for <alsa-devel@alsa-project.org>; Sun, 29 Oct 2023 20:15:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FAB9F80166
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1698606951015890837-webhooks-bot@alsa-project.org>
References: <1698606951015890837-webhooks-bot@alsa-project.org>
Subject: SPDIF output of ASRock X670E with ALC4080 didnt work
Message-Id: <20231029191556.C44C9F8020D@alsa1.perex.cz>
Date: Sun, 29 Oct 2023 20:15:56 +0100 (CET)
Message-ID-Hash: HHLCFV3GMANDLBLQOY77I6V3QOGJBNDZ
X-Message-ID-Hash: HHLCFV3GMANDLBLQOY77I6V3QOGJBNDZ
X-MailFrom: github@alsa-project.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HHLCFV3GMANDLBLQOY77I6V3QOGJBNDZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #364 was opened from jonasdutra:

http://alsa-project.org/db/?f=43bba1198f548f906c597d1f2e15ff5f6df58a60

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/364
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
