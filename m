Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EC4CC1AB6
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Dec 2025 09:55:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73FA560214;
	Tue, 16 Dec 2025 09:55:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73FA560214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765875326;
	bh=F3asDb980XKZeXBCFRz7hnsKLAQeE3ZUPGf0f4p44V0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ecN7lRX0ZcEtVXSNiLHdcq3PW3JF1uxl5etmwjy0HTyrjq0BwuT1pmIZnmfhlL2+G
	 VbZD9m1Gf6P5JvkoQb2z0aNQccRW7zbfINooB8+lETpqdt4r/55zJVOS5DWdZOqcVb
	 MUI1qhHTLfnlZQUl5BY2jm39g7oksAJxwrWCx6jY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8775F805D9; Tue, 16 Dec 2025 09:54:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1196EF805D7;
	Tue, 16 Dec 2025 09:54:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32529F80217; Tue, 16 Dec 2025 09:54:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AAF2F800DF
	for <alsa-devel@alsa-project.org>; Tue, 16 Dec 2025 09:54:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AAF2F800DF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1881a630de4f3300-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-lib/pr/490@alsa-project.org>
References: <alsa-project/alsa-lib/pr/490@alsa-project.org>
Subject: mixer: fix cache coherency issue in multi-application scenario
Date: Tue, 16 Dec 2025 09:54:20 +0100 (CET)
Message-ID-Hash: EMF65WWE363SQZYJYL5ACX47C6F6H75X
X-Message-ID-Hash: EMF65WWE363SQZYJYL5ACX47C6F6H75X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EMF65WWE363SQZYJYL5ACX47C6F6H75X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #490 was edited from DevreeseJorik:

Remove conditional hardware writes in set_volume_ops and set_switch_ops to ensure hardware state is always updated. This fixes an issue where setting controls to the same value repeatedly does nothing, even if the hardware state has changed due to actions from other applications.

---

Given this code has been in alsa-lib for 20 years, I assume there is a good reason for it, or perhaps a workaround exists that I could not find. 

The issue we faced is that after an initial write, if the same value is written again, but in the meantime a different application altered the hardware state, the new change will not occur, yet no error code is provided. Also, reading the current state returns the current application's state, rather than the actual hardware state. Is alsa-lib not designed with multi-application uses in mind?

Request URL   : https://github.com/alsa-project/alsa-lib/pull/490
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/490.patch
Repository URL: https://github.com/alsa-project/alsa-lib
