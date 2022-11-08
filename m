Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DE7620987
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 07:21:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C3AB15E5;
	Tue,  8 Nov 2022 07:20:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C3AB15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667888472;
	bh=0oB696VKt1YtePMrzKqJHOFfGNu7etBSlj/ZfAisHe8=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dyNfaNy1epcn0r9Rj0MsfiRj2cug5L8vi9LE+zCS+VX7Rvf0zYw0SBcs6ri6+UotW
	 xRJ01p6lBDOdg5zZfLEJqHliZiaW51/Xfcw8N1Crt6dl6nAjemQ7ZI/V8k6TwGH2ts
	 M3u09jtzyzDEh6uJ4gFaY5mAphGCKH4+KNPi8Mwg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE8FEF8020D;
	Tue,  8 Nov 2022 07:19:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF30DF80566; Tue,  8 Nov 2022 07:19:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A81EAF8020D
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 07:19:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A81EAF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="fLlBrQ7A"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20221108061923epoutp0142561c3f53104336e1d75a414a48f3bf~lh6FM7HFL2065220652epoutp01S
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 06:19:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20221108061923epoutp0142561c3f53104336e1d75a414a48f3bf~lh6FM7HFL2065220652epoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1667888363;
 bh=wQw59ZJkL430DS0zBeDtb6FDh4OKqj/913SOIKgtwlc=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=fLlBrQ7AZy34UBcgBKk5Pmkm2lXULBq5XwgekSdOiPgIUycdGu4NBWamLFtSkdYpM
 PmDeuoYOz3SFSuqu3lQZIpraHFnNE3eTJq/GgaP4+1XHaDXY57mOZlsTYJtfZ2EPA5
 odaIAzVY8/LPLnalCORXdYctGyd6M5BGEUlEuRiQ=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20221108061923epcas5p30527e1d0ad96e5e4305277baae99afc6~lh6EiGMiu0649206492epcas5p3a;
 Tue,  8 Nov 2022 06:19:23 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.182]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4N5yc56L6xz4x9QP; Tue,  8 Nov
 2022 06:19:17 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 92.FE.56352.5E4F9636; Tue,  8 Nov 2022 15:19:17 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20221108052516epcas5p3a1006bd334b83bcc46b5a38474657b42~lhK1RMTPt1066810668epcas5p3L;
 Tue,  8 Nov 2022 05:25:16 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221108052516epsmtrp1b8a29f53d550aa23998ccaaa7da5178f~lhK1Pdkxu2223122231epsmtrp1f;
 Tue,  8 Nov 2022 05:25:16 +0000 (GMT)
