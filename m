Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 482DE19BA69
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Apr 2020 04:46:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8E1D1679;
	Thu,  2 Apr 2020 04:45:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8E1D1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585795567;
	bh=9NDEUINdmOZ+noQg4bZQ8ILTlo8By4li4mu3EWkbRWs=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h8fl+Lzgp7SH4h6MAMIOD9Vi1Fbe4FbZOHe3cUfDr4MFpxWWP5tOpeQZJSVBHOcUU
	 p4ZthI6Uy96xkSHRwAxeH5clzZW6MXqKpDbFSGC3pd+C5Lzs4siD9hnqS0/D7znzBa
	 RTAQr+kCvlbndQOtQB/P+nl8l4/UjDKwooVxsguk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAD62F80141;
	Thu,  2 Apr 2020 04:44:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3F70F80148; Thu,  2 Apr 2020 04:44:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52F13F80141
 for <alsa-devel@alsa-project.org>; Thu,  2 Apr 2020 04:44:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52F13F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="knVGoB4t"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200402024406epoutp02da67488f3a16eeef74af572a7a86434b~B4I6NiqDG2978029780epoutp02W
 for <alsa-devel@alsa-project.org>; Thu,  2 Apr 2020 02:44:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200402024406epoutp02da67488f3a16eeef74af572a7a86434b~B4I6NiqDG2978029780epoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585795446;
 bh=EZaZfY5VrQMR10pqAB9WPakWsZtIDC3z0yVekpltegI=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=knVGoB4t79N7DZxy2KvucCzworE4EHlcjkKminoMGo2ifcEfE5g6Cjm4UKeod5Rxl
 zX3weedmhTXu21Mvrdz0KOTtHuA2uKXwQoe+J0L5U8kiRxFcCwwNsbrcErJqC8HmU/
 uwJ9Aq2H3qXAtA0NMVHjj38uMCjYhTyMgYTx+tOI=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTP id
 20200402024406epcas2p3e5cf5bdef30206a8b1d5fa39eb162a5e~B4I5rz5h12774927749epcas2p3W;
 Thu,  2 Apr 2020 02:44:06 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.40.188]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 48t6pD5dpnzMqYkc; Thu,  2 Apr
 2020 02:44:04 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 4E.4E.04105.471558E5; Thu,  2 Apr 2020 11:44:04 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
 20200402024404epcas2p453b6445f43077050a44d74cda5f13043~B4I4Cpml01349813498epcas2p4v;
 Thu,  2 Apr 2020 02:44:04 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200402024404epsmtrp19a4de34efd5fa061ae7b1906fe33a403~B4I389nfW0351403514epsmtrp1e;
 Thu,  2 Apr 2020 02:44:04 +0000 (GMT)
X-AuditID: b6c32a47-15bff70000001009-75-5e8551745174
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 FC.43.04158.471558E5; Thu,  2 Apr 2020 11:44:04 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20200402024404epsmtip254652f865021098890877fa854d41b06~B4I3v3_E82370423704epsmtip2R;
 Thu,  2 Apr 2020 02:44:04 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Vinod Koul'" <vkoul@kernel.org>
In-Reply-To: <00a501d606ff$5ec4ef00$1c4ecd00$@samsung.com>
Subject: RE: [PATCH 1/1] ASoC: soc-compress: lock pcm_mutex to resolve
 lockdep error
