Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E31C426ADE
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Oct 2021 14:33:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3BCF168A;
	Fri,  8 Oct 2021 14:32:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3BCF168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633696408;
	bh=AM5VMmIQ7NX3YuqhiEXJ230+mkXq4fnwtGBo4zB0Evs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hR9CMPW4MRox/6PXLVhX4rB1XU8//FWfHIGl7E9KzJpRA1w6idDbQH4b/3gv4vzGV
	 fvuP/fP+p3ejTODbMJBL7frVDd8YtOQYB6vLAjub5HWqkgeJ5B1JsJsJu3xPxdre19
	 h4VUFEZY/g8ZHMIKGTz4tm1Rd+z5U3HVzMSHJ0s4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1281DF80249;
	Fri,  8 Oct 2021 14:32:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A88F6F80246; Fri,  8 Oct 2021 14:32:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 49706F80124
 for <alsa-devel@alsa-project.org>; Fri,  8 Oct 2021 14:32:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49706F80124
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1633696322948684931-webhooks-bot@alsa-project.org>
References: <1633696322948684931-webhooks-bot@alsa-project.org>
Subject: alsabat returns 0 when more than 1 signal is found and all are near DC
Message-Id: <20211008123209.A88F6F80246@alsa1.perex.cz>
Date: Fri,  8 Oct 2021 14:32:09 +0200 (CEST)
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

alsa-project/alsa-utils issue #114 was opened from hollerdawg:

alsabat should return -EDCONLY (-1002) when only dc signals can be found and there's more than 1 signal but instead returns 0.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/114
Repository URL: https://github.com/alsa-project/alsa-utils
