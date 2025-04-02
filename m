Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8013A79176
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Apr 2025 16:52:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C202601FB;
	Wed,  2 Apr 2025 16:51:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C202601FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1743605520;
	bh=E5D4q4WdOEAsZdnXbEg9Hlg213KuNoutdrwSd/NAdPg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=uOtrO29VmGRVGwwx+8ZYS2eA00twnk+wp1HzF3YHBfccIljtb6QnTwloZnH5FTNLP
	 LFfiQt7bJKpLWR89A8JHsgrcAfZcTPBquZiXJvZl40GEZZK/AtKEpqR+39i7eInBhD
	 ZXmvsifC+4er2yb4gHaJzGnzwFlGIZhGoazUY/uk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42A78F805BF; Wed,  2 Apr 2025 16:51:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20E62F805B4;
	Wed,  2 Apr 2025 16:51:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EB10F80301; Wed,  2 Apr 2025 16:51:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 76379F800D2
	for <alsa-devel@alsa-project.org>; Wed,  2 Apr 2025 16:51:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76379F800D2
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <183287f13961d900-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/540@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/540@alsa-project.org>
Subject: sof-soundwire: cs42l43: Switch mixer based on output volume
Date: Wed,  2 Apr 2025 16:51:18 +0200 (CEST)
Message-ID-Hash: C3MJH2KFGGS6OGQTIB6DYWGOATWE7AL2
X-Message-ID-Hash: C3MJH2KFGGS6OGQTIB6DYWGOATWE7AL2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C3MJH2KFGGS6OGQTIB6DYWGOATWE7AL2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #540 was opened from mstrozek:

Hardware volume control in cs42l43 can go up to +31.5dB which can cause audio degradation. For best results, limit hardware volume to 0dB.

Link: https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/4622

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/540
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/540.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
