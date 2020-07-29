Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5482320B8
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jul 2020 16:37:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3204D16FF;
	Wed, 29 Jul 2020 16:36:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3204D16FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596033451;
	bh=5IvcDcXeH05PNwjf655tQF+x3J7+8oBCwx63HMNNlS0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GKiv7Eez4jI2TVHYXm5CoCbXoVcppD++FdVk24h6o1rJwBIne1Fy0XPHC/EkSHYWl
	 9rRbXrZVvAx1WzmAlgQnB4yQn04k6zGNMLcEN7fmeFR+O9hJmEfv+IQpv/xShFQSAe
	 Jwslc51CfcfZyysACCPqfkU7iM95ip32pjvLCPwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5536CF80171;
	Wed, 29 Jul 2020 16:35:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C614F801A3; Wed, 29 Jul 2020 16:35:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id E5509F80125
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 16:35:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5509F80125
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1596033335422851086-webhooks-bot@alsa-project.org>
References: <1596033335422851086-webhooks-bot@alsa-project.org>
Subject: Race condition when closing the Jack plugin
Message-Id: <20200729143547.3C614F801A3@alsa1.perex.cz>
Date: Wed, 29 Jul 2020 16:35:47 +0200 (CEST)
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

alsa-project/alsa-plugins issue #11 was opened from jeberger:

There is a potential race condition that can cause segmentation faults if the Jack process callback is called between the call to `snd_pcm_jack_stop` and `snd_pcm_jack_hw_free`. This was introduced by revision badd921.

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/11
Repository URL: https://github.com/alsa-project/alsa-plugins