Date: Thu, 2 Apr 2020 11:44:03 +0900
Message-ID: <007901d60898$928c7ca0$b7a575e0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFwzVbedZouWCPbUsnJTjAf4rU5iQGklQ1ZAqRUqjYByeFLeqj+/amA
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjmO2eXY7Y4TauX/Rqnm5dW22rrKFpBViONDKEfktph+1JrN3Zm
 pFRYmumCbtiyZdJVwQgvTVFJgmmsrBmBRrMLJVpZEF0sEyzadib573mf93m+93m/76NIeYtE
 QRVbndhh5cyMZJ6osy9Rr3LuOpGvvhtQsUPPfAR74d2YhK3rPCVibw97CfbXUDXBPnh2g2Bb
 p+4gtv9YLcF2v3pIbooxtP44LjF0e15LDe3NNRLDaW8zMrR4h0XZ4lxzWhHmTNihxFajzVRs
 LUxnMnMKNhfo9GqNSpPCrmeUVs6C05mMrGzV1mJzKBGjPMiZS0JUNsfzzJoNaQ5biRMri2y8
 M53BdpPZrtHYV/OchS+xFq422iypGrVaqwsp95qLgj8HCXtb2qH64E1UjgKpLhRDAb0OLnb0
 kC40j5LTXQh83VNiofiOoO7HLYlQ/ELQ09NLzlre132XCo1eBK6Rm1H/BIK+T9eJsEpCq2Dy
 zauII55eDt6xt5GjSPo+guo7tSjciKFT4fUjb8hAUXH0bvh2Ym+YFtHLoP7edEQio1NgdLRX
 LOCF8OjSmCiMSToZGq99jiZSwvR4o1iYtRXcX59GNfFwuaYqqpmSgOuDQcAZEPh4PsrHwSe/
 VypgBUycqYpsBnQFgi+BmWijFkHNKbmA14L3ykAkM0knQkvPmjAEein0j0THLoDqvj9SgZZB
 dVXUyEDbwF9CoAEaWqVnEeOZs5dnzl6eOfk9/0ddRaJmtBjbeUsh5rX2tXPfuh1FPmvSti7U
 OZjlQzSFmPky5b7KfLmYO8iXWnwIKJKJl13OCFEyE1dahh22AkeJGfM+pAtd+zlSschoC319
 q7NAo9Pq9eoUHavTa1lmiaw9NrhHThdyTnwAYzt2zPoIKkZRjmKfj2XmOYMX3Ak4L8FtSit7
 LF/uz5poWnl1MlW12Bc7+dudi1Q2vT/44pq/O//hKIOWWhrrXe9mPEfyHpwcSfm5v2EkubK0
 Y9Wbl08P1w024CaZJeH2AkWOu+L6wMSOdUNnxqcyL2qMK45qt+98coWht1SO93duDAzvbPWx
 w7GMiC/iNEmkg+f+AZ1keAnCAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRmVeSWpSXmKPExsWy7bCSvG5JYGucwZ12DosrFw8xWUx9+ITN
 Ysa2bhaL1Ve3MFl8u9LBZHH04mImiw3f1zJaHGmcwmSx884JZgdOjw2fm9g8ds66y+6xaVUn
 m0ffllWMHuu3XGUJYI3isklJzcksSy3St0vgynjXco+5oEerYkFXI3sD4zylLkZODgkBE4ln
 Mz6xdzFycQgJ7GaUWLFrLhNEQkLiw/wz7BC2sMT9liOsEEXPGSVu9DezgSTYBHQlvty7wwxi
 iwioSmx58oANpIhZ4CSjxIPdG9kgOu4ySpxZf4MFpIpTwEri7sktYCuEBUIketf8BJvEIqAi
 MWfPT0YQm1fAUuLRo72sELagxMmZT8B6mQW0JXoftjLC2MsWvmaGOE9B4ufTZawQV7hJTPtw
 HqpeRGJ2ZxvzBEbhWUhGzUIyahaSUbOQtCxgZFnFKJlaUJybnltsWGCUl1quV5yYW1yal66X
 nJ+7iREcaVpaOxhPnIg/xCjAwajEw6uQ1hInxJpYVlyZe4hRgoNZSYR3tgtQiDclsbIqtSg/
 vqg0J7X4EKM0B4uSOK98/rFIIYH0xJLU7NTUgtQimCwTB6dUA6PHETPXXNGgI96Xgtu0jpz/
 3xfxYH7cwhonTv6guMj0mZfevu/8npDftfdC1sYtr2eWP9DZacwamqacac+qqBh/K+VvraO+
 8LmqjxK636wF2mTFrScc6Wo+Z3Rw3/Tz7vP85Xy05syfw9I+IYWxX0fn/m2Z2m1vpL5eeNly
 O0WGq1enfnF1hhJLcUaioRZzUXEiAPk2bJOwAgAA
