Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1299D227BC1
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 11:30:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A03851687;
	Tue, 21 Jul 2020 11:29:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A03851687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595323838;
	bh=QWHtwJKUU3ADAtwe27vfJdV515swBvaETRbDIi7y3kI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gVi14TbOeZ0BhRBOhVvioctVEA72N62RICP3xi0LRQH5denFteUr4mr0M61TP1g4B
	 IRv8Hmsp090x35qM//e+cAO+nfLgKFJ0ZwCvY9xxDmwPoGfJC4t+sXqZcRLnPuW7Ij
	 2vH7tDxIw2IBwdOi3qdR+uE+0+yCdWS0QdBGHoQg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A98C4F80268;
	Tue, 21 Jul 2020 11:28:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03D21F8024A; Tue, 21 Jul 2020 11:28:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 6743EF80087
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 11:28:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6743EF80087
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1595323724796334982-webhooks-bot@alsa-project.org>
References: <1595323724796334982-webhooks-bot@alsa-project.org>
Subject: amd/renoir/acp: use the machine driver's name for top-level's conf
Message-Id: <20200721092853.03D21F8024A@alsa1.perex.cz>
Date: Tue, 21 Jul 2020 11:28:53 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #41 was opened from jason77-wang:

On the machines with amd renoir audio, the /sys/class/sound/card2/
device/driver links to /sys/bus/platform/drivers/acp_pdm_mach.

Signed-off-by: Hui Wang <hui.wang@canonical.com>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/41
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/41.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
