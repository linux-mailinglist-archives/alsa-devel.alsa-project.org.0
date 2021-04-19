Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F9D3645D9
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 16:18:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43E02167F;
	Mon, 19 Apr 2021 16:18:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43E02167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618841932;
	bh=ZkIu+IOi+NBZ6WVq+5g/BhBGLQD52u8KDpYdrFV3uZo=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=arXPwD8J+4MGbzbrUXLUCKOF0G4xPdqCKjNhomsJ8L+EgLubtDMj7B8J9JQPWrJc+
	 sGB+Oj0B6YREspMj7s8tM0UIJEk//uL2OLTD4ECUKAAHLc5/ez3q0x+eZmPVWnFTpi
	 EMkUiO61vjIQPlgzRdiOGt1DOvoyskji08AkTSxQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B314BF8019B;
	Mon, 19 Apr 2021 16:17:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2E60F80227; Mon, 19 Apr 2021 16:17:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from sonic312-25.consmr.mail.ir2.yahoo.com
 (sonic312-25.consmr.mail.ir2.yahoo.com [77.238.178.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 589D8F800C5
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 16:17:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 589D8F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.b="NT7RhmXK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1618841825; bh=MmIoaN9PXU0k+mM41k974T3NZJ1ysmEWNnDdZkLIFGk=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=NT7RhmXKxuqxYstu3xYOHtPR4dR6IDEERNBR+c60GjAeR9X7aVseLSk4BRimVjzK9wEhjkN0vUJoFEBqF5gF+S4vy3HcidXjqGdBtSwc3wQqIeu++bng+6pinHw9iCHyNueIgGn3fJPCFEmPHbvDY/h8dPrKLiYupoQfI6NjMhaNHytyYWHG7nEqxK80M3x3lAfele+PGF5lWDcq63mmQUWnp2OGLZMsUj6P+wLLA3BiBIfbmSaj5Q/I0CNzcTbdusG5zM9rUHS6OVzX/eiNnRunfjye7GpCVHYHOaRDCI6xV206RgTDv5JqlgetJEgphOJGDkOdGUahm79V5uNF+Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1618841825; bh=0HdZzQxkknvJzBdw8yHw+a+CIcWhEcj6cgs8wV/73sO=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=b7WjWDFBFG09npeSSRvdx2Fc7J4CnrpTBZ3MG2zCGbJqKfWzzRh0TzI95DXxO0WEY/X5uq/j1jjPPzuPoNR8oEpQ1QTDpSrWOEkxahbQzDF4X0OT4W0hWnF0/7dZ93Vqw2S7q+M94hvk4QwSr0xMIqVZe+KIhMi1D6XJ9uMCP8wM0CXtrCU63EK4hTbA/CoRhkFnIWq9RUAmy8TGXDKVis7CyXrfRzH7rOsKTXhEOLcQddzxSMSwSHDg3o9Ba+9kkg+E7aGDX88+44HCIDt6reFDJEPd7p24LNcdiZIIGu0Kym7mTQ28no5bCYrT1lkD6Gqtbiix0Wkgrj15mosWyQ==
X-YMail-OSG: viytI8EVM1lFv5Ytzmdcn7dA0pitqihd1CXk2QGOr_OTdZ7qgjS_.NYb_W7QTWI
 yWcSUvfl3KmUrI_85uxBByuDNuDwmtNbmVSuw.gv55mODbEH7odRIB3bge_G9XSNH0jxZhn1P2MR
 4pXbUFMfaYHdaGvT0Mp.SwjEqGDydKlgh3H1aVrpSQ0N9rCXpYh6pOEjszPWwex79gQ8gWUZVw6R
 E5W9chhFBRE3AEkHpabOhSzY3UbLpS19H8MdL_kUtZmBjt7vUGe8GyAFNkq3klqJ4nQbJ1LKDD7s
 Apqhpog28X7QvqNlHeFFsie87XbWbDVzIEedEe3NRHMGnvsZGvH9Dbx5PmkIcKOCUN9CB3_bO16I
 M8gPDqfxz6rLImt6rHy9Q951T0SRkpUgF_HyKRcODvYqKzPtNG0NKYHmKH1RNQSIOB12Gp_SvfQl
 8q89j3XN3HCSCrQg0Y.3CftCUzZuUdI6jRZ3TSchuYUOtI5U0r1PgCrK9D22RZ5NhjZY9Vv4J0rB
 lfLLcTJz7lUOQyu_Ton9IRwyjgyASDc07zUceD_DWqLtcFq7g6iOgEvII269or2I_UiseF1UFH7A
 H.ZwfA0RUm_upfwuEaz8.vjkmQ1VVuwJgycdyBHOsLyljEfMDPcFNVqOyAvBUsXjGAepIwuYq8YW
 mDMtrf6b5jc4ogP5wYwm4dfpMe6LjVxoToEAaiGL513YJbPXzusomYMn.DAd_G3je7fF9ifz3IA9
 UIWqu5HBwxN42.MvVfAuA6wM6U8mykzeOeXXrewRqo1yrJx6DgF1kDNoCweJ0Jd7ZarFZwWOMT56
 0Ea0fpJi9jduKBgFNIeOCwu7nFr240hN_L8D2f.xhS88AnFoxfl0JEU2E1fm3XddkN7gx6Rj3yzr
 c3bLGB4EJNPJR9MjcVDdcQecVcsdwZFyjr6fuZ6Uecm.ssyaemg2uXBaP3RCdubgyLtVNMKGXWxB
 CvFifa0z3KD5MGgyXKPYYulvTkfmqLMRZohJoXamYe8Pf4r3CSstKdxKtKX2Z6topeFelvhEGc7L
 G7R6ptKRnp0w_wUw0Yu4VXMSKvFmMJMChOLenhm7WtKVc4bH4Hqy0k72OlSHH9DFrpEnVoqa27XQ
 oV5cWkSih75XrEntrgkwio8muFSGxMMOjuHAtiWoxqYEEcuY3YxobcR5Nwtd2m0hpmSw1Q4u7oDD
 3zjjUWEWqqPbusMjfXUPG6gFMKnPtY.5xog3XVvWmv1wpUV0epvsJ5gwb9n1aGR3ZqhGK13gW3Ct
 vMY6lKhs.05XA8InBK2jTlKrhf7ymPCrowOP.BMIuVC0O7O0ch5D3quhbl0eE01F.pZ118BAQS92
 yeCeVBtYc5YY2ccH7dKHolh3Bs8XD3Yobo3ox7MLVhW6rlmi7iWNBWPgY9v01jRmighSdzWJS.7l
 B4FKDFckTlrUuvGSf0VahqeQ85fZKV8zw7OaBfSDqnRSsRwXRhxi927VE5DRmgktQgx7me9eLj68
 .e8re3yGXL7kz0VOs3LmOrQ.ugZ_DdI8jlDDCXxzcPn76Cjp80uFuL2Ly7MLprDWRyIoyAOq5PkP
 rFG639mXDEhqNxcoAhMLJf2w5J6Y1_RL.U7lgGaAmQ3fg6N4l31fdMVeHjGv.ID2aQsrMz7uk7US
 G0owrGomxgS_wEhgeAPJ4UXNTuljTHXHGrcbx.99ZAgXFZXM06TK5JMct7slABbRxdGGFeU8b4m9
 0TEpysLpEaO0Ob6il3SI3yqLTu70EfyNStMZwSynYNwPa.j3RgJ7a4.YUCMyhhdesavaF48ZckTJ
 pHVfuN_EXrr3J5myYSNvXFG_HV2d0rs_4gKy0uBkjYJt1YOZIxB0B.XbH0UQOMsRu5x9xiw6S4vU
 d2lBatIOMtu2FVA_nd2A5pNtAe0ajmv73VOeX6KsaPyiRP0Mg7GDDm8XvZWkyIFzkPuIdZF8tfTr
 3HIubXz1cPiTtQvF6rOX2vpLtClPvhQht5dV8n64egWzsP5Tn.p4QCt_IP86jSV_AzBebXg_bOO0
 cMP5VZXcTSAT_Qdqmyn6wuCQl2P2eNk57MPLzyrm0KhnXPMePyYkJTudFd9N.p.JKYXoleo9pRtD
 oe1AO3WCbYl6IO0msdAXUFNsfzlXweEfvl3OfXysb_wt.0_0lOHgm5qARE2t61dyaEnY1nr9QbTb
 ytPefZHXyT0w5X6ENDajxpyvOt8_LOBlPu2aaCUGThXbkQV7.Ue6AOYRktGETB5s2ifrJxSBjCK6
 Vo_r0rrlI4DIWXywtLeTKjnqJwB7dnMfXQZ6hExztNOCF9XlL5fl1rUcKx9RjOdAsZa29O3kKA9K
 2qAex5WWO1Q0qcUdQ79KuILrHSD94QErbR9HYm2k_gheErbRnQqgeyZOKvCZ6uVNJe5_We4O1xe.
 ouJsBy57qRwy1e7YxjjueoqiOD95x1xgorbEUcLBdqG88BH35NrMEBuaZ58.E85bnNhrofMZOZVh
 z_dpg.HVXr.8HB10dhXV0Cv7It1RrF_3msW97H3JWwHdrUYuuUhskTkZNNL2vyNDfDE3iBLRRfl8
 kSVUC_vJT9sLfdosnezUumNbu4l_uH_WSXM6BJLAlogIhDx_vogSEmtmIUmpnHyC97glqQij7FGb
 aFlgLwdzGuo0iEQnwD2warB0M8w--
X-Sonic-MF: <htl10@users.sourceforge.net>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.ir2.yahoo.com with HTTP; Mon, 19 Apr 2021 14:17:05 +0000
Date: Mon, 19 Apr 2021 14:17:04 +0000 (UTC)
From: Hin-Tak Leung <htl10@users.sourceforge.net>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <1772063602.5910217.1618841824599@mail.yahoo.com>
In-Reply-To: <877dkz5hz1.wl-kuninori.morimoto.gx@renesas.com>
References: <148484793.4894421.1618654607945.ref@mail.yahoo.com>
 <148484793.4894421.1618654607945@mail.yahoo.com>
 <877dkz5hz1.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: ASoc / PCM recording-related regression between v5.4 and v5.5
MIME-Version: 1.0
X-Mailer: WebService/1.1.18121 YMailNodin Mozilla/5.0 (Macintosh;
 Intel Mac OS X 10_15) AppleWebKit/605.1.15 (KHTML, like Gecko)
 Version/14.0 Safari/605.1.15
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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
Reply-To: htl10@users.sourceforge.net
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

 On Monday, 19 April 2021, 00:02:09 BST, Kuninori Morimoto <kuninori.morimo=
to.gx@renesas.com> wrote:

> Hi

> > I am trying to find the cause of a rather unusual regression between ke=
rnel v5.4 and v5.5,
> > for an out-of-tree driver on the raspberrypi.

> I think out-of-tree code needs update.
> We merged snd_pcm_ops into component between v5.4 - v5.5

>=C2=A0=C2=A0=C2=A0 e2cb4a14541dba3587bb78e0f62da27a0e1ad399
> =C2=A0 =C2=A0=C2=A0=C2=A0 ("ASoC: soc-core: merge snd_pcm_ops member to c=
omponent driver")

> And all drivers which used it was updated.
> For example,

>=C2=A0=C2=A0=C2=A0 1fddf424b3c49a475ca7c23662f515b53f884172
>=C2=A0=C2=A0=C2=A0 ("ASoC: mediatek: remove snd_pcm_ops")

> And snd_pcm_ops is no longer used on ALSA SoC

>=C2=A0=C2=A0=C2=A0 e9067bb502787869dabe385727baff233024097b
>=C2=A0=C2=A0=C2=A0 ("ASoC: soc-component: remove snd_pcm_ops from componen=
t driver")

> If your out-of-tree is using it, and not yet updated,
> some issue can be happen, I think.

Thanks for the reply. It appears I made a mistake in my earlier posting - m=
y 'git diff' of what files matter was correct, but the commit listing / aut=
hors with git log was missing some \* and were way too small. The actual nu=
mber of possible commits is rather in the 100+ and involving about 20+ auth=
ors. That said, thanks to your suggestions, I have found one error - and a =
problematic area in the current out-of-tree driver code:

it was not setting .non_legacy_dai_naming - this was a 4.16 change . The si=
milar hardware but working sibling device has one single ADC codec, while t=
he broken device has two such ADC codec plus a 3rd DAC codec; I see that th=
is flag started to matter in v5.6 for codec2codec links . I don't know if t=
his qualifies as a codec 2 codec link - it is running two 4-mic ADC in para=
llel to read from 6 mics...

Anyway, I tried putting that flag in, but it has not fix problem with 5.10,=
 so I am back to trimming the difference between v5.4 and v5.5 slowly.

At the moment I think I need to look at the v4.16 series involving .non_leg=
acy_dai_naming again; while trimming the difference between v5.4 and v5.5 s=
lowly.

(the out-of-tree driver is not my code - I am just the owner of one such de=
vice... the vendor is not very responsive, so I have been doing most of the=
 porting since 4.19...)

Thanks a lot.

Hin-Tak

 =20
