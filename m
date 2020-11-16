Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 678732B3BAC
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Nov 2020 04:08:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DE2B179B;
	Mon, 16 Nov 2020 04:07:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DE2B179B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605496092;
	bh=F/1BeAlgpWEC9J/1HkQktcgCv1JdIFewGl8y2XO6AYQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FKJi82nyGrrtkhI0YUXCo6PtT3kI5iE80hs4XCTknrS3HPvqedAI7r1DiOBPj6oVN
	 ge1zsX3eL9krIi6sTaD3aCFjmMJfzYATuCEnmD8V5Tr0h+eTIzeJq/qf/wqgy2OG8e
	 2TgyexxuCXXXXwtRQJsd5HqSRQtmKp4IrLPY7jv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66DB0F8016C;
	Mon, 16 Nov 2020 04:06:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87E47F80168; Mon, 16 Nov 2020 04:06:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 20E1FF8010A
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 04:06:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20E1FF8010A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1605495994224057913-webhooks-bot@alsa-project.org>
References: <1605495994224057913-webhooks-bot@alsa-project.org>
Subject: rawmidi: substream 0 is always selected, ignoring parameter
Message-Id: <20201116030637.87E47F80168@alsa1.perex.cz>
Date: Mon, 16 Nov 2020 04:06:37 +0100 (CET)
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

alsa-project/alsa-gobject issue #53 was opened from takaswie:

This issue is confirmed in v0.1.0 release.

`ALSARawmidi.StreamPair.open()` has `subdevice_id` to select one of
substreams supported by the Rawmidi device. However, this parameter is
ignored and the first substream is always selected.

Currently, the procedure in `ALSARawmidi.StreamPair.open()` to open Rawmidi
character device is:

1. open control character device
2. ioctl call with SNDRV_CTL_IOCTL_RAWMIDI_PREFER_SUBDEVICE
3. close control character device
4. open rawmidi character device

The cause to ignore is step 3. After closing control character device,
private structure assigned to file descriptor of control character
device is dropped in kernel land. At step 4, the selection information
is already lost and the first substream is assigned to file descriptor
of rawmidi character device.

The solution is to keep file descriptor of control character device
when opening rawmidi character device, thus the procedure should be:

1. open control character device
2. ioctl call with SNDRV_CTL_IOCTL_RAWMIDI_PREFER_SUBDEVICE
3. open rawmidi character device
4. close control character device

Issue URL     : https://github.com/alsa-project/alsa-gobject/issues/53
Repository URL: https://github.com/alsa-project/alsa-gobject
