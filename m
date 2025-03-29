Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0493A7547F
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Mar 2025 07:26:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5259A601DB;
	Sat, 29 Mar 2025 07:26:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5259A601DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1743229590;
	bh=craPDOipNIbNU9Ek/hLVqjKXyZnGeM/9UkmWLVTcJq8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=bsd03zuq6aO+gAdZyHoBY3sbTZCd8ApGauv+ElfpGE/WqthLfviClSKdiO08tz+Gc
	 Ya792Kseo4154c+m0SMBYjqeGiYw/RdeJs0v/TIGa0skfIvI4uBLqprKJihdAabw8+
	 2jk/90sweI48naolMscVRX8vOenxdjAH6iic4Nio=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29067F805B6; Sat, 29 Mar 2025 07:25:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18DE0F805BD;
	Sat, 29 Mar 2025 07:25:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 063B5F8055B; Sat, 29 Mar 2025 07:25:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DCE3F80538
	for <alsa-devel@alsa-project.org>; Sat, 29 Mar 2025 07:25:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DCE3F80538
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1831320a1bc55e00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-tools/pr/30@alsa-project.org>
References: <alsa-project/alsa-tools/pr/30@alsa-project.org>
Subject: envy24control: fix control callback for spdif output
Date: Sat, 29 Mar 2025 07:25:52 +0100 (CET)
Message-ID-Hash: ZXHTHC3DGSAQTABMD4GCYE3A6YNBUESY
X-Message-ID-Hash: ZXHTHC3DGSAQTABMD4GCYE3A6YNBUESY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZXHTHC3DGSAQTABMD4GCYE3A6YNBUESY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-tools pull request #30 was opened from andreas56:

Update S/PDIF Output Settings GUI when settings change.

Request URL   : https://github.com/alsa-project/alsa-tools/pull/30
Patch URL     : https://github.com/alsa-project/alsa-tools/pull/30.patch
Repository URL: https://github.com/alsa-project/alsa-tools
