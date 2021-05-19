Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BDE38DA8A
	for <lists+alsa-devel@lfdr.de>; Sun, 23 May 2021 10:38:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2ECB8167B;
	Sun, 23 May 2021 10:37:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2ECB8167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621759114;
	bh=IK/2fInjLvTzm5/k1DwFUZ1GW8y/E2R0Ji4rc0fFGyc=;
	h=Date:Subject:From:To:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=WvTIMF/F9D7kWKA3zKV0Qkuuf2KQkzmZhyLlXzclVUYKLD8jGoSQVf2l+36hSkgxv
	 5Mw+3USPxknr+FwYO98bLq5xNAnA3ED7LbQZh/YuSYkAj999twDcRXFyZW6cmBeqXP
	 ildh02xDyySOsRAAkoWhYjvhmirUv11TBQTtzOp0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A55AF8019D;
	Sun, 23 May 2021 10:37:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0DC3F8016E; Thu, 20 May 2021 01:16:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,MIME_HTML_ONLY,PRX_APP_ATTACH,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCB0FF8014C
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 01:16:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCB0FF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="cE7qp7tU"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20210519231619epoutp04731ef4010248f8ed1d6f768dcf2e0037~AmuZX9Mdc1825318253epoutp04Q
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 23:16:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20210519231619epoutp04731ef4010248f8ed1d6f768dcf2e0037~AmuZX9Mdc1825318253epoutp04Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1621466180;
 bh=7Utdjxycj377WoGbC+JWZY94qtLw6u/UmHafeIhevFo=;
 h=Date:Subject:Reply-To:From:To:In-Reply-To:References:From;
 b=cE7qp7tUITPYEly4yeoXASvKDK28TbJSZnM6NUiYswCxoDPqAbvwyPLrrHSj+aj2T
 qoqBNyRWtyUvz4K//TetboSqYkD4p59txzFJ3Dy4TYEiQc0Tl/r2OV/MdBK25BfKL0
 YSK/A249GKQmb1EkUxB7+feIPKDdqYjR326x+AqE=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20210519231619epcas2p13573e4f43c26203aa479af96e1636a48~AmuY4vpZS1374513745epcas2p1g;
 Wed, 19 May 2021 23:16:19 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.40.186]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4Flpdr5pNgz4x9QK; Wed, 19 May
 2021 23:16:16 +0000 (GMT)
X-AuditID: b6c32a48-4fbff700000025f5-41-60a59c408761
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 A0.68.09717.04C95A06; Thu, 20 May 2021 08:16:16 +0900 (KST)
Date: Thu, 20 May 2021 08:16:15 +0900
Message-ID: <1613950742.4603319.1621466175888@mail-kr2-3>
Mime-Version: 1.0
Subject: RE: Re: [PATCH] ALSA: pcm: Need to check whether runtime is valid
 or not
