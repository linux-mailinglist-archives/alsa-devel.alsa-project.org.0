Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A5938F5BF
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 00:43:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9170166D;
	Tue, 25 May 2021 00:42:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9170166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621896210;
	bh=uf5jGbGUviaN+E7pH406ehfzFNI2v67GGnrj9v372v4=;
	h=Date:Subject:From:To:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=hf7sytYEtIQzKIpW1iHXXSGcdvxcsdKBOg4WSIX30UjJ4+UFQyHbsPr3xaEklBDFU
	 LsfAr/v/lxdYIzCGbQ5Fan2nfzC5BlW9Yc5uC4z0aSO1y9SZjqj+v/PZWW9NTvwn8/
	 +pz2Q0cRTig9ZjeTbS2ETVzFInv0EUmZeDGoMt4w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05FA2F8022D;
	Tue, 25 May 2021 00:42:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0874F8022B; Tue, 25 May 2021 00:41:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,MIME_HTML_ONLY,PRX_APP_ATTACH,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A4B7F80149
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 00:41:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A4B7F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="LSvdCdbV"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210524224144epoutp010d1f79a919359a7ae13bea53d05b710a~CIeoLnDse2545825458epoutp01N
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 22:41:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210524224144epoutp010d1f79a919359a7ae13bea53d05b710a~CIeoLnDse2545825458epoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1621896104;
 bh=s7A9GSL/zQuMQBcvVsZPPYdcnoXp1gzZrcY/y1/uDvU=;
 h=Date:Subject:Reply-To:From:To:In-Reply-To:References:From;
 b=LSvdCdbVRpN4YsJ+hikxWllcnGdGdAGGZ55fmSINPzvx6XGzGL0OLJRm32wCYh4/n
 GDWo6aLiJ1W+EEYx71OJmH79rk7Y47ONmPxMLafGXXSynlLLO+JSgpeif5MZ1P7kFu
 qaycUJro/6fxddl7jRqJz8eG5bj4uXoqkU9oWZWs=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20210524224143epcas2p455d5c976a2023705de5164b49124cb6e~CIenQV9YL2790027900epcas2p4h;
 Mon, 24 May 2021 22:41:43 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.189]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4Fpsdf0VxMz4x9Pr; Mon, 24 May
 2021 22:41:42 +0000 (GMT)
X-AuditID: b6c32a46-e01ff700000025de-06-60ac2b9eae50
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 BE.C7.09694.E9B2CA06; Tue, 25 May 2021 07:41:34 +0900 (KST)
Date: Tue, 25 May 2021 07:41:34 +0900
Message-ID: <914629993.5780046.1621896094629@mail-kr2-1>
Mime-Version: 1.0
Subject: RE: Re: [PATCH] ALSA: pcm: Need to check whether runtime is valid
 or not
From: EUNWOO KIM <ew.kim@samsung.com>
To: Takashi Iwai <tiwai@suse.de>, EUNWOO KIM <ew.kim@samsung.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <s5hsg2hhllm.wl-tiwai@suse.de>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
X-CMS-MailID: 20210524224134epcms2p277b5610ace069fb380bf4079013cb5f6
Content-Type: multipart/mixed;
 boundary="----=_Part_5780045_1842703437.1621896094628"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDJsWRmVeSWpSXmKPExsWy7bCmhe487TUJBi+mmVhcuXiIyWL1pqVs
 Fi83v2FyYPbY8LmJzaNvyypGj82nqwOYo3JsMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1
 DS0tzJUU8hJzU22VXHwCdN0yc4AWKSmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIK
 DA0L9IoTc4tL89L1kvNzrQwNDIxMgSoTcjJO/VzCUrB1PmPF/IPJDYxTZjN2MXJySAiYSHzs
 uM8GYgsJ7GCUaH+iDGKzCKhKTH7/CizOK2AhceHlAqYuRg4gW1Di7w5hkLCwQLDE4obr7BCt
 MhJfn89ig4irS+yesY4VxGYDGjPnwhvmLkYuDhGBBkaJv7tOMUPs5ZWY0f6UBcKWlti+fCvY
 PZwC2hKf3xxjgohrSPxY1gtVLypxc/Vbdhj7/bH5UPeLSLTeOwtVIyjx4OduqLikxN05C9lA
 FksItDNK7Lt5mxHCmcIo8f7CBqjN5hJf2hdD2S4S/14eYQT5klkgXOLjei8QU0JAWeLILbAK
 ZgE+iY7Df9lh7t8x7wnUnQoSX76chJoiJrH/1CSoezwkDp75B7ZWSOA3s8SL47tYJzDKz0KE
 4yyEZbPANihKTOl+yA5ha0i0zpkLZatJTOn/wgZhm0k0tE9lQVa/gJF9FaNYakFxbnpqsVGB
 EXIS2MQITppabjsYp7z9oHeIkYmD8RCjClDvow2rLzBKseTl56UqifD+7VuZIMSbklhZlVqU
 H19UmpNafIjRFJgQJjJLiSbnA9N5Xkm8oamRmZmBpamFqZmRhZI478/UugQhgfTEktTs1NSC
 1CKYPiYOTqkGptNHGrIjVB+m/14QOqfVrqFawLUrh7+g2e3G58iJVxt2Rst1fWXJsu1qmfBA
 ZP0lZ1Nj9W7rp9ythptPJUwqkXGIbXgZ4mq9nUljq0G2nquQetAmSZPbq/h9jyunLr1/dTUv
 j93yHczih3KclkxXyt7q+caNI+lZlpQAx7lqnjUeN6v+/Ki1NrYyYSrU5jAxr+OX2W50amrY
 7tpPBQnHL6y62bW+pDO+pc2gftakySrVt7b8SVpqevNGRI9d0Ka737lXFRcnxdaaKFzlytzK
 Ej6DqVW2yCeXRcCpf60z6+t9mxZnbFQsT7RKflxpuUzucqXZiR2OR9pE+lJddO32TT652DFh
 /4S/5oWnliuxFGckGmoxFxUnAgADKjmWLwQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210512044441epcas2p4ad7c01a1dc9048bd96a9973760017d8c
