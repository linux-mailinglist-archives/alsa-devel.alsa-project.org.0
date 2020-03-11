Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D67180CCF
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 01:28:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59F331666;
	Wed, 11 Mar 2020 01:27:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59F331666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583886487;
	bh=9hkpiENi2fmLYQD7qgRSLsZ13kxlChnihz6mA03rdVw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=peuupTVaa+OlcdNegiRsz5BBV2ZKMPZKQChluU6uYxlPn66Sp1DZNvwSJbtPkxKfN
	 s9wD0VuPZ394QOIcNMp+Ft3KkDEHiu3wbdJtuqUw8w+bGW5yoqVKVWgvQLWqzUVGJT
	 duMjgRoyfnKkBVn5JckvxmABGm3Mh4GneXV1XPOo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5AA7F8021C;
	Wed, 11 Mar 2020 01:26:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 924DBF80217; Wed, 11 Mar 2020 01:26:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 99690F800DA
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 01:26:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99690F800DA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1583886376963728905-webhooks-bot@alsa-project.org>
References: <1583886376963728905-webhooks-bot@alsa-project.org>
Subject: Sample project request...
Message-Id: <20200311002621.924DBF80217@alsa1.perex.cz>
Date: Wed, 11 Mar 2020 01:26:21 +0100 (CET)
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

alsa-project/alsa-lib issue #35 was opened from mnini:

Can you make sample of alsa processor that is have input and output in the code?

I know only syntax of C and I want to program DSP for linux output sound.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/35
Repository URL: https://github.com/alsa-project/alsa-lib
