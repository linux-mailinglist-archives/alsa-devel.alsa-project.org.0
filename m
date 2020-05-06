Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D36AC1C753B
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 17:43:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FA7D1762;
	Wed,  6 May 2020 17:42:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FA7D1762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588779812;
	bh=DXD2vZ2IaRO7oYu+uhYqyQDDDTM/kE/aawzLtg2/YPM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CPw1e2UJ4WGpHex12TIAs/zzMLFwg6iOqlka53tR7ixKK6JmKMPDZJw5y39Bl4q2P
	 C1A9OPVD7lM1T3A3632zxi0MBIG0DXVLfWgJc8qjHbDpdKq0P7xtoeZDbn4yVhYuOW
	 a0ubrtrbFJ4sdJ643RpgAcO4YA+L1HfjJ4JucZPs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01553F800DF;
	Wed,  6 May 2020 17:42:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73B7BF80258; Wed,  6 May 2020 17:42:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id AB0E1F800DF
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 17:42:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB0E1F800DF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - reopened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1588779732070488930-webhooks-bot@alsa-project.org>
References: <1588779732070488930-webhooks-bot@alsa-project.org>
Subject: [hints] arecord -L show entries which are not capture pcms
Message-Id: <20200506154221.73B7BF80258@alsa1.perex.cz>
Date: Wed,  6 May 2020 17:42:21 +0200 (CEST)
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

alsa-project/alsa-lib issue #39 was reopened from sylware:

arecord -L will show pcms which are not capture pcms (for instance front speakers, surroundX).

Don't know if it is fix-able. Wait for topology/ucm port of classic drivers?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/39
Repository URL: https://github.com/alsa-project/alsa-lib
