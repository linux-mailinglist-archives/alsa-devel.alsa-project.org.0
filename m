Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4FA13BDB7
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jan 2020 11:43:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E415117B5;
	Wed, 15 Jan 2020 11:42:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E415117B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579085001;
	bh=Bmgi3q94SIVB7rKI4hHMnABwHjuKh/KEdCEB2zFQfyQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C7HpfMafOYX8Ck4Ton4wXuxgNxsiT5HnsW9hdhJf9j6TU2Z92RtE4t/gTNquLa6JX
	 9qgtTgW7ugLWUkzUjJ7Pfi/t0PgIoCAcFicuzfLR4ORZsh7pQ1m6hTLF1y8yWDPULm
	 68JWpUj1wGvomYZKkrANdiTSIvBbUbyQqIrQVx1o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39F5EF8014B;
	Wed, 15 Jan 2020 11:41:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DFEFF800B9; Wed, 15 Jan 2020 11:41:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C213AF800B9
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 11:41:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C213AF800B9
Received: from localhost ([130.83.5.183]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis) id
 1MA88C-1ixgfI25TW-00BfwM; Wed, 15 Jan 2020 11:41:30 +0100
Date: Wed, 15 Jan 2020 11:41:27 +0100
From: Tim Schumacher <tim@timakro.de>
To: Jaroslav Kysela <perex@perex.cz>
Message-ID: <20200115104127.GA31357@impa>
References: <20200114173848.GA28085@impa>
 <f9eed39a-a433-e46c-d878-6191f547bd06@perex.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f9eed39a-a433-e46c-d878-6191f547bd06@perex.cz>
X-Provags-ID: V03:K1:MpJkV4y+acNk4aESu+xXq6FY+VVav24ajSvIwjTqmcXhUvASfGy
 A8qM16fkzcvVSEdBCGr63T629J1dMkdajWlWPbHKdSEA2ChZkxBGfDWDR/5K9HQdGLlhSEb
 aBOc0uFQwH+CBqWamucGgJ2H7CUANchcMeyzzN+pnpRZrolS0Naz5T/ft3JvLsHwHW6Kp2T
 JVUL1awZz2jgDXBNulSzg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/CacEmbhppw=:FCnKzLoq6ET/Wfv/qJxZMd
 AxP9l6FHWU1sh340OxhpW7ZpRLCpFvNGVS9xe7sm5F+XklG+GLq1Al8RkwCiXrY+XZ31erlTq
 WVVqlLtpTM4OCCDccNhlp14Ff1YI9+9xyJLewKC1H+aMjqixZVxYjr58yKupKOrHq8Ym5sKVM
 IEpXflBg7lfwue2ziG2fv7k9vpuAd2nAggI37OSAE3E5LlC1sGJSdwnYIXOJ5a/WF0JThCvQ0
 YTMnoz9E+1orYioJkD8/FRW06iEhLi8DMHpLVD2VKBIF6mp+lbQZYj8tXJ9EPubs0klx1ehBw
 Upm+j/OcOWmaX9ftXxTMNuXd8IDKRvOwgvUqR49evmoD3ISWD6UEkfi9Ddz8e1aXcew6pl6xZ
 m95L0MBF1WTephu7rRDe8SR2QM4TkMUfoksuf+6AbIYgytkl4W+kwQmUMesbw3nlynUrgqxog
 WcVci77ofgZtT0b4kYvtNEAUtnUgM6ua2x3zhtS41F44Tx7AfHeTrot1B0VEBeCKhMOlSwdhQ
 cqfrjCCSiDaD39suFfjA610a8v3uV4MLY5OM2qHItBnnnsqvbdCYSn4cYME1eUAWvURFFpMMk
 2X7AXJ1rYzJ8MR2w8X/Edjj5cUreHr2ChcI80wGojvRvP7UJnTIEXN7yzN3APXaXOjeeSWdTo
 Kz0pAIzztizSsYSzhag/h3f3kJRkJXrKruMuJKusei5TUP2z8MLDu6C34MnapT7MxIFTqqMJd
 GJv5U7HLYOe/ahv+SAqc+eOJ4UCGWqpeIhA8/+MXIFms+WCnvl8alJJKtenR12xlHVNpKYXy7
 +GGXnj4Hq2RyWfmR7Tfear15HId/zZ0F1EzCuwICjJEsw63eT30C4J1E0XYtbxV12ULJA07/i
 +b4X/6bUl60fkh2bXBPg==
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Bug report for changes in ucm2 with chtrt5645 card
 on Lenovo Miix 320
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Thanks for the fix. I don't want to compile ALSA myself so I can't test
it unfortunately. I will see if it works after the next ALSA release and
report back here in case it shouldn't work.

