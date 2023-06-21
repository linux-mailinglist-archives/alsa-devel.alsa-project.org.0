Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F9E737D34
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 10:18:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1CE7823;
	Wed, 21 Jun 2023 10:17:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1CE7823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687335524;
	bh=oykLuTgnnXO1TFQvJii2789aZ9tCujYeT9SBPHrN8JM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=b9IgrSUu0Mh1r9EuT9JdkgAen/vvgORqzLrhfrBlLrZfejn6ysjukr/c/C35q20e2
	 ltsRm3f7BsGNSrFfyGdwwpeFR9jhnXv8c0ZclFQbzI383O2pKeiNfCfl2IAjfhpiDw
	 8M5OjEHyv4DksDfbIAdQwroUqXporKsAqCWXR5eA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1ADC6F80535; Wed, 21 Jun 2023 10:17:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79260F80132;
	Wed, 21 Jun 2023 10:17:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08570F80141; Wed, 21 Jun 2023 10:17:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id DAC39F80022
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 10:17:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAC39F80022
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1687335444424100637-webhooks-bot@alsa-project.org>
References: <1687335444424100637-webhooks-bot@alsa-project.org>
Subject: acp63: add initial support for AMD Pink Sardine - ACP63
Message-Id: <20230621081727.08570F80141@alsa1.perex.cz>
Date: Wed, 21 Jun 2023 10:17:27 +0200 (CEST)
Message-ID-Hash: TZ2UWMV7P6OCIY7QUFGWELJGGUI25R2Y
X-Message-ID-Hash: TZ2UWMV7P6OCIY7QUFGWELJGGUI25R2Y
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TZ2UWMV7P6OCIY7QUFGWELJGGUI25R2Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #327 was opened from pma1:

Link: #326

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/327
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/327.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
