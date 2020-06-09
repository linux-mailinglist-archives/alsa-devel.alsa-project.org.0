Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B506A1F3223
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 04:02:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 539311672;
	Tue,  9 Jun 2020 04:01:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 539311672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591668120;
	bh=TgyI5V0Uygp5/bLWjP0DCOnlBK5E5v0WAtll4IpmU/k=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o7gZiU7JtKL8iViKkqP0wRkMglSehTwReMcVngtmxTLLbfqfgaJW/6R+LSrUdiFHz
	 9O13zmRhfYlKrufkvWFfqC0W/gbrfF319mXhN+E+11kdzS1c2TBQjDP3H59H5wIGug
	 8kEnY0mV+vAHHwcOcDkOtaRX+y/bRNuxy1nDSbD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 738E3F8028D;
	Tue,  9 Jun 2020 04:00:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0500F8028C; Tue,  9 Jun 2020 04:00:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D5648F80124
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 04:00:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5648F80124
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1591668011967566967-webhooks-bot@alsa-project.org>
References: <1591668011967566967-webhooks-bot@alsa-project.org>
Subject: Update configs for Broadwell devices
Message-Id: <20200609020016.F0500F8028C@alsa1.perex.cz>
Date: Tue,  9 Jun 2020 04:00:16 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #32 was opened from plbossart:

use the SOF card test to reuse legacy configs.

tests require https://github.com/alsa-project/alsa-tests/pull/9

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/32
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/32.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
