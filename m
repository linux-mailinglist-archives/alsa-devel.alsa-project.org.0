Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2330C306227
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jan 2021 18:36:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CA8316FF;
	Wed, 27 Jan 2021 17:56:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CA8316FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611766658;
	bh=7y3leCP9tuZa8gpf6D90UngXgLOd5Jn9ZvZN4MYzC2Q=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=viITXe4TRZp40XbRoOrQ0DovirIu+C1EwJY8smBLN60Otl1HON44nz1UJXUolCwR6
	 PnEriq7dfF+0m49mEnsoa3rwO58EKCNKQvKPNUlVaWtQvMIHyHK6P36Sd8IoOul4Xh
	 F+vSk4Um2c7DW/gnpu8lQ+tcpeccPEatxoFSzYOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A3F6F800E9;
	Wed, 27 Jan 2021 17:56:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 839C9F80259; Wed, 27 Jan 2021 17:56:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2CCF9F800F0
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 17:55:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CCF9F800F0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1611766546521182060-webhooks-bot@alsa-project.org>
References: <1611766546521182060-webhooks-bot@alsa-project.org>
Subject: Likely ALSA driver bug in snd_hda_intel per syslog
Message-Id: <20210127165600.839C9F80259@alsa1.perex.cz>
Date: Wed, 27 Jan 2021 17:56:00 +0100 (CET)
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

alsa-project/alsa-utils issue #76 was opened from dhdurgee:

[alsa-bug.log](https://github.com/alsa-project/alsa-utils/files/5881756/alsa-bug.log)

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/76
Repository URL: https://github.com/alsa-project/alsa-utils
