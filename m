Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 829139FCC0F
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Dec 2024 18:00:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71C1F601DD;
	Thu, 26 Dec 2024 18:00:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71C1F601DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1735232444;
	bh=lw1KdfeKyWkFy7lcbeQl5IU1Pj3GXVEux5X5418KtsM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=dbYOCMAIXpvo/ZDCyesqdTVW13bgNjiShYJ9eQ4yzBuyLsOZ2vDn3BQ98t9kpdbB7
	 urdmwLw0Igybb8RvP7RyDmm1M4ZYuE8z8bOkmYwu3RSiBIxBmPFOPBon0zJX3+AVmU
	 mM047K0aM/GX/EJoMWrCmpLgc0GV1s6yj4bwmeKk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D96AF805B4; Thu, 26 Dec 2024 18:00:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BB1BF805BF;
	Thu, 26 Dec 2024 18:00:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 809D6F804CC; Thu, 26 Dec 2024 17:59:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 80B46F800B0
	for <alsa-devel@alsa-project.org>; Thu, 26 Dec 2024 17:59:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80B46F800B0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1735232394503345013-webhooks-bot@alsa-project.org>
References: <1735232394503345013-webhooks-bot@alsa-project.org>
Subject: USB-Audio: ALC4080 - add ASUS ROG Crosshair X870E Hero (USB
 0b05:1b7c)
Message-Id: <20241226165957.809D6F804CC@alsa1.perex.cz>
Date: Thu, 26 Dec 2024 17:59:57 +0100 (CET)
Message-ID-Hash: VKZPCIR23U2QZJSN6PM5HB4MQKWSBVDP
X-Message-ID-Hash: VKZPCIR23U2QZJSN6PM5HB4MQKWSBVDP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VKZPCIR23U2QZJSN6PM5HB4MQKWSBVDP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #492 was opened from jetm:

https://rog.asus.com/motherboards/rog-crosshair/rog-crosshair-x870e-hero/

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/492
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/492.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
