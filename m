Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B879A366B
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2024 09:02:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 890527F1;
	Fri, 18 Oct 2024 09:02:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 890527F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729234949;
	bh=HtvD1TfQnLohtRioztL6x04xBEMb46cP+Jg8XPVZT6Q=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=rqaudU3WlFIzuP0bRO+vWWhhTF4v5M4aCtHcnrl/URUj9vT2JwubXCsj65y4QfVIo
	 cBvrOq9r2ldTe8ubh+vZzVaUuBshfFFXnYRQVMn22zwdZ5kxOZKu8CxJyruWyXfI9m
	 VeWrev/9tSrN3M8nUzq9f4253yVv49pU0D9j6Yyg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13E26F80580; Fri, 18 Oct 2024 09:01:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37C1CF805A9;
	Fri, 18 Oct 2024 09:01:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D520F80448; Fri, 18 Oct 2024 09:01:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 89CA1F80149
	for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2024 09:01:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89CA1F80149
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1729234912106848955-webhooks-bot@alsa-project.org>
References: <1729234912106848955-webhooks-bot@alsa-project.org>
Subject: Qualcomm: fix codec initialisation
Message-Id: <20241018070154.3D520F80448@alsa1.perex.cz>
Date: Fri, 18 Oct 2024 09:01:54 +0200 (CEST)
Message-ID-Hash: XPWDPVZDAKGAUNGIUR46KBFMZFQM746G
X-Message-ID-Hash: XPWDPVZDAKGAUNGIUR46KBFMZFQM746G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XPWDPVZDAKGAUNGIUR46KBFMZFQM746G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #454 was opened from jhovold:

Fix the Qualcomm configurations that are using the same identifier for lazy includes of codec initialisation files which means that only the last one is actually included.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/454
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/454.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
