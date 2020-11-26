Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 108812C551B
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Nov 2020 14:16:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 927941798;
	Thu, 26 Nov 2020 14:15:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 927941798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606396568;
	bh=McU6QmCKksaUdzfOjxUE3e9W6kuSdgOq6PWdcgadwUc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=saiH4Vsw9BQLONhCCfJEoZ/nPKW+gut0fv71XCy1pn95MRuxC2QYqOTw75FKVXlMI
	 wb1SQ2fJAoLMcYsAvYoNfG8Lri12CLqUZuOpzQ0PgNOEuOOpIm24bAUDJ6jJAmCdNp
	 ftIF1jY5NMT7aHu4Qfto8l886pEsDtci/rFVijqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3087DF80159;
	Thu, 26 Nov 2020 14:14:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 872B5F80165; Thu, 26 Nov 2020 14:14:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 80642F80159
 for <alsa-devel@alsa-project.org>; Thu, 26 Nov 2020 14:14:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80642F80159
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1606396457981029034-webhooks-bot@alsa-project.org>
References: <1606396457981029034-webhooks-bot@alsa-project.org>
Subject: pcm: snd_pcm_readi - plugin type multi, the overun appears when read
Message-Id: <20201126131431.872B5F80165@alsa1.perex.cz>
Date: Thu, 26 Nov 2020 14:14:31 +0100 (CET)
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

alsa-project/alsa-lib pull request #102 was opened from ouwenchen:

After type route use type multi, merge the two input streams.There was
PCM error due to insufficient readable data.Cause the underlying read
pointer cannot be updated, and then it will be overrun.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/102
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/102.patch
Repository URL: https://github.com/alsa-project/alsa-lib