X-CMS-MailID: 20200402024404epcas2p453b6445f43077050a44d74cda5f13043
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200330110126epcas2p4525e5c6f61f7452df008696f9153770d
References: <CGME20200330110126epcas2p4525e5c6f61f7452df008696f9153770d@epcas2p4.samsung.com>
 <002101d60682$8ec21ed0$ac465c70$@samsung.com>
 <20200330114716.GA72691@vkoul-mobl>
 <00a501d606ff$5ec4ef00$1c4ecd00$@samsung.com>
Cc: alsa-devel@alsa-project.org, kimty@samsung.com, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, hmseo@samsung.com, tkjung@samsung.com,
 pilsun.jang@samsung.com
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

On Tuesday, March 31, 2020 10:55 AM, Gyeongtaek Lee wrote:
>Hi,
>
>On 30-03-20, 17:17, Vinod Koul wrote:
>>Hello,
>>
>>On 30-03-20, 20:01,  =CC=B0=20=20=20=20wrote:=0D=0A>>>=20snd_soc_runtime_=
activate()=20and=20snd_soc_runtime_deactivate()=20require=20=0D=0A>>>=20loc=
ked=20pcm_mutex.=0D=0A>>>=20=0D=0A>>>=20Signed-off-by:=20Gyeongtaek=20Lee=
=20<gt82.lee=40samsung.com>=0D=0A>>>=20---=0D=0A>>>=20=20sound/soc/soc-comp=
ress.c=20=7C=204=20++++=0D=0A>>>=20=201=20file=20changed,=204=20insertions(=
+)=0D=0A>>>=20=0D=0A>>>=20diff=20--git=20a/sound/soc/soc-compress.c=20b/sou=
nd/soc/soc-compress.c=20index=20=0D=0A>>>=20392a1c5b15d3..42d416ac7e9b=2010=
0644=0D=0A>>>=20---=20a/sound/soc/soc-compress.c=0D=0A>>>=20+++=20b/sound/s=
oc/soc-compress.c=0D=0A>>>=20=40=40=20-207,7=20+207,9=20=40=40=20static=20i=
nt=20soc_compr_open_fe(struct=20=0D=0A>>>=20snd_compr_stream=0D=0A>>>=20*cs=
tream)=0D=0A>>>=20=20=09fe->dpcm=5Bstream=5D.state=20=3D=20SND_SOC_DPCM_STA=
TE_OPEN;=0D=0A>>>=20=20=09fe->dpcm=5Bstream=5D.runtime_update=20=3D=20SND_S=
OC_DPCM_UPDATE_NO;=0D=0A>>>=20=20=0D=0A>>>=20+=09mutex_lock_nested(&fe->pcm=
_mutex,=20fe->pcm_subclass);=0D=0A>>>=20=20=09snd_soc_runtime_activate(fe,=
=20stream);=0D=0A>>>=20+=09mutex_unlock(&fe->pcm_mutex);=0D=0A>>=0D=0A>>Can=
=20you=20please=20explain=20why=20you=20need=20the=20lock=20here,=20as=0D=
=0A>>>=20=20=0D=0A>>>=20=20=09mutex_unlock(&fe->card->mutex);=0D=0A>>=0D=0A=
>>we=20already=20have=20a=20lock=20here..=0D=0A>>=0D=0A>>>=20=40=40=20-285,=
7=20+287,9=20=40=40=20static=20int=20soc_compr_free_fe(struct=20=0D=0A>>>=
=20snd_compr_stream=0D=0A>>>=20*cstream)=0D=0A>>>=20=20=09else=0D=0A>>>=20=
=20=09=09stream=20=3D=20SNDRV_PCM_STREAM_CAPTURE;=0D=0A>>>=20=20=0D=0A>>>=
=20+=09mutex_lock_nested(&fe->pcm_mutex,=20fe->pcm_subclass);=0D=0A>>>=20=
=20=09snd_soc_runtime_deactivate(fe,=20stream);=0D=0A>>>=20+=09mutex_unlock=
(&fe->pcm_mutex);=0D=0A>>=0D=0A>>And=20this=20instance=20is=20also=20using=
=20fe->card->mutex..=20so=20I=20think=20double=20lock=20may=20not=20serve=
=20any=20purpose=20here..=0D=0A>>=0D=0A>>Can=20you=20explain=20why=20we=20n=
eed=20the=20extra=20lock?=0D=0A>You=20are=20right.=0D=0A>The=20mutex_lock=
=20with=20fe->pcm_mutex=20has=20no=20purpose.=0D=0A>It=20just=20removes=20l=
ockdep=20warning=20like=20the=20below=0D=0A><4>=5B=201437.857354=5D=20=20=
=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20------------=5B=20cut=
=20here=20=5D------------=0D=0A><4>=5B=201437.857463=5D=20=20=5B5:=20=20=20=
=20=20=20=20=20=20=20cplay:11547=5D=20WARNING:=20CPU:=205=20PID:=2011547=20=
at=20sound/soc/soc-pcm.c:99=20snd_soc_runtime_deactivate+0x88/0x140=0D=0A><=
4>=5B=201437.857498=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=
=5D=20Modules=20linked=20in:=0D=0A><4>=5B=201437.857557=5D=20=20=5B5:=20=20=
=20=20=20=20=20=20=20=20cplay:11547=5D=20CPU:=205=20PID:=2011547=20Comm:=20=
cplay=20Tainted:=20G=20S=20=20=20=20=20=20W=20=20=20=20=20=20=20=20=204.19.=
65-00198-ge6c3a8b64f3d-dirty=20=23146=0D=0A><4>=5B=201437.857590=5D=20=20=
=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20Hardware=20name:=20Sams=
ung=20xxx=20board=20based=20on=20xxx=20(DT)=0D=0A><4>=5B=201437.857620=5D=
=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20Call=20trace:=0D=
=0A><4>=5B=201437.857662=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:1=
1547=5D=20=5B<ffffff800808d598>=5D=20dump_backtrace+0x0/0x404=0D=0A><4>=5B=
=201437.857704=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20=
=5B<ffffff800808d9b0>=5D=20show_stack+0x14/0x1c=0D=0A><4>=5B=201437.857745=
=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20=5B<ffffff8008=
c5dc24>=5D=20dump_stack+0xa0/0xd8=0D=0A><4>=5B=201437.857784=5D=20=20=5B5:=
=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20=5B<ffffff80080a4b28>=5D=20_=
_warn+0xcc/0x12c=0D=0A><4>=5B=201437.857821=5D=20=20=5B5:=20=20=20=20=20=20=
=20=20=20=20cplay:11547=5D=20=5B<ffffff8008c5cd78>=5D=20report_bug+0x78/0xc=
c=0D=0A><4>=5B=201437.857857=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cpl=
ay:11547=5D=20=5B<ffffff800808e5c0>=5D=20bug_handler+0x2c/0x88=0D=0A><4>=5B=
=201437.857895=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20=
=5B<ffffff8008085510>=5D=20brk_handler+0x88/0xc8=0D=0A><4>=5B=201437.857930=
=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20=5B<ffffff8008=
080f0c>=5D=20do_debug_exception+0x108/0x194=0D=0A><4>=5B=201437.857968=5D=
=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20Exception=20stack=
(0xffffff8028b0b960=20to=200xffffff8028b0baa0)=0D=0A><4>=5B=201437.858002=
=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20b960:=20000000=
0000000024=20ffffff8008e28a97=20ffffffc975bb40a0=20ffffff8028b0b748=0D=0A><=
4>=5B=201437.858035=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=
=5D=20b980:=200000000000000080=200000000000000000=20ffffff8008129638=200000=
000000000000=0D=0A><4>=5B=201437.858066=5D=20=20=5B5:=20=20=20=20=20=20=20=
=20=20=20cplay:11547=5D=20b9a0:=20e0b1dc92eba18f00=20e0b1dc92eba18f00=20000=
0000000000003=200000000000000000=0D=0A><4>=5B=201437.858098=5D=20=20=5B5:=
=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20b9c0:=200000000000240022=200=
000000000000004=20ffffff8009b2f420=2000000000fffffff5=0D=0A><4>=5B=201437.8=
58130=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20b9e0:=20f=
fffff8008c6baac=20000000000000002c=2000000000000000b0=20ffffffc9673c1e80=0D=
=0A><4>=5B=201437.858161=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:1=
1547=5D=20ba00:=200000000000000000=20ffffffc8190e6100=200000000000000000=20=
ffffffc95c262e88=0D=0A><4>=5B=201437.858193=5D=20=20=5B5:=20=20=20=20=20=20=
=20=20=20=20cplay:11547=5D=20ba20:=200000000000000008=20ffffffc8ec3050d0=20=
ffffffc8fb81a4d0=200000000000000004=0D=0A><4>=5B=201437.858224=5D=20=20=5B5=
:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20ba40:=200000000000000009=20=
ffffff8028b0bac0=20ffffff8008a895c8=20ffffff8028b0baa0=0D=0A><4>=5B=201437.=
858256=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20ba60:=20=
ffffff8008a895c8=200000000060400005=20ffffff8028b0ba48=20ffffff800811d7b4=
=0D=0A><4>=5B=201437.858287=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cpla=
y:11547=5D=20ba80:=200000007fffffffff=20e0b1dc92eba18f00=20ffffff8028b0bac0=
=20ffffff8008a895c8=0D=0A><4>=5B=201437.858318=5D=20=20=5B5:=20=20=20=20=20=
=20=20=20=20=20cplay:11547=5D=20=5B<ffffff8008082b18>=5D=20el1_dbg+0x18/0x7=
8=0D=0A><4>=5B=201437.858355=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cpl=
ay:11547=5D=20=5B<ffffff8008a895c8>=5D=20snd_soc_runtime_deactivate+0x88/0x=
140=0D=0A>=0D=0A>from=20here=0D=0A>void=20snd_soc_runtime_activate(struct=
=20snd_soc_pcm_runtime=20*rtd,=20int=20stream)=0D=0A>=7B=0D=0A>=09struct=20=
snd_soc_dai=20*cpu_dai=20=3D=20rtd->cpu_dai;=0D=0A>=09int=20i;=0D=0A>=0D=0A=
>=09lockdep_assert_held(&rtd->pcm_mutex);=0D=0A>=0D=0A>and=20here.=0D=0A>vo=
id=20snd_soc_runtime_deactivate(struct=20snd_soc_pcm_runtime=20*rtd,=20int=
=20stream)=0D=0A>=7B=0D=0A>=09struct=20snd_soc_dai=20*cpu_dai=20=3D=20rtd->=
cpu_dai;=0D=0A>=09int=20i;=0D=0A>=0D=0A>=09lockdep_assert_held(&rtd->pcm_mu=
tex);=0D=0A>=0D=0A>Approach=20method=20of=20this=20patch=20is=20too=20simpl=
e=20but,=0D=0A>I=20think=20that=20simple=20approach=20can=20be=20used=20unt=
il=20the=20nicer=20patch=20arrives.=0D=0A>=0D=0A>Thank=20you=20for=20your=
=20fast=20review.=0D=0A>>=0D=0A>>Thanks=0D=0A>>--=0D=0A>>=7EVinod=0D=0A>>=
=0D=0A=0D=0AHi,=0D=0A=0D=0ACould=20you=20review=20my=20answer=20and=20patch=
=20and=20give=20me=20a=20comment?=0D=0AIf=20you=20have=20any=20suggestion,=
=20just=20let=20me=20know=20it.=0D=0A=0D=0AThanks=0D=0A=0D=0AGyeongtaek=0D=
=0A=0D=0A
