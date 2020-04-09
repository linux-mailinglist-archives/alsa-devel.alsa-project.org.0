Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C631A2D5E
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 03:34:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D10BC1662;
	Thu,  9 Apr 2020 03:34:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D10BC1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586396095;
	bh=/jlEahvxFBEG36Sn+sdoU9mIa/xJJWDsoeI/cwk5tr0=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qM1zmcmNArpLAHuBDPffCVu202VTB3dXu9wyVy+YIXvNORkUbc8jdk4+KMQRz40sk
	 r1PUacZ82jqdzFYG0LWzTwphGRZEoPFVETEfFOdTiQ4WtEt4YwTovdjMP53RlaOabk
	 Wh8NmaTTKhAX42WgjGc091IwXuWS2HicWMmMekXI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 090EEF800FD;
	Thu,  9 Apr 2020 03:33:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE165F801DA; Thu,  9 Apr 2020 03:33:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93106F800CB
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 03:33:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93106F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="ad/yNeBK"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200409013258epoutp0270a80dbf3be9089020da9422aba19472~EArzMZFWs0973709737epoutp02X
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 01:32:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200409013258epoutp0270a80dbf3be9089020da9422aba19472~EArzMZFWs0973709737epoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1586395978;
 bh=/jlEahvxFBEG36Sn+sdoU9mIa/xJJWDsoeI/cwk5tr0=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=ad/yNeBKiIOvnONicwVnh3x3FLu4EoObYGaM1WV2rqGrRGd61ctzOM8rE0GYHEA0g
 NoDsTSCp+nnPUIF54knL2QMCxJ0uUpgERPMVJk/nZp7edYfxD+i5rPPlD3Z+Q4hTgb
 I1KTPL4EBsvGJI6zNkwnrsnWYdV6VChe9xhZ+joo=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20200409013258epcas2p24ad735aa3726d384f3587ea2131978a0~EArywMFoC2594725947epcas2p2q;
 Thu,  9 Apr 2020 01:32:58 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.181]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 48yNtw6p7ZzMqYkn; Thu,  9 Apr
 2020 01:32:56 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 11.B5.04704.84B7E8E5; Thu,  9 Apr 2020 10:32:56 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
 20200409013255epcas2p1c5f59e2001749db2e3ebe8daca43373c~EArwZ76Uw0925609256epcas2p1T;
 Thu,  9 Apr 2020 01:32:55 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200409013255epsmtrp15bde59a95db7eec5b0263fc3ef785263~EArwZB2cx3015630156epsmtrp1Q;
 Thu,  9 Apr 2020 01:32:55 +0000 (GMT)
X-AuditID: b6c32a46-829ff70000001260-2f-5e8e7b48f923
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 9E.46.04158.74B7E8E5; Thu,  9 Apr 2020 10:32:55 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20200409013255epsmtip2d065a654d6ecf915d430d91b6928c9ac~EArwQuhpQ0179301793epsmtip2G;
 Thu,  9 Apr 2020 01:32:55 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Vinod Koul'" <vkoul@kernel.org>
In-Reply-To: <20200403075519.GQ72691@vkoul-mobl>
Subject: RE: [PATCH 1/1] ASoC: soc-compress: lock pcm_mutex to resolve
 lockdep error
