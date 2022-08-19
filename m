Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EE859961A
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 09:35:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3498B163B;
	Fri, 19 Aug 2022 09:34:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3498B163B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660894527;
	bh=Setx/McJDFIlSMxvyoT9ZFh31KGUo+NC90w6Q8YhqAI=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=gRGBFDLDOS31CORclYtRxN7BPT47Pw9Xo5a1PILCHl13zehHhK8ofmu3L3MntyIO/
	 uKwKWQC5jLX+dtJXWcO60V6j/u4P40vQdcWmN6ONVnF28ckVESJvXFfi8AV8r/WUou
	 nvY+8pzxSBBF2k5y6Eze0c6JiixMH8ZTquJMngA8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2DFCF8016C;
	Fri, 19 Aug 2022 09:34:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47283F80430; Fri, 19 Aug 2022 03:01:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com
 [148.163.139.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09246F800EE
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 03:01:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09246F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu
 header.b="ZGyeRQrH"
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
 by mx0b-00364e01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27J10ikl020568
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 21:01:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu;
 h=mime-version :
 reply-to : from : date : message-id : subject : to : cc : content-type;
 s=pps01; bh=XXw1wxNVixhCPIaF/xre6zIgiZeCX5cJfzJCkHHLCHg=;
 b=ZGyeRQrH+Vpxgcp1oDB1wJ4XYDpaQYorb912MDU07xzdd7V1U6p7Q/Z39iPpH9q/P1hQ
 c4ci5tgL+2ubn9L0KpiGqbC1xyx5HXHKY9f7cjJdmUDEARpiGyqgbLEKaBRW9DPubuG0
 XTjuRJ7tDiTrEV7q1zcIboX0WrbtuPyPTfrpqJXYlKiTatt/JWb9q+7DNzmWhkphxo/w
 7R3EPlOyuY2i7jQdJNrT7ck8UnMaJSCJGytF/yhhGo4+aQI8Wo/EWpRNSSTvqoJf8HNz
 oM4QzYGfffZxZNyGQRjaN7gnYOGfvKRvWbruBl4H8T8gCL4O3zr/tMT6+WpHsjNMEDqp Zg== 
Received: from sendprdmail20.cc.columbia.edu (sendprdmail20.cc.columbia.edu
 [128.59.72.22])
 by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 3j11b5n5yn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 21:01:21 -0400
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by sendprdmail20.cc.columbia.edu (8.14.7/8.14.4) with ESMTP id 27J11KKs037676
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 21:01:20 -0400
Received: by mail-vs1-f72.google.com with SMTP id
 124-20020a670882000000b00388cd45f433so624362vsi.8
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 18:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc;
 bh=XXw1wxNVixhCPIaF/xre6zIgiZeCX5cJfzJCkHHLCHg=;
 b=xn7xFtCG1Y4ZOlnbBNFfprzDNWb4qXBuj+g3J0Fbv4YHXDDzlkQgkoNPlXS2V9I3Kp
 tHAAvBNCLhkicXnlo1SZFzeTa8mOR39K+/jmOX3UZViCo8qj7qxvZYKMGbKMKtmQp0Z1
 mdZ371cJGlUlSWB193P0IplHLKSF9HlvMAbnElF6Ogq7jECg9jADtRBszTIu1yVCHE4+
 1CiR0efUarjiNGkO46+1770YESAPBwIl6biJnc1vD5Tt5vGf4pxLBRORMiL5OK0IOrVE
 Ous/NLtk62h8OCtehQaCjurOqe9LO/mjNLZCH3mnwkUtZMffAu8ft9+YWw8OZWAIVP1m
 CdEg==
X-Gm-Message-State: ACgBeo3y8Tv06GVQI3vnRZCFTk+m5877Bdl1Q+DwPKubp4MqsDfgdWef
 scPLJtPDS4isROBRoaxqfoVwNTRGVJsU15hf8YlzwbURfOxGoQdW+GyfVvq9rLooUameLtu71hy
 JVk+u1KDbdtLpAn4cTLMQuvmzdYs18V5eAIuCDkfioDxRxC4=
X-Received: by 2002:ab0:3b0b:0:b0:397:d412:8575 with SMTP id
 n11-20020ab03b0b000000b00397d4128575mr2124596uaw.105.1660870879979; 
 Thu, 18 Aug 2022 18:01:19 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4hdZ5wNQvVnVzZL8609KnDo6bvY+9Wh1AwmN9t+svxHw8h8Y72fxMvilDXWJvEN385lzqKOsJQyrBjVb1VcX0=
X-Received: by 2002:ab0:3b0b:0:b0:397:d412:8575 with SMTP id
 n11-20020ab03b0b000000b00397d4128575mr2124579uaw.105.1660870879280; Thu, 18
 Aug 2022 18:01:19 -0700 (PDT)
MIME-Version: 1.0
From: Abhishek Shah <abhishek.shah@columbia.edu>
Date: Thu, 18 Aug 2022 21:00:00 -0400
Message-ID: <CAEHB2493pZRXs863w58QWnUTtv3HHfg85aYhLn5HJHCwxqtHQg@mail.gmail.com>
Subject: data-race in snd_seq_oss_midi_check_exit_port / snd_seq_oss_midi_setup
To: alsa-devel@alsa-project.org, perex@perex.cz, tiwai@suse.com
X-Proofpoint-GUID: crt2f50JjIxcBnFMxrvBM8yt0P1LuSaW
X-Proofpoint-ORIG-GUID: crt2f50JjIxcBnFMxrvBM8yt0P1LuSaW
X-CU-OB: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_18,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10
 clxscore=1011 lowpriorityscore=10 mlxlogscore=941 priorityscore=1501
 suspectscore=0 bulkscore=10 spamscore=0 adultscore=0 malwarescore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208190000
X-Mailman-Approved-At: Fri, 19 Aug 2022 09:34:26 +0200
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: linux-kernel@vger.kernel.org, Gabriel Ryan <gabe@cs.columbia.edu>
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
Reply-To: abhishek.shah@columbia.edu
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi all,

We found a race involving the *max_midi_devs* variable. We see an
interleaving where the following check here
<https://elixir.bootlin.com/linux/v5.18-rc5/source/sound/core/seq/oss/seq_oss_init.c#L200>
passes before the *snd_seq_oss_midi_check_exit_port*() finishes, but this
check should not pass if *max_midi_devs* will become zero, but we are not
sure of its implications in terms of security impact. Please let us know
what you think.

Thanks!

*-------------------Report---------------------*

*write* to 0xffffffff88382f80 of 4 bytes by task 6541 on cpu 0:
 snd_seq_oss_midi_check_exit_port+0x1a6/0x270
sound/core/seq/oss/seq_oss_midi.c:237
 receive_announce+0x193/0x1b0 sound/core/seq/oss/seq_oss_init.c:143
 snd_seq_deliver_single_event+0x30d/0x4e0 sound/core/seq/seq_clientmgr.c:640
 deliver_to_subscribers sound/core/seq/seq_clientmgr.c:695 [inline]
 snd_seq_deliver_event+0x38c/0x490 sound/core/seq/seq_clientmgr.c:830
 snd_seq_kernel_client_dispatch+0x189/0x1a0
sound/core/seq/seq_clientmgr.c:2339
 snd_seq_system_broadcast+0x98/0xd0 sound/core/seq/seq_system.c:86
 snd_seq_ioctl_delete_port+0x9a/0xc0 sound/core/seq/seq_clientmgr.c:1356
 snd_seq_ioctl+0x198/0x2d0 sound/core/seq/seq_clientmgr.c:2173
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl+0xe1/0x150 fs/ioctl.c:856
 __x64_sys_ioctl+0x43/0x50 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0x90 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae

*read* to 0xffffffff88382f80 of 4 bytes by task 6542 on cpu 1:
 snd_seq_oss_midi_setup+0x1b/0x40 sound/core/seq/oss/seq_oss_midi.c:273
 snd_seq_oss_open+0x364/0x900 sound/core/seq/oss/seq_oss_init.c:198
 odev_open+0x55/0x70 sound/core/seq/oss/seq_oss.c:128
 soundcore_open+0x315/0x3a0 sound/sound_core.c:593
 chrdev_open+0x373/0x3f0 fs/char_dev.c:414
 do_dentry_open+0x543/0x8f0 fs/open.c:824
 vfs_open+0x47/0x50 fs/open.c:958
 do_open fs/namei.c:3476 [inline]
 path_openat+0x1906/0x1dc0 fs/namei.c:3609
 do_filp_open+0xef/0x200 fs/namei.c:3636
 do_sys_openat2+0xa5/0x2a0 fs/open.c:1213
 do_sys_open fs/open.c:1229 [inline]
 __do_sys_openat fs/open.c:1245 [inline]
 __se_sys_openat fs/open.c:1240 [inline]
 __x64_sys_openat+0xf0/0x120 fs/open.c:1240
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0x90 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Reported by Kernel Concurrency Sanitizer on:
CPU: 1 PID: 6542 Comm: syz-executor2-n Not tainted 5.18.0-rc5+ #107
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1
04/01/2014


*Reproducing Inputs*

Input CPU 0:
r0 = openat$sndseq(0xffffffffffffff9c,
&(0x7f0000000040)='/dev/snd/seq\x00', 0x0)
ioctl$SNDRV_SEQ_IOCTL_CREATE_PORT(r0, 0xc0a85320,
&(0x7f0000000240)={{0x80}, 'port1\x00', 0x10})
ioctl$SNDRV_SEQ_IOCTL_SET_CLIENT_POOL(r0, 0x40a85321,
&(0x7f0000000100)={0x80})

Input CPU 1:
r0 = openat$sequencer2(0xffffff9c, &(0x7f0000000000)='/dev/sequencer2\x00',
0x0, 0x0)
ioctl$SNDCTL_SYNTH_INFO(r0, 0xc08c5102,
&(0x7f0000000200)={"02961a3ce6d4828f8b5559726313251b55fa11d8d65406f1f33c9af8e3f8",
0xffffffff})
