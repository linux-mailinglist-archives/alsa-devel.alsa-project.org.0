Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C19A4AF72A
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Feb 2022 17:49:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BA8E185B;
	Wed,  9 Feb 2022 17:48:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BA8E185B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644425354;
	bh=YXL0w5qwbL1EgluPfZLm4aZ4zMIoVBqHmflC1bKT2eU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WrFB/H/gYc+MiIcfLhu6PEojhroemeDxYxkxg3JYgmNEjpIbLnfRMMJepsaDdk8Bg
	 nqmRk7mK55dOVjCekbBq5MwO6yWUSlgn7N7rMxcjZbVC+sAVaGS+gKnP4qP1bnkFV4
	 C5ErkGhHR0TSWKZDSUVcoyTnU+pvkfJYOtVwLZvQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB2E1F800ED;
	Wed,  9 Feb 2022 17:48:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64336F8016A; Wed,  9 Feb 2022 17:48:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,MIME_HTML_ONLY,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.web.de (mout.web.de [217.72.192.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DDCBF800F0
 for <alsa-devel@alsa-project.org>; Wed,  9 Feb 2022 17:47:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DDCBF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="QLycPu/8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1644425274;
 bh=8zvv3UVuypLdPnTkeYYi3l3bwG8b66SgKrPydbpOnvU=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=QLycPu/80B07XhtqScmbgr+i/j6HRKp2vQrgXEEp0u7cQWsL7SO57BlRqnNimnv2b
 14Ax5s+/0XI4StaDMPE/iYTDFYbbrP/Oq2llZ+oLmSq8OoMvg10b2bpAKRmAPcDuzp
 ppKRn9rsDXoDK00yXd1M8K51tjztztkCwWOd0g7k=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [185.196.22.219] ([185.196.22.219]) by web-mail.web.de
 (3c-app-webde-bap11.server.lan [172.19.172.11]) (via HTTP); Wed, 9 Feb 2022
 17:47:54 +0100
Message-ID: <trinity-dc5c0214-ab7c-48bf-a502-e93062638611-1644425274650@3c-app-webde-bap11>
From: dmummenschanz@web.de
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Aw: Re:  Re: Cannon Lake PCH cAVS (ALC892) not detected by kernel
 driver
Date: Wed, 9 Feb 2022 17:47:54 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <c71dbf89-80a3-538e-6ebe-e1d1869183e8@linux.intel.com>
References: <trinity-f018660b-95c9-442b-a2a8-c92a56eb07ed-1644345967148@3c-app-webde-bap22>
 <209270c3-4a46-d6a1-0f1d-d4400ecc5962@linux.intel.com>
 <trinity-c5ab92fd-fbab-4431-8579-f8576a9ba71e-1644390880605@3c-app-webde-bap12>
 <c71dbf89-80a3-538e-6ebe-e1d1869183e8@linux.intel.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:GGUipQjOhzWvxms8gYnqx00QELObNN8eVzlZDGF59jYy74FrUfQ4+uHI2ymtRwJFyHoR2
 nqDfAj0jMyA68OBKpDTQNo3B/SgevyNqRGK05TSZMYJMSIcwCptfguN749kVBEIsBkIXCIS6qm9G
 xaGM3kBuFfWbEOFYJBNB6vOrNeTyPkdAnxMPWIWeMGNB0Wmth6vzsymPspdXXfJoC+JVbcGy6+/N
 nwGDzZJv0p1MLN2sF1QA4JStZKGwi7di5+YjAy8fEUGscx9ut16zFh7Yvevv9YLoEJsAV6LAlErz
 /k=
X-UI-Out-Filterresults: notjunk:1;V03:K0:xUi9NexvHx8=:LcqQFWzVISzAdxKMz0rb5E
 YkOD8nrDXDFrTH1SzLq0liPTs7A3AbXZz5xoV2vYk25tXqeIMutCM7VIG47GFnsw2JOXISxao
 p/oZNZ+mxWDeYsvCbkdzv+0LbRQ4VCO+9oGLI9viYnON3hoJZM/VisZL66GYKnwSjxmYRWq0R
 pqTAfmOmfpnSvmu625IXDc2mQmEMEM69swi27nd3fdgmewINRj8UTRZPrSYaURM+p+B/ceIW3
 Nu9P5r2b6Xx0nGc5oZKlArXpe26PwWeKPiWkWsgpdbqGidH0JU1xjjKn2lwzSck1wqZsFmw96
 DAaHnSltsmIihlYlbHSSCy4+H6OfWcJaK1JxoDiWiM4Li3EZqT3tQB2Cr5zLXVs8Ckcz9WZMD
 gayNxX62GDF6n2qiClAZKl0RCB96hPL46fbaSx4zsPctnLr348BvchDxrpb0QF3d6ijMIfWNx
 HQg0MrTpARbQrV2aCS73jp9RJC17rakOtAvsHx9dHU8soptSkhmkIZ4o7wpShrLele8p+Ymhm
 KktvJ5e1QgcEEMWkjn3VxqOna83jMS3ytcGVEszunJttJ56GE0KsVm+7JVJn+OlgybRNaB0Um
 WK6qBzp+CuRxs53OoApFTys6PrLoNOd8mRVcrBkmwiDwKik5FXvBNH70Eb9jMahRkDnSHr8Ov
 fApKI8ri6gke7qT00kUzpCAOzdxJlj0VThn/L1ufwyEPPddtHvbNVzVlcRqaJuzIJlNAeZN/J
 d0UIH1x8iMkEUPVgTYcHqmIhH17CXFinffTu+N+wcZYzc9ybBjjmAa3wN7xMLqLPb8skbSekE
 fERDn/B
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

   snd_intel_dspcfg: dsp_driver=1

   was a leftover from testing. I' ve removed all parameters, add added
   the debug options you've asked.

   http://alsa-project.org/db/?f=6e30e9f598bd2f03b2f5cff0df261f78719ea29d

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
   [1]http://alsa-project.org/db/?f=38c48cd24dc4ba9a9487dd96f857120cc9ce43
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

   1. http://alsa-project.org/db/?f=38c48cd24dc4ba9a9487dd96f857120cc9ce4367
