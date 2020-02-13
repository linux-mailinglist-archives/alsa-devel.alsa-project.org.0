Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAF915B780
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 04:02:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B294D1671;
	Thu, 13 Feb 2020 04:01:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B294D1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581562969;
	bh=VC2+bHbasGcFbg7X81hcuH5jgklYzCY7tI4mxs5ycGk=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dyJsmzceF5+aYEctyEp0Z1lNHJx4khJfo5LyLwBEbRZBY5hupC4w/sIte3R4fpPv1
	 gB17nZUfhNGjv5TSb8CVKILx4sNjftGAnnbcN5oRx+MtMHiex9jwfsKsq+B0LNyU73
	 X5mQISfevn7bSNs8nK4cJm+C+IFuPoSW8DMIbzUo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1041F80138;
	Thu, 13 Feb 2020 04:01:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A622F80145; Thu, 13 Feb 2020 04:01:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=HTML_MESSAGE, MIME_BASE64_TEXT,
 PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from tpecef01.compal.com (exmail3.compal.com [59.120.207.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1933DF80139
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 04:00:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1933DF80139
X-UUID: 984d8f4645e947698bbca4a01db20454-20200213
Received: from tpembx02.compal.com [(10.110.15.27)] by tpecef01.compal.com
 (envelope-from <lucien_kao@compal.com>)
 (Cellopoint E-mail Firewall v4.1.6 Build 0408 with TLS)
 with ESMTP id 2094720153; Thu, 13 Feb 2020 11:00:43 +0800
Received: from TPEMBX03.compal.com (10.110.15.28) by tpembx02.compal.com
 (10.110.15.27) with Microsoft SMTP Server (TLS) id 15.0.995.29; Thu, 13 Feb
 2020 11:00:41 +0800
Received: from TPEMBX03.compal.com ([fe80::dd13:fe1c:1008:7f]) by
 TPEMBX03.compal.com ([fe80::dd13:fe1c:1008:7f%16]) with mapi id
 15.00.0995.028; Thu, 13 Feb 2020 11:00:41 +0800
From: <Lucien_Kao@compal.com>
To: <tiwai@suse.de>
Thread-Topic: [alsa-devel] USB Type-C monitor flashes once when play a video
 file after unplug and re-plug the monitor
Thread-Index: AdXB0nlM5qaLFlJOTlavFS+ZjDjiAwAAOfiAAKNroPAANtEAgAADOdOAACGLiTD//7G2gP/ISKWQgG74KwD//m+x0A==
Date: Thu, 13 Feb 2020 03:00:41 +0000
Message-ID: <45e76602fd2740c9a995073df05bff3f@TPEMBX03.compal.com>
References: <d7aba6970fbd48f2b32e2bc6d838ab20@TPEMBX01.compal.com>
 <s5hwoa8j3xi.wl-tiwai@suse.de>
 <5aff22f1e36e484fa52e17c855e8ddc8@TPEMBX03.compal.com>
 <20200107172457.GA18938@nc-hades.jf.intel.com>	<s5h7e23p01c.wl-tiwai@suse.de>
 <bbbfbfa04bd046c78bba621974c9186f@TPEMBX03.compal.com>
 <s5hwoa2o4ji.wl-tiwai@suse.de>
 <14c541a9b3bf4f39b24edc1d77036ab1@TPEMBX03.compal.com>
 <s5hr1z0yvef.wl-tiwai@suse.de>
In-Reply-To: <s5hr1z0yvef.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.110.15.241]
x-tm-snts-smtp: FA9D95F8E202DA1972BB54B435C576F39A4056003262E2694E815033EE8F161A2000:8
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: nathan.d.ciobanu@linux.intel.com, AJ_Cheng@compal.com,
 alsa-devel@alsa-project.org, CindyXT_Wang@compal.com,
 intel-gfx@lists.freedesktop.org, Nelson_Ye@compal.com, Shane_Yap@compal.com,
 Evan_Tseng@compal.com
Subject: Re: [alsa-devel] USB Type-C monitor flashes once when play a video
 file after unplug and re-plug the monitor
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

This issue we found in kernel 4.19.x, but Ubuntu 19.10 (kernel 5.4.x stable) iss
ue not found. We are chromebook team, so for our product design it shouldn't be
upgraded kernel to 5.4.x, however does it has any chance to fix issue in kernel
4.19.x?

-----Original Message-----
From: Takashi Iwai <tiwai@suse.de>
Sent: Wednesday, February 12, 2020 6:04 PM
To: Kao. Lucien (TPE) <Lucien_Kao@compal.com>
Cc: nathan.d.ciobanu@linux.intel.com; Cheng. AJ (TPE) <AJ_Cheng@compal.com>; int
el-gfx@lists.freedesktop.org; alsa-devel@alsa-project.org; Wang. CindyXT (TPE) <
CindyXT_Wang@compal.com>; Ye. Nelson (TPE) <Nelson_Ye@compal.com>; Yap. Shane (T
PE) <Shane_Yap@compal.com>; Tseng. Evan (TPE) <Evan_Tseng@compal.com>
Subject: Re: [alsa-devel] USB Type-C monitor flashes once when play a video file
 after unplug and re-plug the monitor

On Wed, 12 Feb 2020 10:37:30 +0100,
<Lucien_Kao@compal.com> wrote:
>
> Hi Takashi
>
> Sorry to bother you again, during this period I do some experiment then issue
may be fixed by my local patch, but I am not sure, however may I have your sugge
stion if you are available.
> I put snd_hda_codec_read and snd_hda_codec_set_power_to_all ahead then add deb
ug log in function haswell_verify_D0 I found my changes cause cvt_nid and nid co
uld get "power state: 1" every single time after re-plug type-c cable then playi
ng music, you can see flash_once_fixed_messages in details. But without my patch
 which nid gets "power state: 0" and external type-c monitor flashes once after
playing music. Assume my finding is right, do we have chance to submit code to f
ix issue? Thanks.

Is the issue reproduced with the latest upstream code (or at least 5.4.y stable)
?
Then yeah, we need to take a deeper look.


thanks,

Takashi

>
> With patch
> 2020-02-12T00:58:27.496016-08:00 ERR kernel: [   47.729823] @@@ cvt_nid power
state: 1
> 2020-02-12T00:58:27.496024-08:00 ERR kernel: [   47.729883] @@@ nid power stat
e: 1
>
> Without patch
> 2020-02-12T00:55:36.795016-08:00 ERR kernel: [  125.047502] @@@
> cvt_nid power state: 1
> 2020-02-12T00:55:36.795026-08:00 ERR kernel: [  125.047565] @@@ nid
> power state: 0
>
> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Wednesday, January 8, 2020 2:18 PM
> To: Kao. Lucien (TPE) <Lucien_Kao@compal.com>
> Cc: nathan.d.ciobanu@linux.intel.com; Cheng. AJ (TPE)
> <AJ_Cheng@compal.com>; intel-gfx@lists.freedesktop.org;
> alsa-devel@alsa-project.org; Wang. CindyXT (TPE)
> <CindyXT_Wang@compal.com>; Ye. Nelson (TPE) <Nelson_Ye@compal.com>;
> Yap. Shane (TPE) <Shane_Yap@compal.com>; Tseng. Evan (TPE)
> <Evan_Tseng@compal.com>
> Subject: Re: [alsa-devel] USB Type-C monitor flashes once when play a
> video file after unplug and re-plug the monitor
>
> On Wed, 08 Jan 2020 04:07:17 +0100,
> <Lucien_Kao@compal.com> wrote:
> >
> > Hi Takashi
> >
> > Is the attachment what you suspect? That merged to our kernel v4.19 already,
 have any suggestions? Thanks.
>
> Then I have no concrete idea.  It might be some other changes in HDMI codec dr
iver or it might be a fix in i915 graphics side, or even thunderbolt or whatever
, too...
>
> Takashi
>
> >
> > -----Original Message-----
> > From: Takashi Iwai <tiwai@suse.de>
> > Sent: Wednesday, January 8, 2020 2:57 AM
> > To: Nathan Ciobanu <nathan.d.ciobanu@linux.intel.com>
> > Cc: Kao. Lucien (TPE) <Lucien_Kao@compal.com>; Cheng. AJ (TPE)
> > <AJ_Cheng@compal.com>; intel-gfx@lists.freedesktop.org;
> > alsa-devel@alsa-project.org; Wang. CindyXT (TPE)
> > <CindyXT_Wang@compal.com>; Ye. Nelson (TPE) <Nelson_Ye@compal.com>;
> > Yap. Shane (TPE) <Shane_Yap@compal.com>; Tseng. Evan (TPE)
> > <Evan_Tseng@compal.com>
> > Subject: Re: [alsa-devel] USB Type-C monitor flashes once when play
> > a video file after unplug and re-plug the monitor
> >
> > On Tue, 07 Jan 2020 18:24:57 +0100,
> > Nathan Ciobanu wrote:
> > >
> > > On Mon, Jan 06, 2020 at 08:08:04AM +0000, Lucien_Kao@compal.com wrote:
> > > > Hi Takashi
> > > >
> > > > We verified on Ubuntu 19.10 with kernel 5.4.0.0-050400-generic (please r
efer to attachment), the result is positive which symptom doesn't happen anymore
 once I played music or video sound output through Dell S2718D Type-C monitor. I
t seems had some fix in latest kernel.
> > >
> > > Takashi, can you point to the patch series you suspect may have fixed this
 issue?
> >
> > The first suspect would be
> > 2756d9143aa517b97961e85412882b8ce31371a6
> >     ALSA: hda - Fix intermittent CORB/RIRB stall on Intel chips
> >
> > Takashi
> >
> > >
> > > Thanks,
> > > Nathan
> > > >
> > > > Thanks.
> > > >
> > > >
> > > > -----Original Message-----
> > > > From: Takashi Iwai <tiwai@suse.de>
> > > > Sent: Friday, January 3, 2020 5:16 PM
> > > > To: Cheng. AJ (TPE) <AJ_Cheng@compal.com>
> > > > Cc: intel-gfx@lists.freedesktop.org;
> > > > alsa-devel@alsa-project.org; nathan.d.ciobanu@linux.intel.com;
> > > > Wang. CindyXT (TPE) <CindyXT_Wang@compal.com>; Ye. Nelson (TPE)
> > > > <Nelson_Ye@compal.com>; Yap. Shane (TPE) <Shane_Yap@compal.com>;
> > > > Kao. Lucien (TPE) <Lucien_Kao@compal.com>; Tseng. Evan (TPE)
> > > > <Evan_Tseng@compal.com>
> > > > Subject: Re: [alsa-devel] USB Type-C monitor flashes once when
> > > > play a video file after unplug and re-plug the monitor
> > > >
> > > > On Fri, 03 Jan 2020 02:57:03 +0100, <AJ_Cheng@compal.com> wrote:
> > > > >
> > > > > Hi Sirs,
> > > > >         Here is chromebook SW team from Compal.
> > > > > As the mail title, we hit issue that the external monitor will flash o
nce when play video after hot pluging.
> > > > > We can reproduce not only on chromebook but also ubuntu 16.04.
> > > > > There has higher failure rate with Dell Solomon dock and Dell S2718D m
onitor.
> > > > >
> > > > > We found adding the delay in "sound/pci/hda/patch_hdmi.c " can
> > > > > fix this issue.(as the attachment) May need your help to review and ad
vice. Thanks.
> > > > >
> > > > > Here is the issue number in gitlab for more detail.
> > > > > https://gitlab.freedesktop.org/drm/intel/issues/318
> > > >
> > > > Could you check whether it still happens with the latest upstream kernel
, at least 5.4.y, if it wasn't tested yet?
> > > >
> > > > I don't want to put a long delay just because of random reason unless it
's really mandatory.  I'm wondering whether the recent write-sync change improve
s the situation, so let's check the recent code.
> > > >
> > > >
> > > > thanks,
> > > >
> > > > Takashi
> > > >
> > > > >
> > > > >
> > > > >
> > > > > AJ Cheng
> > > > > NID/NID1
> > > > > e-mail: AJ_Cheng@compal.com<mailto:AJ_Cheng@compal.com>
> > > > > Tel:  +886-2-8797-8599 ext. 17561 Mobile : +886-932827829
> > > > > COMPAL Electronics, Inc.
> > > > >
> > > > > [2 flash_once.diff <application/octet-stream (base64)>]
> > > > >
> > > > > _______________________________________________
> > > > > Alsa-devel mailing list
> > > > > Alsa-devel@alsa-project.org
> > > > > https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> > >
> > >
> >
> > ====================================================================
> > ==
> > ========
> > =================================
> > This message may contain information which is private, privileged or
> > confidential of Compal Electronics, Inc.
> > If you are not the intended recipient of this message, please notify
> > the sender and destroy/delete the message.
> > Any review, retransmission, dissemination or other use of, or taking
> > of any action in reliance upon this information, by persons or
> > entities other than the intended recipient is prohibited.
> > ====================================================================
> > ==
> > ========
> > =================================
> >
> >
> > [1.2  <text/plain; us-ascii (base64)>]
> >
> > [2 0001-UPSTREAM-ALSA-hda-Fix-intermittent-CORB-RIRB-stall-o.patch
> > <application/octet-stream (base64)>]
> >
>
> ======================================================================
> ========
> =================================
> This message may contain information which is private, privileged or
> confidential of Compal Electronics, Inc.
> If you are not the intended recipient of this message, please notify
> the sender and destroy/delete the message.
> Any review, retransmission, dissemination or other use of, or taking
> of any action in reliance upon this information, by persons or
> entities other than the intended recipient is prohibited.
> ======================================================================
> ========
> =================================
>
>
> [1.2  <text/plain; us-ascii (base64)>]
>
> [2 flash_once_fixed_messages <application/octet-stream (base64)>]
>
> [3 flash_once_present_messages <application/octet-stream (base64)>]
>
> [4 flash_once.diff <application/octet-stream (base64)>]
>

   =======================================================================
   ========================================
   This message may contain information which is private, privileged or
   confidential of Compal Electronics, Inc.
   If you are not the intended recipient of this message, please notify
   the sender and destroy/delete the message.
   Any review, retransmission, dissemination or other use of, or taking of
   any action in reliance upon this information,
   by persons or entities other than the intended recipient is prohibited.
   =======================================================================
   ========================================
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
