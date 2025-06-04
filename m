Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E56BAACD78C
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jun 2025 07:48:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 044C5601EA;
	Wed,  4 Jun 2025 07:48:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 044C5601EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749016107;
	bh=OqiTMkvuu10NJ9WrhTk/AK0vrC/cK8QP7SFuqa+o9EY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=pZotWzJipBfRtfCmTgk75fS6Ze7d3lbUAwFBzjlgJ/eVJ0OCznpscap9dR2bH3h6V
	 87ktmugtULHJVI7IS0FmnAKc415WGSVSFsDAeFjjBfJzWvSZl6UbQDIXhXyItoLxIV
	 dh5CNw+FJ0Oq4YLwZJZkmzR9FlVIOEUw4HIER8Qg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8390F805BE; Wed,  4 Jun 2025 07:47:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2E6FF805BE;
	Wed,  4 Jun 2025 07:47:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85ED1F8028B; Wed,  4 Jun 2025 07:47:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 9442EF800FA
	for <alsa-devel@alsa-project.org>; Wed,  4 Jun 2025 07:47:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9442EF800FA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1845c0d7c5184d00-webhooks-bot@alsa-project.org>
In-Reply-To: <1845c0d7c501a000-webhooks-bot@alsa-project.org>
References: <1845c0d7c501a000-webhooks-bot@alsa-project.org>
Subject: alsabat: fills /tmp until out of memory
Date: Wed,  4 Jun 2025 07:47:47 +0200 (CEST)
Message-ID-Hash: D2X5P4EZDCH4E3S5DCGDAOEVD7JQS2VJ
X-Message-ID-Hash: D2X5P4EZDCH4E3S5DCGDAOEVD7JQS2VJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D2X5P4EZDCH4E3S5DCGDAOEVD7JQS2VJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #301 was opened from eurofun:

alsabat creates its capture file by using mkstemp() in bat.c. So it creates a new file under /tmp each time it runs (at least when
configured to capture something...) and never removes any until no space is left.
I propose it should by default delete the files it opened after analysis and keep the current behavior as an option in order 
to allow inspecting captured files after alsabat ran. Or alternatively an option to specify the capture filename.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/301
Repository URL: https://github.com/alsa-project/alsa-utils
