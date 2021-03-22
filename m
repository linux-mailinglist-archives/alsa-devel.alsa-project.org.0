Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C79345249
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 23:10:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD05C15E2;
	Mon, 22 Mar 2021 23:09:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD05C15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616451048;
	bh=cRXAb1mjicrBkxyTQUYGNC2rk0PMI/GSOGA+OlPpt/Y=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VGJQyrIpdwOCIa7PVDLA7TCGRIQqsHC2SovMYXomJ165X8AlY4ZOPUEeh07/I7ihD
	 PIqL50c2zvdPYQK6PcXaWZXgEVJaRK+rMkd1HPlEcjUu9Fkk6n/hIupS2zMnNkeQen
	 iMH9JPiilZgBdRbKRAHexzNDm7Hhj7V6W3qIrCOQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C2F9F80156;
	Mon, 22 Mar 2021 23:09:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD14FF8016B; Mon, 22 Mar 2021 23:09:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 5C4E5F80155
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 23:09:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C4E5F80155
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1616450958551068068-webhooks-bot@alsa-project.org>
References: <1616450958551068068-webhooks-bot@alsa-project.org>
Subject: Correct "rate" option
Message-Id: <20210322220921.BD14FF8016B@alsa1.perex.cz>
Date: Mon, 22 Mar 2021 23:09:21 +0100 (CET)
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

alsa-project/alsa-utils pull request #83 was opened from nootc:

https://github.com/alsa-project/alsa-utils/issues/82
Change "rate" option from "-c" to "-r".

Request URL   : https://github.com/alsa-project/alsa-utils/pull/83
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/83.patch
Repository URL: https://github.com/alsa-project/alsa-utils
