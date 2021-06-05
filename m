Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2148A39CB93
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Jun 2021 00:59:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 815C31715;
	Sun,  6 Jun 2021 00:59:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 815C31715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622933992;
	bh=kGtEiEQOW49zXcv6ikqKgWbsZzdPOgmrSCWmLrHgDsU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ERZ5+uAysHpGw9uTI3JD317RiBWzGPBAvC6wLGdURXtzToytaGEqP+i2WCFFA+eVo
	 JaeRJOo3XBa47gGAjBDUz8/MKQqjyqAL/GNrByI7CcwjrkAHEM+ZBofuR1dOCLAiOM
	 NVzdwXrXVrSCq8oYN2LIoqRwjNdk767MTye/hjjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E697EF80254;
	Sun,  6 Jun 2021 00:58:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDE70F80253; Sun,  6 Jun 2021 00:58:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D1D81F80155
 for <alsa-devel@alsa-project.org>; Sun,  6 Jun 2021 00:58:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1D81F80155
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1622933884811094999-webhooks-bot@alsa-project.org>
References: <1622933884811094999-webhooks-bot@alsa-project.org>
Subject: alsa-ucm-conf 1.2.5 broke front headphone output on pipewire-pulse
Message-Id: <20210605225814.BDE70F80253@alsa1.perex.cz>
Date: Sun,  6 Jun 2021 00:58:14 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #98 was opened from amezin:

After upgrade to 1.2.5, front headphone output isn't working.
In GNOME Settings, when I select front headphone output and click "Test", it shows a dialog with text "Click a speaker to test", but there are no buttons to click.

`systemctl --user status pipewire` shows this:

    Jun 06 04:40:30 trx40 systemd[2732]: Started Multimedia Service.
    Jun 06 04:40:41 trx40 pipewire[44766]: '_ucm0005.hw:ALC1220VBDT,2': playback open failed: No such device
    Jun 06 04:40:41 trx40 pipewire[44766]: adapter 0x559741478670: can't get format: No such device
    Jun 06 04:40:41 trx40 pipewire[44766]: usage: node.name=<string>
    Jun 06 04:40:41 trx40 pipewire[44766]: '_ucm0005.hw:ALC1220VBDT,1': playback open failed: No such device
    Jun 06 04:40:41 trx40 pipewire[44766]: adapter 0x559741530560: can't get format: No such device
    Jun 06 04:40:41 trx40 pipewire[44766]: usage: node.name=<string>

Downgrading alsa-ucm-conf to 1.2.4 fixes the issue

Tried pipewire 0.3.29 and pipewire git master
Though with pulseaudio 14.2 the output works
Motherboard: ASUS ROG Strix TRX40-E

With alsa-ucm-conf 1.2.4 - output working:
alsa-info.sh output: [alsa-info-good.txt](https://github.com/alsa-project/alsa-ucm-conf/files/6603363/alsa-info-good.txt)
pw-dump output: [pw-dump-good.txt](https://github.com/alsa-project/alsa-ucm-conf/files/6603365/pw-dump-good.txt)

With alsa-ucm-conf 1.2.5 - output not working:
alsa-info.sh output: [alsa-info-bad.txt](https://github.com/alsa-project/alsa-ucm-conf/files/6603362/alsa-info-bad.txt)
pw-dump output: [pw-dump-bad.txt](https://github.com/alsa-project/alsa-ucm-conf/files/6603364/pw-dump-bad.txt)

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/98
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
