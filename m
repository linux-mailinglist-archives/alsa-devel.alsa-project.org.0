Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C08C438FB31
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 08:51:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BC791657;
	Tue, 25 May 2021 08:51:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BC791657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621925517;
	bh=kmGHRCkTzXtegOD9eyxMroV27XwsRn2bJIvUTkchfhM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AIKEcf/sUpifF7fO0Kwi++PmuzWPpa3/bomyqLEy/GPR0epuSUTZDovFQT1yJU3Lt
	 UhKgNH5xUa9mCEiwTcEAw+vO+qOMqf7K/tWN3HS7aF1/wOhZIeAJcJt+eJEYbouWc1
	 R01CUr3Knzvjr9CQdbfolsdy+kEuUa5m26W6UCaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6623F80113;
	Tue, 25 May 2021 08:50:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A3A4F801EB; Tue, 25 May 2021 08:50:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DATE_IN_PAST_12_24,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 035E5F80113
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 08:50:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 035E5F80113
IronPort-SDR: 6K5DqCJLh+ltvrTDUqOtWGRcr7YEXBNiD9aFeD5jib0sb4ZRseuM1px6cyRBeRZ88w+whVtmsd
 cYa5Y+Q4khyg==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="189240236"
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="189240236"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 23:50:14 -0700
IronPort-SDR: rgP2fOU8RrEZw0YQXb4WEG+pjOyVg9SoSfAyJog1HVkOkVsss6Nj7c+0KNPZpp0C7e0Jz9eA8E
 I4R7+uCPweJg==
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="476270500"
Received: from pujfalus-mobl.ger.corp.intel.com (HELO
 peter-virtualbox.ger.corp.intel.com) ([10.252.39.140])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 23:50:13 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: tiwai@suse.com
Subject: [PATCH] ALSA: hda: Add Lenovo ThinkStation P340 to power_save_denylist
Date: Mon, 24 May 2021 18:25:33 +0300
Message-Id: <20210524152533.7479-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com
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

On playback start there is a huge plock/pop noise via the green jack used
in Line out mode.

The only way I was able to fix it to set the power_save to 0 for the
snd_hda_intel.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
Hi Takashi,

Changes since RFC:
- Fixed up the PCI ID

ever since I have this workstation (three weeks) the plock/pop noise on playback
start bugged me. So far the only solution I have found is to disable the
power_save which I find acceptable on a desktop compared to the pops.

The alsa-info.sh output is can be found here:
http://alsa-project.org/db/?f=414b1b236fc73db386ad4f938bc3b304f6b30b05

Missing details from alsa-info output:
# lspci -nnk | grep -A2 Audio
00:1f.3 Audio device [0403]: Intel Corporation Comet Lake PCH cAVS [8086:06c8]
        DeviceName: Onboard - Sound
        Subsystem: Lenovo Device [17aa:1048]

CPU: i9-10900k

The machine have ALC623 codec and the jacks are correctly discovered and they
do what they supposed to be.
When I have the headset connected to the front and audio is routed there the
line out (green jack) from the back still prodices the plock/pop.

Is there a known quirk for similar issue or a better way to handle it?

Thanks you,
Peter Ujfalusi

 sound/pci/hda/hda_intel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 79ade335c8a0..9cacd1cb211b 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2213,6 +2213,8 @@ static const struct snd_pci_quirk power_save_denylist[] = {
 	SND_PCI_QUIRK(0x17aa, 0x36a7, "Lenovo C50 All in one", 0),
 	/* https://bugs.launchpad.net/bugs/1821663 */
 	SND_PCI_QUIRK(0x1631, 0xe017, "Packard Bell NEC IMEDIA 5204", 0),
+	/* Loud plock/pop noise via the green jack on playback start */
+	SND_PCI_QUIRK(0x17aa, 0x1048, "Lenovo ThinkStation P340", 0),
 	{}
 };
 #endif /* CONFIG_PM */
-- 
2.31.1

