Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F34C1AECF07
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Jun 2025 19:23:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95D14601FA;
	Sun, 29 Jun 2025 19:23:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95D14601FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751217824;
	bh=7VscTy40R0aVEdsuTSMTXF3DqdsZ4yfh2Tdj5avgn/8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=T5R4Ny8P39951VvkjbKkxAsSihFNNJLH2xszAunMcb1Ac8tQfB1dGAHz+y5D7k3Bd
	 ScBDzdd5ZLLzesEgVK4AFTyOmCeMGOKYI7g/EOUK0AFw4Vl65t0MJnsXpIfEVzp1n1
	 G4K7QGz4p1NdtW2ztmjsm3bOLxvdjAoZMak8sK38=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F063AF805D5; Sun, 29 Jun 2025 19:23:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3479F805B6;
	Sun, 29 Jun 2025 19:23:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94825F800B8; Sun, 29 Jun 2025 19:23:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id C1626F800B8
	for <alsa-devel@alsa-project.org>; Sun, 29 Jun 2025 19:23:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1626F800B8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <184d934c0edad900-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/589@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/589@alsa-project.org>
Subject: ucm2: Qualcomm: Add Dell Latitude 7455 / Inspiron 14 Plus 7441
 support
Date: Sun, 29 Jun 2025 19:23:07 +0200 (CEST)
Message-ID-Hash: IHNOR3PQBCQWRB257XDTRKIQ6PAEGDQZ
X-Message-ID-Hash: IHNOR3PQBCQWRB257XDTRKIQ6PAEGDQZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IHNOR3PQBCQWRB257XDTRKIQ6PAEGDQZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #589 was opened from valpackett:

(Both SKUs are identical, the codename is Thena)

This configuration is:

- 4 speakers
- 2 DMICs
- headset with mic
- DisplayPort (not yet)

---

cc @0xB0D @alexVinarskis

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/589
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/589.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
