Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3141A985479
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2024 09:48:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BD1FB76;
	Wed, 25 Sep 2024 09:48:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BD1FB76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727250514;
	bh=sDeo/tAjed9YiG368+eNVkKQIoOUK4Ryfl3GcXrixz0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=l5o6xIyl6+80Ymtbnrio1SrFMmdcMLqs/16pWY/sW9cWErxWqw8Ryy+LSTbe+VArZ
	 +qDcmZvJ4V4dFvtzsA8jLcU9TcM1MHr0+0KkUlvzRLpGSMiykhXYNmucWHFE2/keG1
	 zKrdPsYi/CevVb4KevK+rIozd1CtCfs+qVU5xvkw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94A68F8010B; Wed, 25 Sep 2024 09:48:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2B29F8049C;
	Wed, 25 Sep 2024 09:48:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C7DCF802DB; Wed, 25 Sep 2024 09:47:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 90581F80107
	for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2024 09:47:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90581F80107
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1727250463133398771-webhooks-bot@alsa-project.org>
References: <1727250463133398771-webhooks-bot@alsa-project.org>
Subject: rt722: add mic led support
Message-Id: <20240925074758.8C7DCF802DB@alsa1.perex.cz>
Date: Wed, 25 Sep 2024 09:47:58 +0200 (CEST)
Message-ID-Hash: 2CPZF56BGV2FRUPMULY5LEH2O6HCZBWW
X-Message-ID-Hash: 2CPZF56BGV2FRUPMULY5LEH2O6HCZBWW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2CPZF56BGV2FRUPMULY5LEH2O6HCZBWW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #443 was opened from shumingfan:

rt722: add mic led support

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/443
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/443.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
