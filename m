Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AF5652D25
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Dec 2022 08:05:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88A86DE5;
	Wed, 21 Dec 2022 08:05:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88A86DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671606359;
	bh=HE28zBRBlt4AGGvCRo7GwdoclPmDBizGGWcoNj0bm7A=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WoM1kx57ap/aO9FNeYapIWzVmkGx0n7iyHrX+Y7ZTI7fxiDc3SKqWw3ZNxgigVfDW
	 4IyMaypQ40Ej59VekY7wrE3SvNPnFD8u4hxEnpDxs94s0ft6BhM7e9Xs3So6guiHn0
	 VIRE3bZbktsKNVv2hxVZAhVcDoUDdw8kjECnHgCw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20587F801C1;
	Wed, 21 Dec 2022 08:05:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DFBBF801C1; Wed, 21 Dec 2022 08:05:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_DNSWL_HI,SPF_FAIL,SPF_HELO_NONE shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 8DA6BF801C1
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 08:04:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DA6BF801C1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1671606298090306997-webhooks-bot@alsa-project.org>
References: <1671606298090306997-webhooks-bot@alsa-project.org>
Subject: rt715-sdca soundwire micphone record no sound
Message-Id: <20221221070500.4DFBBF801C1@alsa1.perex.cz>
Date: Wed, 21 Dec 2022 08:05:00 +0100 (CET)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

alsa-project/alsa-ucm-conf issue #255 was opened from KaiChuan-Hsieh:

On linux kernel 6.0, with rt715-sdca codec on Dell platform.

The internal mic can't record sound after boot.
Try $ amixer cset name='PGA5.0 5 Master Capture' 1

Then the internal mic can record sound successfully.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/255
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
