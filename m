Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 067DE53DE49
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jun 2022 23:09:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1B4E188F;
	Sun,  5 Jun 2022 23:08:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1B4E188F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654463361;
	bh=y3J57NqSbDXLWt/LcUJH8Wq2LhdFATKlXd6oCIS+dUg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FIp59EGllAB/jHhLXrKBO3tSqzymdvey47y9a62H00E7dusDSMVt1e1yEjkQVGXOd
	 PgTpNNdeUS76+yomNMdaTXIm02VgyHeJC2ymoXrvyMOctrj9jxifsr1Uv2o3Ib05cz
	 aHpGjrJNnuFhXPVahz1BAYser3WWEFgpPQvWJ5S8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AE23F8016C;
	Sun,  5 Jun 2022 23:08:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CCA6F80089; Sun,  5 Jun 2022 23:08:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=5.0 tests=MISSING_DATE,MISSING_MID,
 PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id F1BD0F80116
 for <alsa-devel@alsa-project.org>; Sun,  5 Jun 2022 23:08:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1BD0F80116
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1654463295162611961-webhooks-bot@alsa-project.org>
References: <1654463295162611961-webhooks-bot@alsa-project.org>
Subject: HDMI audio broken in 1.2.7 for old laptops
Message-Id: <20220605210822.3CCA6F80089@alsa1.perex.cz>
Date: Sun,  5 Jun 2022 23:08:22 +0200 (CEST)
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

alsa-project/alsa-lib issue #235 was opened from hwpfeil:

Tag 1.2.7 breaks HDMI audio on HP laptops with AMD A6-5200 APU (video works). No HDMI option in System Settings|Audio Devices, both KDE and XFCE. Reverting to 1.2.6.1 restores the HDMI Audio Device. There should come a time when such dinosaurs are declared obsolete and no longer supported. They can keep running on 1.2.6.1. Not sure if it needs fixing.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/235
Repository URL: https://github.com/alsa-project/alsa-lib
