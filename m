Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 623BE198BAE
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 07:29:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE2B01657;
	Tue, 31 Mar 2020 07:28:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE2B01657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585632577;
	bh=b0rnPpL78RHgb4dBYqMLp1hCnkQZVNKmWCbLFMJsCWU=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=igomuA3M8GBZzY9LcA2UHypbC8xD0eGD2zNIQXJ2Vv5xSzESJd1Ks4a10n2+s4aK8
	 WueK8XbCQVLF8c38hB+paM3STtu/XRZk/zT2sOnmxfOt4ZHt6DEGenFZuqEVMpykzR
	 R9NFRqOavJxLUy1etUdpnvM3WopIdzXEAKdPDtGY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6823F8014F;
	Tue, 31 Mar 2020 07:27:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C780F800AA; Tue, 31 Mar 2020 07:27:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8E28F800AA
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 07:27:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8E28F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="fP7OlJUk"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200331052737epoutp04f4185a1a1ca57bf6ad50a0d38edf9c7d~BTFG-i-qc2827428274epoutp048
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 05:27:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200331052737epoutp04f4185a1a1ca57bf6ad50a0d38edf9c7d~BTFG-i-qc2827428274epoutp048
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585632457;
 bh=b0rnPpL78RHgb4dBYqMLp1hCnkQZVNKmWCbLFMJsCWU=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=fP7OlJUkKUQvhh+5Gkhq/Mkg1ckz5Ikhfg+V7N9zFGu+jdGAKhX+QWoKTBlTdEHfl
 7I0agLE4KQ5HVQ3OtlAsjvx5uV9rn+NjYibm/7QVCh1zDkd4c52ouU/u59wCI8t9mZ
 FCHr14Ypt5krubxV38AQ8Fg1uoMzvowM6gY3odu4=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20200331052737epcas2p1bc46656fe751c9be38d1cd162ee319aa~BTFGauww40472704727epcas2p11;
 Tue, 31 Mar 2020 05:27:37 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.187]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 48ryWq3m2MzMqYkp; Tue, 31 Mar
 2020 05:27:35 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 74.BB.04128.5C4D28E5; Tue, 31 Mar 2020 14:27:33 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
 20200331052733epcas2p4672957fefb52fefe5621e42e5ee8064c~BTFCsBe6L1429314293epcas2p41;
 Tue, 31 Mar 2020 05:27:33 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200331052733epsmtrp22d891afdf77f41cbb244d8255039e708~BTFCrSik_2895428954epsmtrp28;
 Tue, 31 Mar 2020 05:27:33 +0000 (GMT)
X-AuditID: b6c32a45-f9bff70000001020-d7-5e82d4c58d28
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 8A.6D.04024.4C4D28E5; Tue, 31 Mar 2020 14:27:33 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20200331052732epsmtip1f6b17ecd6818f17b42c3e0007e77b02b~BTFCfh2Iq3205532055epsmtip1o;
 Tue, 31 Mar 2020 05:27:32 +0000 (GMT)
