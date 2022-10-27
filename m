Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE8160FF48
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 19:27:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BD272EC9;
	Thu, 27 Oct 2022 19:26:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BD272EC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666891634;
	bh=2lJdc0zAJOuNbZuXkRIGfJQxLHS9//AEWO1BYsDn03I=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V5m9R0xcECY7wBf9UqfH0C452qV6FH/Sv9rmqWYDxRdQSF5t0g/44+bKx9XENQkya
	 GxCVrj5+NG9rujsHQjkD/y8agygIY0WGqQwzDSV5gYYFUayarp7tJP41k0sKB5sSrl
	 uFmZQ9K94m31VRuLsTfejIsZ19W5hPdEmilv/XZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDA09F80095;
	Thu, 27 Oct 2022 19:26:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 504BEF8025E; Thu, 27 Oct 2022 19:26:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id DB95DF8016C
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 19:26:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB95DF8016C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1666891574834574938-webhooks-bot@alsa-project.org>
References: <1666891574834574938-webhooks-bot@alsa-project.org>
Subject: Add Focusrite Scarlett 2i2 gen2
Message-Id: <20221027172618.504BEF8025E@alsa1.perex.cz>
Date: Thu, 27 Oct 2022 19:26:18 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #234 was opened from superseed:

This is basically #203 but for the 2i2.

I don't really know what I'm doing, but with these changes, I get two separate mono inputs in Pipewire, which is what I was looking for.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/234
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/234.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