References: <s5hsg2hhllm.wl-tiwai@suse.de> <s5h8s4hahxj.wl-tiwai@suse.de>
 <s5ho8df9inv.wl-tiwai@suse.de> <s5hpmxwbcp0.wl-tiwai@suse.de>
 <s5htun8bfa5.wl-tiwai@suse.de>
 <20210512044323.106673-1-chanho61.park@samsung.com>
 <20210512075834epcms2p182290868ca278decaa7e86c67f740db8@epcms2p1>
 <929757006.2969317.1620858694065@mail-kr2-3>
 <1932109751.3301982.1620952404404@mail-kr2-3>
 <1613950742.4603319.1621466175888@mail-kr2-3>
 <CGME20210512044441epcas2p4ad7c01a1dc9048bd96a9973760017d8c@epcms2p2>
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
Reply-To: ew.kim@samsung.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

------=_Part_5780045_1842703437.1621896094628
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"



   --------- Original Message ---------

   Sender : Takashi Iwai <tiwai@suse.de>

   Date : 2021-05-20 17:10 (GMT+9)

   Title : Re: [PATCH] ALSA: pcm: Need to check whether runtime is valid
   or not

   To : 김은우<ew.kim@samsung.com>

   CC : alsa-devel@alsa-project.org


   On Thu, 20 May 2021 01:16:15 +0200,

   EUNWOO KIM wrote:

   >

   > > > > Sender : Takashi Iwai <tiwai@suse.de>

   >

   > > > > Date : 2021-05-12 16:08 (GMT+9)

   >

   > > > > Title : Re: [PATCH]

   >  ALSA: pcm: Need to check whether runtime is valid or not

   >

   > > > >

   >

   > > > > On Wed, 12 May 2021 06:43:23 +0200,

   >

   > > > > Chanho Park wrote:

   >

   > > > > >

   >

   > > > > > From: eunwoo kim <ew.kim@samsung.com>

   >

   > > > > >

   >

   > > > > > Since snd_pcm_ioctl_sw_params_compat has no runtime variable
   check,

   >

   > > > > > if application call the ioctl after close, it can make kernel
    crash.

   >

   > > > > > So, snd_pcm_ioctl_sw_params_compat needs to check the runtime
    variable

   >

   > > > > > at the beginning of the function.

   >

   > > > >

   >

   > > > > > In principle, you cannot call ioctl for an already closed fil
   e.

   >

   > > > > > Or do you mean other code path?

   >

   > > > >

   >

   > > > > Yes, other code path such as application layer or alsa framwork
    layer.

   >

   > > >

   >

   > > > But how can it go over the 32bit compat ioctl layer...?

   >

   > > > It's always tied with a file object, so the runtime object is

   >

   > > > assured.

   >

   > > >

   >

   > > > > >

   >  Yes, I think so too. but in fact, some case can call 32bit compat io
   ctl.

   >

   > > >

   >

   > > > >

   >  In our case, suspend call is releasing all running pcm device. other
    side some application want to start music.

   >

   > > > > it make critical section between suspend and pcm_open from appl
   ication.

   >

   > > > > this is error and we have to solve this problem without this pa
   tch.

   >

   > > > >

   >  but I think kernel don't make kernel crash even if application or sy
   stem architecture have problem.

   >

   > > >

   >

   > > > I guess you're scratching a wrong surface.

   >

   > > >

   >

   > > > > could you tell me more detail? why do you think that.

   >

   > > > >

   >  In 64bit native case, it didn't make kernel crash on same test case.
    because native always check runtime in ioctl.

   >

   > >

   >

   > > > Try to put WARN_ON() there.  If you can catch the real case, it'd
    be

   >

   > > > worth to merge.  Otherwise, it's just a wrong place to look at.

   >

   > >

   >

   > >

   >  I already found root cause in our issue case. And I am fixing this i
   ssue via changing sequence.

   >

   > >

   >

   > > I think that you want to know issue case because why this patch nee
   d.

   >

   > > So I explain more about our case.

   >

   > > 1. application playback sound in android.

   >

   > > 2. call pcm_open in tinyalsa.

   >

   > > 3. call file open and hw param in pcm_open

   >

   > > 4. go to suspend

   >

   > > 5. freezing all task before calling sw param in pcm_open.

   >

   > > 6. kernel layer try to go suspend

   >

   > >

   >  7. release all running substream, because all HW IPs must to go idle
    for power save mode.

   >

   > > -> detach runtime from substream.

   >

   > > 8. go to resume.

   >

   > > 9. call sw param in pcm_open.

   >

   > > 10-1. native case : has runtime check in ioctl -> return error ->

   >  audio hal layer recovery hw connect.

   >

   > > 10-2. 32bit compat case : has not runtime check -> runtime is not v
   alid ->

   >  make kernel crash.

   >

   > >

   >

   > >

   >  - if AAOS can support wakelock, we can postpone suspend until finish
   ed pcm_open. but AAOS didn't support wakelock.

   >

   > > I'm afraid that the approach is wrong.  It breaks the fundamental P
   CM

   >

   > > state change rule.

   >

   > Yes, that is wrong approach I know. So I am changing that.

   >

   > > I guess it's a downstream driver that does that?  If so, tweaking

   >

   > > something superfluous in the upstream code is unacceptable.

   >

   > > BTW, if you want further discussions, please don't drop Cc to

   >

   > > alsa-devel ML.

   >

   > Safety is very important in automotive. so it must not to make kernel
    crash

   > even if someone make wrong code. because it can connect to accident.


   >> Shipping such a broken stuff on the car would be a more serious

   >> problem.  Really.  If this kind of change is required, it means that

   >> the driver has a fundamental design problem.


   >> Wrong driver code can always crash a kernel, no matter how the core

   >>
   stuff is written.  So, it might make sense to put some debug code, but

   >> it'd be not meant as a "fix" but only for debugging.


   > If 32bit compat don't need checking-runtime, why do pcm_native check
   runtime?


   >> That code path can be called from OSS layer, so it's more complex.

   >>
   We may drop the check as well, of course.  It's no mandatory check at
   all.


   if OSS layer means EL0 layer, we shouldn't think only EL0 layer.
   Because virtualization system is more complex than before.
   In current google conference, we can see virtio system for automotive.

   It means that we should handle to transfer between virtio-snd and alsa
   core in EL1 layer.
   so we have to concern any approach from kernel layer.
   I think we should avoid potential problems that may arise at now.


   Takashi


   [update?userid=ew.kim&do=bWFpbElEPTIwMjEwNTI0MjI0MTM0ZXBjbXMycDI3N2I1Nj
   EwYWNlMDY5ZmIzODBiZjQwNzkwMTNjYjVmNiZyZWNpcGllbnRBZGRyZXNzPWFsc2EtZGV2Z
   WxAYWxzYS1wcm9qZWN0Lm9yZw__]

