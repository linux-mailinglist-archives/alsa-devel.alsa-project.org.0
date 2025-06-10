Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC52FAD3505
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jun 2025 13:34:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14017601F4;
	Tue, 10 Jun 2025 13:33:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14017601F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749555240;
	bh=VwKka6qXzOrE/k7fAZyFfGM9vcHi2dwlOfRiJK43XU4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=iuMx1NP7b1AWhSEkYaqO163Lzh3JNwIfeia+IOYb6QOI7sz8i637DXBaaUdeYF4NQ
	 DFM+nbtbti13CjQQcgIOuTqWoQjCvL4OCCWmVvQhTlZ6LvvNbSj4w2x8uAwQCRpyMz
	 NrzahSVX4urO29ZimhOXQ7A9sOofL8u53XwHrOIk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6899DF805C7; Tue, 10 Jun 2025 13:33:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34AFDF805C3;
	Tue, 10 Jun 2025 13:33:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEAE3F804B2; Tue, 10 Jun 2025 13:33:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id E7894F8025A
	for <alsa-devel@alsa-project.org>; Tue, 10 Jun 2025 13:33:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7894F8025A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1847ab2fac2cca00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/577@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/577@alsa-project.org>
Subject: ucm2: Qualcomm: Update the QCM6490 and QCS6490 HiFi conf files
Date: Tue, 10 Jun 2025 13:33:23 +0200 (CEST)
Message-ID-Hash: K75ZX5AMESH4PH25QVRX53UQXOUNCREP
X-Message-ID-Hash: K75ZX5AMESH4PH25QVRX53UQXOUNCREP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K75ZX5AMESH4PH25QVRX53UQXOUNCREP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #577 was opened from mohsRafi:

Rename the HiFi conf files for QCM6490-IDP and QCS6490-RB3Gen2 boards to match with soundcard name.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/577
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/577.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
