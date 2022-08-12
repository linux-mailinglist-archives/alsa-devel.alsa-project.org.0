Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA319590BD8
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Aug 2022 08:10:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E7E9820;
	Fri, 12 Aug 2022 08:10:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E7E9820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660284659;
	bh=uzMJFzBLfTNgKjWDIl0zZSYZaa/INcnNEkr5UeJsyT0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ujYjePkQ387iDNSSvuTF8DpYYiUGg6BXYAGKWhLw1sbr6igK2WEGtDBmm2EzEdC9Z
	 uIT6kWqqQYtoZm1QQedvjZioUaR+5Kr/R5zcmQLVnsSJDo51AigCLBvGu+NxLFxVV7
	 HRTPvHmfkapDdzX46uCCJMHPZHo/4x1KKx8oXBxY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FF20F80054;
	Fri, 12 Aug 2022 08:10:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26229F8026A; Fri, 12 Aug 2022 08:09:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 3E950F80054
 for <alsa-devel@alsa-project.org>; Fri, 12 Aug 2022 08:09:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E950F80054
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1660284592628407001-webhooks-bot@alsa-project.org>
References: <1660284592628407001-webhooks-bot@alsa-project.org>
Subject: Include <sys/soundcard.h> instead of <linux/soundcard.h>
Message-Id: <20220812060958.26229F8026A@alsa1.perex.cz>
Date: Fri, 12 Aug 2022 08:09:58 +0200 (CEST)
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

alsa-project/alsa-oss pull request #3 was opened from davidebeatrici:

The `linux` folder strictly contains kernel headers, including OSSv3's.

A distribution may package the OSS development header(s) separately.

Request URL   : https://github.com/alsa-project/alsa-oss/pull/3
Patch URL     : https://github.com/alsa-project/alsa-oss/pull/3.patch
Repository URL: https://github.com/alsa-project/alsa-oss
