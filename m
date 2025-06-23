Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F40AE36A6
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jun 2025 09:23:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECB20601EF;
	Mon, 23 Jun 2025 09:22:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECB20601EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750663382;
	bh=gJ9/Oe7fCcYI6Fe0mTz3a0Hfk+8BPX3+qSGqThKp7Ws=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=k8govbUX62OyeCq1xjaIuqi9lZo6qMfcUejH+UzEPQGxoHU1M0PyktcislhMAFbY4
	 GUXf03t+UWirKR5tNT9I2KVgZGlWVndYYiWfVh2scZrwZ9MLL4Cc8Gw+LjN8VVy6em
	 s9nDYZSqjonMDIrIF5MZ2xIPjCv/+H5u7BLWIloo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BDD5F805D6; Mon, 23 Jun 2025 09:22:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 230FCF805C7;
	Mon, 23 Jun 2025 09:22:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4D04F80424; Mon, 23 Jun 2025 09:22:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id D615FF8013D
	for <alsa-devel@alsa-project.org>; Mon, 23 Jun 2025 09:22:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D615FF8013D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <184b9b08dac79300-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/583@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/583@alsa-project.org>
Subject: Add UCM support for MediaTek mt8365-evk
Date: Mon, 23 Jun 2025 09:22:24 +0200 (CEST)
Message-ID-Hash: UDCXSZJ6ZGAUOIZIW3HF3TB5KNOXEJKF
X-Message-ID-Hash: UDCXSZJ6ZGAUOIZIW3HF3TB5KNOXEJKF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UDCXSZJ6ZGAUOIZIW3HF3TB5KNOXEJKF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #583 was opened from zoran055:

Add support for MT8365 EVK with SOF enabled. When SOF is disabled, the "HiFi" use case is used; when SOF is enabled, the "SOF" use case is used.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/583
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/583.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
