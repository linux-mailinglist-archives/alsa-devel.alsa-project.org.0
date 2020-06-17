Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A667F1FC58B
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 07:09:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49F1B167C;
	Wed, 17 Jun 2020 07:08:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49F1B167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592370559;
	bh=AfoyPzENKsY+inaQruKfOrwefpWoppg99Y65nT5LrrY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dRKod1P0obl21quar1TEq+LRpit1+NYHdad7hHm3psB7jib9DBLy7DAi906v24qRD
	 ZKjQMJYkvl+nMipHW1/s1lkhxfVMUjvrzzpCVcPGoI9BJHWU3yFESxXlyapCeSXIPB
	 c4lGpYW4/yrzjGupSVra0B/OhlhSEyJVCcJnKScU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 804CEF800EF;
	Wed, 17 Jun 2020 07:07:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3583F80171; Wed, 17 Jun 2020 07:07:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 97AACF800EF
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 07:07:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97AACF800EF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1592370450217144966-webhooks-bot@alsa-project.org>
References: <1592370450217144966-webhooks-bot@alsa-project.org>
Subject: alsa-gobject: timer/seq: use const qualifier to self argument for
 getter API
Message-Id: <20200617050735.A3583F80171@alsa1.perex.cz>
Date: Wed, 17 Jun 2020 07:07:35 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #40 was opened from takaswie:

In ALSATimer and ALSASeq, some methods have prototype such that self argument don't have const qualifier even if it's getter method.

This patchset adds const qualifier to the methods.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/40
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/40.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
