Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F29B9388D5
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 08:16:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78A75B70;
	Mon, 22 Jul 2024 08:16:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78A75B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721629005;
	bh=HObDABh6rz8l6U/tW0FDKQwOcbmVIa6lXAl8EMr2r4Y=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=qXUMSmm3JilbudI20ODXlZIhXHMYEbYqd8l5buQWgC7bD3/KI5ZG+lEUaz754cvXB
	 5mKCt7I1S2deUNMxzWwAleOdnjz3rCut0HxZpbP+eQHSca01t5h8JGU5jRSE0kU2Ms
	 6l3Gn78pY4f72YWiFO/xmu3nqfp3iFCtPfoSWMAk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 351C8F805B6; Mon, 22 Jul 2024 08:16:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E24D6F80482;
	Mon, 22 Jul 2024 08:16:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B95B4F8007E; Mon, 22 Jul 2024 08:09:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=KHOP_HELO_FCRDNS,MISSING_DATE,
	MISSING_MID,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 257D5F8007E
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 08:04:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 257D5F8007E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1721628237360221863-webhooks-bot@alsa-project.org>
References: <1721628237360221863-webhooks-bot@alsa-project.org>
Subject: aplay: Print '=== PAUSE ===' only if it is supported
Message-Id: <20240722060922.B95B4F8007E@alsa1.perex.cz>
Date: Mon, 22 Jul 2024 08:09:22 +0200 (CEST)
Message-ID-Hash: HUEFJ4NXSCFM6KK2XP3O7MACGGN4SQ5P
X-Message-ID-Hash: HUEFJ4NXSCFM6KK2XP3O7MACGGN4SQ5P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HUEFJ4NXSCFM6KK2XP3O7MACGGN4SQ5P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #271 was opened from ujfalusi:

Instead of printing the '=== PAUSE ===' unconditionally before calling do_pause(), move it to the function and only print it if the stream can be paused.

If the stream cannot be paused that the '=== PAUSE ===' will be replaced by `PAUSE command ignored (no hw support)` immediately, which is not observable by users but automation scripts will catch the '=== PAUSE ===' and might think that the stream is indeed got paused.

Move the print into do_pause() function after the snd_pcm_pause() have returned without error to make sure it is only printed if the stream is paused and we are waiting for the pause release from user to proceed.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/271
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/271.patch
Repository URL: https://github.com/alsa-project/alsa-utils
