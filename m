Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F253A5FD41
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Mar 2025 18:14:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B8D960395;
	Thu, 13 Mar 2025 18:14:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B8D960395
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741886098;
	bh=7fejxIuGCM7767/hDyS8efuCVz5gALkh1KjWPS9VGvY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=qcA4AnbWETIT3d2BUa9ICL1soc8EwOY5u4D0g2wDpAmP2u5u8vKnkunyRvPz2RSX5
	 idI6brr5uC50UfvzPG4jU1xjzFpM71JD2Ysvm0Fz1yF8HgHDJd5Dn8vz2aooi0zBUK
	 rmRJkiJGRfalEVgLAf7/m/jlr577iMbmX/oIRm9M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A778F805B3; Thu, 13 Mar 2025 18:14:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3819FF8057B;
	Thu, 13 Mar 2025 18:14:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF425F8026D; Thu, 13 Mar 2025 18:14:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 13E65F8014B
	for <alsa-devel@alsa-project.org>; Thu, 13 Mar 2025 18:14:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13E65F8014B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <182c6c23ba1bc300-webhooks-bot@alsa-project.org>
In-Reply-To: <182c6c23b7987d00-webhooks-bot@alsa-project.org>
References: <182c6c23b7987d00-webhooks-bot@alsa-project.org>
Subject: Need to edit Steinberg configuration files
Date: Thu, 13 Mar 2025 18:14:18 +0100 (CET)
Message-ID-Hash: I4PQJO4BRAXSFFMDASMSC3FVSAR5Q42S
X-Message-ID-Hash: I4PQJO4BRAXSFFMDASMSC3FVSAR5Q42S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I4PQJO4BRAXSFFMDASMSC3FVSAR5Q42S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #519 was opened from AdrianusWest:

I faced a problem with disappearance of HiFi profile in Steinberg UR22C audio card settings.

Attempting to fix it myself did not lead to anything. I addressed the issue to pipewire developers, who pointed out that the existing configuration file needs to be corrected: "The problem here is that previously, the channel splitting was done with ALSA dshare plugin which as it turns out does not require the exact channel numbers to match. As this introduces additional latency, in 1.4.0 the splitting is now done on Pipewire side. But of course there was a nasty surprise (and affects multiple devices), so probably there will be 1.4.1 with a workaround for wrong channel numbers in profiles."

The link to the thread is attached:
https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/4609

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/519
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
