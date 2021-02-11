Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5546319731
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Feb 2021 00:53:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E8DB171E;
	Fri, 12 Feb 2021 00:53:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E8DB171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613087639;
	bh=qnEhJ1BET/0dJB4U3b4xlarw3uzuNczxh6co4PJz+x8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q5S0/3D6hdqNS25/rH182JWeI70NZioWf0DBjEejEYvaTN+7zbvxWA92UaTimPl2/
	 NENfTB8m/dHF2rD+Oj8Qkidy18oBb99Zpcx3OH/eamejo7r+NGMQn47WcGPW8Ais7p
	 s3/fzixwLbC/Cr/XcPaAWOIC0JZevlapFsPA4b08=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F50AF801EB;
	Fri, 12 Feb 2021 00:52:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A41EEF801D5; Fri, 12 Feb 2021 00:52:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 56EEDF80165
 for <alsa-devel@alsa-project.org>; Fri, 12 Feb 2021 00:52:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56EEDF80165
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1613087537999742031-webhooks-bot@alsa-project.org>
References: <1613087537999742031-webhooks-bot@alsa-project.org>
Subject: ucm2/conf.d: add symlinks for Qualcomm cards
Message-Id: <20210211235225.A41EEF801D5@alsa1.perex.cz>
Date: Fri, 12 Feb 2021 00:52:25 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #81 was opened from lumag:

Add ucm2/conf.d symlinks for all defined Qualcomm sound cards.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/81
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/81.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