From: EUNWOO KIM <ew.kim@samsung.com>
To: Takashi Iwai <tiwai@suse.de>, EUNWOO KIM <ew.kim@samsung.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <s5h8s4hahxj.wl-tiwai@suse.de>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
X-CMS-MailID: 20210519231615epcms2p18cce145c2a9c0d99febf3140c167d226
Content-Type: multipart/mixed;
 boundary="----=_Part_4603318_504276424.1621466175887"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFJsWRmVeSWpSXmKPExsWy7bCmua7DnKUJBn8O8FhcuXiIyWL1pqVs
 Fi83v2FyYPbY8LmJzaNvyypGj82nqwOYo3JsMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1
 DS0tzJUU8hJzU22VXHwCdN0yc4AWKSmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIK
 DA0L9IoTc4tL89L1kvNzrQwNDIxMgSoTcjJmfv7HVrCmoGLziQksDYxLc7sYOTkkBEwkvv3/
 x9LFyMUhJLCDUWJqyx7GLkYODhYBVYmmU/IgJq+ApcTxZZoQpqDE3x3CIJ3CAsESixuus4PY
 QgIyEl+fz2KDiKtL7J6xjhXEZgMaMufCG2aQ6SICDYwSf3edYoZYyysxo/0pC4QtLbF9+VZG
 EJtTQFuiceULJoi4hsSPZb1Q9aISN1e/ZYex3x+bzwhhi0i03jsLVSMo8eDnbqi4pMTdOQvZ
 QBZLCLQzSuy7eZsRwpnCKPH+wgaozeYSX9oXQ9kuEjdPfmcH+ZJZIEziy0FlEFNCQFniyC2w
 CmYBPomOw3/ZYe7fMe8J1J0KEl++nISaIiax/9QkqHs8JA6e+ccICdpVzBL3tp1jmcAoPwsR
 jrMQls0C26AoMaX7ITuErSHROmculK0mMaX/CxuEbSbR0D6VBVn9Akb2VYxiqQXFuempxUYF
 JsgJYBMjOGFqeexgnP32g94hRiYOxkOMKkC9jzasvsAoxZKXn5eqJMK73XtxghBvSmJlVWpR
 fnxRaU5q8SFGU2AymMgsJZqcD0zleSXxhqZGZmYGlqYWpmZGFkrivD9T6xKEBNITS1KzU1ML
 Uotg+pg4OKUamKyKurlVqn7MkZcpSc29NLHO2pznyElFQ/47c98EvLZ8HnlSus2yWmXDsS15
 c+osdebobzu8/57dq4YX/2S+snikVExSMlwhFmK2qY4xuCT2mWXAvSuT77A9bmMWPpkttnqF
 HMfBit/dt91ZhdUO1vp5eTV+Vrl13c3nPVOb0LnHvfe3FW7muHZAREFOqdjhscjVzRXBExhc
 y8/917pcvGXegndx/H4VvmsVn6iF/i7WXWq+r87stevuE859j2Rky+6ukbYTn/nbi3H39fnV
 u7jt7YTT/fe7aUXsPbQi5sGDBWkvpvg8fbEz9XorW0S9ejDjzkWHH10ymXfZOiKlcxrL5ycv
 Dx6fY87x2oMpRomlOCPRUIu5qDgRALl6ho8tBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210512044441epcas2p4ad7c01a1dc9048bd96a9973760017d8c
References: <s5h8s4hahxj.wl-tiwai@suse.de> <s5ho8df9inv.wl-tiwai@suse.de>
 <s5hpmxwbcp0.wl-tiwai@suse.de> <s5htun8bfa5.wl-tiwai@suse.de>
 <20210512044323.106673-1-chanho61.park@samsung.com>
 <20210512075834epcms2p182290868ca278decaa7e86c67f740db8@epcms2p1>
 <929757006.2969317.1620858694065@mail-kr2-3>
 <1932109751.3301982.1620952404404@mail-kr2-3>
 <CGME20210512044441epcas2p4ad7c01a1dc9048bd96a9973760017d8c@epcms2p1>
X-Mailman-Approved-At: Sun, 23 May 2021 10:37:03 +0200
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

