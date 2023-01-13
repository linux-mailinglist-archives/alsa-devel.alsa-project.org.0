Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7BC669809
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 14:07:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC67EA2F4;
	Fri, 13 Jan 2023 14:06:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC67EA2F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673615252;
	bh=zzaAvFgJKKJyCzCPjhKj8uE0TWttZxned2M1R+SQElo=;
	h=From:To:In-Reply-To:Subject:Date:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Pj0BV+ObjN2fMb/fPgKUO1+l9PJ00h8ih+9UF9a4Re/aPlk/DSaZSBo9Y/kqCd5pm
	 fMLhVUWgqZdCDDegxGvaji+7xjosziMDpDqUOaRU1NL9XRgM/qn523aeJd1pvHQTpG
	 qq1fUKlKurah78BQ047UyvRsvtbwsnFS4nG9buH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9727F803DC;
	Fri, 13 Jan 2023 14:06:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77D0AF8030F; Fri, 13 Jan 2023 14:06:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3450AF8026D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 14:06:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3450AF8026D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=ujsgd9+8
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20230113130623epoutp018c8a4f6919aec4c22663d6ca50ef573b~54CRpGqKB0392503925epoutp019
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 13:06:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20230113130623epoutp018c8a4f6919aec4c22663d6ca50ef573b~54CRpGqKB0392503925epoutp019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1673615183;
 bh=Cn5iP866Kdx0POhch28qzZ48mi8a+MHtfczfeBEvxWU=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=ujsgd9+813rgal1swekVCIWZl5TxfmESmuSzGVhMF49yY1eQW7XKg9mb8htpjPR3M
 1wCdOjzyBeGhRtrfiNTNVuS3ruQWI2tZh3C3UXGIljGbcqT/zkErBgpvC97LVDdtKy
 UDWD8BipgGyZolI7C7+T3vyV5RmJWJ6X8rwiNZSM=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20230113130623epcas5p3e2fa903b8650725e17dca9f7ebae053e~54CRPQ5962978829788epcas5p3Y;
 Fri, 13 Jan 2023 13:06:23 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.183]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4NthWK2X8wz4x9Pq; Fri, 13 Jan
 2023 13:06:21 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 FD.84.62806.D4751C36; Fri, 13 Jan 2023 22:06:21 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20230113121414epcas5p18b5ea92be2521e8ca5ee3b210a99dcca~53UvKAu700248902489epcas5p1i;
 Fri, 13 Jan 2023 12:14:14 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230113121414epsmtrp2f23b1a60d5d56cda2ce2417d845ac08a~53UvHb0I-1153811538epsmtrp20;
 Fri, 13 Jan 2023 12:14:14 +0000 (GMT)
