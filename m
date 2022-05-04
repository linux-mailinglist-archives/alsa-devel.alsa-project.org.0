Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E95175195C4
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 05:18:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F6901E2;
	Wed,  4 May 2022 05:17:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F6901E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651634313;
	bh=w7Lrm0T8vpoAB/s6oda+pZ/Uv36OOU5qala/uVwBsc4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qStMR4smim3xWkjysg2nr++Umng+yJ7hEYw310XNhSLMYiK2/MVHHu1tt92rwC0xY
	 LR7qIFWntqlrQRefeXJd6gsdUOBToMelN1dDONX3rrL93qA6slsw89RCSAjzxmFCsk
	 8vrKaLDEq2EW7tddu/PpPo972tXcmkYtjEjnAVDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E785DF800BF;
	Wed,  4 May 2022 05:17:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92E58F80141; Wed,  4 May 2022 05:17:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 5AF0DF800BF
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 05:17:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AF0DF800BF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1651634249895046949-webhooks-bot@alsa-project.org>
References: <1651634249895046949-webhooks-bot@alsa-project.org>
Subject: pcm: multi: return correct hwptr and avail from snd_pcm_multi_status()
Message-Id: <20220504031733.92E58F80141@alsa1.perex.cz>
Date: Wed,  4 May 2022 05:17:33 +0200 (CEST)
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

alsa-project/alsa-lib pull request #224 was opened from infmagic2047:

Ensure the logic of snd_pcm_multi_status() is consistent with
snd_pcm_multi_avail_update().

Signed-off-by: Yutao Yuan <infmagic2047reg@outlook.com>

Request URL   : https://github.com/alsa-project/alsa-lib/pull/224
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/224.patch
Repository URL: https://github.com/alsa-project/alsa-lib
