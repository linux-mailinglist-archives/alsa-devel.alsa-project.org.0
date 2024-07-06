Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A02A692950F
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Jul 2024 21:13:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23736F55;
	Sat,  6 Jul 2024 21:13:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23736F55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720293228;
	bh=yH9sIVVWfoLovOVsfG2IArUOV9Xa+vzSyF6Wsvsa1r8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=kdcJ2hMLxuOrFakceYIjLJE0C7t82XXUaEzUlQcsO/VFrx0S+bM61KNS0pM8m7WDz
	 xmBwKArygYtiHWNTBmFnUnmj0hdf8u1b72H6vjS9JB1zoEUfQ1G6UkAmRD7RG+dVJh
	 Us4yUDOk+6MVKmfP6ocL6qtE/5i8dkjK8feNTYTE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DC42F805AA; Sat,  6 Jul 2024 21:13:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1849F80588;
	Sat,  6 Jul 2024 21:13:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FBACF8025E; Sat,  6 Jul 2024 21:10:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id AD0A2F800F8
	for <alsa-devel@alsa-project.org>; Sat,  6 Jul 2024 21:10:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD0A2F800F8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1720293044699448347-webhooks-bot@alsa-project.org>
References: <1720293044699448347-webhooks-bot@alsa-project.org>
Subject: Fix labeling of BOSS Katana ports
Message-Id: <20240706191048.7FBACF8025E@alsa1.perex.cz>
Date: Sat,  6 Jul 2024 21:10:48 +0200 (CEST)
Message-ID-Hash: Y53H5QXNR3F3PPYOBF5HSOLCIGFPCFJN
X-Message-ID-Hash: Y53H5QXNR3F3PPYOBF5HSOLCIGFPCFJN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y53H5QXNR3F3PPYOBF5HSOLCIGFPCFJN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #430 was opened from aledomu:

I'd like to rename the MIDI ports as well but I don't know how. If you can point me where I can learn about it, I'll be glad to do so and mark this PR as finished.

I guess this fix works the same for all Katana models from all generations, but I don't have the PID available to enable it, nor the devices for testing.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/430
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/430.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
