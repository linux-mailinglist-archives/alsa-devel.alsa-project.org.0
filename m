Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D3D1A69E3
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Apr 2020 18:28:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0878416A4;
	Mon, 13 Apr 2020 18:27:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0878416A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586795282;
	bh=ZtSw/ynOZlGCFCEBSdGGsERaRW2z/mdeXGM18Qw7qq0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gSCek0nWnCbj8kW+x1AVBwZ4NIhqgav5YzS4NVsMNQ1Zp35+hy9hpnyqW4DlZ7LHo
	 Fov6xpHPdnsV2Rb0iESDPXqiNTKcj4YXH0qmFh8z0rQAjQIiAUvcGO4xQCxPNskRXn
	 o1ntfozKT+2TXzNcNx50dXD2Y9eLwyJqYTQnq4is=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52EC4F8025F;
	Mon, 13 Apr 2020 18:26:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E7C9F80266; Mon, 13 Apr 2020 18:25:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id ADEB9F8025F
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 18:25:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADEB9F8025F
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1586795156453360081-webhooks-bot@alsa-project.org>
References: <1586795156453360081-webhooks-bot@alsa-project.org>
Subject: SOF support for Baytrail/CherryTrail
Message-Id: <20200413162559.3E7C9F80266@alsa1.perex.cz>
Date: Mon, 13 Apr 2020 18:25:59 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #20 was edited from plbossart:

Add symlink and simple test to reuse legacy settings as is.

tested on Baytrail/Asus T100TA only with SOF and legacy drivers, all other platforms are just based on same changes.

sof-bytcr-rt5640 is here:
 http://alsa-project.org/db/?f=6f8be0520e2bbda94cb744ce66232174feec03d4

UCM validator seems to have problems with the conditional statement?

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/20
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/20.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
