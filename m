Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4078D4E9597
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 13:45:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A597717C1;
	Mon, 28 Mar 2022 13:44:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A597717C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648467921;
	bh=uSPz32mAwPvQxKlM3Qog4/Sqqg6u+YlivpBP0rKR6fk=;
	h=Date:From:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ouraInpDKAs9S2iJBz/5aKrcBy072/LR8Q+lbtv9hQCLoBHVvZ+5KNgVoKchXQ54U
	 EfJt2uX94/S96qiYM7hPS3lvfQHhqQxz5PvUHiMiybqAlrHXzXud5Q9xsiLKmyI6dx
	 PJXOYagsN3Ft9siNtMfH6XoeX3axuw3hZp4fwx0s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04A10F800CB;
	Mon, 28 Mar 2022 13:44:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B57E1F8024C; Mon, 28 Mar 2022 13:44:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CF65F800FA
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 13:44:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CF65F800FA
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1nYnn2-0001nr-F8; Mon, 28 Mar 2022 13:44:04 +0200
Message-ID: <45051cd2-2e28-3065-776b-d5e83c998cb5@leemhuis.info>
Date: Mon, 28 Mar 2022 13:44:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Bug 215711 - snd_hda_intel not binding to codec
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1648467848;
 fda44afa; 
X-HE-SMSGID: 1nYnn2-0001nr-F8
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 alsa-devel@alsa-project.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Petr Cerny <bugzilla@black-net.org>
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

Hi, this is your Linux kernel regression tracker.

I noticed a regression report in bugzilla.kernel.org that afaics nobody
acted upon since it was reported about a week ago, that's why I decided
to forward it to the lists and the maintainers. To quote from
https://bugzilla.kernel.org/show_bug.cgi?id=215711:

