Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC519A3630
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2024 08:55:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB840857;
	Fri, 18 Oct 2024 08:54:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB840857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729234502;
	bh=Ex3kvJh1gN7YkF5GJIShs69TI+/PqQa0biQ4bNm2qVU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=aQ6jJzZsfFrarYwUTbZOZhxH1RBWOjkqnnRWX7xQGHOyNoH9npUcD+kSsddZ917nK
	 8NohxoUbNcLMlJfd1RG89OAQ8ZaLQlVpCVCUm4SoNUS+iBBZOwzSdSR0XfuXKPCACV
	 Rah3cksWdOpfIKwIT0cfZgTwuHrP9Jq50AjqbSCk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BDDDF805B2; Fri, 18 Oct 2024 08:54:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B772F805B2;
	Fri, 18 Oct 2024 08:54:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42E3CF80448; Fri, 18 Oct 2024 08:54:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 85B7FF8016B
	for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2024 08:54:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85B7FF8016B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1729234468864535332-webhooks-bot@alsa-project.org>
References: <1729234468864535332-webhooks-bot@alsa-project.org>
Subject: Revert "ucm2: Qualcomm: x1e80100: add USB DisplayPort playback"
Message-Id: <20241018065431.42E3CF80448@alsa1.perex.cz>
Date: Fri, 18 Oct 2024 08:54:31 +0200 (CEST)
Message-ID-Hash: 4NEXG76KGTEQQNVFVIV7GROBLI5SL7BX
X-Message-ID-Hash: 4NEXG76KGTEQQNVFVIV7GROBLI5SL7BX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4NEXG76KGTEQQNVFVIV7GROBLI5SL7BX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #453 was opened from jhovold:

This reverts commit 1dcb58e4fac989bafe0705e49a7f029727207fb3.

The recently added DisplayPort support depends on kernel changes that never made it upstream and has some usability issues that remain to be resolved.

Revert for now to avoid breaking existing setups.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/453
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/453.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
