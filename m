Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C40C0B386CC
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Aug 2025 17:39:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AC966025E;
	Wed, 27 Aug 2025 17:38:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AC966025E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756309147;
	bh=aeVGeTGTKNmHxmfAffAgwnNvKvo0D2V9yDQ5uFY83/4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=jFvsBm9T4+J5yQXpr88N60FfhXsb5+YSOlNa2Rvzp0DGgWcxWaMNC8k3NvmzcJnZ6
	 MlzyTnliyNiizoz/AMROF7+b3i/2tgTyYhOr/WL3PqWjQXZtxKUhc5Bun+xRpyyCVe
	 7jAoz+85VUZtfmrv7sMXWG8DA2JIYfFjPLt+gNug=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60E17F805BE; Wed, 27 Aug 2025 17:38:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E30DF805BF;
	Wed, 27 Aug 2025 17:38:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85EF4F80495; Wed, 27 Aug 2025 17:38:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B8B9F800DF
	for <alsa-devel@alsa-project.org>; Wed, 27 Aug 2025 17:38:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B8B9F800DF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <185fa9cd986f6900-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/606@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/606@alsa-project.org>
Subject: Add UCM for RME Fireface UCX
Date: Wed, 27 Aug 2025 17:38:04 +0200 (CEST)
Message-ID-Hash: TGT6MXJRMSL2YJ6ETSDMKBAKKJ6JOILB
X-Message-ID-Hash: TGT6MXJRMSL2YJ6ETSDMKBAKKJ6JOILB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TGT6MXJRMSL2YJ6ETSDMKBAKKJ6JOILB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #606 was opened from vascosantos:

Adds UCM for RME Fireface UCX (heavily based on RME Fireface UCX II config).
Device is assumed in CC mode.
#605

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/606
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/606.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
