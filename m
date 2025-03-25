Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3A3A70513
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Mar 2025 16:32:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC25A601B3;
	Tue, 25 Mar 2025 16:32:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC25A601B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742916736;
	bh=UAOSgUqLDxDJvhKoyksra926/BbESeXDw21oeLpaU/Y=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=XlCG2gWzmOiP2uMjbYB7jjYDU62Spsl2nyiaricdIxSiCPBHql+77b7dBFQBwsmsE
	 M6TpuKkg3FATH1U4FiDkrPfgmcbNcoXJJAHtGs9H7XtDR6nxAcnEuNHCAns1AFwpSY
	 YrW4mAsa4wDg9I6EAmdo2KqCB0GWmSEicyrpWMVU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D053FF805B3; Tue, 25 Mar 2025 16:31:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B8CAF805BD;
	Tue, 25 Mar 2025 16:31:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CB98F800B6; Tue, 25 Mar 2025 16:29:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AD33F800B6
	for <alsa-devel@alsa-project.org>; Tue, 25 Mar 2025 16:29:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AD33F800B6
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <183015638513bc00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/533@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/533@alsa-project.org>
Subject: HDA: Handle better Bass speaker including 4 channel mode
Date: Tue, 25 Mar 2025 16:29:40 +0100 (CET)
Message-ID-Hash: UJX4VZMQPSD63BEYMEZ2F5YRXK2Y63OK
X-Message-ID-Hash: UJX4VZMQPSD63BEYMEZ2F5YRXK2Y63OK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UJX4VZMQPSD63BEYMEZ2F5YRXK2Y63OK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #533 was opened from perexg:

It's a follow up of #410 .

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/533
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/533.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
