Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9958DA2BED1
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 10:10:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFE156024F;
	Fri,  7 Feb 2025 10:09:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFE156024F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738919407;
	bh=lAyGMCnnW6egsd8Ss0hNrj7mZoySnEPuL8GjsKC6BRQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=VOM/iTrAL17PCjE4eCQM9dMVAzukaAByOAeW9RXbdLvG5qTUq+Ex0cyxw3O3nKTyB
	 cjNgnkRjFXeU4XmZcLP0Ov+nLsVYpeqT3HdPpBQ3jUVH+ws4KdQXuXsOYC7dH2YE5M
	 AqgJNv9DIRafmvGJPB19gWPQyVUhjeEQCUnhSkvE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 953AAF805B3; Fri,  7 Feb 2025 10:09:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 493FAF805B6;
	Fri,  7 Feb 2025 10:09:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 474F6F80246; Fri,  7 Feb 2025 10:09:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FBEEF800B8
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 10:09:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FBEEF800B8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1738919348656884670-webhooks-bot@alsa-project.org>
References: <1738919348656884670-webhooks-bot@alsa-project.org>
Subject: rt722: change output volume of speaker to 0dB
Message-Id: <20250207090913.474F6F80246@alsa1.perex.cz>
Date: Fri,  7 Feb 2025 10:09:11 +0100 (CET)
Message-ID-Hash: 3JEQ23ANM4O6L4MWE56J7H4CUGYARBPW
X-Message-ID-Hash: 3JEQ23ANM4O6L4MWE56J7H4CUGYARBPW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3JEQ23ANM4O6L4MWE56J7H4CUGYARBPW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #506 was opened from shumingfan:

This patch also changes hardware gain to software gain when using volume bar.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/506
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/506.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
