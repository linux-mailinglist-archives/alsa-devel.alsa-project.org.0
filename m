Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BAE22D6B4
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Jul 2020 12:22:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04E91168B;
	Sat, 25 Jul 2020 12:21:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04E91168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595672562;
	bh=Cx30daHQvDW29UUOYle7IdZkVt861pyWQsnZWs8IAxw=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YHlwwctnqL3HDCSW0ekWJ4tH5+OnD9JDY9Udy8/nnC/OnZktkqcFsegROwcV1LcNB
	 FgX/r1zpEKJlAAhGsIolKI2/OokVWZ3SWZjcYG3UdwCpAIRfQEDvbELA8d7H7OMq/m
	 rpouS9Yw9p01xlpM8Q2mApdUvxlfhj4OjCsSzs1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FB86F8024A;
	Sat, 25 Jul 2020 12:21:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24902F800DE; Sat, 25 Jul 2020 12:20:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_138,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77597F800DE
 for <alsa-devel@alsa-project.org>; Sat, 25 Jul 2020 12:20:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77597F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NwDdQfBl"
Received: by mail-io1-xd32.google.com with SMTP id s189so5034823iod.2
 for <alsa-devel@alsa-project.org>; Sat, 25 Jul 2020 03:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=37n7QaWOYkrlns9TnvU32tm+M/AN4tL2ffSDuwW/ifs=;
 b=NwDdQfBl0XPVJzzcgmsdG9R/kxoSt3EQc5amA1TDK5VNVcOkhHtstui/AtyOoyxrOp
 b6/cALneCOFuujBA4DV9Ybe3eWVg9Hw+nU0XbQlt1n7o1sWdReTpNUJ8n0PaPV0h3o2W
 LGkQHcI4k9T7B3BAsKQZxCwBeJRivOIh+QNIHqBr0vUJLuRhopkwT6TcgN8k5VHp+IhS
 8YZJ6+XQFM0l2rAjCEqMVqd8Y6hVny2tn0jNf/O0Q46uWtOD2eLAK/Z2aEhtQGSJoVFJ
 CN5JR9iCuwkeBGMzaSjQlanZYXW+i2xyaz9Y4SmzQEu3FpIZ+MxmmGZrR2RtmQANQwfy
 0X5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=37n7QaWOYkrlns9TnvU32tm+M/AN4tL2ffSDuwW/ifs=;
 b=YL/xT4v7JHszs8SDBQr8oWOMB7GcxEIO5VJ/I+f1gPYsR5UjwGvbSdAnZUeKcifgS6
 fwuofuOQClEFflEwH4tbPHrwTO0frsBZCsv96GCxJ5A2a0Vhd3LN32z7z5KZ8nHyqrDR
 hsdlvEy2FNnPAXzfRxtlYk9sT1Mi2W6V/OObBQI7Ryt6dNnIrM37+taXXcmvyPk1wXeZ
 fwCo2yz0p7Qye4RuDTbQuuN3MscjlYLhqt7ZXzPUDn36CxNIEsaUUFkUi9/gVWjSYKlx
 THr8smNhrJugAjoiW/pMIADdb2m8pOrJMjFu/QLEDCKHP0EvpeJM7+WEQvVbxdXd+lfO
 noPw==
X-Gm-Message-State: AOAM530nGop6sLzVjWGtOQqGnNTyFTU4KZbg5Fw4iB8QHIFLj5dIXjYO
 bdqaFM4Zl+Ppq5r3Uc7uQTYN59w95l8iUd3KqPMmoZ70ueg=
X-Google-Smtp-Source: ABdhPJxJB3lde80dxPOF8LwXZalvWsttdLApmuPqdcikak4u0WIKVeijyeBWOYAMCYMcVRBZHLGZjcCh51A1k2E8vls=
X-Received: by 2002:a02:3c08:: with SMTP id m8mr15139035jaa.107.1595672451854; 
 Sat, 25 Jul 2020 03:20:51 -0700 (PDT)
MIME-Version: 1.0
From: Yasushi SHOJI <yasushi.shoji@gmail.com>
Date: Sat, 25 Jul 2020 19:20:41 +0900
Message-ID: <CAELBRWJ7oL1+v1eX_rZ6gPkC2ykbms-rcyGMQZ+MTmOKMVnJSQ@mail.gmail.com>
Subject: Lenovo X270 with HDA ALC298
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
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

Hi all,

I noticed that my 3 years old Lenovo X270 with Intel HDA & RealTek
ALC298 doesn't work with 3.5 mm audio combo jack with 4 pole CTIA. A
bit of googling showed me that `snd-hda-intel` module can take some
options like `model` to run some fix ups. and I have found that
`model=alc298-dell1` seems to at least work. But its gain is way too
low.  It's mostly just noise.  It sounds like my mic is on the
line-in.

So, I opened `patch_realtek.c` to see what's going on. I found the
following but not sure what the values for `.v.pins` are for.

```
[ALC298_FIXUP_DELL1_MIC_NO_PRESENCE] = {
.type = HDA_FIXUP_PINS,
.v.pins = (const struct hda_pintbl[]) {
{ 0x18, 0x01a1913c }, /* use as headset mic, without its own jack detect */
{ 0x1a, 0x01a1913d }, /* use as headphone mic, without its own jack detect */
{ }
},
.chained = true,
.chain_id = ALC269_FIXUP_HEADSET_MODE
},
```

In `apply_fix(), these `.v.pins` values are passed to
`snd_hda_apply_pincfgs()` but I can't find what values mean.  Would
someone please enlighten me?

My questions are

1) How can I found out which pin goes where.  There is x270 schematics
   on the net but not sure it's correct.

2) What does the value, ie, 0x01a1913d, represent?

Thanks,
-- 
              yashi
