Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2956531F78
	for <lists+alsa-devel@lfdr.de>; Tue, 24 May 2022 01:57:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D5ED1710;
	Tue, 24 May 2022 01:57:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D5ED1710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653350279;
	bh=Ci/X35VOlCKjTPchVdjKVCv9/6WIbjjMa5p6y4iM+3k=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lPx3xQcR/AS0bBOAR6iCwj974SnhqrFFeNN0XoK72jIHOa/7N1SJE3yEiLI475fRM
	 v9WEoEtYiM+aUpL2DvvMuo5D1m+pqnIJOoJSfiHz/UAZP8rucbYF5ODQU8yXxYa8WE
	 3lCfkNMSV8pDMgPVFq0Oc78cARX/Kmz5gj/Hmn/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78CBBF8025E;
	Tue, 24 May 2022 01:57:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2EE2F80236; Tue, 24 May 2022 01:56:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 5299FF800CB
 for <alsa-devel@alsa-project.org>; Tue, 24 May 2022 01:56:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5299FF800CB
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1653350215258241892-webhooks-bot@alsa-project.org>
References: <1653350215258241892-webhooks-bot@alsa-project.org>
Subject: GoXLR: Fixed sampler input configuration
Message-Id: <20220523235658.D2EE2F80236@alsa1.perex.cz>
Date: Tue, 24 May 2022 01:56:58 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #155 was opened from FrostyCoolSlug:

Renamed the 'Sample' input channel to 'Sampler' to better reflect it's behaviour, and corrected channel numbers. This fixes sampler capture on the GoXLR.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/155
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/155.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
