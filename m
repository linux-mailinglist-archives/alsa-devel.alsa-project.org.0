Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5921F8265D2
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jan 2024 20:43:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9A7784D;
	Sun,  7 Jan 2024 20:43:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9A7784D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704656600;
	bh=UCl6r2vcNH48280ZfVif1BSntAnhScPDpzxg8RwKlMQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=iRS3qawlhdTtmdWi+hXkV1mH9ud+SEv62Z6aDaJ/4dXrsO2wUWsjktKlle4dwwmoJ
	 B1zfgknTVISxbyZGzBpiui7XtHXVpF9LwcMromhHNu1UsQEHIivEFJ5yjglNIYbTvv
	 E661oQvXbBPBMcmQPjX2+ZOzgSimpIm/++a977so=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF1E5F80587; Sun,  7 Jan 2024 20:42:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 208B6F80578;
	Sun,  7 Jan 2024 20:42:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82DD9F80246; Sun,  7 Jan 2024 20:42:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id D0DA4F800F5
	for <alsa-devel@alsa-project.org>; Sun,  7 Jan 2024 20:42:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0DA4F800F5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1704656551892743587-webhooks-bot@alsa-project.org>
References: <1704656551892743587-webhooks-bot@alsa-project.org>
Subject: aplaymidi: Set event completely for tempo event
Message-Id: <20240107194234.82DD9F80246@alsa1.perex.cz>
Date: Sun,  7 Jan 2024 20:42:34 +0100 (CET)
Message-ID-Hash: ZKM73GE44USXMIO24QDTERVZAY6HMG5F
X-Message-ID-Hash: ZKM73GE44USXMIO24QDTERVZAY6HMG5F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZKM73GE44USXMIO24QDTERVZAY6HMG5F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #253 was opened from jkl1337:

After UMP support was added in b399fb8 ev.type setting was inadvertently dropped in the code path handling tempo meta event. This is causing tempo meta events to not be handled at all. Moreover, snd_seq_ev_set_fixed is also missing so MIDI files with variable events such as SYSEX before the tempo meta event usually are causing a segfault.

Fixes https://github.com/alsa-project/alsa-utils/issues/241

Request URL   : https://github.com/alsa-project/alsa-utils/pull/253
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/253.patch
Repository URL: https://github.com/alsa-project/alsa-utils
