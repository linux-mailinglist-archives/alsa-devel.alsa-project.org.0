Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DA42189D5
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 16:08:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5814F1675;
	Wed,  8 Jul 2020 16:07:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5814F1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594217295;
	bh=VV/M/UgCgs0AGx62184mVJt1dGkrqvW8zweoCbZ9tb0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BBphfMilKNdSyyLo1Z0gmBpAbosl+SQSPUeTuXTT1hZ8xznTIpQDAS8FFVYV4drIf
	 NjDbZQ9oZxg01uphqpOIYl79p0opA4KCIWuQYbRZ/L7h9xb861Vp3y8JOjJsQSP95W
	 JvIGeL53JcS/X2cZPMqHeIdKbBIdgAuVA2V3it/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C95DF8015A;
	Wed,  8 Jul 2020 16:06:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE756F80150; Wed,  8 Jul 2020 16:06:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C0344F80115
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 16:06:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0344F80115
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1594217177699127913-webhooks-bot@alsa-project.org>
References: <1594217177699127913-webhooks-bot@alsa-project.org>
Subject: French translation update
Message-Id: <20200708140631.AE756F80150@alsa1.perex.cz>
Date: Wed,  8 Jul 2020 16:06:31 +0200 (CEST)
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

alsa-project/alsa-utils pull request #42 was opened from trebmuh:

- fixes spaces
- improvements
- min/MAJ
- update
- new translations
- typo fixes

Request URL   : https://github.com/alsa-project/alsa-utils/pull/42
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/42.patch
Repository URL: https://github.com/alsa-project/alsa-utils
