Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 111DA3B78DC
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Jun 2021 21:50:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 888851682;
	Tue, 29 Jun 2021 21:50:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 888851682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624996251;
	bh=hrNhFLADgl4eppCdbVOqKBM0/stVQhsWzlRD8vKOmv8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OL9C6L2Z1w85kSiQ5uOZ5AcsQFW/O3VdnNkXV66GSiM5MqJBpxrbiaM6JVkx0b1fJ
	 vI05iZA6ftDxSSJcyOfT1q7sbSXm/+tspcxFJximWMeyMskgHq+pid5oG/9HF4i97M
	 Az7Ba/fhafiLDTAtEJ/Zclg0pGXkGVRpCRkp95p0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1C96F800EE;
	Tue, 29 Jun 2021 21:49:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB722F80259; Tue, 29 Jun 2021 21:49:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id CF30CF80156
 for <alsa-devel@alsa-project.org>; Tue, 29 Jun 2021 21:49:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF30CF80156
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1624996154686913013-webhooks-bot@alsa-project.org>
References: <1624996154686913013-webhooks-bot@alsa-project.org>
Subject: Warnings while building alsa-gobject
Message-Id: <20210629194921.AB722F80259@alsa1.perex.cz>
Date: Tue, 29 Jun 2021 21:49:21 +0200 (CEST)
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

alsa-project/alsa-gobject issue #60 was opened from playaspec:

