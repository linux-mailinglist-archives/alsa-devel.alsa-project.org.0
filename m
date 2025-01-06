Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46822A02885
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jan 2025 15:51:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EF536025D;
	Mon,  6 Jan 2025 15:50:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EF536025D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1736175068;
	bh=idQCN1WmTJydOJAJfpEmUyaI0+ZRmnErCyv1Rl8MVIM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=mVlA/1kfO1BE+I1XkVYavJDOqxHh6mq7tPVFA6H6ekuvAdNm94Zw/VwFUnm10QJBc
	 AR8LNcUghfcDZsiJDuQdcPqqy6s7OUSdr4SqsI+9PFzz0ikOOWP1lOCIumtQ3jBziS
	 Gip4V6jLAKQDG3WJqQBTUF7E05HhcaojV9HFvA/w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5657FF805B4; Mon,  6 Jan 2025 15:50:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CFFE3F805BA;
	Mon,  6 Jan 2025 15:50:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16325F8045D; Mon,  6 Jan 2025 15:50:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id D6960F800C1
	for <alsa-devel@alsa-project.org>; Mon,  6 Jan 2025 15:50:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6960F800C1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1736175019198570967-webhooks-bot@alsa-project.org>
References: <1736175019198570967-webhooks-bot@alsa-project.org>
Subject: headers: make more headers self-contained
Message-Id: <20250106145025.16325F8045D@alsa1.perex.cz>
Date: Mon,  6 Jan 2025 15:50:25 +0100 (CET)
Message-ID-Hash: H3N6Y2Y7VMAOCQEM6DZ2DQPVWBDMGHB6
X-Message-ID-Hash: H3N6Y2Y7VMAOCQEM6DZ2DQPVWBDMGHB6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H3N6Y2Y7VMAOCQEM6DZ2DQPVWBDMGHB6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #435 was opened from timblechmann:

Some IDEs parse headers in isolation to populate their code model. This exposes some missing headers, mainly for alsa internal struct definitions, ssize_t (requiring sys/types.h), size_t (requiring string.h), va_args (requiring stdargs.h) or FILE (requiring stdio.h)

This patch makes the main headers parsable by qtcreator

Request URL   : https://github.com/alsa-project/alsa-lib/pull/435
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/435.patch
Repository URL: https://github.com/alsa-project/alsa-lib
