Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F44115A027
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 05:32:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A18B415E4;
	Wed, 12 Feb 2020 05:31:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A18B415E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581481952;
	bh=zvr9TjJVOVZlgGV51RLjBC+z4UcWbsOxmolp/9hWLpI=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FwxJraVWg/7VcZ6msVCQWpOUBTPEnAXUaOomjXGjFh+JxNpm6pwnAX04V1nQm8EqQ
	 AwU0TRGx28w27XF/P9qiNN4SjyYkJ8wpUCuvH8qzilkLjSVC4dxAoia04zEnsNuLHU
	 07T5qEt8CkTZBgb+sa6ePPNAcCjcyi3ccdO5Bze4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6F0FF80158;
	Wed, 12 Feb 2020 05:30:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D8CEF80157; Wed, 12 Feb 2020 05:30:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D89E8F800E7
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 05:30:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D89E8F800E7
MIME-Version: 1.0
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1581481834465197086-webhooks-bot@alsa-project.org>
References: <1581481834465197086-webhooks-bot@alsa-project.org>
Message-Id: <20200212043049.2D8CEF80157@alsa1.perex.cz>
Date: Wed, 12 Feb 2020 05:30:49 +0100 (CET)
Subject: [alsa-devel] MIDI 2.0 Universal MIDI Packet format (UMP)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-lib issue #24 was edited from symdeb:

Since MIDI 2.0 only support USB and not over DIN (for now), will MIDI 2.0 need a new or updated OS class driver for the 32/64 bit universal packet interface and device descriptor for devices ? Page 16 of the USB MIDI class driver spec defines support for 1,2 or 3 bytes transfers only, How will this have to be implemented by MIDI USB device manufacturers and well as on the Linux OSes side ?  How will this impact Linux ALSA ? Would the first byte of the message with b7=0 not confuse the driver of running status ? 
Link universal packet format 
https://www.midi.org/articles-old/details-about-midi-2-0-midi-ci-profiles-and-property-exchange)
Link first MIDI 2.0 Ready product: Roland A-88MKII
https://www.midi.org/articles-old/roland-announces

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/24
Repository URL: https://github.com/alsa-project/alsa-lib
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