Date: Thu, 9 Apr 2020 10:32:55 +0900
Message-ID: <000001d60e0e$cb30c3b0$61924b10$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFwzVbedZouWCPbUsnJTjAf4rU5iQGklQ1ZAqRUqjYByeFLegG5MuGqqPwfM3A=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUgTcRjH+d3Nu7NaXdPqSfpjXC80Y7mtpmdpLyQ20kIoIkNchx5O3Bu7
 LTQlSkl8KVPQymWhFiKr0NYSjRSdZmpoGPZHotHLIsroPSvMavMW+d/n+f6e7+95vnc/Cpc1
 ExFUttnO28yckSEWSNp6FTFKXX5FuspXRbJjo16MrXnuI9gLbeUSdnqsBGPvjV7B2NbvNxDb
 d7IaYzsmBvAdlK71SyGh63BOkjq3q5TQVXhcSNfieSxJCTlsjDPwXCZvk/PmDEtmtjkrnkna
 r9+l10ar1Ep1LBvDyM2ciY9nEpJTlInZRv8yjPwoZ3T4pRROEJiobXE2i8POyw0WwR7P8NZM
 o1Wttm4UOJPgMGdtzLCYtqhVKo3W33nEaHhddJ20tsXlTk40kSeQb0sZCqWA3gyvnw3gZWgB
 JaPbEbwsmiHE4jOC+kl3sJhG0P7nMVaGyDlLOS/KnQjONX7ExOINgsGHbhS4lqCV8PXpBB7g
 cHoteHzPiADjtAvBWHdMgENpFZwtrPX3UFQYfRA+nToSkCX0Gpge+TTXLqVjoedHAybyUhis
 9UnEazZAU8MULiaQw89XTSHiqH1Q8/FFcFQ4XCwtnksG9AcCGvu9mGhIgF+3viORw+DtfQ8p
 cgS8OVtMioYiBO+HfwUPqhGUlstE3gSeS0NYYGmcVkDLnagAAr0a+saDuy2Gkt5ZUpSlUFIc
 NDJwc+g3JsoAl1vJSsQ45wVzzgvmnBfA+X9UPZK40HLeKpiyeEFj1cz/024090ojE9vR1ZFk
 L6IpxCySdt89ky4L4Y4KeSYvAgpnwqVJhX5JmsnlHeNtFr3NYeQFL9L6v3sVHrEsw+J/82a7
 Xq3VREerYrWsNlrDMiuk7oVP0mR0Fmfnc3jeytv++TAqNOIEGt9aXtWbVr3k/CoFlp4Staep
 3+DoWqu6/a5yqni4AUseyd5ZwPx5sLsjt3PCdXvv4rqh5hep+T31YyGFPgPgvqU79NYvVx6t
 zyf1pw6cyTmkuVZf4aobrc3rQusGtxc0n25X+FInpVO5x1s/VL/vyCuglLUz+c7Ls9/SFV0r
 nQsZiWDg1JG4TeD+AmmM2gu7AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRmVeSWpSXmKPExsWy7bCSvK57dV+cwevfKhZXLh5ispj68Amb
 xYxt3SwW3650MFkcvbiYyWLD97WMFkcapzBZ7LxzgtmBw2PD5yY2j52z7rJ7bFrVyebRt2UV
 o8f6LVdZAlijuGxSUnMyy1KL9O0SuDK2PHrOXrBes2J+zzrWBsYVil2M7BwSAiYS3aldjFwc
 QgK7GSW2rrjO1sXICRSWkPgw/ww7hC0scb/lCCtE0XNGidNdXcwgCTYBXYkv9+6A2SICqhJb
 njxgAyliFtjEKLH3w25miI5GJok1DQtZQKo4BQwk+ptmgnUIC4RI9K75CbaORUBF4tu5j2A2
 r4ClxMEfC5kgbEGJkzOfgPUyC2hLPL35FM5etvA1M8R5ChI/ny5jhbjCT2Lqh0dsEDUiErM7
 25gnMArPQjJqFpJRs5CMmoWkZQEjyypGydSC4tz03GLDAqO81HK94sTc4tK8dL3k/NxNjODY
 0tLawXjiRPwhRgEORiUeXon9vXFCrIllxZW5hxglOJiVRHi9m4BCvCmJlVWpRfnxRaU5qcWH
 GKU5WJTEeeXzj0UKCaQnlqRmp6YWpBbBZJk4OKUaGHlmaF4KLNHKWOs/q2bnQkXWnxdF/ec+
 dg/7PXN6SZhGtvr6+L1ciUyTnPYbZv+78KHj1uSt/6a2ZBjPbsyZ6nL2P9u9eF7nbeIZoTNW
 6E33YVngU5PfOG9N5RTfFZ/4o1tbiz8a8W6ZdyXR5fRCtoVc/2Vu8GRllD9Z0nxaf7JDkeVD
 xcrfFUosxRmJhlrMRcWJAFnt/HKpAgAA
