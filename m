Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5C1CA442B
	for <lists+alsa-devel@lfdr.de>; Thu, 04 Dec 2025 16:30:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2C8B60206;
	Thu,  4 Dec 2025 16:29:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2C8B60206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764862205;
	bh=ECfzbFzfISJDuTRIPfxgVusUXKWys9UcLTECyh+NdCo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=FtdDLQptYzdIWKAhG5y7oQIsUviPtDzNCmyjNr7Rg/bJUDZyARkPVLn9LiRkCsbP2
	 u5Zw08j808OvND7DUdhmLg7kxUrU//27qb+NwZz2Fy1kIn0i+q6ERLO3jlL+8zzD/u
	 7vVLStII2EZWEHasdTqiUKvi95qb/md5f5y0R72A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 138F2F805C8; Thu,  4 Dec 2025 16:29:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD051F805BB;
	Thu,  4 Dec 2025 16:29:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF59CF80542; Thu,  4 Dec 2025 16:29:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B818F8016E
	for <alsa-devel@alsa-project.org>; Thu,  4 Dec 2025 16:29:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B818F8016E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <187e0cc6ff9ba700-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/654@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/654@alsa-project.org>
Subject: DRAFT [for alsa-lib 1.2.15] USB-Audio: add support for conf.d
 configurations
Date: Thu,  4 Dec 2025 16:29:16 +0100 (CET)
Message-ID-Hash: CQM72THT67CAPAUL3VIZLO4RUSAJBMVF
X-Message-ID-Hash: CQM72THT67CAPAUL3VIZLO4RUSAJBMVF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CQM72THT67CAPAUL3VIZLO4RUSAJBMVF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #654 was opened from perexg:

It may be useful to add new or override specific hardware configurations until they are merged to the main USB-Audio.conf file.

BugLink: https://github.com/alsa-project/alsa-ucm-conf/issues/609

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/654
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/654.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
