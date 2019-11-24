Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A681082D4
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Nov 2019 11:15:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A2661870;
	Sun, 24 Nov 2019 11:14:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A2661870
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574590510;
	bh=mzm3pdkRCGe8rfRHF9HhFbX+7FpmTTCPPyGMGtaOCLE=;
	h=From:To:References:In-Reply-To:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=inZL1eCzdDiLUCCbSjCpfv9pV1HidPSdWFIVwF7sBLXNemjVglhgygcunyTR4OyiE
	 rXFUyOyc+LU2P+64N1oQ5majARwrwHBXFQvjnw/OjhMKBThrqcbd/RUWtQkn2pOEBO
	 7izXwTlvtHn0NOmHFMADjAJC3X2dXHqnVqAHSqLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A2C4F800E5;
	Sun, 24 Nov 2019 11:13:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CE1CF801ED; Sun, 24 Nov 2019 11:13:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01E32F800E5
 for <alsa-devel@alsa-project.org>; Sun, 24 Nov 2019 11:13:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01E32F800E5
IronPort-SDR: 3LpsuME9Kh+4v0Hpj/hRJ+q0aDgTMv5REcrobFn9kiN/fVbC1m+ua0AVI1JHzoUv+gs5o/5D5F
 CseOepgPTFDmS/0hjWtMNffbhRBgsyhIDBy08kqaRdzF8l7HBOzSxfDzf9Q8d/WmOf9z87Wn1p
 i0772JskWyeTusm/yP2iNgrYXRrwTatrsNg88bF+NQFm1OnkcrHXklyKaQ5gmwcg8VUQKXNJWF
 9meDOohFDEQpPScojcsZRF1H2ddFRLWx9xif0BktubQjMNnpsX0wuvtpMcNGy51fwkbsXliI/8
 Lak=
X-IronPort-AV: E=Sophos;i="5.69,237,1571731200"; d="scan'208";a="45330423"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa1.mentor.iphmx.com with ESMTP; 24 Nov 2019 02:13:15 -0800
IronPort-SDR: 6gwaT97ICF1SVV34eQLQKFWSxzi/Zc9LiTz1zqp8lmdRMljCfXc3BWhe6lFJv3WZ8cU2fTIhKi
 yoCmG1gjUz27NOAtlctc6A9LWWoSpF3vuGjGjhchMVzvMY0iuQ6Y/y/jWEmok0X+D/SyGiI9ph
 TzLGSVoLM5Am7a77kkKAtxxleTphvopdAWaU8DGOM5/BPUpmX78yr/PpltjqCBdptbxiQAC0MG
 hZIOy69YZC6RMHJM1K2YMHURwNi+s9Ow8SiQjmgxO7f7pvJ6mmdE3fzRbgU9KyzQZQkQkDMOmO
 N4Q=
From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
To: 'Takashi Iwai' <tiwai@suse.de>, kbuild test robot <lkp@intel.com>
References: <201911240651.BBgcccwk%lkp@intel.com>
 <s5h36ed1xcc.wl-tiwai@suse.de>
In-Reply-To: <s5h36ed1xcc.wl-tiwai@suse.de>
Date: Sun, 24 Nov 2019 13:12:10 +0300
Organization: Mentor Graphics Corporation
Message-ID: <000001d5a2af$ade525f0$09af71d0$@mentor.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQHVokv8CUWYCnkb8061oNTe2bUpWqeaAQKAgAAZCWA=
Content-Language: en-us
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Cc: Timo Wischer <twischer@de.adit-jv.com>, alsa-devel@alsa-project.org,
 kbuild-all@lists.01.org
Subject: Re: [alsa-devel] [sound:for-next 127/148]
	sound/drivers/aloop.c:313: undefined reference to `snd_timer_close'
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

Hello Takashi,

> -----Original Message-----
> From: Takashi Iwai [mailto:tiwai@suse.de]
> Sent: Sunday, November 24, 2019 11:40 AM
> To: kbuild test robot
> Cc: Timo Wischer; kbuild-all@lists.01.org; alsa-devel@alsa-project.org;
> Gabbasov, Andrew
> Subject: Re: [sound:for-next 127/148] sound/drivers/aloop.c:313: undefined
> reference to `snd_timer_close'
> 
> On Sat, 23 Nov 2019 23:17:53 +0100,
> kbuild test robot wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
> for-next
> > head:   9314e44f455c8b46d08b2d379cb9e8fba5767207
> > commit: 26c53379f98d22d6a3e50bb146651dc7824334d7 [127/148] ALSA: aloop:
> Support selection of snd_timer instead of jiffies
> > config: i386-randconfig-f001-20191124 (attached as .config)
> > compiler: gcc-7 (Debian 7.4.0-14) 7.4.0
> > reproduce:
> >         git checkout 26c53379f98d22d6a3e50bb146651dc7824334d7
> >         # save the attached .config to linux build tree
> >         make ARCH=i386
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kbuild test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> >    ld: sound/drivers/aloop.o: in function
> `loopback_snd_timer_close_cable':
> > >> sound/drivers/aloop.c:313: undefined reference to `snd_timer_close'
> > >> ld: sound/drivers/aloop.c:314: undefined reference to
> `snd_timer_instance_free'
> >    ld: sound/drivers/aloop.o: in function `loopback_snd_timer_stop':
> > >> sound/drivers/aloop.c:276: undefined reference to `snd_timer_stop'
> >    ld: sound/drivers/aloop.o: in function `loopback_snd_timer_start':
> > >> sound/drivers/aloop.c:237: undefined reference to `snd_timer_start'
> >    ld: sound/drivers/aloop.o: in function `loopback_snd_timer_open':
> > >> sound/drivers/aloop.c:1129: undefined reference to
> `snd_timer_instance_new'
> > >> ld: sound/drivers/aloop.c:1164: undefined reference to
> `snd_timer_open'
> >    ld: sound/drivers/aloop.c:1173: undefined reference to
> `snd_timer_instance_free'
> 
> It's the missing Kconfig dependency.  I submitted the fix patch now.

Thank you for submitting the fix!

Best regards,
Andrew

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
