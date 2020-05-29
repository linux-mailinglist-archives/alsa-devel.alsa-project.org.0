Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0E91E78BF
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 10:49:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE25117BC;
	Fri, 29 May 2020 10:48:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE25117BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590742188;
	bh=TC60nvQnIqmGFzkoLTyvV/4wijTkHESimWf/eSJzrA0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CwoZ1vpjhJtKTQZoj8BWx7o+Go97arAjjuueHQWZdyUGZkAqysktIn6al96t++cM8
	 i8HWKUM3eHn5C5CbxVHOoMKT/VWTdiMQpHYnBSrloWIdovjFWlzozn/49avSDMK/wc
	 udphz/dMv1PE5H0WeMYSte1KRvyzgg6uF+Azfroo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3964F80107;
	Fri, 29 May 2020 10:48:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DBF9F8014E; Fri, 29 May 2020 10:48:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B4793F80125
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 10:48:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4793F80125
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1590742078655210972-webhooks-bot@alsa-project.org>
References: <1590742078655210972-webhooks-bot@alsa-project.org>
Subject: alsa-ucm.c: UCM not available for card sof-bytcr-rt5640
Message-Id: <20200529084805.8DBF9F8014E@alsa1.perex.cz>
Date: Fri, 29 May 2020 10:48:05 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #28 was opened from youling257:

(  30.692|   0.006) I: [pulseaudio] (alsa-lib)main.c: error: failed to import hw:0 use case configuration -2
(  30.693|   0.000) I: [pulseaudio] (alsa-lib)main.c: error: failed to import sof-bytcr-rt5640 use case configuration -2
(  30.693|   0.000) I: [pulseaudio] alsa-ucm.c: UCM not available for card sof-bytcr-rt5640

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/28
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
