Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 153A7A35180
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2025 23:48:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AA4260284;
	Thu, 13 Feb 2025 23:48:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AA4260284
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739486929;
	bh=fs/GUfnAzCduPKxm4zUZmmH9vfnpNKT17fuNxFEDEH8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=JFPbBboYd7Lj+YwP5h04Iq8gtdMAbmRF7X1gcmWbtNsz9dC4XVXTM5DmRbB8UKrDX
	 5cXjJJ1hvNFyO+11uZDuBXFqI6zVcGwroiZLzhGlKq3Eso4n6vxjpCFO3l1cf+RgjE
	 ve4E7F5dnaL4WC5d+6tOaJNmxakGvzIrLpn63fu8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A380F805B4; Thu, 13 Feb 2025 23:48:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DA1CF805B3;
	Thu, 13 Feb 2025 23:48:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02819F80269; Thu, 13 Feb 2025 23:48:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C023F80185
	for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2025 23:47:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C023F80185
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1739486878144608498-webhooks-bot@alsa-project.org>
References: <1739486878144608498-webhooks-bot@alsa-project.org>
Subject: USB-Audio: Add support for RME Fireface UCX II
Message-Id: <20250213224804.02819F80269@alsa1.perex.cz>
Date: Thu, 13 Feb 2025 23:48:03 +0100 (CET)
Message-ID-Hash: KBJMVYFMNZOEVVYNVQY3WAOW2WZKDFKU
X-Message-ID-Hash: KBJMVYFMNZOEVVYNVQY3WAOW2WZKDFKU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KBJMVYFMNZOEVVYNVQY3WAOW2WZKDFKU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #509 was opened from illdefined:

[alsa-info.txt](https://github.com/user-attachments/files/18790978/alsa-info.txt)

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/509
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/509.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
