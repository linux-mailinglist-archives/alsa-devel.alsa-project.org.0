Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 623A9CB2A8A
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Dec 2025 11:17:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1E64601EA;
	Wed, 10 Dec 2025 11:17:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1E64601EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765361838;
	bh=HJIQ8Hay2nNLe+mxbdBLcnFO/wxuMyAUokp0oDaIhMo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Ai+QvbYkUaeQOvOkEhXm0Nd9WVIrR9VLbyKWRlSYU7v56wkN4On7MV0KL1mxX4T1x
	 +3eiAtpZKQ9cMsbm1/b/+lscdo/NYnBnQalt0sQjzjFdoRtOfgz8w8+zpszeU9ONZF
	 5PWL+NBHbjW1KOroCQ02z9lf/lqg91jnHfe8zbcI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 667AFF805DF; Wed, 10 Dec 2025 11:16:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06C9BF80579;
	Wed, 10 Dec 2025 11:16:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F9AEF804F2; Wed, 10 Dec 2025 11:14:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 5543EF80095
	for <alsa-devel@alsa-project.org>; Wed, 10 Dec 2025 11:14:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5543EF80095
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <187fd313063e6700-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/659@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/659@alsa-project.org>
Subject: USB-Audio: Antelope Audio Zen Go: add UCM2 configuration files
Date: Wed, 10 Dec 2025 11:14:31 +0100 (CET)
Message-ID-Hash: 2KVOQKUJLEDGG22VNJJ2HJB4GSEXXAEU
X-Message-ID-Hash: 2KVOQKUJLEDGG22VNJJ2HJB4GSEXXAEU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2KVOQKUJLEDGG22VNJJ2HJB4GSEXXAEU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #659 was opened from ryodeushii:

Add support for Antelope Audio Zen Go SC


[alsa-info.txt](https://github.com/user-attachments/files/24074814/alsa-info.txt)

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/659
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/659.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