X-CMS-MailID: 20200409013255epcas2p1c5f59e2001749db2e3ebe8daca43373c
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
 <20200403075519.GQ72691@vkoul-mobl>
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, hmseo@samsung.com, tkjung@samsung.com,
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

On 03-04-20, 16:55, Vinod Koul wrote:
>On 31-03-20, 10:54, =EC=9D=B4=EA=B2=BD=ED=83=9D=20wrote:=0D=0A>>=20Hi,=0D=
=0A>>=20=0D=0A>>=20On=2030-03-20,=2017:17,=20Vinod=20Koul=20wrote:=0D=0A>>=
=20>Hello,=0D=0A>>=20>=0D=0A>>=20>On=2030-03-20,=2020:01,=20=20=CC=B0=20=20=
=20=20wrote:=0D=0A>>=20>>=20snd_soc_runtime_activate()=20and=20snd_soc_runt=
ime_deactivate()=20require=20=0D=0A>>=20>>=20locked=20pcm_mutex.=0D=0A>>=20=
>>=20=0D=0A>>=20>>=20Signed-off-by:=20Gyeongtaek=20Lee=20<gt82.lee=40samsun=
g.com>=0D=0A>>=20>>=20---=0D=0A>>=20>>=20=20sound/soc/soc-compress.c=20=7C=
=204=20++++=0D=0A>>=20>>=20=201=20file=20changed,=204=20insertions(+)=0D=0A=
>>=20>>=20=0D=0A>>=20>>=20diff=20--git=20a/sound/soc/soc-compress.c=20b/sou=
nd/soc/soc-compress.c=20index=20=0D=0A>>=20>>=20392a1c5b15d3..42d416ac7e9b=
=20100644=0D=0A>>=20>>=20---=20a/sound/soc/soc-compress.c=0D=0A>>=20>>=20++=
+=20b/sound/soc/soc-compress.c=0D=0A>>=20>>=20=40=40=20-207,7=20+207,9=20=
=40=40=20static=20int=20soc_compr_open_fe(struct=20=0D=0A>>=20>>=20snd_comp=
r_stream=0D=0A>>=20>>=20*cstream)=0D=0A>>=20>>=20=20=09fe->dpcm=5Bstream=5D=
.state=20=3D=20SND_SOC_DPCM_STATE_OPEN;=0D=0A>>=20>>=20=20=09fe->dpcm=5Bstr=
eam=5D.runtime_update=20=3D=20SND_SOC_DPCM_UPDATE_NO;=0D=0A>>=20>>=20=20=0D=
=0A>>=20>>=20+=09mutex_lock_nested(&fe->pcm_mutex,=20fe->pcm_subclass);=0D=
=0A>>=20>>=20=20=09snd_soc_runtime_activate(fe,=20stream);=0D=0A>>=20>>=20+=
=09mutex_unlock(&fe->pcm_mutex);=0D=0A>>=20>=0D=0A>>=20>Can=20you=20please=
=20explain=20why=20you=20need=20the=20lock=20here,=20as=0D=0A>>=20>>=20=20=
=0D=0A>>=20>>=20=20=09mutex_unlock(&fe->card->mutex);=0D=0A>>=20>=0D=0A>>=
=20>we=20already=20have=20a=20lock=20here..=0D=0A>>=20>=0D=0A>>=20>>=20=40=
=40=20-285,7=20+287,9=20=40=40=20static=20int=20soc_compr_free_fe(struct=20=
=0D=0A>>=20>>=20snd_compr_stream=0D=0A>>=20>>=20*cstream)=0D=0A>>=20>>=20=
=20=09else=0D=0A>>=20>>=20=20=09=09stream=20=3D=20SNDRV_PCM_STREAM_CAPTURE;=
=0D=0A>>=20>>=20=20=0D=0A>>=20>>=20+=09mutex_lock_nested(&fe->pcm_mutex,=20=
fe->pcm_subclass);=0D=0A>>=20>>=20=20=09snd_soc_runtime_deactivate(fe,=20st=
ream);=0D=0A>>=20>>=20+=09mutex_unlock(&fe->pcm_mutex);=0D=0A>>=20>=0D=0A>>=
=20>And=20this=20instance=20is=20also=20using=20fe->card->mutex..=20so=20I=
=20think=20double=20lock=20may=20not=20serve=20any=20purpose=20here..=0D=0A=
>>=20>=0D=0A>>=20>Can=20you=20explain=20why=20we=20need=20the=20extra=20loc=
k?=0D=0A>>=20You=20are=20right.=0D=0A>>=20The=20mutex_lock=20with=20fe->pcm=
_mutex=20has=20no=20purpose.=0D=0A>=0D=0A>Okay=0D=0A>=0D=0A>>=20It=20just=
=20removes=20lockdep=20warning=20like=20the=20below=0D=0A>>=20<4>=5B=201437=
.857354=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20-------=
-----=5B=20cut=20here=20=5D------------=0D=0A>>=20<4>=5B=201437.857463=5D=
=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20WARNING:=20CPU:=
=205=20PID:=2011547=20at=20sound/soc/soc-pcm.c:99=20snd_soc_runtime_deactiv=
ate+0x88/0x140=0D=0A>>=20<4>=5B=201437.857498=5D=20=20=5B5:=20=20=20=20=20=
=20=20=20=20=20cplay:11547=5D=20Modules=20linked=20in:=0D=0A>>=20<4>=5B=201=
437.857557=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20CPU:=
=205=20PID:=2011547=20Comm:=20cplay=20Tainted:=20G=20S=20=20=20=20=20=20W=
=20=20=20=20=20=20=20=20=204.19.65-00198-ge6c3a8b64f3d-dirty=20=23146=0D=0A=
>>=20<4>=5B=201437.857590=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:=
11547=5D=20Hardware=20name:=20Samsung=20xxx=20board=20based=20on=20xxx=20(D=
T)=0D=0A>>=20<4>=5B=201437.857620=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=
=20cplay:11547=5D=20Call=20trace:=0D=0A>>=20<4>=5B=201437.857662=5D=20=20=
=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20=5B<ffffff800808d598>=
=5D=20dump_backtrace+0x0/0x404=0D=0A>>=20<4>=5B=201437.857704=5D=20=20=5B5:=
=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20=5B<ffffff800808d9b0>=5D=20s=
how_stack+0x14/0x1c=0D=0A>>=20<4>=5B=201437.857745=5D=20=20=5B5:=20=20=20=
=20=20=20=20=20=20=20cplay:11547=5D=20=5B<ffffff8008c5dc24>=5D=20dump_stack=
+0xa0/0xd8=0D=0A>>=20<4>=5B=201437.857784=5D=20=20=5B5:=20=20=20=20=20=20=
=20=20=20=20cplay:11547=5D=20=5B<ffffff80080a4b28>=5D=20__warn+0xcc/0x12c=
=0D=0A>>=20<4>=5B=201437.857821=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20=
cplay:11547=5D=20=5B<ffffff8008c5cd78>=5D=20report_bug+0x78/0xcc=0D=0A>>=20=
<4>=5B=201437.857857=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=
=5D=20=5B<ffffff800808e5c0>=5D=20bug_handler+0x2c/0x88=0D=0A>>=20<4>=5B=201=
437.857895=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20=5B<=
ffffff8008085510>=5D=20brk_handler+0x88/0xc8=0D=0A>>=20<4>=5B=201437.857930=
=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20=5B<ffffff8008=
080f0c>=5D=20do_debug_exception+0x108/0x194=0D=0A>>=20<4>=5B=201437.857968=
=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20Exception=20st=
ack(0xffffff8028b0b960=20to=200xffffff8028b0baa0)=0D=0A>>=20<4>=5B=201437.8=
58002=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20b960:=200=
000000000000024=20ffffff8008e28a97=20ffffffc975bb40a0=20ffffff8028b0b748=0D=
=0A>>=20<4>=5B=201437.858035=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cpl=
ay:11547=5D=20b980:=200000000000000080=200000000000000000=20ffffff800812963=
8=200000000000000000=0D=0A>>=20<4>=5B=201437.858066=5D=20=20=5B5:=20=20=20=
=20=20=20=20=20=20=20cplay:11547=5D=20b9a0:=20e0b1dc92eba18f00=20e0b1dc92eb=
a18f00=200000000000000003=200000000000000000=0D=0A>>=20<4>=5B=201437.858098=
=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20b9c0:=20000000=
0000240022=200000000000000004=20ffffff8009b2f420=2000000000fffffff5=0D=0A>>=
=20<4>=5B=201437.858130=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11=
547=5D=20b9e0:=20ffffff8008c6baac=20000000000000002c=2000000000000000b0=20f=
fffffc9673c1e80=0D=0A>>=20<4>=5B=201437.858161=5D=20=20=5B5:=20=20=20=20=20=
=20=20=20=20=20cplay:11547=5D=20ba00:=200000000000000000=20ffffffc8190e6100=
=200000000000000000=20ffffffc95c262e88=0D=0A>>=20<4>=5B=201437.858193=5D=20=
=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20ba20:=20000000000000=
0008=20ffffffc8ec3050d0=20ffffffc8fb81a4d0=200000000000000004=0D=0A>>=20<4>=
=5B=201437.858224=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=
=20ba40:=200000000000000009=20ffffff8028b0bac0=20ffffff8008a895c8=20ffffff8=
028b0baa0=0D=0A>>=20<4>=5B=201437.858256=5D=20=20=5B5:=20=20=20=20=20=20=20=
=20=20=20cplay:11547=5D=20ba60:=20ffffff8008a895c8=200000000060400005=20fff=
fff8028b0ba48=20ffffff800811d7b4=0D=0A>>=20<4>=5B=201437.858287=5D=20=20=5B=
5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20ba80:=200000007fffffffff=
=20e0b1dc92eba18f00=20ffffff8028b0bac0=20ffffff8008a895c8=0D=0A>>=20<4>=5B=
=201437.858318=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20=
=5B<ffffff8008082b18>=5D=20el1_dbg+0x18/0x78=0D=0A>>=20<4>=5B=201437.858355=
=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20=5B<ffffff8008=
a895c8>=5D=20snd_soc_runtime_deactivate+0x88/0x140=0D=0A>=0D=0A>So=20if=20t=
he=20lockdep=20is=20complaining,=20then=20we=20should=20add=20lockdep=20ass=
ert=20in=0D=0A>the=20open_fe=20as=20well..=0D=0Asoc_compr_open_fe()=20is=20=
a=20callback=20of=20the=20soc_compr_syn_ops.=0D=0A=0D=0Astatic=20struct=20s=
nd_compr_ops=20soc_compr_dyn_ops=20=3D=20=7B=0D=0A=09.open=09=09=3D=20soc_c=
ompr_open_fe,=0D=0A=0D=0ASo,=20if=20lockdep_assert_held()=20is=20inserted=
=20in=20soc_compr_open_fe(),=0D=0Adoubled=20warning=20message=20will=20be=
=20printed.=0D=0AIf=20you=20have=20any=20idea,=20just=20let=20me=20know=20i=
t.=0D=0A=0D=0AThanks,=0D=0AGyeongtaek=0D=0A>=0D=0A>--=20=0D=0A>=7EVinod=0D=
=0A>=0D=0A=0D=0A
