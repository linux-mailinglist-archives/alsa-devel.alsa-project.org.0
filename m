Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 345941FAABD
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 10:07:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B92C116A5;
	Tue, 16 Jun 2020 10:06:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B92C116A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592294821;
	bh=M4TJ+TSJpTiNjpe3jkOebnglXJ0GqGtBw1X0qc+jJxQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WVoLVoDGQ1HGYy0B9ttSnnAiAgczQbOgz9AtkBoxQMUKxHPpMj29bfYL3HKKViCLc
	 rs8r/cKmIyrO/2PVJSRXcxEZd9AJxTetrxabKIFXXBFMjSVMvgKFxsaayPTV8miiIb
	 6bzsSNKtOy23Sj5a6G1NFrfVIBSIXB3iqrf63t+s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89140F80114;
	Tue, 16 Jun 2020 10:05:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D536F80252; Tue, 16 Jun 2020 10:05:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 6DA4CF80232
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 10:05:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DA4CF80232
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1592294717314460993-webhooks-bot@alsa-project.org>
References: <1592294717314460993-webhooks-bot@alsa-project.org>
Subject: low volume libalsa 1.2.3
Message-Id: <20200616080521.1D536F80252@alsa1.perex.cz>
Date: Tue, 16 Jun 2020 10:05:21 +0200 (CEST)
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

alsa-project/alsa-lib issue #60 was edited from texstar:

Sound is about 30% lower with alsa 1.2.3 than with alsa 1.2.2 using the same volume setting. Backing down to 1.2.2 to restore order as the natives are getting stabby.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/60
Repository URL: https://github.com/alsa-project/alsa-lib
