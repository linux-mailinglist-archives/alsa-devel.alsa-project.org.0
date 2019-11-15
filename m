Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 128DCFDA28
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 10:58:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 468E91657;
	Fri, 15 Nov 2019 10:57:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 468E91657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573811895;
	bh=O0kTHvsv/crJhJHAXTRX5iiyW4eVFiSnPNtWyU4kuzY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HaDUaShN+S7MCBM+HGeEq1rmcutRo8E7Y1NvgGXI4vmAWkJOWDUkFSMk74p2Q3NMm
	 cg45+8ghKfSc5REZvd90pHJcS4lJLV7M82bnU9ueu3keGC8xNEZZW3NsDLxO+X+kJo
	 9MmvC+ja6aJoNR8RWQ1wuefXmog7MUK+FaIfElsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8157FF80102;
	Fri, 15 Nov 2019 10:56:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4BC5F80103; Fri, 15 Nov 2019 10:56:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40A58F800CC
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 10:56:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40A58F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="EtBr2hci"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dce76480000>; Fri, 15 Nov 2019 01:56:24 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 15 Nov 2019 01:56:24 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 15 Nov 2019 01:56:24 -0800
Received: from nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com (172.20.187.13)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 15 Nov 2019 09:56:23 +0000
From: Nikhil Mahale <nmahale@nvidia.com>
To: <tiwai@suse.com>
Date: Fri, 15 Nov 2019 15:26:01 +0530
Message-ID: <20191115095606.22392-1-nmahale@nvidia.com>
X-Mailer: git-send-email 2.16.4
X-NVConfidentiality: public
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573811785; bh=A+IIhDG3szX6G2EI9PypAB7/o7mdG8UZuNwvK3rEqJk=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 X-NVConfidentiality:MIME-Version:X-Originating-IP:
 X-ClientProxiedBy:Content-Type;
 b=EtBr2hci9wE3ZgZx2FpLBw+MjOb7wXu585QiCl2gHDYwP5xuIqBa1q/r7B5e9xC8p
 8aRvueMPxWTh1mmjrmzte8zzvl96YaQ2nUqgJnV7xkjcqlxed373jhCwMucS6TJKVo
 4fAbOhEDruloEQ62c07tCg6MRukZtGyVsF0CPjFO83tVGbj5tlR8EAhlaghYU0eBTZ
 WZdnOiciqwFOQqzQKiGj6H3siN4vnHLN0APng5y/wIoWSi2pH/1/9Ma/Z1t1Soh7k0
 npIR0rL3E+KiR3tMfPPr7g9xWQKk+ISqRBTyKHaBbf9p5uRaoQOcOi4gilSi4nJdKS
 7RwWSzalEtK+A==
Cc: alsa-devel@alsa-project.org, nmahale@nvidia.com, aplattner@nvidia.com
Subject: [alsa-devel] [PATCH v2 0/5] ALSA: hda - Add DP-MST support for
	NVIDIA codecs
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

Today, DisplayPort multi-stream transport (DP-MST) audio is not
supported on codec drivers which don't use the audio component
(acomp) binding.

The commit ade49db337a9 (ALSA: hda/hdmi - Allow audio component for
AMD/ATI and Nvidia HDMI) added the DRM audio component binding for
the NVIDIA codec drivers, but the traditional HD-audio unsolicited
event code path is still in use by the proprietary NVIDIA graphics
driver.

This patch set adds DP-MST audio support for non-acomp codec drivers
which use the traditional HD-audio unsolicited event code path. This
patch set adds DP-MST support for NVIDIA codecs.

The patch set has been tested for HDMI/DP-SST/DP-MST(4 dp-mst audio
streams) configurations on NVIDIA Kepler and Maxwell GPUs, using
both the nouveau driver and the proprietary NVIDIA graphics driver.

Nikhil Mahale (5):
  ALSA: hda - Rename snd_hda_pin_sense to snd_hda_jack_pin_sense
  ALSA: hda - Add DP-MST jack support
  ALSA: hda - Add DP-MST conn list support
  ALSA: hda - Add DP-MST support for non-acomp codecs
  ALSA: hda - Add DP-MST support for NVIDIA codecs

 sound/pci/hda/hda_codec.c  |   5 +-
 sound/pci/hda/hda_jack.c   | 143 +++++++++++++++++--------
 sound/pci/hda/hda_jack.h   | 107 +++++++++++++++++--
 sound/pci/hda/patch_hdmi.c | 256 +++++++++++++++++++++++++++++++--------------
 4 files changed, 378 insertions(+), 133 deletions(-)

-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
