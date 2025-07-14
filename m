Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C52E8B03A60
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Jul 2025 11:10:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19CF06018A;
	Mon, 14 Jul 2025 11:10:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19CF06018A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1752484225;
	bh=W6MLzXYXJPcg5WN58R02rSNnTGUN0RMxhJBvqYuQEuE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=rLh8zGmdsuCyzcmOG8dV7jZQqtY8rxzA5gxzfUfxtpc3mvKoNkJXA5e12QNP8VzJg
	 I76t6diV+YyNMhHjtzzigix2jMcofFgeP0eZSicqjQpAXc9eVqkDouJmxFiq1AMqpK
	 RXDwd17RdGxY0ushk5+EHoWE3I0VGcvYqyYcTuyY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 385EBF805C6; Mon, 14 Jul 2025 11:09:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D2E2F805C4;
	Mon, 14 Jul 2025 11:09:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BC83F804E5; Mon, 14 Jul 2025 11:09:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id AF31AF800F3
	for <alsa-devel@alsa-project.org>; Mon, 14 Jul 2025 11:09:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF31AF800F3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <185213138a0e2800-webhooks-bot@alsa-project.org>
In-Reply-To: <185213138a04bc00-webhooks-bot@alsa-project.org>
References: <185213138a04bc00-webhooks-bot@alsa-project.org>
Subject: I'm using Ubuntu 24.04.2 LTS with Wayland on an iMac 27" (2017)
 equipped with the Cirrus Logic CS8409 audio codec.  After compiling the
 driver manually (https://github.com/egorenar/snd-hda-codec-cs8409),
 ALSA detects the audio device correctly and it works properly with PipeWire
 and PulseAudio. However, it breaks with each kernel update,
 requiring recompilation.  **Request**: Please consider adding native support
 for CS8409 in `alsa-ucm-conf`. Modern systems like Ubuntu 24.04.2 handle the
 device well,
 and integration would improve support for Apple hardware dramatically. I'm
 happy to assist with testing and diagnostics.
Date: Mon, 14 Jul 2025 11:09:41 +0200 (CEST)
Message-ID-Hash: ZCIIZYSSGA6OWLADA65UXQJEC7FT4QFJ
X-Message-ID-Hash: ZCIIZYSSGA6OWLADA65UXQJEC7FT4QFJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZCIIZYSSGA6OWLADA65UXQJEC7FT4QFJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #592 was edited from Marek-mahav:

-w

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/592
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
