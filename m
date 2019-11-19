Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12788101E80
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 09:49:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86287168D;
	Tue, 19 Nov 2019 09:48:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86287168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574153364;
	bh=QYbttdEvUYwCRgDQ/WhpCzhyqGzSI9vVTjTOWGNZn2U=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qkTMGl5ukC7I3QkIdv3TDIOqFM7uzqY3eDeALHqNFquv39rNbVZYCLzjAHEtEjDtL
	 s0/SgXgAO2WTWfI8WOzSofRzM0kdcb30antVZtk42HP6cjCcnTvSkoL6tKaechc+wc
	 gtH2mS36zG6O8aFo1cQbv2FPp5jcjI5eEETQu23g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3E27F80145;
	Tue, 19 Nov 2019 09:47:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B487F80119; Tue, 19 Nov 2019 09:47:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C277F80119
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 09:47:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C277F80119
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="RF8nSMrg"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd3ac230000>; Tue, 19 Nov 2019 00:47:31 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 19 Nov 2019 00:47:34 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 19 Nov 2019 00:47:34 -0800
Received: from nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com (172.20.187.13)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 19 Nov 2019 08:47:32 +0000
From: Nikhil Mahale <nmahale@nvidia.com>
To: <tiwai@suse.com>
Date: Tue, 19 Nov 2019 14:17:06 +0530
Message-ID: <20191119084710.29267-1-nmahale@nvidia.com>
X-Mailer: git-send-email 2.16.4
X-NVConfidentiality: public
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1574153251; bh=+STf9TDSGroZeS7G8aiugWDLqESTLZQ8r5/XGyPALfc=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 X-NVConfidentiality:MIME-Version:X-Originating-IP:
 X-ClientProxiedBy:Content-Type;
 b=RF8nSMrgfr+stJgaBfk7qHktv6pzpTmgA7TAtIbDqh9lzy5xUVI7JzOhmw9GEEfqU
 SiOeS7tmqQjK4a3ymMLpEd5HxwoDymijcv092+M7VN4hxuGBnN6aza2lEebFp6aqHS
 ZoLNwl4vRO5vaksyoVTIC/03OljNip3vzqXhwm6BO4MnE7x6tmadRrp4pfq6N2tqAa
 UjVlrhQx9HlAb6066LMSOKvxQg4EAhpZ8/CUDNcdTXqFpuN1L2fvT65pqvV5bpAPRV
 YZcm8D0lv6UXfW6DJCBd/CwN6crh1JuBgFW43Yh9LNDDHYthSkYKCSrhRQLbt5bkIn
 L9rX/3KO1iTJw==
Cc: alsa-devel@alsa-project.org, nmahale@nvidia.com, aplattner@nvidia.com
Subject: [alsa-devel] [PATCH v3 0/4] ALSA: hda - Add DP-MST support for
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

Nikhil Mahale (4):
  ALSA: hda - Rename snd_hda_pin_sense to snd_hda_jack_pin_sense
  ALSA: hda - Add DP-MST jack support
  ALSA: hda - Add DP-MST support for non-acomp codecs
  ALSA: hda - Add DP-MST support for NVIDIA codecs

 sound/pci/hda/hda_jack.c   | 151 ++++++++++++++++++--------
 sound/pci/hda/hda_jack.h   | 107 ++++++++++++++++--
 sound/pci/hda/patch_hdmi.c | 263 +++++++++++++++++++++++++++++++--------------
 3 files changed, 385 insertions(+), 136 deletions(-)

-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
