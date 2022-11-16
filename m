Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B395062B6AF
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 10:39:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52BAF1695;
	Wed, 16 Nov 2022 10:38:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52BAF1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668591559;
	bh=9Qk+vi5YQVfAOSKjqx2oexb0RXKBk8G1UxGl8Pfi5Os=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K/EEAWOFPx59uFdqOntIPu6adsihmQdJzGcgAylTCAlsrjfmDdMh2BRdNRUiY4jWe
	 eb+de3VQLzsn3osjw+4lu9/H0xy7vGKzy18XJshifyacNeZTGGuatlbN4md5sbtuoA
	 zqBUyg6A+7xHHhM0GXuHvuZv6oAvtMWMsCBUKv48=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D23C6F80238;
	Wed, 16 Nov 2022 10:38:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82985F80169; Wed, 16 Nov 2022 10:38:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 7B830F800B8
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 10:38:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B830F800B8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1668591496425622940-webhooks-bot@alsa-project.org>
References: <1668591496425622940-webhooks-bot@alsa-project.org>
Subject: ucm2: sof-soundwire: add basic settings for RT1318 SDCA device
Message-Id: <20221116093823.82985F80169@alsa1.perex.cz>
Date: Wed, 16 Nov 2022 10:38:23 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #242 was opened from shumingfan:

Add support for rt1318 amplifier

Signed-off-by: Shuming Fan <shumingf@realtek.com>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/242
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/242.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
