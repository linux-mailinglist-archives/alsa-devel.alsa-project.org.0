Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 445EACA3169
	for <lists+alsa-devel@lfdr.de>; Thu, 04 Dec 2025 10:50:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 571C6601C6;
	Thu,  4 Dec 2025 10:50:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 571C6601C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764841857;
	bh=OkIKM80QkQiR9Kiomb4jbV8lLGJpWdkc66yGfOG9DDk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=uowymnCQ0sx21P+ILHVwLVohoKlqQVJDvqf/rBOOQWHK2GPzzaJ6q7GObTgYlgfiE
	 hIf/orzBCm1me9/7jNA/cDtmIMD9fK7BrZu2GaYwVLzQRyxGqRXOMDWQ8Cu/d/lX0V
	 ry0Jm9Q3D8R5uu4d6YGqBm2t/7otICfu7GXk595Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5E67F805C5; Thu,  4 Dec 2025 10:50:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45F53F805C1;
	Thu,  4 Dec 2025 10:50:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2632F80542; Thu,  4 Dec 2025 10:50:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 43F7AF8007E
	for <alsa-devel@alsa-project.org>; Thu,  4 Dec 2025 10:50:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43F7AF8007E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <187dfa48a87e6900-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/644@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/644@alsa-project.org>
Subject: ucm2: sof-soundwire: Update cs42l45 configurations
Date: Thu,  4 Dec 2025 10:50:20 +0100 (CET)
Message-ID-Hash: 5PF4AJLNZDD7AF6SAILSDP66FESSK4W4
X-Message-ID-Hash: 5PF4AJLNZDD7AF6SAILSDP66FESSK4W4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5PF4AJLNZDD7AF6SAILSDP66FESSK4W4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #644 was edited from mstrozek:

Update JackControls to follow machine driver changes [1]

[1] https://github.com/thesofproject/linux/pull/5590

Keeping this PR as a draft until the SOF PR is finalized and merged

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/644
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/644.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