------=_Part_5780045_1842703437.1621896094628
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="rcptInfo.txt"
Content-Transfer-Encoding: base64

DQogICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0NCiAgICAgIFN1YmplY3QgICAgOiBSZTogW1BBVENIXSBBTFNB
OiBwY206IE5lZWQgdG8gY2hlY2sgd2hldGhlciBydW50aW1lIGlzIHZhbGlkIG9yIG5vdA0KICAg
ICAgRnJvbSAgICAgICA6IFRha2FzaGkgSXdhaSB0aXdhaUBzdXNlLmRlDQogICAgICBTZW50IERh
dGUgIDogMjAyMS0wNS0yMCAxNzoxMCAgR01UKzkNCiAgID09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KICAgICAg
ICAgICAgICAgICAgTmFtZSAgICAgICAgICAgICAgICBUeXBlICAgICAgICAgIEpvYiBUaXRsZSAg
ICAgICAgICAgICAgICAgICAgICAgRGVwdC4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Q29tcGFueSAgICAgICAgICAgICAgICANCiAgID09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KICAgICAg6rmA7J2A
7JqwICAgICAgICAgICAgICAgICAgICAgICAgIFRPICAgICAgICAgU3RhZmYgRW5naW5lZXIgICAg
ICAgICAgICAgQ3VzdG9tIFNPQyBQbGF0Zm9ybe2MgChTLkxTSSkgICAgICAgICAgICAgIOyCvOyE
seyghOyekA0KICAgICAgYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnICAgIENDDQogICA9PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0NCg==

------=_Part_5780045_1842703437.1621896094628--
