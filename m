Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B0666069F
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 19:49:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6295812773;
	Fri,  6 Jan 2023 19:48:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6295812773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673030941;
	bh=tp1wwYL+dWnG3JQw8MZJx330UNMQf42TIrG39TK3gRY=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=sV+Z9SplNaa5dxmz30bFUF1RWRJWyC8bLyfJa6bn8ZM3gMkLKAhvFMpdgPUwDxYez
	 BwKlmdfuIs5z1P8IUJC4Ztio9CV+3Zynepp5EqcqJDXZ4Gp2uCdiWO+IRP/qHz8P70
	 pmSkcSRZL4La0pqlPqGtRPL69DOGYaaGNvob1lx0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2166AF8022B;
	Fri,  6 Jan 2023 19:48:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D365DF8024D; Fri,  6 Jan 2023 19:47:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.mutex.one (mail.mutex.one [62.77.152.124])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65A56F8022B
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 19:47:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65A56F8022B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=mutex.one header.i=@mutex.one header.a=rsa-sha256
 header.s=default header.b=Z+SIrCO/
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.mutex.one (Postfix) with ESMTP id AEF6616C000A;
 Fri,  6 Jan 2023 20:47:56 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
 by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OFXBDppdFQVh; Fri,  6 Jan 2023 20:47:55 +0200 (EET)
From: Marian Postevca <posteuca@mutex.one>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
 t=1673030875; bh=tp1wwYL+dWnG3JQw8MZJx330UNMQf42TIrG39TK3gRY=;
 h=From:To:Cc:Subject:Date:From;
 b=Z+SIrCO/3K7QzEBb7e7mbglitdz5lX24ZKP69dZkhD7kSbZNVKh02LLdqwrh13HB+
 3nf+Pn7OKidjwyS+4HMHJH29WXwKvJcjIbbIKLDvgZBrUiyv8KO14Rip5xsUeB8wea
 kSO95Cws6tKYlwAuL6n2coxch1vvjS3faOdnNaGQ=
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [RFC] Sound support for Huawei line of AMD laptops using ACP and
 ES8336 codec
Date: Fri, 06 Jan 2023 20:47:54 +0200
Message-ID: <871qo7fqjp.fsf@mutex.one>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Mario Limonciello <mario.limonciello@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 syed sabakareem <Syed.SabaKareem@amd.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


I have a Huawei Matebook 14 AMD 2021 laptop for which the sound isn't
supported on Linux. On further investigation in Windows and ACPI tables
I could determine that this particular SKU has an ES8336 codec connected
to the CPU ACP module.
The CPU of my laptop is an AMD Ryzen 5 5500U which seems to be codenamed
Lucienne and is a derivation of the Renoir family.
Acording to lspci the ACP is revision 1:

03:00.5 Multimedia controller [0480]: Advanced Micro Devices, Inc. [AMD] Raven/Raven2/FireFlight/Renoir Audio Processor [1022:15e2] (rev 01)
	Subsystem: Device [1e83:3e4d]
	Kernel driver in use: snd_rn_pci_acp3x
	Kernel modules: snd_pci_acp3x, snd_rn_pci_acp3x, snd_pci_acp5x,
	snd_pci_acp6x, snd_acp_pci, snd_rpl_pci_acp6x,
	snd_sof_amd_renoir

I have written a machine driver for this platform and managed to make
the sound and internal microphone work. I am looking to integrate this
support but there are some issues with the current implementation of ACP
support.

As far as I can tell there are 4 directions I could take to add support:

1. A standalone machine driver in sound/soc/amd that uses the platform
  drivers from sound/soc/amd/raven/

2. An embedded driver in sound/soc/amd/acp/acp-legacy-mach.c

3. A standalone machine driver in sound/soc/amd that uses the platform
  drivers from sound/soc/amd/renoir

4. Use the SOF infrastructure

Now as far as I can tell, all of these directions have issues:

1. The pci driver from sound/soc/amd/raven/pci-acp3x.c doesn't support Lucienne
   since it blocks rev 1 devices in :

   /* Raven device detection */
   if (pci->revision != 0x00)
       return -ENODEV;

   This is the approach I took and just changed the check to add support
   for rev 1.
   The sound and internal microphone worked ok and I didn't encounter any
   issues with it. Of course I don't know the internals of ACP and
   don't know what are the differences between rev 0 and rev 1.

2. This approach could work but I would need to change the structure
   acp_card_drvdata and struct snd_soc_dapm_widget acp_widgets,
   to add proper support for jack handling (and maybe some other
   modifications).
   This driver seems to support rev 1 (in sound/soc/amd/acp/acp-pci.c):

   switch (pci->revision) {
	case 0x01:
		chip->name = "acp_asoc_renoir";
		chip->acp_rev = ACP3X_DEV;
		break;

   Also from the module description it seems that these drivers are
   meant only for chromebook support.

3. This seems like it would the best approach in theory, but the problem
   is that the drivers inside only seem to add support for DMIC.

4. I tried to use SOF early when I started tinkering, but I always got a
   timeout during init phase when loading the renoir firmware.

So the reason for this email is to get some idea, on how to best add
support for these laptops.
