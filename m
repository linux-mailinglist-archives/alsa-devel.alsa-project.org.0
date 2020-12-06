Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7FB2D04E1
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Dec 2020 13:48:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F9A01764;
	Sun,  6 Dec 2020 13:47:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F9A01764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607258898;
	bh=LqJE8NJCN2Scji+A/KiZTE1NJK/1fXLAdx2jCgQRHNE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=enVuE+CmQfPOX18Q7UTo/doLP7nlBzFemU2xoJxsl+5p7ZBWOsFuuOvBrb3Z77O44
	 4FKPbKmoJwEEzlxhk1n112VVAa72RY8iGs6gqv/omMYaOFOWOGKiFcTvh3HzANMt1M
	 6HLsg5Qd5SZOQ17mqhdVvsljdjCOjy4sRudvUhaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E78ECF80218;
	Sun,  6 Dec 2020 13:46:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D72D6F80255; Sun,  6 Dec 2020 13:46:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6450AF8010A
 for <alsa-devel@alsa-project.org>; Sun,  6 Dec 2020 13:46:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6450AF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="XIKSr986"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607258794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wtYKHwar8IcVxtybg8fxr5gqVolENKfE/dqogM/Sehw=;
 b=XIKSr986JQ27KnwyNURsdlWEEtKMLEGEUTe7cIrD7rW2THGDPMrcdoXVQ/ooIYCMQnyaP7
 c+4QbuKHeacJefjVSQbeel1T9q/nI5Q3ODjUWx/xwT8pd8n405GLfhtPiON0NXnQCRqHjV
 +k6j/1HgTRuC39X5F0bY5Kpg5M/WLqs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-8eNVanDUP7qL02STcwxC7A-1; Sun, 06 Dec 2020 07:46:30 -0500
X-MC-Unique: 8eNVanDUP7qL02STcwxC7A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1483910054FF;
 Sun,  6 Dec 2020 12:46:29 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-98.ams2.redhat.com [10.36.112.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB39C5D9DB;
 Sun,  6 Dec 2020 12:46:27 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RFC SOF 0/2] topology: Try to add sof-cht-nau8824 topology file
Date: Sun,  6 Dec 2020 13:46:24 +0100
Message-Id: <20201206124626.13932-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
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

Hi All,

I have veen working on making the cht_bsw_nau8824 machine
driver work together with the sof-audio-acpi driver.

The sof topology files are missing a .tplg file for this setup.
Simply copying over the standard sof-byt-codec.tplg file does
the trick, but then some mixer setting changes are necessary
to fix the right speaker/headphones channel not working.
Specifically I need to change the DACR channel setting from CH1 to
CH0. But that mixer setting breaks the right channel when used with
the sst-acpi driver.

The problem seems to be that the codec and ucm-mixer settings
expect DSP_B TDM 4 channel 24 bit format, but the standard
sof-byt-codec.tplg file specifies I2S 2 channel 24 bit format.

I tried changing the kernel to program the codec and SSP2
CPU DAIs both at I2S 2 channel 24 bit format to match what
most other machine drivers are doing. This causes the no sound
on right speaker channel to reproduce with the SST driver too.
And like with the SOF driver it can be fixed by changing the
mixer setting. With this kernel changes the SOF driver also
still needs the mixer-setting fix.

So I can get things to work, and make SOF/SST behave consistent
by switching both DAIs to I2S 2 channel 24 bit format and
then changing the mixer settings.

The problem is that this will cause regressions unless users
update their kernel and UCM in sync...

So I tried to instead change the tplg file so that SOF will
use DSP_B TDM 4 channel 24 bit format on the SSP2 DAI side,
so that it matches what SST is doing and we don't need to
change the mixer settings.

This RFC series reflects my attempts at switching the SSP2
DAI to DSP_B TDM 4 channel 24 bit format when using SOF,
unfortunately it does not work, the resulting tplg file
causes the following errors:

[   21.537432] sof-audio-acpi 808622A8:00: Firmware info: version 1:6:0-18fab
[   21.537447] sof-audio-acpi 808622A8:00: Firmware: ABI 3:17:0 Kernel ABI 3:18:0
[   25.003836] sof-audio-acpi 808622A8:00: Topology: ABI 3:17:0 Kernel ABI 3:18:0
[   25.216003] sof-audio-acpi 808622A8:00: error: ipc error for 0x80010000 size 12
[   25.216060] sof-audio-acpi 808622A8:00: error: failed to set DAI config for SSP2-Codec index 2
[   25.216070] sof-audio-acpi 808622A8:00: error: failed to save DAI config for SSP2
[   25.216080] sof-audio-acpi 808622A8:00: ASoC: physical link loading failed
[   25.216089] sof-audio-acpi 808622A8:00: ASoC: topology: could not load header: -22
[   25.217459] sof-audio-acpi 808622A8:00: error: tplg component load failed -22
[   25.217643] sof-audio-acpi 808622A8:00: error: failed to load DSP topology -22

Which I'm not getting when using the default sof-byt-codec.tplg file.

Possible ways to fix this which I can think of are:

1. Fix SOF and/or the tplg file so that it can do
DSP_B TDM 4 channel 24 bit on BYT/CHT.

2. Switch the machine driver over the I2S 2 channel 24 bit, to align it
with other machine drivers; and update the UCM files to match. Preferably
together with some string in the components string advertised by the kernel
so that the UCM files can be written so that they also keep working with
older kernels.

3. Keep using DSP_B TDM 4 channel 24 bit with sst-acpi and switch to
I2S 2 channel 24 bit with sof-audio-acpi; and update the UCM file to
set the mixer settings accordingly depending on which driver is in use.

I'm not sure what the best way to proceed is. To go with solution 1
I'm going to need some help, since I'm stuck there. I find solution 2
tempting because I like the idea of standardising all BYT/CHT machine
drivers on using I2S 2 channel 24 bit format between the SSP DAI and
the codec DAI. But this means that people upgrading their kernel
might see a regression until they update their UCM files too.

Regards,

Hans

