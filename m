Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5482533477
	for <lists+alsa-devel@lfdr.de>; Wed, 25 May 2022 02:47:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 789CE1654;
	Wed, 25 May 2022 02:46:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 789CE1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653439666;
	bh=ZiavT8JMAa9bWjeDlfs9tGMnMFWqLNlgZY9AiCrw3+w=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hJ8t9uH7xZpLJb05oJ8C8J30XcnDlXn+N5O/bJ7siaEK369+Hg8FjuBKj0TC83yZR
	 q9D7wPJCvPvaBhBl7/hjXuBLPqwjGWHJMGQK0Z8sEQcrLuad0HYNIbAfBCCSsc1pL3
	 kkfhnwPfxqmnAtcp6WjN3xcfpZN4JdUkxQDUqgxM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E280DF804D6;
	Wed, 25 May 2022 02:46:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 747E9F804D1; Wed, 25 May 2022 02:46:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 0F516F80116
 for <alsa-devel@alsa-project.org>; Wed, 25 May 2022 02:46:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F516F80116
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1653439602991985083-webhooks-bot@alsa-project.org>
References: <1653439602991985083-webhooks-bot@alsa-project.org>
Subject: Update mapping for the new Gigabyte Aorus Pro WiFi rev 1.2
Message-Id: <20220525004646.747E9F804D1@alsa1.perex.cz>
Date: Wed, 25 May 2022 02:46:46 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #156 was edited from 13r0ck:

Requires kernel patch from:
https://bugzilla.kernel.org/attachment.cgi?id=301036&action=diff

This doesn't fix the front mic for some reason, as well I am not sure if this will cause a regression for the 1.1 board

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/156
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/156.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