- Tim

On 2020-01-15, Jaroslav Kysela wrote:
> Dne 14. 01. 20 v 18:38 Tim Schumacher napsal(a):
> > Hi,
> > 
> > sending the mail CC to the mailing list again because I messed this up
> > last time. This is the output from 'alsaucm -c hw:0 set _verb HiFi'.
> > 
> > ALSA lib utils.c:261:(uc_mgr_config_load) could not open configuration file /usr/share/alsa/ucm2/LENOVO-80XF-LenovoMIIX320_10ICR-LNVNB161216/HiFi-dmic2.conf
> > ALSA lib parser.c:1190:(parse_verb_file) error: failed to open verb file /usr/share/alsa/ucm2/LENOVO-80XF-LenovoMIIX320_10ICR-LNVNB161216/HiFi-dmic2.conf : -2
> > ALSA lib main.c:960:(snd_use_case_mgr_open) error: failed to import hw:0 use case configuration -2
> > alsaucm: error failed to open sound card hw:0: No such file or directory
> 
> Thanks. This commit for alsa-lib should fix this issue:
> 
> https://github.com/alsa-project/alsa-lib/commit/b34715004f4a1aabb85c5b9f03ba9f200638ee97
> 
> 					Jaroslav
> > 
> > - Tim
> > 
> > On 2020-01-13, Jaroslav Kysela wrote:
> > > Dne 13. 01. 20 v 15:27 Tim Schumacher napsal(a):
> > > > The patch doesn't help unfortunately. Deleting
> > > > LENOVO-80XF-LenovoMIIX320_10ICR-LNVNB161216.conf still works with the
> > > > patch installed. Can I help debug this somehow?
> > > 
> > > If you have latest alsa-utils, the command 'alsaucm dump text' should work,
> > > otherwise try 'alsaucm set _verb HiFi'.
> > > 
> > > 					Jaroslav
> > > 
> > > > 
> > > > - Tim
> > > > 
> > > > On 2020-01-13, Jaroslav Kysela wrote:
> > > > > Dne 09. 01. 20 v 23:10 Tim Schumacher napsal(a):
> > > > > > Hi alsa devs,
> > > > > > 
> > > > > > I'm on Arch Linux on a rather uncommon laptop (Lenovo Miix 320) and my sound
> > > > > > stopped working on the upgrade from alsa-lib 1.1.9 to 1.2.1. wabbits on
> > > > > > IRC helped me track down the problem to a change in the
> > > > > > /usr/share/alsa/ucm (now /usr/share/alsa/ucm2) files. It seems like
> > > > > > /usr/share/alsa/ucm2/chtrt5645/HiFi-dmic2.conf and a symlink at
> > > > > > /usr/share/alsa/ucm2/chtrt5645/LENOVO-80XF-LenovoMIIX320_10ICR-LNVNB161216.conf
> > > > > > were specifically added for this laptop but in the contrary they break the
> > > > > > sound for me.
> > > > > > 
> > > > > > After the upgrade to alsa-lib 1.2.1 the sound is not working. The commands play no sound:
> > > > > > 
> > > > > >        pasuspender -- speaker-test --nloops=1 --channels=2 --test=wav --device=hw:0,0
> > > > > >        pasuspender -- speaker-test --nloops=1 --channels=2 --test=wav --device=hw:0,1
> > > > > > 
> > > > > > And this is the alsa-info.sh output http://alsa-project.org/db/?f=f883910a5c5101b4b1ea4202d1fe84ccd139f796
> > > > > > 
> > > > > > After deleting the /usr/share/alsa/ucm2/chtrt5645/LENOVO-80XF-LenovoMIIX320_10ICR-LNVNB161216.conf
> > > > > > symlink both commands from above play sound and this is the alsa-info.sh
> > > > > > output http://alsa-project.org/db/?f=e759eb9118a191b6c3b8c021fed58abc9cf95076
> > > > > 
> > > > > Thanks. I forgot to fix the file path in chtrt5645/chtrt5645-dmic2.conf .
> > > > > Could you test this patch?
> > > > > 
> > > > > https://github.com/alsa-project/alsa-ucm-conf/commit/74f2a0f0884df7b9f2d08d07456a3bc37d1a512e
> > > > > 
> > > > > 				Jaroslav
> > > > > 
> > > > > -- 
> > > > > Jaroslav Kysela <perex@perex.cz>
> > > > > Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
> > > > > 
> > > 
> > > 
> > > -- 
> > > Jaroslav Kysela <perex@perex.cz>
> > > Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
> > > 
> 
> 
> -- 
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
