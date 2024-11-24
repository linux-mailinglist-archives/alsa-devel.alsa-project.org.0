Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 494C09D7421
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Nov 2024 15:59:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE9B11F7;
	Sun, 24 Nov 2024 15:59:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE9B11F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732460397;
	bh=6e5z0TAy4rvbY/TdMV1S7aiuw65BW36NObwA1K9qUu0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=mKYCk1ht1jaiIxhEdcuFFiRnObvgh+QXmRThh8Fyoycl7afEv/2dNs2Ih16pM8XEn
	 GLvWdwE05KUjJMzvk2A7rDmC9lDK1dTH09WEzwdFmb/68+nPZfbpBNWGKf3m7by4HQ
	 cV1iNfoFCjkf3ktrGMb42/AgNYNu9sqDSgQ+LbCI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51075F805BA; Sun, 24 Nov 2024 15:59:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76085F805B6;
	Sun, 24 Nov 2024 15:59:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33141F80496; Sun, 24 Nov 2024 15:59:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 7940CF8019B
	for <alsa-devel@alsa-project.org>; Sun, 24 Nov 2024 15:59:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7940CF8019B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1732460360917246580-webhooks-bot@alsa-project.org>
References: <1732460360917246580-webhooks-bot@alsa-project.org>
Subject: amd-soundwire: add support for AMD generic legacy machine driver
Message-Id: <20241124145923.33141F80496@alsa1.perex.cz>
Date: Sun, 24 Nov 2024 15:59:23 +0100 (CET)
Message-ID-Hash: YVWIIAKSY4AU32B53UAHNTMS26BY6Q7V
X-Message-ID-Hash: YVWIIAKSY4AU32B53UAHNTMS26BY6Q7V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YVWIIAKSY4AU32B53UAHNTMS26BY6Q7V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #470 was opened from vijendarmukunda:

Add support for AMD generic legacy(No DSP) machine driver for ACP6.3 platform using RT722 codec.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/470
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/470.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
