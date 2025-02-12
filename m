Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14039A32B0F
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2025 17:03:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54F8060276;
	Wed, 12 Feb 2025 17:03:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54F8060276
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739376202;
	bh=PfYLkZp7rvLzThYC9OVdvu0vO0AR5TX91PHz79+3QWc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=OAAZ1bXdz1YL/sWklrTZ4gJhBUENfGfVcbbFdajmevF9yZaVSo2FIyh55xDY701yz
	 qqhBNNYeGBPtYWbYdl7IROtjPvjzRkK74ByojxDvh7Ott1yKtfBVIQtBThU6XWprpJ
	 KRYaUINz7LM9zCWH4PqRJpigped/fx8ctC4ljWv0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BD5FF805C0; Wed, 12 Feb 2025 17:02:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E68E0F805BA;
	Wed, 12 Feb 2025 17:02:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0965F8049C; Wed, 12 Feb 2025 17:02:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 03B88F80134
	for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2025 17:02:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03B88F80134
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1739376156478939295-webhooks-bot@alsa-project.org>
References: <1739376156478939295-webhooks-bot@alsa-project.org>
Subject: Add HIFI Config support for QCM6490-IDP and QCS6490-RB3Gen2 Qualcomm
 boards
Message-Id: <20250212160240.E0965F8049C@alsa1.perex.cz>
Date: Wed, 12 Feb 2025 17:02:39 +0100 (CET)
Message-ID-Hash: V366UJJ2DL3FRZXPROMP2NLPVS4UX7R5
X-Message-ID-Hash: V366UJJ2DL3FRZXPROMP2NLPVS4UX7R5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V366UJJ2DL3FRZXPROMP2NLPVS4UX7R5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #508 was opened from mohsRafi:

Add HIFI Config support for QCM6490-IDP and QCS6490-RB3Gen2 Qualcomm boards

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/508
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/508.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
