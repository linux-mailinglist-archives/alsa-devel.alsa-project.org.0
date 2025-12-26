Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3723FCDE6DE
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Dec 2025 08:38:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9184E601EC;
	Fri, 26 Dec 2025 08:37:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9184E601EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1766734686;
	bh=5y8aLB9MruEmoDRc1oGdX0zRmLW4x4NVPMkyD2q/V18=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=u6c1z2Jg7MLH469dU7JlEgEZSbu22uBIpQcZ321mCF9YeVNSW49sWjr7KZm7Nf+yh
	 AGKlvsLCVcKyD/WEXQkDpigIOPeEpcsnnAxwUSQlHGdZNAQuauSKrKZRqCgt42GU7v
	 PXaTebuYE/bDYJ1pRb38wLHPC+yL+zLeV2Hexq5U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22EB8F805D6; Fri, 26 Dec 2025 08:37:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AA35F805D9;
	Fri, 26 Dec 2025 08:37:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 288A7F8025F; Fri, 26 Dec 2025 08:36:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id C3E78F800BA
	for <alsa-devel@alsa-project.org>; Fri, 26 Dec 2025 08:36:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3E78F800BA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1884b3bc82d21300-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-tools/pr/44@alsa-project.org>
References: <alsa-project/alsa-tools/pr/44@alsa-project.org>
Subject: envy24control: update README
Date: Fri, 26 Dec 2025 08:36:25 +0100 (CET)
Message-ID-Hash: RNVHDIEHMRYRR25LQJGZ2XIMZLBEW7MG
X-Message-ID-Hash: RNVHDIEHMRYRR25LQJGZ2XIMZLBEW7MG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RNVHDIEHMRYRR25LQJGZ2XIMZLBEW7MG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-tools pull request #44 was opened from qaqland:

A minor change to prevent downstream from mistakenly removing this GTK4-based package when dropping GTK2.

Request URL   : https://github.com/alsa-project/alsa-tools/pull/44
Patch URL     : https://github.com/alsa-project/alsa-tools/pull/44.patch
Repository URL: https://github.com/alsa-project/alsa-tools
