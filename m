Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF403E843B
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Aug 2021 22:20:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E7D61760;
	Tue, 10 Aug 2021 22:19:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E7D61760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628626835;
	bh=vH0Sy0anl6Si9RrYUC3n7jXDZ3b1NorZPTWoYqpUCSs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wz2EAyeds1/TszsIrwjEwqyIHlmEkzklzOcnL7jDIMccFFRSiP+lbXlVM/ypw3n9Z
	 WVx3Dk/bGEKYl1bKCWgVZ+2Dn7UZhCiWe/csHK53KNdwyz5cqlyk57A3jg2lMMLbKh
	 3xsmve9zA5QHnZK6clnBfdXJSe1PbUGTKRCyhIWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90641F80279;
	Tue, 10 Aug 2021 22:19:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0FE6F8025D; Tue, 10 Aug 2021 22:19:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 48BCAF800C8
 for <alsa-devel@alsa-project.org>; Tue, 10 Aug 2021 22:19:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48BCAF800C8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1628626741915877104-webhooks-bot@alsa-project.org>
References: <1628626741915877104-webhooks-bot@alsa-project.org>
Subject: Fix alsa-utils building error on NetBSD
Message-Id: <20210810201905.B0FE6F8025D@alsa1.perex.cz>
Date: Tue, 10 Aug 2021 22:19:05 +0200 (CEST)
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

alsa-project/alsa-lib pull request #169 was opened from triaxx:

The following errors occur at least on NetBSD 9.2 amd64 when building
alsa-utils:
include/alsa/output.h:75:66: error: unknown type name 'va_list'; did you mean '__va_list'?
include/alsa/error.h:80:25: error: unknown type name 'va_list'; did you mean '__va_list'?

Request URL   : https://github.com/alsa-project/alsa-lib/pull/169
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/169.patch
Repository URL: https://github.com/alsa-project/alsa-lib