X-AuditID: b6c32a4a-ea5fa7000000f556-85-63c1574d9805
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 41.F8.02211.51B41C36; Fri, 13 Jan 2023 21:14:13 +0900 (KST)
Received: from FDSFTE070 (unknown [107.116.189.86]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20230113121411epsmtip1e003e0f3cf413a0a49d4135b8a7cb350~53UshKwmN2352823528epsmtip1b;
 Fri, 13 Jan 2023 12:14:11 +0000 (GMT)
From: "Padmanabhan Rajanbabu" <p.rajanbabu@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
 <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <s.nawrocki@samsung.com>,
 <perex@perex.cz>, <tiwai@suse.com>, <pankaj.dubey@samsung.com>,
 <alim.akhtar@samsung.com>, <rcsekar@samsung.com>, <aswani.reddy@samsung.com>
In-Reply-To: <a0c06803-450c-eb44-8789-8a48c577389d@linaro.org>
Subject: RE: [PATCH v2 5/5] arm64: dts: fsd: Add sound card node for Tesla FSD
Date: Fri, 13 Jan 2023 17:44:09 +0530
Message-ID: <031d01d92748$8cdef1d0$a69cd570$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-in
Thread-Index: AQH5OglsonJNs2LrkABkwml8apZdSgIw2p9KAbd2VQACGX4hJwIEsvRIAd9DKvSuDO4ZMA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGJsWRmVeSWpSXmKPExsWy7bCmuq5v+MFkg38TBSwezNvGZnHl4iEm
 i0Obt7JbTH34hM1i/pFzrBZ9Lx4yW+x9DRT7dqWDyeLyrjlsFjPO72OyWLT1C7tF565+VotZ
 F3awWrTuPcJucfhNO6vFhu9rGR0EPDZ8bmLz2DnrLrvHplWdbB53ru1h89j3dhmbR9+WVYwe
 67dcZfH4vEkugCMq2yYjNTEltUghNS85PyUzL91WyTs43jne1MzAUNfQ0sJcSSEvMTfVVsnF
 J0DXLTMH6AUlhbLEnFKgUEBicbGSvp1NUX5pSapCRn5xia1SakFKToFJgV5xYm5xaV66Xl5q
 iZWhgYGRKVBhQnbG7KOrmAoWK1T8OzuTrYFxv1QXIyeHhICJxOU321m7GLk4hAR2M0rca/3J
 DuF8YpTounmYHaRKSOAbo8SfLwFdjBxgHctPWEPU7GWUmHvxOBtEzQug7s88IDabgLnEor1L
 GUGKRASuMEn8XN3OAuIwC7QxSuy9uJYRpIpTwE5iwo0rYLawQIDE7NbJzCA2i4CqxO7Hl8Fs
 XgFLiTd/tkDZghInZz5hAbGZBbQlli18zQzxg4LEz6fLWCHi4hJHf/aAxUUEwiS+/pgPdoWE
 wAcOiRczvjJCvOAi0XTIGKJXWOLV8S3sELaUxOd3e9kg7HyJaR+boewKibaPG5ggbHuJA1fm
 sICMYRbQlFi/Sx8iLCsx9dQ6JogT+CR6fz+BKueV2DEPxlaVWL98EyOELS2x7/pexgmMSrOQ
 fDYLyWezkHwzC2HbAkaWVYySqQXFuempxaYFRnmp5fD4Ts7P3cQITuBaXjsYHz74oHeIkYmD
 8RCjBAezkgjvnqP7k4V4UxIrq1KL8uOLSnNSiw8xmgKDeyKzlGhyPjCH5JXEG5pYGpiYmZmZ
 WBqbGSqJ86ZunZ8sJJCeWJKanZpakFoE08fEwSnVwLRJYLuIzqcFfMmuh/7eUm7memO5bdHj
 e+Fh1/8E/eV48Nrz2Cu5g/Ke3HJ7Vu8y9nsfvT7n0VPOVfJS1n6/nzSZvI+/tvlZWrrC5GVr
 ApuFBRcL181Zb+zDYbHAnesG64ZpJk8zd02+pDM58GR8LbNeD4v4peWTYlT+9dfccZGZdXeq
 1YYaBn5LZTHLsIPqPdoyPc/N17HuEuCbEqjDG8E7+8ZPBr9MLZfO08/jdopLPpnfvcmvtiGk
 UPabuUHcYUflEzEfhZ+LW5cGaF7lf/yneuH2MMm3zp0nMy6Wvw9VWXWM96+ax6EHFxL9u6Kf
 Xm95aSnCms+ubyrhWKZ8Yw5zt3i9enam5PSLCeL7lViKMxINtZiLihMBr534MmkEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRmVeSWpSXmKPExsWy7bCSnK6o98Fkg6VvLCwezNvGZnHl4iEm
 i0Obt7JbTH34hM1i/pFzrBZ9Lx4yW+x9DRT7dqWDyeLyrjlsFjPO72OyWLT1C7tF565+VotZ
 F3awWrTuPcJucfhNO6vFhu9rGR0EPDZ8bmLz2DnrLrvHplWdbB53ru1h89j3dhmbR9+WVYwe
 67dcZfH4vEkugCOKyyYlNSezLLVI3y6BK+PYG8OCl3IVUyc8YW9gbJXsYuTgkBAwkVh+wrqL
 kYtDSGA3o8T9mRvYuxg5geLSEtP797BB2MISK/89Z4coesYo8fXSDCaQBJuAucSivUsZQRIi
 Ao+YJObOf8QG4jALdDFKHP+7khmi5TKTxNLTx8FaOAXsJCbcuMIIYgsL+Ems7u0Fi7MIqErs
 fnyZGcTmFbCUePNnC5QtKHFy5hMWEJtZQFui92ErI4y9bOFrZoj7FCR+Pl3GChEXlzj6swcs
 LiIQJvH1x3zGCYzCs5CMmoVk1Cwko2YhaV/AyLKKUTK1oDg3PbfYsMAwL7Vcrzgxt7g0L10v
 OT93EyM4krU0dzBuX/VB7xAjEwfjIUYJDmYlEd49R/cnC/GmJFZWpRblxxeV5qQWH2KU5mBR
 Eue90HUyXkggPbEkNTs1tSC1CCbLxMEp1cC0mH0965bGButz0/+lvP5q5vrOYeUM80m/9L9q
 5Dlzc63zZ31UorerTSAqQtvO7gXTt8bvi351Oc3j5Hjiuf7yMW7Z3+kZ1z4LCgbPspgq4ld5
 atJ5t9mTv5+PnTelds46TkGuGSYJlv0Kj/V05coOBVstSE1dGrLp3B/m9py83Qfbt3bLSERu
 qqrg3Bf65sLTu1eWi8x52j57w+rdlc8yLFZ+/1Suw8S+fPnThGVnD3zseCxyR2dHZGl8qBuj
 iP0XTyXjeSaqMSmt5lo3ugxOMd/elrrSkU2W7WagW/GJhUI/N2oyTOv2O9e3135BUM3nvu+T
 r4cZ/pV5oD4jOSionMmIkymzj7NV9NAeb0clluKMREMt5qLiRACpYaT2UwMAAA==
X-CMS-MailID: 20230113121414epcas5p18b5ea92be2521e8ca5ee3b210a99dcca
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230103045706epcas5p14f2f951d162899234c7f5f7a0998ab6b
References: <20230103045613.100309-1-p.rajanbabu@samsung.com>
 <CGME20230103045706epcas5p14f2f951d162899234c7f5f7a0998ab6b@epcas5p1.samsung.com>
 <20230103045613.100309-6-p.rajanbabu@samsung.com>
 <2c6950c9-3489-c2d4-2ca8-cb723195f75b@linaro.org>
 <051601d923df$a0e7b840$e2b728c0$@samsung.com>
 <a0c06803-450c-eb44-8789-8a48c577389d@linaro.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



> -----Original Message-----
> From: Krzysztof Kozlowski =5Bmailto:krzysztof.kozlowski=40linaro.org=5D
> Sent: 09 January 2023 01:58 PM
> To: Padmanabhan Rajanbabu <p.rajanbabu=40samsung.com>;
> lgirdwood=40gmail.com; broonie=40kernel.org; robh+dt=40kernel.org;
> krzysztof.kozlowski+dt=40linaro.org; s.nawrocki=40samsung.com;
> perex=40perex.cz; tiwai=40suse.com; pankaj.dubey=40samsung.com;
> alim.akhtar=40samsung.com; rcsekar=40samsung.com;
> aswani.reddy=40samsung.com
> Cc: alsa-devel=40alsa-project.org; devicetree=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; linux-samsung-soc=40vger.kernel.org
> Subject: Re: =5BPATCH v2 5/5=5D arm64: dts: fsd: Add sound card node for =
Tesla
> FSD
>=20
> On 09/01/2023 05:05, Padmanabhan Rajanbabu wrote:
> >
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski =5Bmailto:krzysztof.kozlowski=40linaro.org=
=5D
> >> Sent: 03 January 2023 04:43 PM
> >> To: Padmanabhan Rajanbabu <p.rajanbabu=40samsung.com>;
> >> lgirdwood=40gmail.com; broonie=40kernel.org; robh+dt=40kernel.org;
> >> krzysztof.kozlowski+dt=40linaro.org; s.nawrocki=40samsung.com;
> >> perex=40perex.cz; tiwai=40suse.com; pankaj.dubey=40samsung.com;
> >> alim.akhtar=40samsung.com; rcsekar=40samsung.com;
> >> aswani.reddy=40samsung.com
> >> Cc: alsa-devel=40alsa-project.org; devicetree=40vger.kernel.org; linux=
-
> >> kernel=40vger.kernel.org; linux-samsung-soc=40vger.kernel.org
> >> Subject: Re: =5BPATCH v2 5/5=5D arm64: dts: fsd: Add sound card node f=
or
> >> Tesla FSD
> >>
> >> On 03/01/2023 05:56, Padmanabhan Rajanbabu wrote:
> >>> Add device tree node support for sound card on Tesla FSD board
> >>>
> >>> Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu=40samsung.com>
> >>> ---
> >>>  arch/arm64/boot/dts/tesla/fsd-evb.dts =7C 37
> >>> +++++++++++++++++++++++++++
> >>>  1 file changed, 37 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts
> >>> b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> >>> index e2fd49774f15..ce726bddfb50 100644
> >>> --- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
> >>> +++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> >>> =40=40 -29,6 +29,43 =40=40
> >>>  		device_type =3D =22memory=22;
> >>>  		reg =3D <0x0 0x80000000 0x2 0x00000000>;
> >>>  	=7D;
> >>> +
> >>> +	sound =7B
> >>> +		compatible =3D =22simple-audio-card=22;
> >>> +
> >>> +		=23address-cells =3D <1>;
> >>> +		=23size-cells =3D <0>;
> >>> +
> >>> +		simple-audio-card,name =3D =22FSD Audio Card=22;
> >>> +		simple-audio-card,widgets =3D
> >>> +			=22Line=22, =22Line Out=22,
> >>
> >> I don't think you need to break the line after '=3D'.
> >
> > Okay, will change the same in the next patch set.
> >
> >>
> >>> +			=22Line=22, =22Line In=22;
> >>> +		simple-audio-card,routing =3D
> >>> +			=22Line Out=22, =22LLOUT=22,
> >>> +			=22Line Out=22, =22RLOUT=22,
> >>> +			=22MIC2L=22, =22Line In=22,
> >>> +			=22MIC2R=22, =22Line In=22;
> >>> +
> >>> +		status =3D =22okay=22;
> >>
> >> Why?
> >
> > Okay, I understood that if there is no status entry, it is treated as
> > =22okay=22. I'll update the same in the next patch set.
> >
> >>
> >>> +
> >>> +		simple-audio-card,dai-link=400 =7B
> >>> +			reg =3D <0>;
> >>> +			format =3D =22i2s=22;
> >>> +			bitclock-master =3D <&tlv320aic3x>;
> >>> +			frame-master =3D <&tlv320aic3x>;
> >>> +
> >>> +			cpu0 =7B
> >>
> >> Does not look like you tested the DTS against bindings. Please run
> >> =60make dtbs_check=60 (see
> >> Documentation/devicetree/bindings/writing-schema.rst
> >> for instructions).
> >
> > I did not encounter any error while running dtbs_check for fsd-evb.dts
> >
> > This is the command I executed
> > make dtbs_check > output.txt 2>&1
> >
> > dt-mk-schema --version: 2022.11
> >
> > Please let me know if I'm missing anything here.
>=20
> You are right. I misread the pattern in simple-card.yaml. I'll fix the fi=
le, so let's
> make these nodes: cpu-0 and cpu-1.

Okay, Thank you for confirming, I'll change the node names to cpu-0 and cpu=
-1

>=20
> Best regards,
> Krzysztof

