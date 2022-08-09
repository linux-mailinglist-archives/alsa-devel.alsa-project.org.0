Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E8058DD5C
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Aug 2022 19:42:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65B6C836;
	Tue,  9 Aug 2022 19:41:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65B6C836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660066922;
	bh=btuZL0Abdx4jmwiQUkXSXVhn/SzwUswiLeWzX7I4axE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sbvVRMjJXggXwg8yBhBjVOkrLdkzm53Dkiq+3iHRdtk6+AsdkrDRBU3kyBOp0pU7p
	 AtIbYA2fbW9LHc2k/gnGhthdSshi4M0iKDpxrdbXIWYUVTfkOlxdGeGxVn14XcILa3
	 8HDV+DuG0lyyfd+bb1M+NM5vEFHGe8JEdu91x0aE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8156F8012A;
	Tue,  9 Aug 2022 19:41:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03052F80132; Tue,  9 Aug 2022 19:41:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=5.0 tests=MISSING_DATE,MISSING_MID,
 PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 37DD8F8012A
 for <alsa-devel@alsa-project.org>; Tue,  9 Aug 2022 19:40:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37DD8F8012A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1660066859580853939-webhooks-bot@alsa-project.org>
References: <1660066859580853939-webhooks-bot@alsa-project.org>
Subject: Behringer UMC204HD audio delay
Message-Id: <20220809174103.03052F80132@alsa1.perex.cz>
Date: Tue,  9 Aug 2022 19:41:03 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #198 was opened from vostok01:

After update from 1.2.6.3 to 1.2.7.2, there was a desynchronization of audio and video. The sound is delayed by about 400 ms. Sometimes the out-of-sync disappears, but then it reappears. The sound is output via pulseaudio.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/198
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
