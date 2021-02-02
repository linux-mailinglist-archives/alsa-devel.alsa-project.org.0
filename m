Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 070F430B497
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 02:21:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 980B9175C;
	Tue,  2 Feb 2021 02:20:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 980B9175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612228863;
	bh=eFEfmnSlqTDVg6HT2DwzrZ3pJelfcBtVOywlkfWeAVo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JPZdQHKqYSK7zTHtg207kksyosWRYYyYgQoOmL7u14rZzrp6j2y1cXDfxQRcCA9xo
	 dWELIc0LGItqhZFF+8JiCkk57PfFIOCsj8MmsBM5gdJcjnUptja7wO8s7KOrQwlHR6
	 qj3rK61HTS2Z5/oFHi7YxVlDin4Q8n0HJE8l4YaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0C06F80154;
	Tue,  2 Feb 2021 02:19:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D919EF80153; Tue,  2 Feb 2021 02:19:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id A78DCF800E9
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 02:19:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A78DCF800E9
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1612228760758320093-webhooks-bot@alsa-project.org>
References: <1612228760758320093-webhooks-bot@alsa-project.org>
Subject: conf: HDA-Intel: increase the max number of HDMI/DP output to 11
Message-Id: <20210202011929.D919EF80153@alsa1.perex.cz>
Date: Tue,  2 Feb 2021 02:19:29 +0100 (CET)
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

alsa-project/alsa-lib pull request #118 was opened from jason77-wang:

Intel TGL HDMI/DP codec provides 9 pins (Linux kernel, 9a11ba7388f16:
ALSA: hda: hdmi - add Tigerlake support), and with the DP MST enabled,
the linux kernel will build 11 output devices (3, 7, 8, 9, 10, 11, 12,
13, 14, 15, 16), and current alsa-lib only maps the first 8 output
devices, if users plug the HDMI/DP monitor to the last 4 ports, the
users will not see the output device from pulseaudio or gnome.

We have experienced this issue on a dell TGL machine with a dock, we
plugged 2 HDMP/DP monitors on the dock, but we could only see 1
HDMI/DP output device from pulseaudio or gnome, through investigation,
we found one monitor is plugged in the 2nd port from last.

Signed-off-by: Hui Wang <hui.wang@canonical.com>

Request URL   : https://github.com/alsa-project/alsa-lib/pull/118
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/118.patch
Repository URL: https://github.com/alsa-project/alsa-lib
