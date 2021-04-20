Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FEA36575B
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Apr 2021 13:19:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8FB21688;
	Tue, 20 Apr 2021 13:19:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8FB21688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618917595;
	bh=CCwlga6gkwbiks5FTOs95J+lVoPQqFpKfCPL3bB25YM=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=KWqEVs44hqzDIqHcytVLR07HA6xdFZ6Efeg62io8soT51PE2+U4fvq/9tRPrXQu03
	 IzKi36YRCmi/3dMYyX2TlSlRjKbHMcORGF8AJE3kp2K0iW5YaEpgF+oky2yJR3TO45
	 TOqqCUiCBDMIIMv6sqoLpcKTbwFhCrdwn6ZunXB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C044F8014D;
	Tue, 20 Apr 2021 13:18:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD533F80253; Tue, 20 Apr 2021 13:18:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from sonic303-20.consmr.mail.ir2.yahoo.com
 (sonic303-20.consmr.mail.ir2.yahoo.com [77.238.178.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0ADEF8014D
 for <alsa-devel@alsa-project.org>; Tue, 20 Apr 2021 13:18:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0ADEF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.b="HkUYGrw5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1618917494; bh=2eqjHV1k6BZv9zvynDZu+VCkZPbonXXWvmZ9IZaH2yk=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=HkUYGrw5pzgN+SkILASzaSuU8lcgh1Y8x9Vv67IzqM14kitfTtNkBxskVGtv853anzTgvWr/7Cu/mwaYUEjGjdWg4CssxwJ5K8TxorMoOk9mL+/DPFWghp6SlpG4m8i7CxEPPfUQqENV1Cp9CXNlNb4J4bxCnbv99V5Xmrt3DO4XWrBrK81S/wBpfJ9M55w5eMraCQj1VbQSL4u19+n/gQTF3IRgnY4j6R4tjbxdovH3HNDNKETxT/H/9BpDwoxUUzo89Zf8BGtVBG89kQ41u+rwWAJtCYrg6FJgUfcX6lCtojY0SJihD21UR1NtWH+MXgEERxVwXSHqFkTW/zn+Tg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1618917494; bh=LI1geVmHV4hmswG8zUrhAHM/WP35F3W8gqxDaJcApNd=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=piYygweQXf5XMrgsxl7/fkpg10hvXNp/X07CJzCIILsReMZd3TA6uZuCI6WOhjmaO7M9FIzjOxeAMLIGGK7yrG+RKZvGxcJfIElO7aN1dhLPr2Lw3RBeLaSICoo9NTEGgFijObABAmzIa9vfJMWd6aYhbL7lOhRrOPvRS1rVAwJ/QooJVZXrrPLH8K0GRn949Pg8CGap3Q8YRvsPjPz/rpTEpdaBcRY4TmnCcfPdFI0ScPq213AQKgugMqQClKN8Jf7f/rMFnCvMWis805PYoJJ4tnRuJkMEM5FzxPNVDE/JDbR5tOrAIl9jKU0mzsEqWULJY5Tnc2g/v5W2Y61dWA==
X-YMail-OSG: cz5pp.oVM1nUI_DpIrDCPfRP3De05_Uu8N1Uub3i6wEiHdpJBTPypDxZKblaFeH
 0qGmcw3tI.K6sOhdXiB0TGopU1fcT5QNw2fTJQ.zFw4Oap6_tCIzY1Z2p_AiqBgsMQX930A1nc53
 A8T.wPwbodmz2_tx1t_lguLsu1lwEfPd3Xl65pJkJIiDC9pc1CD3Bc6sv8f7_TyPxqgnfVJOYu9s
 Xa0RB8FuXDmUuzzy.OYSP3Yw7wob.cxZHHRwKm7FKRO0DlmEvJ6QG9umJ1nWck85GRc0OeE9X0WY
 LTzYlwyHXwikVs8J54cI5kW9wvlNoc3v_aWF5yOVNLBf4mK8tZUJta5K4mc6_5ZD3aBg7OPvglCV
 rhP4Pa6AfNHsRTHa4d9mKXaV.VcnRqNXkSXC6yIracF1yR__oz.6HIFxTLPYcU688sFizMrOuQ9F
 8v_PZDmBs_TdaocNWxYAAUk2yD71cw411DioTOo1tA8D5zl14GwuQe4IR7Ls605uMPEBntXkdghn
 VX8ysGvgUIReyV88WBlzoLuibal16dggm1zufc_Ps8Hiij.1UIs7c0nEUylapyQXGK2Hy3letLIx
 WMYHJ0oDeVpmp20tq7Jno.CQ098h545Qm132qN1_TVh6J8nqiZauPbs3y2xpr3Ouu0Y.4fCeh0M9
 5kuR7cBnTKVlnKzHHa_gFtoIsU.XM79B4MoZLD6FvA7tQRO04okoZvrJBae13CNWSFvCQllgBrQJ
 BMT_9g3DcCiHzIChZWw93..8u7ks.W.1nEAxe7vWnbuWZd4bg5RSat25c8jJs.2EHK_3DHKzC6yd
 oDS4IsY11olf9dXHle7DWZwWp7Jfzyhoo_DzFQn8V.a7CbpBLxgsDxVlwQMFA5Ys9iwG1scoevrn
 X9iBsUzMig9pXKPGlx7Jepq1FAeGsFVyhRDzRSMsPFis3UtoeV3OkDTx0i7UiXVwVx.JmkVFOnMI
 .p_SiRIJ6raeFRpEbxLRDZ89vg5LoejqBEM0QABAQSw3SGLODEiG5RdCHir5u7uHD6ysAUqv55d8
 Ddy0WF.EuG1QsTPxE473ifMzRuZlplz76zcsLbgC5IO8gCfypkIIYVKFcyd8WbVdN2nFgYPjSoNS
 Kcg818d6OMGrYqA08yAAvJzLY2ZcBZZgSlS1tZp6M3q2grDEe0UbJAhYNhl5_UeVStE837bLDe8x
 5rcOYV4S1bHuMGnMfvskYCXoWb5dLtS63Em1P0uq_OsTLAlDDMgKG8X3OKfnH8DsbP0nvdch8XFj
 9ba8Q8O0pAy0ApIuFqCa4fHVaZZ5bCLcenlLD2M._rMoxy2xmgR2BzqjyhBAmpuUSJZEJd3jTHrL
 0TbgaZoetPwN3A6hYuC3GKhPXPtI9kVAwRoOC.FJsQcVoEcpX3YjZ0IfG9bD1ZT3CpgqqzK.by5R
 TAV4GHH5R9cPqSPq5670YWBt1Bgd20dqV_c9obtNX395M3u2xcSOHH6DALdn5rcEoIA.mLpI0IXx
 KFH_Ghd6B7MIzO10MN2eJl.rKLqF2jAi1lrk0oAFNAI.kfZFVb_7_9kwtX5kvSYxg9vmkXA6hIrX
 NJ8fQAKCeJVGYepCU9Iy8pEv_.S9uDpSQYbvUD2ynD_IjN5ufNY.fIOIHJ4IhJaVdDHdATQzEwQm
 Td5nIMPgfIBYLgy.9aY7daTKCe6d89DrR_6MOGfUVGU0OrMWLWq6H3z..0PMiHtDJxxE4nyJn2rR
 ApMM6.JoNOBozs3AOClTcYXVMFtCEiCBgaVxmIMTABqAea7PheLIzEORM11rXp97CwAXKEM0JdnW
 F.JcmeQC_AbPYdIqsXyW8WwqcvFoEopXe4ud.XdkSDOIkkriznppRgZr_lrgSeK6gOBWXixDetRV
 FgFBLl_jdrMLmJWOQk4b2i8OKuI_H7YTI2ixJI6xuwYcf1gsoHA4kv2tcI2YrkSw1BlWdxqN0EnV
 tWmPK1IhEKE.ksqkWjv2gb9juhU96kZ3AYeE8AVl_VqpGpV9HjJNlhedNRPM_Z02pNRebQQCbMfA
 EqPRpYnqCfR91n0rMyyUJlUw6_tsdPMBT9q3TNKkCvXNFn4vA7JTVvZvJ67BCedYA22E30lp1xgU
 UxK6j7Qm0dbKJLxul94FRRx.j7qkxrAYU1_7Tb2OoGCQ2hb_5iI7RCdMa1rrJn1USgYev4.2iiRR
 6_Q7PxkBh1Sqv6Nqfo.BQpFf8wJrSauNGV.qAtG3Q1sSpKTSr44Kz1YBQOq8UukD1c7JYM7GLaik
 baa.Kpyqa11vpdZBQvAFBELsFpX1NWYgUT86z1gkCSz.HE_dUuxUSgwTEMyO11F1GGhPGA0Hz.J5
 vMKOW6hNDU1VNxJK1aYS.pFpYKgGtbQRe1pvXdQrjCBYxh373G7GlvxmP1kU7P2M1QDGN_wocuty
 ksg933ACbn_.IkKPRyv.cqrfUYVMtbpYwS0.tNy.C8r6akBJxDkFEWyNEE19aRc7N_XZSy3K5qPc
 TDwvK.pW1KxMnjO68PSH0Btai34eF8UjRkVnIL6ipgiRgKaG.Oz_UcrRZ5.8WD29KL0k3s4x0kzF
 P9Ccyjazq4prjcv0_XzaUI4pW9JiICbJqbqKkyNXIQyhs.RvACn4CUiCTRrEIWkzfr_teukHwQAS
 YS_wyZbNeSiS35OjpxV6ZnGVFNf.rAURCIddwEImO_R4qpk9.
X-Sonic-MF: <htl10@users.sourceforge.net>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic303.consmr.mail.ir2.yahoo.com with HTTP; Tue, 20 Apr 2021 11:18:14 +0000
Date: Tue, 20 Apr 2021 11:18:09 +0000 (UTC)
From: Hin-Tak Leung <htl10@users.sourceforge.net>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <1177185277.6505734.1618917489204@mail.yahoo.com>
In-Reply-To: <87h7k152du.wl-kuninori.morimoto.gx@renesas.com>
References: <148484793.4894421.1618654607945.ref@mail.yahoo.com>
 <148484793.4894421.1618654607945@mail.yahoo.com>
 <877dkz5hz1.wl-kuninori.morimoto.gx@renesas.com>
 <1772063602.5910217.1618841824599@mail.yahoo.com>
 <87h7k152du.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: ASoc / PCM recording-related regression between v5.4 and v5.5
MIME-Version: 1.0
X-Mailer: WebService/1.1.18121 YMailNoble Mozilla/5.0 (Linux; Android 4.2.2;
 C6833) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.99
 Mobile Safari/537.36
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
Reply-To: Hin-Tak Leung <htl10@users.sourceforge.net>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

=20

    On Tuesday, 20 April 2021, 06:35:51 GMT+8, Kuninori Morimoto <kuninori.=
morimoto.gx@renesas.com> wrote:
> v5.3 has other big change on ALSA SoC for each driver.
> Out-of-tree might get this effect.

>=C2=A0 =C2=A0 =C2=A0ASoC: xxxx: use modern dai_link style

> For example,
> 05ab66178cb27ee795aa45b43818d2caa2d3953
> ("ASoC: mediatek: mt8173-rt5650-rt5676: use modern dai_link style")

I am bisecting down to 5 asoc related commits now, and currently building "=
ASoC: pcm_dmaengine: Extra snd_dmaengine_pcm_refine_runtime_hwpararms". The=
 breakage is between "...remove snd_soc_soc_rtdcom_del_all()" and "Merge br=
anch asoc-5.4 into asoc-5.5". It takes about an hour to do a clean build.
I think it is either that hwparams commit or the next one, "use different s=
equence..."?
I shall be able to tell you for sure in a few more hours / next day.
Any thoughts on those two?
Regards,Hin-Tak =20
