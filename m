Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E237A62E75
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Mar 2025 15:54:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5DBF603A8;
	Sat, 15 Mar 2025 15:54:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5DBF603A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742050471;
	bh=6hnhPVqMhnVs9Dl465+ZzT23gVVFCwrpc6GJ6fWax3Y=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=oHyKa+XgcHr+nJVD7/j3gM02kb3qwZzbC/jPYJctGlW/ja55ZOYBZ57gj2JA2SABB
	 VcK4BGC8rUzOrCCqXwaQz0gCTfHuLIpr36rijC2GdNTBDnQKidHHesKB2gxRfDmXC5
	 /g8XVQ0zlQitjgzeZpdb4ZxJfW3OEuGPuc7ikUCs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0A30F805BE; Sat, 15 Mar 2025 15:53:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A15B4F805AF;
	Sat, 15 Mar 2025 15:53:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF50FF8023A; Sat, 15 Mar 2025 15:53:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 09432F800FA
	for <alsa-devel@alsa-project.org>; Sat, 15 Mar 2025 15:53:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09432F800FA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <182d019abc6d0d00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/524@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/524@alsa-project.org>
Subject: DRAFT [for alsa-lib-1.2.14]: USB-Audio: GoXLR: enable detection of
 beta firmware (25 channels)
Date: Sat, 15 Mar 2025 15:53:16 +0100 (CET)
Message-ID-Hash: 4VW3H2E52RRJKXGUDSDK2C5FML3S7JZP
X-Message-ID-Hash: 4VW3H2E52RRJKXGUDSDK2C5FML3S7JZP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4VW3H2E52RRJKXGUDSDK2C5FML3S7JZP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #524 was opened from perexg:

'Syntax 8' is required (alsa-lib 1.2.14+)

Fixes: 17f9b4f ("USB-Audio: GoXLR - fix the channel detection for mini, cleanups")
Link: https://github.com/alsa-project/alsa-ucm-conf/issues/444

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/524
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/524.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
