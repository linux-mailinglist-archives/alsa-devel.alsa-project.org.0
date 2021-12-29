Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DF8481A8D
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Dec 2021 08:58:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8092D173A;
	Thu, 30 Dec 2021 08:57:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8092D173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640851081;
	bh=3+cxsWJzcxwxvlgm8JC15q9orIzlvp5B33kSIsTPbvA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k/jX76DyBmHl0c9F6NQEQJFhaWO8EJIiLt8e3EsqZyPLCeSfdPGDyWhaRByz2sb/g
	 jcdURVNO+HSJLxhNglPQFMesfraF3KIcocxWU/RH1OEZAWgvFkPjOL2/FUvTujzVjg
	 N7qNetA8xF9VBWtIR+ryk975lmlSa+wOrHhgBRgM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CC61F800EB;
	Thu, 30 Dec 2021 08:57:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E959F801EC; Wed, 29 Dec 2021 16:31:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from magratgarlick.emantor.de (magratgarlick.emantor.de
 [IPv6:2a01:4f8:c17:c88::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20FBCF800CE
 for <alsa-devel@alsa-project.org>; Wed, 29 Dec 2021 16:31:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20FBCF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=czerwinskis.de header.i=@czerwinskis.de
 header.b="Mkt5SUHx"; 
 dkim=pass (1024-bit key) header.d=czerwinskis.de header.i=@czerwinskis.de
 header.b="E6h0sbTW"
Received: by magratgarlick.emantor.de (Postfix, from userid 114)
 id D70889122C; Wed, 29 Dec 2021 16:31:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=czerwinskis.de;
 s=mail; t=1640791871;
 bh=3+cxsWJzcxwxvlgm8JC15q9orIzlvp5B33kSIsTPbvA=;
 h=From:To:Cc:Subject:Date:From;
 b=Mkt5SUHxwySzgFwnFNwas6Qr0sFoWQ/eIuMcOd1SSQT1H2sfyNl+8Eq4oWY+sIdLm
 OcVwLadBf4k6dZyanPIOUCqjOpTEXHEJZdfdfiAXTvQBWq+R1HpX3Q+6V04CuUln+t
 t33qJM8tqvkee74Iuv3NqFWN1z1DCZWZjfhj8v6s=
Received: from localhost (unknown
 [IPv6:2001:9e8:2145:1402:c0d3:dbff:fefe:ff70])
 by magratgarlick.emantor.de (Postfix) with ESMTPSA id 3987C909AC;
 Wed, 29 Dec 2021 16:31:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=czerwinskis.de;
 s=mail; t=1640791869;
 bh=3+cxsWJzcxwxvlgm8JC15q9orIzlvp5B33kSIsTPbvA=;
 h=From:To:Cc:Subject:Date:From;
 b=E6h0sbTWvJSGKmYmR3cxSM+AycehfQjSMaqkPlfA42julzHJd45aqbuEPNH7AAFxR
 2LwBeMecwo5mnVAhLZyCIzGLzZMY3dCyl9T69jTMaC8ohv2jH5p0X8JRlswY3vjqBM
 SgIjAxMfJhhU0Unxe436eyF1oTAJiR+tGhZhrjCU=
User-agent: mu4e 1.6.10; emacs 27.2
From: Rouven Czerwinski <rouven@czerwinskis.de>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: IOMMU Page Fault with Creative Soundblaster Zx after suspend
Date: Wed, 29 Dec 2021 16:24:13 +0100
Message-ID: <87mtkjqvgj.fsf@czerwinskis.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Thu, 30 Dec 2021 08:57:09 +0100
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Colin Ian King <colin.king@intel.com>,
 linux-kernel@vger.kernel.org, Simeon Simeonoff <sim.simeonoff@gmail.com>
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

Hi,

With current 5.15.11, my soundblaster Zx is not correctly coming back
from suspend. Dmesg prints:

[Mi Dez 29 16:12:14 2021] [drm] UVD and UVD ENC initialized successfully.
[Mi Dez 29 16:12:14 2021] snd_hda_codec_ca0132 hdaudioC0D1: ca0132 DSP downloaded and running
[Mi Dez 29 16:12:15 2021] [drm] VCE initialized successfully.
[Mi Dez 29 16:12:15 2021] usb 1-5: reset full-speed USB device number 2 using xhci_hcd
[Mi Dez 29 16:12:16 2021] ata1.00: Enabling discard_zeroes_data
[Mi Dez 29 16:12:16 2021] OOM killer enabled.
[Mi Dez 29 16:12:16 2021] Restarting tasks ... done.
[Mi Dez 29 16:12:16 2021] PM: suspend exit
[Mi Dez 29 16:12:16 2021] snd_hda_intel 0000:06:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x000f address=0xdf880000 flags=0x0000]
[Mi Dez 29 16:12:17 2021] igb 0000:08:00.0 enp8s0: igb: enp8s0 NIC Link is Up 1000 Mbps Full Duplex, Flow Control: RX/TX

Where the IOMMU Page Fault looks suspicious. Unbinding and rebinding the
driver using sysfs fixes it, thats the current workaround I have
been using.

Thanks and happy holidays,
Rouven Czerwinski
