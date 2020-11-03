Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E8D2A3E4F
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 09:04:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D091E1835;
	Tue,  3 Nov 2020 09:03:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D091E1835
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604390669;
	bh=t2g/N9obupJwYMnsow846hL+0DrS/Q3Fykpd+9s97rc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uouLIKYDxtO4Wa1RYbL+t1C6asW/PKZBLvJg2kkk5VCvMio8oiuD0rZjajK3cxkIx
	 utzzAEHLzeZ+C8lsa9eKUU6TUre8O/9nYjeuO4gmaiHf5TZUN9Bac6a9R0+VH6ecG0
	 QT1HLFsG/xaRbMvntNLSd8xNzhE2++G/7iaEwtWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEB63F805CB;
	Tue,  3 Nov 2020 09:00:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BAA4F805C6; Tue,  3 Nov 2020 09:00:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 779EAF80515
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 09:00:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 779EAF80515
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1604390411503396034-webhooks-bot@alsa-project.org>
References: <1604390411503396034-webhooks-bot@alsa-project.org>
Subject: ucm2:sof-soundwire: Add Support For Dell Privacy Mic Mute LED Control
Message-Id: <20201103080036.9BAA4F805C6@alsa1.perex.cz>
Date: Tue,  3 Nov 2020 09:00:36 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #60 was opened from GoPerry:

Dell is going to add internal microphone mute led control for Dell privacy system,
which has hardware level protection for audio privacy, when mic mute
state is changed, the ucm2 will help to switch the Mic Mute LED state.

Signed-off-by: perry_yuan <perry_yuan@dell.com>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/60
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/60.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
