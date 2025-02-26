Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7FCA458B4
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2025 09:45:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 830B86020D;
	Wed, 26 Feb 2025 09:45:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 830B86020D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740559552;
	bh=pV3igzPnOpW+6SSx3pnjAIIBAy/QEcAPsiGwjwYUfFg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=KkPSjTU37ei+hu95Ufaow7I6lL0IU64XsmOSj9oa5PlKTIRLxtA95QgzSFD7ufHaD
	 HhGIYkVUd5g/rPBbDkdVGxlhAv9eHiMPOXoiHwXf8dzQIkO74es8fSnSep1Txd0/rt
	 fMmDrUJssjh7ZVTVKuDpGtPJbjPtJw4oyJGG0ipg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7ABBF805AE; Wed, 26 Feb 2025 09:45:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B37AF805B2;
	Wed, 26 Feb 2025 09:45:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A79FBF8016E; Wed, 26 Feb 2025 09:44:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id C2CF0F800E5
	for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2025 09:44:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2CF0F800E5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1740559488369824409-webhooks-bot@alsa-project.org>
References: <1740559488369824409-webhooks-bot@alsa-project.org>
Subject: add rt713 & rt1318 LED control
Message-Id: <20250226084451.A79FBF8016E@alsa1.perex.cz>
Date: Wed, 26 Feb 2025 09:44:51 +0100 (CET)
Message-ID-Hash: Z2M63JE5ZCAYHHWXETXLBEIERUK5A2SM
X-Message-ID-Hash: Z2M63JE5ZCAYHHWXETXLBEIERUK5A2SM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z2M63JE5ZCAYHHWXETXLBEIERUK5A2SM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #512 was opened from shumingfan:

add rt713 & rt1318 LED control

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/512
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/512.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
