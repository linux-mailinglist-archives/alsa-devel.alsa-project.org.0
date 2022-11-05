Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E670461DF27
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 23:40:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A58086E;
	Sat,  5 Nov 2022 23:39:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A58086E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667688042;
	bh=3QZQqcPqubu16OB7KllWXlNDgbzyz7a4TKDzbFrmGew=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BkWhQ0fj7myaSk0uUd5H+YiaDXpj25vB3hCV8tLTLhxsQi0W7N+rKJ4OrgoW/6Dhh
	 whRs5LDjkcndCOVAIlJenMG/0veYtbsXOntbyvMsr8XXBtIwkwImkmWw+LZzlCuobt
	 m/gMxKqsHFKv0CNP6YBxnl9Svm6hgAkemBiFuDTU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 673E5F8042F;
	Sat,  5 Nov 2022 23:39:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 731FBF803DC; Sat,  5 Nov 2022 23:39:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_FAIL,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 6A948F8012F
 for <alsa-devel@alsa-project.org>; Sat,  5 Nov 2022 23:39:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A948F8012F
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1667687979899627924-webhooks-bot@alsa-project.org>
References: <1667687979899627924-webhooks-bot@alsa-project.org>
Subject: ucm2: add support for "Digidesign Mbox 3"
Message-Id: <20221105223943.731FBF803DC@alsa1.perex.cz>
Date: Sat,  5 Nov 2022 23:39:43 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #237 was opened from ManuLinares:

Add ucm2 support for "Digidesign Mbox 3", 
without it, alsa detects as analog-surround4.0, instead of 2 line and 2 spdif in/out.

[alsa-info.txt](https://github.com/alsa-project/alsa-ucm-conf/files/9944813/alsa-info.txt)

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/237
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/237.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
