Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B33CFB41A36
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Sep 2025 11:39:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C0D160202;
	Wed,  3 Sep 2025 11:38:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C0D160202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756892347;
	bh=2SyHIKAKlgvLukDHaDHIZpx3xJtxYTVpwlZJEkjVUYY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=sf8lexGfIlPb0Y4fxqD6+PhF1LAx0qzUv8qX1TlOO/SJ4eqSVRwP4n046Y34x/Qi3
	 VfI+QBmPiFEE1WPNUzFJ5QCn7YSEk4W0JR8sg6J4w7h5V1NDn3Jf71u7rayICPhX6Q
	 p/PLu89HHZFtqxufDrWOPC+cJ9ANlz3IvUUv7VBE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9980FF805C5; Wed,  3 Sep 2025 11:38:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29ABFF805BF;
	Wed,  3 Sep 2025 11:38:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C962F804D6; Wed,  3 Sep 2025 11:38:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id B8768F80075
	for <alsa-devel@alsa-project.org>; Wed,  3 Sep 2025 11:38:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8768F80075
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1861bc3cf6d55e00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/608@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/608@alsa-project.org>
Subject: ucm2: Qualcomm: x1e80100: Add X1E80100-EVK configuration
Date: Wed,  3 Sep 2025 11:38:21 +0200 (CEST)
Message-ID-Hash: JPKEX7VBD232GC5XTTYEUBGJ5TNXG3EJ
X-Message-ID-Hash: JPKEX7VBD232GC5XTTYEUBGJ5TNXG3EJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JPKEX7VBD232GC5XTTYEUBGJ5TNXG3EJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #608 was opened from ReaLcdcLeQi:

The X1E80100-EVK needs basically the same configuration as the X1E80100-CRD.
The dts upstream is already in progress.
https://lore.kernel.org/all/20250828-hamoa_initial-v8-3-c9d173072a5c@oss.qualcomm.com/
message id <20250828-hamoa_initial-v8-3-c9d173072a5c@oss.qualcomm.com>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/608
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/608.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
