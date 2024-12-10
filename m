Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFC69EB22D
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2024 14:49:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DC09E0F;
	Tue, 10 Dec 2024 14:49:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DC09E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733838560;
	bh=7seMAXkquug7n4wiMAC8y5A1M+8T6VfSxq9vEEFy9+4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=aFDISTLlcjW9lFXtLWoR+OfW9V8o+xpt/m1YD+y9s6wu0qa2m/4mskIZ/LnwOnkr6
	 W01kRIJNXyOIxSH61c4YCIzQUVmkO6UHkwMabg5rDtKJgLx4u5QcDcN30BXIA22QE3
	 Hr6CmqH04+8TKySePeK/I9OlEjKMKnB7eRE5YLL8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63B40F805C4; Tue, 10 Dec 2024 14:48:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 931F4F805B2;
	Tue, 10 Dec 2024 14:48:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87D0AF80482; Tue, 10 Dec 2024 14:48:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id DC56EF8016C
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 14:48:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC56EF8016C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1733838515743928432-webhooks-bot@alsa-project.org>
References: <1733838515743928432-webhooks-bot@alsa-project.org>
Subject: Support for ASUS ROG STRIX X870E-E GAMING WIFI
Message-Id: <20241210134842.87D0AF80482@alsa1.perex.cz>
Date: Tue, 10 Dec 2024 14:48:42 +0100 (CET)
Message-ID-Hash: BFZXHBK4Y7NMK3Q4Z2QTSHO6CB6FRQOS
X-Message-ID-Hash: BFZXHBK4Y7NMK3Q4Z2QTSHO6CB6FRQOS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BFZXHBK4Y7NMK3Q4Z2QTSHO6CB6FRQOS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #486 was opened from aidvu:

Add support for [ASUS ROG STRIX X870E-E GAMING WIFI](https://rog.asus.com/motherboards/rog-strix/rog-strix-x870e-e-gaming-wifi/spec/
).

```Bus 003 Device 004: ID 0b05:1b9b ASUSTek Computer, Inc. USB Audio```

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/486
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/486.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
