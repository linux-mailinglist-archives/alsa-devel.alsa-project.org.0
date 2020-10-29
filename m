Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8C329E37E
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 06:56:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EE4C950;
	Thu, 29 Oct 2020 06:55:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EE4C950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603950963;
	bh=5GBkczd+ZTuAjq4J9AWbcoD1614GRgj+jLYvDRZ78a4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uQwuINqHFyKZpKYPAHUUnA+eh8r1iEbqJcD7M09tEwe9DpafgSc5YFdgoJkGVXVZY
	 riQ+9V+ltN+mu1+FSxDRnudhSGUyY7NVJFDk35GDzYWFLDUoNzOESDNmyMxA52bRS3
	 Br8VTZvoGOMGY6mVU6UgBMBj6mi9RON0/dkPWsYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C09FBF801D8;
	Thu, 29 Oct 2020 06:54:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2E1BF8020D; Thu, 29 Oct 2020 06:54:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 3479AF800FF
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 06:54:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3479AF800FF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1603950863071362972-webhooks-bot@alsa-project.org>
References: <1603950863071362972-webhooks-bot@alsa-project.org>
Subject: Fix initsetting
Message-Id: <20201029055427.E2E1BF8020D@alsa1.perex.cz>
Date: Thu, 29 Oct 2020 06:54:27 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #57 was opened from jason77-wang:

This issue was found when we prepared ubuntu 20.10. When users install the OS to a machine with HDA codec and use sof driver, the audio output is muted after installation. And even we set the master playback switch to on, the output volume from speaker is too low.

This issue could be easily reproduced by:
sudo rm /var/lib/asla/*
rm ~/.config/pulse/* (optional)
sudo /usr/sbin/alsactl -E HOME=/run/alsa -E XDG_RUNTIME_DIR=/run/alsa/runtime restore

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/57
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/57.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
