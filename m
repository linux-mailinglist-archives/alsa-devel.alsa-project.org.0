Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A15218D98
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 18:54:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56D071669;
	Wed,  8 Jul 2020 18:54:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56D071669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594227293;
	bh=6+IA+dhSI4EEX4SO6nfuDV2AvhaFEgJdbPDOD26sAVU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W7Uk41+riaLKmYib2x86DTz9MS+sc5RZ1RjiF8XcK/CZa9vQUlymMuHGFFs8ziT1n
	 APH3wwcngviZMgD2gjHPKM5q7HsyEGTbafG7cNIIi1+I7ygW5TlLhtNqY9pZxoPP7C
	 J+MwYVztVvkeIvGtBVliBV8FtHrUTeiDtZUI4FuI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45277F8015C;
	Wed,  8 Jul 2020 18:53:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CE35F8015A; Wed,  8 Jul 2020 18:53:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 60453F8011F
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 18:52:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60453F8011F
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1594227177177649975-webhooks-bot@alsa-project.org>
References: <1594227177177649975-webhooks-bot@alsa-project.org>
Subject: Typo fix in aplay.c
Message-Id: <20200708165307.1CE35F8015A@alsa1.perex.cz>
Date: Wed,  8 Jul 2020 18:53:07 +0200 (CEST)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-utils pull request #43 was opened from trebmuh:

HTH

Request URL   : https://github.com/alsa-project/alsa-utils/pull/43
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/43.patch
Repository URL: https://github.com/alsa-project/alsa-utils
