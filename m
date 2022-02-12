Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BDB4B34B8
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Feb 2022 12:34:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9282188A;
	Sat, 12 Feb 2022 12:34:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9282188A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644665693;
	bh=0heDdyxzRUfY+wznxgGqC1/56XnD9CQCDv1JYJKvqyU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CU4koYXgh0ytcXak1GirjNwKUjh1CruYEroch4UddXSbwNg4Q7WmjBSYuOWOjqDnZ
	 oyFLKEL8ugON/2u67DoXYG5hMa1Bt7YgucYB45uO9uMWddQXL0fV0efk5+EMBxl6IT
	 fa7cGFZv3vyk8NOQ+/NK9ya3/Pbv74MhY8nh0Xi4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A1BCF804B0;
	Sat, 12 Feb 2022 12:33:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42023F8014E; Sat, 12 Feb 2022 12:33:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,MIME_HTML_ONLY,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.web.de (mout.web.de [212.227.15.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2300AF800BF
 for <alsa-devel@alsa-project.org>; Sat, 12 Feb 2022 12:33:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2300AF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="TvIMwHJS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1644665613;
 bh=mTmzNeMvkiQPRMYfjTSlGCMmLKQk0rF2yphzzvlINSo=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=TvIMwHJShmj8Im31IPRCGbSqZOtIe4S7c8O0drEK45ul30Ksvs8nsjSlMwh+VUiJv
 9T2ut5gSZgV8eef7rECEg2IzpfcSeNH2XIuaqH21YPfTKRJSa1b3+3ibWVvVoA7YAz
 tiTTPj7bbnZDZCDdBYxmlbSKaBg95oyhJRPlsgto=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [185.196.22.219] ([185.196.22.219]) by web-mail.web.de
 (3c-app-webde-bs56.server.lan [172.19.170.203]) (via HTTP); Sat, 12 Feb
 2022 12:33:33 +0100
Message-ID: <trinity-7e2e8baa-0f43-4b12-902d-a907bd7efb79-1644665613748@3c-app-webde-bs56>
From: dmummenschanz@web.de
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: Re:  Re: Cannon Lake PCH cAVS (ALC892) not detected by kernel
 driver
Date: Sat, 12 Feb 2022 12:33:33 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <trinity-dc5c0214-ab7c-48bf-a502-e93062638611-1644425274650@3c-app-webde-bap11>
References: <trinity-f018660b-95c9-442b-a2a8-c92a56eb07ed-1644345967148@3c-app-webde-bap22>
 <209270c3-4a46-d6a1-0f1d-d4400ecc5962@linux.intel.com>
 <trinity-c5ab92fd-fbab-4431-8579-f8576a9ba71e-1644390880605@3c-app-webde-bap12>
 <c71dbf89-80a3-538e-6ebe-e1d1869183e8@linux.intel.com>
 <trinity-dc5c0214-ab7c-48bf-a502-e93062638611-1644425274650@3c-app-webde-bap11>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:QBfBt67BI2HwUNs261J85q7lyL/jnJxtxQ/e/0PDUNsXmKG40MayfO33OBBJ+CE0EYJsX
 j6SPgmLNrJYWT/tDiJscNszJQWTMEWa3g7I9kDtXjSNHsNxzUcNj6DvbIBOV5m/jqL5K5xu1haGb
 1Yl78d3Ii9IiSdEVm/SxUY9NSui/8C2Uma5QIm3wq4LDBWx3y9BTRnUlOdbeCCUsa856uDrq6rrr
 MHMr8yiPG1E0duB96RrMFWTHsjeoWwk6fF3kzXUmOZKY1rI02QU2Rg53bueqz2FPkyc2l9NorMHY
 JA=
X-UI-Out-Filterresults: notjunk:1;V03:K0:6qM3liMUuRQ=:mo/10ZKDOy4HidApBcByws
 STnIXTclT22GABNrsDJYPVc8/fShq8YX5b5Y4YyjauFMsM6gGFLpt9DiXGlrADNft9a9kcVFC
 qnAp1VAZb5HgMLkj/sAs8LMVsP8BaTk/Z4vZ3xg5umB2utYg4zKoS5z+5L7OdQEnsKZX20zro
 YVQHCTJtnOS+piITK6UUyYdnnNwkIdbv7PfR1JpUPpPurR6HIE0da45Ho7kd7IhEuxZkrVuYM
 tANHsSifm7kkUqmcZT9IFD2OLwOOhj4rhbnzzsw5ZbD7NSEwXSwF8QKqJT2CvdIEhFxYzJJAC
 uI5LGKSPIaXOnQcslswlrSeHPCn7LoHtYa75wfcUVcIRDfJs2qTZzMJxmK8XUdFjCaLOCCga5
 bcZ3KGVHvU+ZviWnQWjNOqElpXBRf3B4Sv6KdUW6w3ig/gJktUZ+3jfYY6OHyr13DQ8/JxbcF
 6DuQ5cwK6x5bvWHWA1LZizVRzwcemZoGB5SAhxl4HOgSPS+yHREpYL+Hh2GYMug7sSb+FjFIB
 LLFeb1z4KwsCgrSGKS28Xz0WlKQxz4asHNrUFAR8iHF6bhsCa6dz4Eo0TNcFobdPT9Sjzxbt6
 eKlW1QobwoTZZNbsIiIkDiXjgCtpGyQU9/H4rqiJhQGDcGDJ1fE8UyJvHj/zhVChJeKH9+0mG
 kgFoF8pgoTemEYxt9hbZOFWt+8QqqmtM8U1vA6IwQAYK+jca+gwZH6Q1eEJXNeKlGrM1rbrWK
 DwncDOkL22rGEf6kX4mvvTFrs4bDc871YC62YokdaNvDKQ/XYtpICMwqbipjxsTYLfB5WKvYN
 nTO1sRQ
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

   I did some more digging into the code to find out what goes boink.
   For comparison I took my wife's desktop wich has a  Cannon Lake chipset
   as well along with a working a ALC892 AVS device.

   It seems there is a codec mask issue selected in the chip->bus struct.
   Inside the function

   static int azx_probe_continue(struct azx *chip)

   of hda_intel.c the bus->codec_mask on my wife's pc contains the integer
   value "5" and both ALC892 and the HDMI is found. On my device it is "4"
   and only the HDMI is found.

   /* create codec instances */
   if (bus->codec_mask) {
     err = azx_probe_codecs(chip, azx_max_codecs[chip->driver_type]);
     if (err < 0)
       goto out_free;
   }

   After forcing the falue before probing: "bus->codec_mask = 5;" the
   ALC892 is finally detected on my system and I have sound! alsa-info
   below: Please pardon the trash printk's in the log ;-)

   http://alsa-project.org/db/?f=057aac1a0e9591de3847dca5ebc424dd65c8a221

   I'll do some more digging into it next week but it would probably
   save tons of time if someone could point me is the right direction
   where to look further?



   Gesendet: Mittwoch, 09. Februar 2022 um 17:47 Uhr
   Von: dmummenschanz@web.de
   An: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>,
   alsa-devel@alsa-project.org
   Betreff: Aw: Re: Re: Cannon Lake PCH cAVS (ALC892) not detected by
   kernel driver
   snd_intel_dspcfg: dsp_driver=1
   was a leftover from testing. I' ve removed all parameters, add added
   the debug options you've asked.
   [1]http://alsa-project.org/db/?f=6e30e9f598bd2f03b2f5cff0df261f78719ea2
   9d
   Some googling reveals that others suffer from the same problen on the
   same laptop as well. Some report that the device appears after pci-bus
   rescanning however that did not work in my case so I agree there might
   be an issue with probing the relatek device. Unfortunately I'm not a
   kernel dev so I don't even know where to start looking however I'm
   happy to investigate with your help.
   Gesendet: Mittwoch, 09. Februar 2022 um 16:51 Uhr
   Von: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>
   An: dmummenschanz@web.de, alsa-devel@alsa-project.org
   Betreff: Re: Aw: Re: Cannon Lake PCH cAVS (ALC892) not detected by
   kernel driver
   On 2/9/22 01:14, dmummenschanz@web.de wrote:
   > The information about the codec is based on the string windows
   > provides:
   >
   >
   HDAUDIO\FUNC_01&VEN_10EC&DEV_0892&SUBSYS_15580351&REV_1003\4&16AF2B56&&
   > 0001
   >
   > Here is the alsa-info output for the 5.16 mainline kernel:
   >
   >
   [1][2]http://alsa-project.org/db/?f=38c48cd24dc4ba9a9487dd96f857120cc9c
   e43
   67
   The use of this option is not clear:
   snd_intel_dspcfg: dsp_driver=1
   This means you are trying to force the use of the legacy driver. is
   this
   intentional? Can you remove it and see what happens?
   The results show you don't have a driver bound to the PCI device, so
   likely something goes boink in the probe.
   It wouldn't hurt to enable dynamic debug as well.
   options snd_hda_intel dyndbg=+p
   options snd_intel_dspcfg dyndbg=+p
   References
   1.
   [3]http://alsa-project.org/db/?f=38c48cd24dc4ba9a9487dd96f857120cc9ce43
   67

References

   1. http://alsa-project.org/db/?f=6e30e9f598bd2f03b2f5cff0df261f78719ea29d
   2. http://alsa-project.org/db/?f=38c48cd24dc4ba9a9487dd96f857120cc9ce43
   3. http://alsa-project.org/db/?f=38c48cd24dc4ba9a9487dd96f857120cc9ce4367
