Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D1099D80C
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2024 22:17:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93134857;
	Mon, 14 Oct 2024 22:17:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93134857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728937074;
	bh=xhz9dKsWvEc5PGzx4R8l6bL6jAriuS8z3ttMOwf8VGs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=cLCt06k600IdrEUzUssHac9+s7sXtb4phDFvB6iK7cXpeoVnRK56b6uuX+VrJ+3vx
	 lXjVuiL6rbiYN+HcE3q7SNIEv1BWUUEhTaSJ/va0W9TZQtBkd+MGkyQD9VU9WfUzEN
	 yFV+adC/upCVSKQ+HPnmCDJPvk+8EGz7wNZ6+kV4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 933F5F805B3; Mon, 14 Oct 2024 22:17:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F168FF805B1;
	Mon, 14 Oct 2024 22:17:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA3E1F80448; Mon, 14 Oct 2024 22:17:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E71AF8016B
	for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2024 22:17:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E71AF8016B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1728937036294651747-webhooks-bot@alsa-project.org>
References: <1728937036294651747-webhooks-bot@alsa-project.org>
Subject: ucm2: wsa884x: fix typo in mixer names
Message-Id: <20241014201718.DA3E1F80448@alsa1.perex.cz>
Date: Mon, 14 Oct 2024 22:17:18 +0200 (CEST)
Message-ID-Hash: 5YZVJ7F33KZWSS4G5LXG5K22XLUZUF63
X-Message-ID-Hash: 5YZVJ7F33KZWSS4G5LXG5K22XLUZUF63
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5YZVJ7F33KZWSS4G5LXG5K22XLUZUF63/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #450 was opened from joske:

DTS fix for x1e80100-CRD will be submitted upstream separately

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/450
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/450.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