```
spec@spec-OBSPro:/opt/alsa-gobject-0.2.0/build$ ninja
[1/80] Generating alsactl-sigs-marshal_c with a custom command
INFO: Reading ../src/ctl/alsactl-sigs-marshal.list...
[2/80] Generating alsactl-sigs-marshal_h with a custom command
INFO: Reading ../src/ctl/alsactl-sigs-marshal.list...
[71/80] Generating ALSACtl-0.0.gir with a custom command
g-ir-scanner: link: x86_64-linux-gnu-gcc -pthread -o /opt/alsa-gobject-0.2.0/build/tmp-introspectwlgw8uso/ALSACtl-0.0 /opt/alsa-gobject-0.2.0/build/tmp-introspectwlgw8uso/ALSACtl-0.0.o -L. -Wl,-rpath,. -Wl,--no-as-needed -L/opt/alsa-gobject-0.2.0/build/src/ctl -Wl,-rpath,/opt/alsa-gobject-0.2.0/build/src/ctl -lalsactl -lgobject-2.0 -lglib-2.0 -ludev -lgirepository-1.0 -lgio-2.0 -lgobject-2.0 -Wl,--export-dynamic -lgmodule-2.0 -pthread -lglib-2.0
[73/80] Generating ALSATimer-0.0.gir with a custom command
g-ir-scanner: link: x86_64-linux-gnu-gcc -pthread -o /opt/alsa-gobject-0.2.0/build/tmp-introspecth2cag8su/ALSATimer-0.0 /opt/alsa-gobject-0.2.0/build/tmp-introspecth2cag8su/ALSATimer-0.0.o -L. -Wl,-rpath,. -Wl,--no-as-needed -L/opt/alsa-gobject-0.2.0/build/src/timer -Wl,-rpath,/opt/alsa-gobject-0.2.0/build/src/timer -lalsatimer -lgobject-2.0 -lglib-2.0 -ludev -lgirepository-1.0 -lgio-2.0 -lgobject-2.0 -Wl,--export-dynamic -lgmodule-2.0 -pthread -lglib-2.0
[75/80] Generating ALSARawmidi-0.0.gir with a custom command
g-ir-scanner: link: x86_64-linux-gnu-gcc -pthread -o /opt/alsa-gobject-0.2.0/build/tmp-introspectirtcfspf/ALSARawmidi-0.0 /opt/alsa-gobject-0.2.0/build/tmp-introspectirtcfspf/ALSARawmidi-0.0.o -L. -Wl,-rpath,. -Wl,--no-as-needed -L/opt/alsa-gobject-0.2.0/build/src/rawmidi -Wl,-rpath,/opt/alsa-gobject-0.2.0/build/src/rawmidi -lalsarawmidi -lgobject-2.0 -lglib-2.0 -ludev -lgirepository-1.0 -lgio-2.0 -lgobject-2.0 -Wl,--export-dynamic -lgmodule-2.0 -pthread -lglib-2.0
[76/80] Generating ALSAHwdep-0.0.gir with a custom command
g-ir-scanner: link: x86_64-linux-gnu-gcc -pthread -o /opt/alsa-gobject-0.2.0/build/tmp-introspectbm236ozt/ALSAHwdep-0.0 /opt/alsa-gobject-0.2.0/build/tmp-introspectbm236ozt/ALSAHwdep-0.0.o -L. -Wl,-rpath,. -Wl,--no-as-needed -L/opt/alsa-gobject-0.2.0/build/src/hwdep -Wl,-rpath,/opt/alsa-gobject-0.2.0/build/src/hwdep -lalsahwdep -lgobject-2.0 -lglib-2.0 -ludev -lgirepository-1.0 -lgio-2.0 -lgobject-2.0 -Wl,--export-dynamic -lgmodule-2.0 -pthread -lglib-2.0
../src/hwdep/alsahwdep-enum-types.h:10: Warning: ALSAHwdep: symbol='SNDRV_HWDEP_IFACE_LINE6': Unknown namespace for symbol 'SNDRV_HWDEP_IFACE_LINE6'
../src/hwdep/alsahwdep-enum-types.h:16: Warning: ALSAHwdep: symbol='SNDRV_HWDEP_IFACE_FW_MOTU': Unknown namespace for symbol 'SNDRV_HWDEP_IFACE_FW_MOTU'
../src/hwdep/alsahwdep-enum-types.h:17: Warning: ALSAHwdep: symbol='SNDRV_HWDEP_IFACE_FW_FIREFACE': Unknown namespace for symbol 'SNDRV_HWDEP_IFACE_FW_FIREFACE'
[79/80] Generating ALSASeq-0.0.gir with a custom command
g-ir-scanner: link: x86_64-linux-gnu-gcc -pthread -o /opt/alsa-gobject-0.2.0/build/tmp-introspectn1rw21o7/ALSASeq-0.0 /opt/alsa-gobject-0.2.0/build/tmp-introspectn1rw21o7/ALSASeq-0.0.o -L. -Wl,-rpath,. -Wl,--no-as-needed -L/opt/alsa-gobject-0.2.0/build/src/timer -Wl,-rpath,/opt/alsa-gobject-0.2.0/build/src/timer -L/opt/alsa-gobject-0.2.0/build/src/seq -Wl,-rpath,/opt/alsa-gobject-0.2.0/build/src/seq -L/opt/alsa-gobject-0.2.0/build/src/timer -Wl,-rpath,/opt/alsa-gobject-0.2.0/build/src/timer -lalsaseq -lalsatimer -lgobject-2.0 -lglib-2.0 -ludev -lgirepository-1.0 -lgio-2.0 -lgobject-2.0 -Wl,--export-dynamic -lgmodule-2.0 -pthread -lglib-2.0
[80/80] Generating ALSASeq-0.0.typelib with a custom command

```

Tried both git version and the 0.2.0 tar file. System is Ubuntu Studio 20.04.02 Kernel 5.8.0-59-lowlatency. ALSA: alsa-base 1.0.25+dfsg-0ubuntu5, Pulseaudio 1:13.99.1-1ubuntu3.11, pipewire 0.3.31-3~ubuntu20.04, jack2 1.9.14-0ubuntu2

Running on a Mac Pro 4,1, using a MOTU 828mkII.

Perhaps these warnings are inconsequential, but I figured I'd report them since it may affect my hardware. Happy to provide more info and testing.

Issue URL     : https://github.com/alsa-project/alsa-gobject/issues/60
Repository URL: https://github.com/alsa-project/alsa-gobject