From: =?ks_c_5601-1987?B?wMyw5sXD?= <gt82.lee@samsung.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>
In-Reply-To: <001001d60665$db7af3e0$9270dba0$@samsung.com>
Subject: RE: [PATCH 3/3] ASoC: fix regwmask
Date: Tue, 31 Mar 2020 14:27:32 +0900
Message-ID: <00fa01d6071d$144a2da0$3cde88e0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQLEOIH1sK9HcthW43dBh7e87NpZcwEJSRRNpn1+2QA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIJsWRmVeSWpSXmKPExsWy7bCmme7RK01xBg1LdS2uXDzEZDH14RM2
 i29XOpgsNnxfy+jA4rHhcxObx85Zd9k9Nq3qZPNYv+UqSwBLVI5NRmpiSmqRQmpecn5KZl66
 rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2Si0+ArltmDtBOJYWyxJxSoFBAYnGxkr6dTVF+aUmq
 QkZ+cYmtUmpBSk6BoWGBXnFibnFpXrpecn6ulaGBgZEpUGVCTsasb19ZCrYJVVzqj2lgfC/Y
 xcjJISFgInFn3QP2LkYuDiGBHYwSz9eeYoFwPjFKbF65Ccr5xiixY8pEVpiWaRv7WEBsIYG9
 jBI/tnBDFL1klJh78x9QgoODTcBKoqdbCaRGRMBR4uuxBrB6ZgFFicd/5oDZnEAl0xYuBJsp
 LKAtsWdfMzOIzSKgKjHz+C2wOK+ApcTaSe/YIGxBiZMzn0DNMZJYsno+E4StLbFs4WtmiNsU
 JH4+XcYKEReRmN3Zxgxxg5XEzEmvwN6UEDjBJnF72jF2iAYXiT8LFrJA2MISr45vgYpLSXx+
 t5cNoqGZUeLd2T9QiSmMEp3dQhC2scSWuaeYQB6WEFCWOHIL6jg+iY7Df9khwrwSHW1Q1UoS
 G0/9g6qWkJi3gX0Co9IsJJ/NQvLZLCSfzULyzQJGllWMYqkFxbnpqcVGBYbIcb2JEZwctVx3
 MM4453OIUYCDUYmH98HVxjgh1sSy4srcQ4wSHMxKIrxs/g1xQrwpiZVVqUX58UWlOanFhxhN
 gSE/kVlKNDkfmLjzSuINTY3MzAwsTS1MzYwslMR5N3PfjBESSE8sSc1OTS1ILYLpY+LglGpg
 NHCIPrHNb6O12fVlyvFRbDk9BhKBnR17p7yLSs+2nL7e2NMpjq9jtbSY4rdn8c47qxhLL3bu
 V35ksuHYJrvewMoKFSfBs6tPBUZGBTk/TJp79W737pj7Tev/K2pm95h9UJC8/W9X0+c59sH+
 lv33ti85oXzQ4VnCPKvjVzlnL/7zSyC4oSZIiaU4I9FQi7moOBEAtNroCaQDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLLMWRmVeSWpSXmKPExsWy7bCSnO7RK01xBjP6mS2uXDzEZDH14RM2
 i29XOpgsNnxfy+jA4rHhcxObx85Zd9k9Nq3qZPNYv+UqSwBLFJdNSmpOZllqkb5dAldG+7Pv
 zAXreCuWn1rG2sA4k7uLkZNDQsBEYtrGPpYuRi4OIYHdjBIbz91ig0hISHyYf4YdwhaWuN9y
 hBWi6DmjxOdlG4EcDg42ASuJnm4lkBoRAVeJ+3sbwOqZBRQlHv+ZAzW0m1Fi5cRHrCAJTqD6
 aQsXgtnCAtoSe/Y1M4PYLAKqEjOP3wKL8wpYSqyd9I4NwhaUODnzCQvEUBOJxsPdULa2xLKF
 r5khjlOQ+Pl0GStEXERidmcbM8RBVhIzJ71in8AoPAvJqFlIRs1CMmoWkvYFjCyrGCVTC4pz
 03OLDQsM81LL9YoTc4tL89L1kvNzNzGCI0VLcwfj5SXxhxgFOBiVeHgfXG2ME2JNLCuuzD3E
 KMHBrCTCy+bfECfEm5JYWZValB9fVJqTWnyIUZqDRUmc92nesUghgfTEktTs1NSC1CKYLBMH
 p1QDY1ha+tNV0iazVN17lV+JdkQo9E17rXburuLprrBDO7L48+xrOTRbRZ603ri2tuV0v9rZ
 4piSHYZWgXyeEkxFumcPfk1f0+FxuqZrmq7YtwuMwosOXVPrUnmS+8X5/0LtybN+iIVttFvE
 mlP0fh/v9yfPbQ+cuXHz0axdDNuij55etDudN5yzWImlOCPRUIu5qDgRAItMN8eQAgAA
X-CMS-MailID: 20200331052733epcas2p4672957fefb52fefe5621e42e5ee8064c
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200330073600epcas2p3712a5e92d86a524bedda790f2e273935
References: <CGME20200330073600epcas2p3712a5e92d86a524bedda790f2e273935@epcas2p3.samsung.com>
 <001001d60665$db7af3e0$9270dba0$@samsung.com>
