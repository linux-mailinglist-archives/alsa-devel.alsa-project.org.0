Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F31022A28AB
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Nov 2020 12:04:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A57F16F7;
	Mon,  2 Nov 2020 12:03:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A57F16F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604315088;
	bh=iH6qRBWkilYqQo2H1R4GjTyQjynWiZAhO+cB8qv+N9E=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J5sKDBZI9Apqwds5bPpSpBkvEWFpnzoJzF0wtPHT5cZClID5oXX5ewS3YC1sXubiG
	 Fdirpr31dm60q5LvxSntyTqR92bzNMHuJ4kc09m338Eo0g2BIyhFpFbDIyGUDWg7c1
	 k5huufItnN4OxOLv7uKpGIFKuqLzJkq8KEIsjI5U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD9F0F80229;
	Mon,  2 Nov 2020 12:03:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6749CF80232; Mon,  2 Nov 2020 12:03:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 9027AF8012B
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 12:03:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9027AF8012B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1604314985824170113-webhooks-bot@alsa-project.org>
References: <1604314985824170113-webhooks-bot@alsa-project.org>
Subject: No more sound through HDMI / DisplayPort with 1.2.4
Message-Id: <20201102110314.6749CF80232@alsa1.perex.cz>
Date: Mon,  2 Nov 2020 12:03:14 +0100 (CET)
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

alsa-project/alsa-lib issue #95 was opened from fkroener:

The recent update might have broken HDMI / DisyplayPort sound on my Thinkpad T14 (AMD), using ArchLinux with 5.9.2 kernel.
[old-alsa.log](https://github.com/alsa-project/alsa-lib/files/5474401/old-alsa.log) has the log of pulseaudio -vvvvv after the downgrade; [new-alsa.log](https://github.com/alsa-project/alsa-lib/files/5474402/new-alsa.log) is 1.2.4 - where the device name as well changed. 
Strangely only after a reboot the previous alsa-lib appears to come in effect and working, see: 
[rebooted-alsa.log](https://github.com/alsa-project/alsa-lib/files/5474440/rebooted-alsa.log)

Maybe this is a bug on my side, any pointers would be highly appreciated. I'll happily supply more logs or information if necessary. Thanks.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/95
Repository URL: https://github.com/alsa-project/alsa-lib