> Created attachment 300588 [details]
> SND_HDA_* excrept from kernel config
> 
> On PCI device discovery the Intel HDA codec doesn't bind to appropriate codec (if that is the correct term). The device codec (Conexant) is loaded, but sound doesn't work. Reloading the main module (snd_hda_intel) fixes the issue:
> 
> $ echo 1 > /sys/bus/pci/devices/0000:00:1b.0/remove
> 
> $ lsmod | sort
> Module                  Size  Used by
> configs                45056  0
> e1000e                225280  0
> grace                  16384  1 lockd
> irqbypass              16384  1 kvm
> iwlwifi               274432  0
> kvm                   569344  1 kvm_intel
> kvm_intel             229376  0
> lockd                  98304  1 nfs
> mei                    90112  1 mei_me
> mei_me                 28672  0
> nfs                   184320  3 nfsv4
> nfsv4                 380928  2
> sunrpc                274432  9 nfsv4,lockd,nfs
> uvcvideo              110592  0
> videobuf2_common       45056  4 videobuf2_vmalloc,videobuf2_v4l2,uvcvideo,videobuf2_memops
> videobuf2_memops       16384  1 videobuf2_vmalloc
> videobuf2_v4l2         24576  1 uvcvideo
> videobuf2_vmalloc      16384  1 uvcvideo
> 
> $ echo 1 > /sys/bus/pci/rescan
> # dmesg output
> [ 9218.563134] pci 0000:00:1b.0: [8086:3b56] type 00 class 0x040300
> [ 9218.563178] pci 0000:00:1b.0: reg 0x10: [mem 0xc0004000-0xc0007fff 64bit]
> [ 9218.563344] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
> [ 9218.563818] pci 0000:00:1b.0: BAR 0: assigned [mem 0xc0004000-0xc0007fff 64bit]
> [ 9218.563846] pci 0000:00:1e.0: PCI bridge to [bus 0e]
> [ 9218.598927] snd_hda_intel 0000:00:1b.0: bound 0000:00:02.0 (ops 0xffffffff824a44e0)
> [ 9218.609798] snd_hda_intel 0000:00:1b.0: Cannot probe codecs, giving up
> 
> $ lsmod | sort
> Module                  Size  Used by                                                                                                                                                                                                                                            
> configs                45056  0                                                                                                                                                                                                                                                  
> e1000e                225280  0                                                                                                                                                                                                                                                  
> grace                  16384  1 lockd                                                                                                                                                                                                                                            
> irqbypass              16384  1 kvm                                                                                                                                                                                                                                              
> iwlwifi               274432  0                                                                                                                                                                                                                                                  
> kvm                   569344  1 kvm_intel                                                                                               
> kvm_intel             229376  0                                                                                                         
> lockd                  98304  1 nfs                                                                                                     
> mei                    90112  1 mei_me                                                                                                  
> mei_me                 28672  0                                                                                                         
> nfs                   184320  3 nfsv4                                                                                                   
> nfsv4                 380928  2                                                                                                         
> snd                    77824  7 snd_hda_codec_generic,snd_hda_codec_conexant,snd_hwdep,snd_hda_intel,snd_hda_codec,snd_timer,snd_pcm    
> snd_hda_codec         118784  3 snd_hda_codec_generic,snd_hda_codec_conexant,snd_hda_intel                                              
> snd_hda_codec_conexant    20480  0                                                                                                      
> snd_hda_codec_generic    77824  1 snd_hda_codec_conexant                                                                                
> snd_hda_core           65536  4 snd_hda_codec_generic,snd_hda_codec_conexant,snd_hda_intel,snd_hda_codec                                
> snd_hda_intel          36864  0                                                                                                         
> snd_hwdep              16384  1 snd_hda_codec                                                                                           
> snd_intel_dspcfg       16384  1 snd_hda_intel                                                                                           
> snd_pcm               110592  3 snd_hda_intel,snd_hda_codec,snd_hda_core                                                                
> snd_timer              32768  1 snd_pcm                                                                                                 
> soundcore              16384  1 snd                                                                                                     
> sunrpc                274432  9 nfsv4,lockd,nfs                                                                                         
> uvcvideo              110592  0                                                                                                         
> videobuf2_common       45056  4 videobuf2_vmalloc,videobuf2_v4l2,uvcvideo,videobuf2_memops
> videobuf2_memops       16384  1 videobuf2_vmalloc
> videobuf2_v4l2         24576  1 uvcvideo
> videobuf2_vmalloc      16384  1 uvcvideo
> 
> $ modprobe -rv snd_hda_intel; modprobe -v snd_hda_intel
> # dmesg output
> [ 9230.886362] snd_hda_intel 0000:00:1b.0: bound 0000:00:02.0 (ops 0xffffffff824a44e0)
> [ 9230.895721] snd_hda_codec_conexant hdaudioC0D0: CX20585: BIOS auto-probing.
> [ 9230.896677] snd_hda_codec_conexant hdaudioC0D0: autoconfig for CX20585: line_outs=1 (0x1f/0x0/0x0/0x0/0x0) type:speaker
> [ 9230.896691] snd_hda_codec_conexant hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
> [ 9230.896700] snd_hda_codec_conexant hdaudioC0D0:    hp_outs=2 (0x1c/0x19/0x0/0x0/0x0)
> [ 9230.896707] snd_hda_codec_conexant hdaudioC0D0:    mono: mono_out=0x0
> [ 9230.896713] snd_hda_codec_conexant hdaudioC0D0:    inputs:
> [ 9230.896718] snd_hda_codec_conexant hdaudioC0D0:      Internal Mic=0x23
> [ 9230.896724] snd_hda_codec_conexant hdaudioC0D0:      Mic=0x1b
> [ 9230.896729] snd_hda_codec_conexant hdaudioC0D0:      Dock Mic=0x1a
> [ 9230.908437] snd_hda_codec_generic hdaudioC0D3: autoconfig for Generic: line_outs=0 (0x0/0x0/0x0/0x0/0x0) type:line
> [ 9230.908454] snd_hda_codec_generic hdaudioC0D3:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
> [ 9230.908461] snd_hda_codec_generic hdaudioC0D3:    hp_outs=0 (0x0/0x0/0x0/0x0/0x0)
> [ 9230.908468] snd_hda_codec_generic hdaudioC0D3:    mono: mono_out=0x0
> [ 9230.908473] snd_hda_codec_generic hdaudioC0D3:    dig-out=0x5/0x0
> [ 9230.908477] snd_hda_codec_generic hdaudioC0D3:    inputs:
> [ 9230.916063] input: HDA Intel MID Mic as /devices/pci0000:00/0000:00:1b.0/sound/card0/input52
> [ 9230.916216] input: HDA Intel MID Dock Mic as /devices/pci0000:00/0000:00:1b.0/sound/card0/input53
> [ 9230.916353] input: HDA Intel MID Dock Headphone as /devices/pci0000:00/0000:00:1b.0/sound/card0/input54
> [ 9230.919563] input: HDA Intel MID Headphone as /devices/pci0000:00/0000:00:1b.0/sound/card0/input55
> [ 9230.919727] input: HDA Intel MID HDMI as /devices/pci0000:00/0000:00:1b.0/sound/card0/input56
> 
> $ lsmod | sort
> Module                  Size  Used by
> configs                45056  0
> e1000e                225280  0
> grace                  16384  1 lockd
> irqbypass              16384  1 kvm
> iwlwifi               274432  0
> kvm                   569344  1 kvm_intel
> kvm_intel             229376  0
> lockd                  98304  1 nfs
> mei                    90112  1 mei_me
> mei_me                 28672  0
> nfs                   184320  3 nfsv4
> nfsv4                 380928  2
> snd                    77824  7 snd_hda_codec_generic,snd_hda_codec_conexant,snd_hwdep,snd_hda_intel,snd_hda_codec,snd_timer,snd_pcm
> snd_hda_codec         118784  3 snd_hda_codec_generic,snd_hda_codec_conexant,snd_hda_intel
> snd_hda_codec_conexant    20480  1
> snd_hda_codec_generic    77824  2 snd_hda_codec_conexant
> snd_hda_core           65536  4 snd_hda_codec_generic,snd_hda_codec_conexant,snd_hda_intel,snd_hda_codec
> snd_hda_intel          36864  0
> snd_hwdep              16384  1 snd_hda_codec
> snd_intel_dspcfg       16384  1 snd_hda_intel
> snd_pcm               110592  3 snd_hda_intel,snd_hda_codec,snd_hda_core
> snd_timer              32768  1 snd_pcm
> soundcore              16384  1 snd
> sunrpc                274432  9 nfsv4,lockd,nfs
> uvcvideo              110592  0
> videobuf2_common       45056  4 videobuf2_vmalloc,videobuf2_v4l2,uvcvideo,videobuf2_memops
> videobuf2_memops       16384  1 videobuf2_vmalloc
> videobuf2_v4l2         24576  1 uvcvideo
> videobuf2_vmalloc      16384  1 uvcvideo
> 
> 
> 5.15.29, have observed it already at least on 5.10.27, HW is ThinkPad x201 (x220 as well). I'm marking it as regression, since it used to work in the distant past (5.4-ish at least iirc)

Could somebody take a look into this? Or was this discussed somewhere
else already? Or even fixed?

Anyway, to get this tracked:

#regzbot introduced: v5.4..v5.10
#regzbot from: Petr Cerny <bugzilla@black-net.org>
#regzbot title: snd: snd_hda_intel not binding to codec
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215711

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.

-- 
Additional information about regzbot:

If you want to know more about regzbot, check out its web-interface, the
getting start guide, and the references documentation:

https://linux-regtracking.leemhuis.info/regzbot/
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md

The last two documents will explain how you can interact with regzbot
yourself if your want to.

Hint for reporters: when reporting a regression it's in your interest to
CC the regression list and tell regzbot about the issue, as that ensures
the regression makes it onto the radar of the Linux kernel's regression
tracker -- that's in your interest, as it ensures your report won't fall
through the cracks unnoticed.

Hint for developers: you normally don't need to care about regzbot once
it's involved. Fix the issue as you normally would, just remember to
include 'Link:' tag in the patch descriptions pointing to all reports
about the issue. This has been expected from developers even before
regzbot showed up for reasons explained in
'Documentation/process/submitting-patches.rst' and
'Documentation/process/5.Posting.rst'.