X-AuditID: b6c32a4b-383ff7000001dc20-37-6369f4e5d0d5
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 5D.AF.18644.C38E9636; Tue,  8 Nov 2022 14:25:16 +0900 (KST)
Received: from FDSFTE070 (unknown [107.116.189.86]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20221108052514epsmtip2a08ff035d5970dbd9ba69361439c44f4~lhKy8BqHs2168921689epsmtip2N;
 Tue,  8 Nov 2022 05:25:14 +0000 (GMT)
From: "Padmanabhan Rajanbabu" <p.rajanbabu@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>, "'Alim
 Akhtar'" <alim.akhtar@samsung.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <s.nawrocki@samsung.com>,
 <perex@perex.cz>, <tiwai@suse.com>, <pankaj.dubey@samsung.com>,
 <rcsekar@samsung.com>, <aswani.reddy@samsung.com>
In-Reply-To: <89340edb-2451-e648-e2e6-94c8f2410084@linaro.org>
Subject: RE: [PATCH 6/6] arm64: dts: fsd: Add sound card node for Tesla FSD
Date: Tue, 8 Nov 2022 10:55:13 +0530
Message-ID: <01bf01d8f332$7c15fdc0$7441f940$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKFI9qd/qMOsyXBjKz4d8Q6MS4QvwItme6KAWz5sEgBhUP0cQGPN5hmASAqNi2snaMRcA==
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJJsWRmVeSWpSXmKPExsWy7bCmhu7TL5nJBk8mG1o8mLeNzeLKxUNM
 Foc2b2W3mPrwCZvF/CPnWC36Xjxkttj7Gij27UoHk8XlXXPYLGac38dksWjrF3aLzl39rBaz
 LuxgtWjde4Td4vCbdlaLDd/XMjoIeGz43MTmsXPWXXaPTas62TzuXNvD5rHv7TI2j74tqxg9
 1m+5yuLxeZNcAEdUtk1GamJKapFCal5yfkpmXrqtkndwvHO8qZmBoa6hpYW5kkJeYm6qrZKL
 T4CuW2YO0AtKCmWJOaVAoYDE4mIlfTubovzSklSFjPziElul1IKUnAKTAr3ixNzi0rx0vbzU
 EitDAwMjU6DChOyMvucbGAs2qVdsmfmZpYFxqkIXIyeHhICJxPxL3SxdjFwcQgK7GSUaFj6E
 cj4xSuzpm8AI4XxmlHjf3skG03L44C52iMQuRonds5YwQzgvGCV2XbzGBFLFJmAusWjvUrB2
 EYFnTBLt65+AVTELtDFK7L24lhGkilPATqLxwXtmEFtYwFuiaelDoDgHB4uAisT5TRkgYV4B
 S4m2aVvYIGxBiZMzn7CA2MwC8hLb385hhjhJQeLn02WsILaIQJjEnfZOJogacYmjP3vA9koI
 fOCQ6Lq0kxGiwUXi687trBC2sMSr41vYIWwpiZf9bVB2vsS0j81QP1dItH3cwARh20scuDKH
 BeROZgFNifW79CHCshJTT62D2ssn0fv7CVQ5r8SOeTC2qsT65ZugTpCW2Hd9L+MERqVZSF6b
 heS1WUhemIWwbQEjyypGydSC4tz01GLTAuO81HJ4lCfn525iBKdxLe8djI8efNA7xMjEwXiI
 UYKDWUmEV6QmM1mINyWxsiq1KD++qDQntfgQoykwuCcyS4km5wMzSV5JvKGJpYGJmZmZiaWx
 maGSOO/iGVrJQgLpiSWp2ampBalFMH1MHJxSDUwJJqbJF/xOVjltmqHmqnTykN2vbN51wvWx
 ZVnnrBwjCxYuf/n65PlV1mZbVgmW+b8K2OGltUQ9+b3aRL59GQbzpCQyb938oSJn+8wlRkAk
 6vhEx3PLYmZ9LpTVUN3XsGLBzPmTGla/MLuyp2et0VpGtQh5VV3zuTf7z8c3ct/4FXnvTr5X
 3/lpM41P3/jw/EfGV64zB3qfsiwWbJzV96Pl/P8oxSD/GaLyD51+mFjXZ0xaLP3m5qSTimfY
 2DmFd++b7Gaw08u4+hSDhmhUzJYTnAs7GZ+tnKGgfnplj0k5+xKtLzfrjkxxk4mxj9l08dOC
 19MCGcIPBu01fHYxtHy34vnm+XVLNRZv4mc+XVesxFKckWioxVxUnAgAENuweGwEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRmVeSWpSXmKPExsWy7bCSvK7Ni8xkg60b9CwezNvGZnHl4iEm
 i0Obt7JbTH34hM1i/pFzrBZ9Lx4yW+x9DRT7dqWDyeLyrjlsFjPO72OyWLT1C7tF565+VotZ
 F3awWrTuPcJucfhNO6vFhu9rGR0EPDZ8bmLz2DnrLrvHplWdbB53ru1h89j3dhmbR9+WVYwe
 67dcZfH4vEkugCOKyyYlNSezLLVI3y6BK6Pv+QbGgk3qFVtmfmZpYJyq0MXIySEhYCJx+OAu
 9i5GLg4hgR2MEpvOrmeGSEhLTO/fwwZhC0us/PccqugZo8Tnr3tZQBJsAuYSi/YuZQRJiAh8
 YpJ4/xaiilmgi1Hi+N+VYKOEBM4zSTQflwKxOQXsJBofvAeLCwt4SzQtfQjUzcHBIqAicX5T
 BkiYV8BSom3aFjYIW1Di5MwnYMuYBbQleh+2MkLY8hLb386BulRB4ufTZawgtohAmMSd9k4m
 iBpxiaM/e5gnMArPQjJqFpJRs5CMmoWkZQEjyypGydSC4tz03GLDAqO81HK94sTc4tK8dL3k
 /NxNjOBI1tLawbhn1Qe9Q4xMHIyHGCU4mJVEeEVqMpOFeFMSK6tSi/Lji0pzUosPMUpzsCiJ
 817oOhkvJJCeWJKanZpakFoEk2Xi4JRqYOKsnflwg+TL7wtrbjXcmHrhnua1HSsYWArV5/tI
 7OO3n7r8p2ZcnrzH382JSjxZlV4JB+7GtzzzL7XkemmgfVhzzc9t075GrEqa+jrylWx2SVJU
 5lvjTUVPJqWXTO3bpyWrF/BdOnrPtJfB7Xr5/jMV9m851jGj3v9cu/OEtmOBGmWSk19Z6ezY
 czI5quO21UF91/KLl87MetSblWVbfDnQXH2Wr7CNo8Ovy88XCnleO7pip4rsvENC1dLbP+cE
 egbNUll7aMJW7ovVZn+lmVckly3Yf/pwYrTF1VXr9jFX3QtREfrTqzdpj0L4rDNnNlmpzDts
 9uROcOWuiEU1ycevPAnxFTS6xvGs/F3w0u1KLMUZiYZazEXFiQCp4MI2UwMAAA==
X-CMS-MailID: 20221108052516epcas5p3a1006bd334b83bcc46b5a38474657b42
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20221014104915epcas5p12414b87ea127b2d5bf521556bf841b00
References: <20221014102151.108539-1-p.rajanbabu@samsung.com>
 <CGME20221014104915epcas5p12414b87ea127b2d5bf521556bf841b00@epcas5p1.samsung.com>
 <20221014102151.108539-7-p.rajanbabu@samsung.com>
 <00c301d8dfd0$f55ca230$e015e690$@samsung.com>
 <04aa01d8e524$d253f2d0$76fbd870$@samsung.com>
 <89340edb-2451-e648-e2e6-94c8f2410084@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
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



> -----Original Message-----
> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@linaro.org]
> Sent: 21 October 2022 06:24 PM
> To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>; 'Alim Akhtar'
> <alim.akhtar@samsung.com>; lgirdwood@gmail.com; broonie@kernel.org;
> robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> s.nawrocki@samsung.com; perex@perex.cz; tiwai@suse.com;
> pankaj.dubey@samsung.com; rcsekar@samsung.com;
> aswani.reddy@samsung.com
> Cc: alsa-devel@alsa-project.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-samsung-soc@vger.kernel.org
> Subject: Re: [PATCH 6/6] arm64: dts: fsd: Add sound card node for Tesla FSD
> 
> On 21/10/2022 04:12, Padmanabhan Rajanbabu wrote:
> >
> >
> >> -----Original Message-----
> >> From: Alim Akhtar [mailto:alim.akhtar@samsung.com]
> >> Sent: 14 October 2022 06:59 PM
> >> To: 'Padmanabhan Rajanbabu' <p.rajanbabu@samsung.com>;
> >> lgirdwood@gmail.com; broonie@kernel.org; robh+dt@kernel.org;
> >> krzysztof.kozlowski+dt@linaro.org; s.nawrocki@samsung.com;
> >> perex@perex.cz; tiwai@suse.com; pankaj.dubey@samsung.com;
> >> rcsekar@samsung.com; aswani.reddy@samsung.com
> >> Cc: alsa-devel@alsa-project.org; devicetree@vger.kernel.org; linux-
> >> kernel@vger.kernel.org; linux-samsung-soc@vger.kernel.org
> >> Subject: RE: [PATCH 6/6] arm64: dts: fsd: Add sound card node for
> >> Tesla FSD
> >>
> >>
> >>
> >>> -----Original Message-----
> >>> From: Padmanabhan Rajanbabu [mailto:p.rajanbabu@samsung.com]
> >>> Sent: Friday, October 14, 2022 3:52 PM
> >>> To: lgirdwood@gmail.com; broonie@kernel.org; robh+dt@kernel.org;
> >>> krzysztof.kozlowski+dt@linaro.org; s.nawrocki@samsung.com;
> >>> perex@perex.cz; tiwai@suse.com; pankaj.dubey@samsung.com;
> >>> alim.akhtar@samsung.com; rcsekar@samsung.com;
> >> aswani.reddy@samsung.com
> >>> Cc: alsa-devel@alsa-project.org; devicetree@vger.kernel.org; linux-
> >>> kernel@vger.kernel.org; linux-samsung-soc@vger.kernel.org;
> >> Padmanabhan
> >>> Rajanbabu <p.rajanbabu@samsung.com>
> >>> Subject: [PATCH 6/6] arm64: dts: fsd: Add sound card node for Tesla
> >>> FSD
> >>>
> >>> Add device tree node support for sound card on Tesla FSD board
> >>>
> >>> Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
> >>> ---
> >>> arch/arm64/boot/dts/tesla/fsd-evb.dts | 49
> >>> +++++++++++++++++++++++++++
> >>> arch/arm64/boot/dts/tesla/fsd.dtsi    |  3 ++
> >>> 2 files changed, 52 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts
> >>> b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> >>> index c0a4509499ab..ecaa3c2e3045 100644
> >>> --- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
> >>> +++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> >>> @@ -49,3 +49,52 @@
> >>> &tdm_1 {
> >>> 	status = "okay";
> >>> };
> >>> +
> >>> +&sound {
> >>> +	compatible = "tesla,fsd-sndcard";
> >>> +	status = "okay";
> >>> +	model = "fsd-i2s";
> >>> +	widgets =
> >>> +		"Speaker", "MAIN SPK",
> >>> +		"Microphone", "MAIN MIC";
> >>> +
> >>> +	primary-dai-link-0 {
> >>> +		link-name = "fsd-primary-0";
> >>> +		dai-format = "i2s";
> >>> +		tesla,bitclock-master = <&tdm_0>;
> >>> +		tesla,frame-master = <&tdm_0>;
> >>> +		cpu {
> >>> +			sound-dai = <&tdm_0 0>;
> >>> +		};
> >>> +	};
> >>> +
> >>> +	secondary-dai-link-0 {
> >>> +		link-name = "fsd-secondary-0";
> >>> +		dai-format = "i2s";
> >>> +		tesla,bitclock-master = <&tdm_0>;
> >>> +		tesla,frame-master = <&tdm_0>;
> >>> +		cpu {
> >>> +			sound-dai = <&tdm_0 1>;
> >>> +		};
> >>> +	};
> >>> +
> >>> +	primary-dai-link-1 {
> >>> +		link-name = "fsd-primary-1";
> >>> +		dai-format = "i2s";
> >>> +		tesla,bitclock-master = <&tdm_1>;
> >>> +		tesla,frame-master = <&tdm_1>;
> >>> +		cpu {
> >>> +			sound-dai = <&tdm_1 0>;
> >>> +		};
> >>> +	};
> >>> +
> >>> +	secondary-dai-link-1 {
> >>> +		link-name = "fsd-secondary-1";
> >>> +		dai-format = "i2s";
> >>> +		tesla,bitclock-master = <&tdm_1>;
> >>> +		tesla,frame-master = <&tdm_1>;
> >>> +		cpu {
> >>> +			sound-dai = <&tdm_1 1>;
> >>> +		};
> >>> +	};
> >>> +};
> >>> diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi
> >>> b/arch/arm64/boot/dts/tesla/fsd.dtsi
> >>> index 5decad45a1b6..fc8931f830a7 100644
> >>> --- a/arch/arm64/boot/dts/tesla/fsd.dtsi
> >>> +++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
> >>> @@ -847,6 +847,9 @@
> >>> 			status = "disabled";
> >>> 		};
> >>>
> >>> +		sound: sound {
> >>> +		};
> >>> +
> >> Why to have an empty node in dtsi?
> > This is required as every node we use in dts should have the same
> > declared in
> 
> I see no reason why this is required.
> 
> > dtsi. Sound nodes in most of the platform is only declared (dummy
> > node) in dtsi and defining only in dts. Thus we are following the same.
> 
> Can you point me to Samsung platform doing this?
> 
> Keep the code consistent with Exynos style.

Okay, will add the sound node in accordance with Exynos style

> 
> Best regards,
> Krzysztof