------=_Part_4603318_504276424.1621466175887
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"

   > > > Sender : Takashi Iwai <tiwai@suse.de>

   > > > Date : 2021-05-12 16:08 (GMT+9)

   > > > Title : Re: [PATCH] ALSA: pcm: Need to check whether runtime is v
   alid or not

   > > >

   > > > On Wed, 12 May 2021 06:43:23 +0200,

   > > > Chanho Park wrote:

   > > > >

   > > > > From: eunwoo kim <ew.kim@samsung.com>

   > > > >

   > > > > Since snd_pcm_ioctl_sw_params_compat has no runtime variable ch
   eck,

   > > > > if application call the ioctl after close, it can make kernel c
   rash.

   > > > > So, snd_pcm_ioctl_sw_params_compat needs to check the runtime v
   ariable

   > > > > at the beginning of the function.

   > > >

   > > > > In principle, you cannot call ioctl for an already closed file.

   > > > > Or do you mean other code path?

   > > >

   > > > Yes, other code path such as application layer or alsa framwork l
   ayer.

   > >

   > > But how can it go over the 32bit compat ioctl layer...?

   > > It's always tied with a file object, so the runtime object is

   > > assured.

   > >

   > > > > Yes, I think so too. but in fact, some case can call 32bit comp
   at ioctl.

   > >

   > > > In our case, suspend call is releasing all running pcm device. ot
   her side some application want to start music.

   > > > it make critical section between suspend and pcm_open from applic
   ation.

   > > > this is error and we have to solve this problem without this patc
   h.

   > > > but I think kernel don't make kernel crash even if application or
    system architecture have problem.

   > >

   > > I guess you're scratching a wrong surface.

   > >

   > > > could you tell me more detail? why do you think that.

   > > > In 64bit native case, it didn't make kernel crash on same test ca
   se. because native always check runtime in ioctl.

   >

   > > Try to put WARN_ON() there.  If you can catch the real case, it'd b
   e

   > > worth to merge.  Otherwise, it's just a wrong place to look at.

   >

   > I already found root cause in our issue case. And I am fixing this is
   sue via changing sequence.

   >

   > I think that you want to know issue case because why this patch need.

   > So I explain more about our case.

   > 1. application playback sound in android.

   > 2. call pcm_open in tinyalsa.

   > 3. call file open and hw param in pcm_open

   > 4. go to suspend

   > 5. freezing all task before calling sw param in pcm_open.

   > 6. kernel layer try to go suspend

   > 7. release all running substream, because all HW IPs must to go idle
   for power save mode.

   > -> detach runtime from substream.

   > 8. go to resume.

   > 9. call sw param in pcm_open.

   > 10-1. native case : has runtime check in ioctl -> return error -> aud
   io hal layer recovery hw connect.

   > 10-2. 32bit compat case : has not runtime check -> runtime is not val
   id -> make kernel crash.

   >

   > - if AAOS can support wakelock, we can postpone suspend until finishe
   d pcm_open. but AAOS didn't support wakelock.


   > I'm afraid that the approach is wrong.  It breaks the fundamental PCM

   > state change rule.


   Yes, that is wrong approach I know. So I am changing that.


   > I guess it's a downstream driver that does that?  If so, tweaking

   > something superfluous in the upstream code is unacceptable.

   > BTW, if you want further discussions, please don't drop Cc to

   > alsa-devel ML.


   Safety is very important in automotive. so it must not to make kernel
   crash even if someone make wrong code. because it can connect to
   accident.

   If 32bit compat don't need checking-runtime, why do pcm_native check
   runtime?


   thanks,


   Takashi


   [update?userid=ew.kim&do=bWFpbElEPTIwMjEwNTE5MjMxNjE1ZXBjbXMycDE4Y2NlMT
   Q1YzJhOWMwZDk5ZmViZjMxNDBjMTY3ZDIyNiZyZWNpcGllbnRBZGRyZXNzPWFsc2EtZGV2Z
   WxAYWxzYS1wcm9qZWN0Lm9yZw__]

------=_Part_4603318_504276424.1621466175887
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="rcptInfo.txt"
Content-Transfer-Encoding: base64

DQogICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0NCiAgICAgIFN1YmplY3QgICAgOiBSZTogW1BBVENIXSBBTFNB
OiBwY206IE5lZWQgdG8gY2hlY2sgd2hldGhlciBydW50aW1lIGlzIHZhbGlkIG9yIG5vdA0KICAg
ICAgRnJvbSAgICAgICA6IFRha2FzaGkgSXdhaSB0aXdhaUBzdXNlLmRlDQogICAgICBTZW50IERh
dGUgIDogMjAyMS0wNS0xNCAxNjozMyAgR01UKzkNCiAgID09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KICAgICAg
ICAgICAgICAgICAgTmFtZSAgICAgICAgICAgICAgICBUeXBlICAgICAgICAgIEpvYiBUaXRsZSAg
ICAgICAgICAgICAgICAgICAgICAgRGVwdC4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Q29tcGFueSAgICAgICAgICAgICAgICANCiAgID09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KICAgICAg6rmA7J2A
7JqwICAgICAgICAgICAgICAgICAgICAgICAgIFRPICAgICAgICAgU3RhZmYgRW5naW5lZXIgICAg
ICAgICAgICAgQ3VzdG9tIFNPQyBQbGF0Zm9ybe2MgChTLkxTSSkgICAgICAgICAgICAgIOyCvOyE
seyghOyekA0KICAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo=

------=_Part_4603318_504276424.1621466175887--