Cc: alsa-devel@alsa-project.org
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



-----Original Message-----
From: Alsa-devel <alsa-devel-bounces=40alsa-project.org> On Behalf Of =C0=
=CC=B0=E6=C5=C3=0D=0ASent:=20Monday,=20March=2030,=202020=204:36=20PM=0D=0A=
To:=20lgirdwood=40gmail.com;=20broonie=40kernel.org;=20tiwai=40suse.com=0D=
=0ACc:=20alsa-devel=40alsa-project.org=0D=0ASubject:=20=5BPATCH=203/3=5D=20=
ASoC:=20fix=20regwmask=0D=0A=0D=0AIf=20regwshift=20is=2032=20and=20the=20se=
lected=20architecture=20compiles=20'<<'=20operator=20for=0D=0Asigned=20int=
=20literal=20into=20rotating=20shift,=20'1<<regwshift'=20became=201=20and=
=20it=0D=0Amakes=20regwmask=20to=200x0.=0D=0AThe=20literal=20is=20set=20to=
=20unsigned=20long=20to=20get=20intended=20regwmask.=0D=0A=0D=0ASigned-off-=
by:=20Gyeongtaek=20Lee=20<gt82.lee=40samsung.com>=0D=0A---=0D=0A=20sound/so=
c/soc-ops.c=20=7C=204=20++--=0D=0A=201=20file=20changed,=202=20insertions(+=
),=202=20deletions(-)=0D=0A=0D=0Adiff=20--git=20a/sound/soc/soc-ops.c=20b/s=
ound/soc/soc-ops.c=20index=0D=0A652657dc6809..55ffb34be95e=20100644=0D=0A--=
-=20a/sound/soc/soc-ops.c=0D=0A+++=20b/sound/soc/soc-ops.c=0D=0A=40=40=20-8=
25,7=20+825,7=20=40=40=20int=20snd_soc_get_xr_sx(struct=20snd_kcontrol=20*k=
control,=0D=0A=20=09unsigned=20int=20regbase=20=3D=20mc->regbase;=0D=0A=20=
=09unsigned=20int=20regcount=20=3D=20mc->regcount;=0D=0A=20=09unsigned=20in=
t=20regwshift=20=3D=20component->val_bytes=20*=20BITS_PER_BYTE;=0D=0A-=09un=
signed=20int=20regwmask=20=3D=20(1<<regwshift)-1;=0D=0A+=09unsigned=20int=
=20regwmask=20=3D=20(1UL<<regwshift)-1;=0D=0A=20=09unsigned=20int=20invert=
=20=3D=20mc->invert;=0D=0A=20=09unsigned=20long=20mask=20=3D=20(1UL<<mc->nb=
its)-1;=0D=0A=20=09long=20min=20=3D=20mc->min;=0D=0A=40=40=20-874,7=20+874,=
7=20=40=40=20int=20snd_soc_put_xr_sx(struct=20snd_kcontrol=20*kcontrol,=0D=
=0A=20=09unsigned=20int=20regbase=20=3D=20mc->regbase;=0D=0A=20=09unsigned=
=20int=20regcount=20=3D=20mc->regcount;=0D=0A=20=09unsigned=20int=20regwshi=
ft=20=3D=20component->val_bytes=20*=20BITS_PER_BYTE;=0D=0A-=09unsigned=20in=
t=20regwmask=20=3D=20(1<<regwshift)-1;=0D=0A+=09unsigned=20int=20regwmask=
=20=3D=20(1UL<<regwshift)-1;=0D=0A=20=09unsigned=20int=20invert=20=3D=20mc-=
>invert;=0D=0A=20=09unsigned=20long=20mask=20=3D=20(1UL<<mc->nbits)-1;=0D=
=0A=20=09long=20max=20=3D=20mc->max;=0D=0A--=0D=0A2.21.0=0D=0A=0D=0A=0D=0A=
=0D=0A
