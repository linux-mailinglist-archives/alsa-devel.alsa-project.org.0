Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 075CC4B421A
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 07:51:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFCBC827;
	Mon, 14 Feb 2022 07:50:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFCBC827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644821477;
	bh=xqWrNG327woJXgO9bXybSv2vgkEdcK9/jdolMQkUWHc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gUFtbEgPSE7QU3ZASH/gJ8SULbDv3oEHPCis8pATH1M2Z2z4T+aqPb0lNeGyKSbgk
	 NkUkKKbNzWaZLGZIzeTczwwc0UViOW42lQp1dKcC3WxX+g55dYEM7R0h/dzhrJPlyH
	 u2aTYjqq+2W3/f5pKYYe4J0G8bwGNFOEXlD1oRvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DF91F80169;
	Mon, 14 Feb 2022 07:50:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D17B2F80310; Mon, 14 Feb 2022 07:50:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,MIME_HTML_ONLY,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mout.web.de (mout.web.de [212.227.15.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B535CF8012F
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 07:49:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B535CF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="fiVgRKS+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1644821395;
 bh=N/OpIKNwWQowJ2rDRO2+7GZRfIiMfEDTbHwvgAwmLxc=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=fiVgRKS+MrbPAifssykZ4ecF58VAN8ja8G1tgZeYc13hqD/J++wAACuoLm3Z8zgpD
 lbOZy7yo/+TECtZ0p++HAT8dG9HCvfml5/Ga+X0YLFqUc8NGCWobpWsdOq1tGHeAka
 moWagOvC05+11LfPw/8Fu/z8nPIOUuOPkAyWgDwc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [185.196.22.218] ([185.196.22.218]) by web-mail.web.de
 (3c-app-webde-bs52.server.lan [172.19.170.108]) (via HTTP); Mon, 14 Feb
 2022 07:49:55 +0100
Message-ID: <trinity-354a4a90-f564-4f73-bbea-ed00bc502c24-1644821395116@3c-app-webde-bs52>
From: dmummenschanz@web.de
To: Takashi Iwai <tiwai@suse.de>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, alsa-devel@alsa-project.org
Subject: Re: Re: Cannon Lake PCH cAVS (ALC892) not detected by kernel driver
Date: Mon, 14 Feb 2022 07:49:55 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <s5hmtivgmld.wl-tiwai@suse.de>
References: <trinity-f018660b-95c9-442b-a2a8-c92a56eb07ed-1644345967148@3c-app-webde-bap22>
 <209270c3-4a46-d6a1-0f1d-d4400ecc5962@linux.intel.com>
 <trinity-c5ab92fd-fbab-4431-8579-f8576a9ba71e-1644390880605@3c-app-webde-bap12>
 <c71dbf89-80a3-538e-6ebe-e1d1869183e8@linux.intel.com>
 <trinity-dc5c0214-ab7c-48bf-a502-e93062638611-1644425274650@3c-app-webde-bap11>
 <trinity-7e2e8baa-0f43-4b12-902d-a907bd7efb79-1644665613748@3c-app-webde-bs56>
 <2db61794-d772-8df6-a843-fd1512cfaa57@linux.intel.com>
 <s5hmtivgmld.wl-tiwai@suse.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:+7F2sFNN/ExXPzzdejF5L+NKcg813fWpazL1o/noIoursbNiBRtc1BP/nDedLbpgOQuL/
 8sEsiQht+x4yoTUY9LTxXSAS/1cNKVAuN3A1Ezd6BQYl8n0mwr/ruLyOfd+DAwazJruK1J/701aa
 +V6ypeibnvdr1hWUuJk5/qm/fVW5Qt41OFyeRApWDoU6M23sKb0No8nkv9q+Whp+T0s9jcRyvJwy
 Fo35umT+E6QKhwyolDEOp9Ebqfd2BEJrtSBT0NB9cwNdIjzNa40X5hK3XNdyrE3EeuW4BQiuEnZ2
 4M=
X-UI-Out-Filterresults: notjunk:1;V03:K0:7ZIlFOW9qPY=:jhx6NI1lPXuN07/lnHZbma
 +z6TCwucGK49xgQ8Cel/xDmboIYBgLrVt55sF6ymBOg58X1XVbTX1F57eUxEQJS10DqBrSrCF
 ZtZkvWRb5g2nsEoRO6oct3JH+VSNM0ZGf9h+eBJFss6XBJu9INdi/1Qmq9MzLJMB0c8zQFPGS
 Rs4Og6WlGK3gKZF86lojr9/86GtzVnd05EVH7wOOVnbUCmyjsD2RKniR98LVwP+9vGNmv0Yvm
 HOwHqb1WqGTgJvnUSyVptVXM++9PyG1u6nDEjfKqBrJhcdrUGGDiGHXX7Zm4o6DmF6glC0Hto
 Zw1sjNOfs6pPECwtsxnkK1pWAoqSAZlwK45IzTWuj3wMFYu4MGK3RZMSmYxRy1LbWR+jRCZXu
 vyDjFuEN4/o93rGjaTGx1vYvT1/DytZGvZbAKHFiAwFagKoJb87dASlX54S/3L0OjAH+FKHui
 /EFS9WP/kN3FyHCYeodDYrjQjjmyxnvfNopIw24rPG4G6UuK1eCyKP+BhnhQHpzlyneyw24Mi
 3P9jwFM8NE42kCpdrU31BSj08f43u+mmn1PesKcvX3zmlmFMBPQm8zEX35EvvqoB0T+hVShw0
 HJpHmWLXnsW4JNyOwYgb+M2AjQBhJRPV7EQFmdOnGUFEu3guHVCZ+5FJgRSwfLfEjsiOsDUyK
 2agUhjFjmZOZ2lz93eVkC0Gm3But0XmgGDxixCxd3fUn073KEvoBfagK4ZowTkO3mzVUBOOCF
 JBmxfaDq22bC2/QFz4/xcY9yBNI0xXzqBGfoOL1fkoBDHuEnxagv5V212/RBjEsGh/9Q+Elgq
 cb59DHQ
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

   Thanks for the scoop. I've added "options snd-hda-intel
   probe_mask=0x105" to /etc/modules-d/alsa.conf. Unfortunately that
   didn't help. The ALC892 didn't show up. Why the log below says
   "codec_mask forced to 0x5" but I've explicitly set the value to 0x105 I
   don't know.

   [  109.071253] snd_hda_intel 0000:00:1f.3: codec_mask forced to 0x5
   [  109.071329] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops
   i915_exit [i915])
   [  109.092895] input: HDA Intel PCH HDMI/DP,pcm=3 as
   /devices/pci0000:00/0000:00:1f.3/sound/card0/input20
   [  109.093808] input: HDA Intel PCH HDMI/DP,pcm=7 as
   /devices/pci0000:00/0000:00:1f.3/sound/card0/input21
   [  109.093883] input: HDA Intel PCH HDMI/DP,pcm=8 as
   /devices/pci0000:00/0000:00:1f.3/sound/card0/input22
   [  109.093953] input: HDA Intel PCH HDMI/DP,pcm=9 as
   /devices/pci0000:00/0000:00:1f.3/sound/card0/input23
   [  109.095354] input: HDA Intel PCH HDMI/DP,pcm=10 as
   /devices/pci0000:00/0000:00:1f.3/sound/card0/input24



   Gesendet: Sonntag, 13. Februar 2022 um 10:08 Uhr
   Von: "Takashi Iwai" <tiwai@suse.de>
   An: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>
   Cc: "Vehmanen, Kai" <kai.vehmanen@intel.com>,
   alsa-devel@alsa-project.org, dmummenschanz@web.de
   Betreff: Re: Cannon Lake PCH cAVS (ALC892) not detected by kernel
   driver
   On Sat, 12 Feb 2022 20:42:28 +0100,
   Pierre-Louis Bossart wrote:
   >
   >
   >
   > On 2/12/22 05:33, dmummenschanz@web.de wrote:
   > > I did some more digging into the code to find out what goes boink.
   > > For comparison I took my wife's desktop wich has a Cannon Lake
   chipset
   > > as well along with a working a ALC892 AVS device.
   > >
   > > It seems there is a codec mask issue selected in the chip->bus
   struct.
   > > Inside the function
   > >
   > > static int azx_probe_continue(struct azx *chip)
   > >
   > > of hda_intel.c the bus->codec_mask on my wife's pc contains the
   integer
   > > value "5" and both ALC892 and the HDMI is found. On my device it is
   "4"
   > > and only the HDMI is found.
   > >
   > > /* create codec instances */
   > > if (bus->codec_mask) {
   > > err = azx_probe_codecs(chip, azx_max_codecs[chip->driver_type]);
   > > if (err < 0)
   > > goto out_free;
   > > }
   > >
   > > After forcing the falue before probing: "bus->codec_mask = 5;" the
   > > ALC892 is finally detected on my system and I have sound! alsa-info
   > > below: Please pardon the trash printk's in the log ;-)
   > >
   > >
   [1]http://alsa-project.org/db/?f=057aac1a0e9591de3847dca5ebc424dd65c8a2
   21
   > >
   > > I'll do some more digging into it next week but it would probably
   > > save tons of time if someone could point me is the right direction
   > > where to look further?
   >
   > Adding Kai and Takashi, in case they haven't see this codec_mask
   issue.
   > I personally don't recall having seen this before.
   This means BIOS trying to hide this codec by some reason. It's seen
   sometimes in the past although it's rare.
   You can forcibly probe it via probe_mask=0x105 option for
   snd-hda-intel module in this case.
   If this is confirmed to work reliably, we can add a static quirk table
   in the driver cideo.
   HTH,
   Takashi

References

   1. http://alsa-project.org/db/?f=057aac1a0e9591de3847dca5ebc424dd65c8a221
