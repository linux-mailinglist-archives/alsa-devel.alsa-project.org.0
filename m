Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9389A1980F
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jan 2025 18:51:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0F3D6042F;
	Wed, 22 Jan 2025 18:51:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0F3D6042F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737568302;
	bh=jzLJKk6bAfjbioiVx6qP3shZGgCf9v7+nnCrn5JMH1w=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=IJdRKTaztpVthn1+7AGs0BvmBpromnW8dXAQ9m5PTIj5oDT83gSROdDKgb9FUrhJj
	 JJuKNViv+1j1AQ5VCWGuruSXU6bMw2DXXG2LSxaB0mIF82RC6znK5coTTXMITzB5SS
	 nTN93+mDoPNOEjCK4GrsN0i4bDHnVosy53g/kzlA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80A02F805BA; Wed, 22 Jan 2025 18:51:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72159F805B4;
	Wed, 22 Jan 2025 18:51:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62833F801F7; Wed, 22 Jan 2025 18:51:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id A3F2FF80149
	for <alsa-devel@alsa-project.org>; Wed, 22 Jan 2025 18:51:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3F2FF80149
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1737568262304499626-webhooks-bot@alsa-project.org>
References: <1737568262304499626-webhooks-bot@alsa-project.org>
Subject: Qualcomm: Add SM8750 MTP HiFi config
Message-Id: <20250122175104.62833F801F7@alsa1.perex.cz>
Date: Wed, 22 Jan 2025 18:51:04 +0100 (CET)
Message-ID-Hash: NVTBC2YV7PCUXHHX5LLL3H4Y2F2YHPXE
X-Message-ID-Hash: NVTBC2YV7PCUXHHX5LLL3H4Y2F2YHPXE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NVTBC2YV7PCUXHHX5LLL3H4Y2F2YHPXE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #498 was opened from krzk:

Add UCM2 configs for the Qualcomm SM8750-MTP Board to handle:
- on-board Speakers
- Headphones speakers
- Top and Bottom on-board Microphones

Not yet implemented/tested are Headphone Microphones over USB-C port.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/498
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/498.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
