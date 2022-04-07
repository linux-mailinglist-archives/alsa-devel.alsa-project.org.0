Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 887C24F8286
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 17:08:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FA1816CD;
	Thu,  7 Apr 2022 17:08:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FA1816CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649344133;
	bh=VIqBtihNVEhTQ521N6isPwqtqp9UpqcTvFwMZBbkst8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m+Scdc8OYROxRa74mqY9I3Yyw0vb0oCyPgxz0bbfYGFvfyJ3r7aC0Wnc5nBs3t/EG
	 X8epP5E/uwZ6m7AxvarhgLf7+sgSijVFkmc1Ka2SeiPFDYG0K0WT/OooMMHBikOJAN
	 0kuOovC8R5lIRR0xPDpqAFC2qYmbBrYTTieQT4hA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B6F3F80141;
	Thu,  7 Apr 2022 17:07:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 240F4F8024C; Thu,  7 Apr 2022 17:07:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id AD1A0F80054
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 17:07:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD1A0F80054
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1649344065101376057-webhooks-bot@alsa-project.org>
References: <1649344065101376057-webhooks-bot@alsa-project.org>
Subject: HDSPMixerOutput.cxx:96: possible typo ?
Message-Id: <20220407150752.240F4F8024C@alsa1.perex.cz>
Date: Thu,  7 Apr 2022 17:07:52 +0200 (CEST)
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

alsa-project/alsa-tools issue #10 was opened from dcb314:

clang says:

HDSPMixerOutput.cxx:96:30: warning: suspicious concatenation of string literals in an array initialization; did you mean to separate the elements with a comma? [-Wstring-concatenation]

Source code is

  "AEB 1", "AEB 2", "AEB 3," "AEB 4"

Maybe better code

  "AEB 1", "AEB 2", "AEB 3", "AEB 4"

Issue URL     : https://github.com/alsa-project/alsa-tools/issues/10
Repository URL: https://github.com/alsa-project/alsa-tools
