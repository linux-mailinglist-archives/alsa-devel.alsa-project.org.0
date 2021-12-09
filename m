Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A29746F673
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Dec 2021 23:07:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB33C2146;
	Thu,  9 Dec 2021 23:06:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB33C2146
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639087638;
	bh=VUtHe2oVR/Z9qXToeyncnO6N0DYzrpFXuTRQ73Nfa0c=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hn0qvRKPkiU8IPJ5+ZgJi/d4m4G7fFsJ0KpqU52+hGB4LP2LtmXd5Z0h1uUlvq38k
	 filO6cARF0zaGH814Wbr1GYJb0IL9dwwjoyleu/AR9TvkXhSRPPJkE3Y0Eaepyzil6
	 mhhRhPu+Pcvye+VxC8jj+5PJqGfMqLat4CCzriUg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43E4BF8028D;
	Thu,  9 Dec 2021 23:06:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54524F804AE; Thu,  9 Dec 2021 23:06:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 3521BF8028D
 for <alsa-devel@alsa-project.org>; Thu,  9 Dec 2021 23:06:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3521BF8028D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1639087560992140055-webhooks-bot@alsa-project.org>
References: <1639087560992140055-webhooks-bot@alsa-project.org>
Subject: microphone disappeared on alsa-ucm-conf 1.2.6.1
Message-Id: <20211209220607.54524F804AE@alsa1.perex.cz>
Date: Thu,  9 Dec 2021 23:06:07 +0100 (CET)
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

alsa-project/alsa-lib issue #200 was edited from galibozek:

after upgrade alsa-ucm-conf 1.2.5.1-1 to 1.2.6.1-1 (arch linux) my microphone disappeared on lenovo t14 gen2i

Similar to: https://bugs.archlinux.org/task/71180

```
00:1f.3 Audio device: Intel Corporation Tiger Lake-LP Smart Sound Technology Audio Controller (rev 20) (prog-if 80)
        Subsystem: Lenovo Device 22c9
        Flags: bus master, fast devsel, latency 64, IRQ 187, IOMMU group 12
        Memory at 603dbc0000 (64-bit, non-prefetchable) [size=16K]
        Memory at 603da00000 (64-bit, non-prefetchable) [size=1M]
        Capabilities: <access denied>
        Kernel driver in use: sof-audio-pci-intel-tgl
        Kernel modules: snd_hda_intel, snd_sof_pci_intel_tgl
```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/200
Repository URL: https://github.com/alsa-project/alsa-lib
