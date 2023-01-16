Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B87F466D818
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 09:24:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D02696464;
	Tue, 17 Jan 2023 09:23:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D02696464
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673943851;
	bh=4zRDNfct97RtYyfe+EaxdLW4DHiRuJEahXyPi1OYKZk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=a1tWLEWDnYnEL+n6TdUCY7WT74hpIsE0xqpDUMYwV9xTPh/vtUjFaPGcAtK3zcPF0
	 gNqGNmpsX10MSKjPBCDzlcbLJgfiiPjEGRiFb7lpT8L0BBSUa+8buF3L1uPewsKlD3
	 YFV8P+DBTbJ4gxZqfqwp1uQ+P29XzXhHnzOBVxeE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1467F8055B;
	Tue, 17 Jan 2023 09:22:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9143F80563; Tue, 17 Jan 2023 09:22:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E9B7F8055B
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 09:22:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E9B7F8055B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=dI/4X0gN
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20230117082224epoutp045a7bbb9e0711f99933fff3b1c663f79e~7CveBp9GK0655706557epoutp04e
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 08:22:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20230117082224epoutp045a7bbb9e0711f99933fff3b1c663f79e~7CveBp9GK0655706557epoutp04e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1673943744;
 bh=vhmZncf5080rWwGNjHNDrtkXaS1sv2q9iERbNtRikh8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dI/4X0gN3yNpr2flR4Mbdh2ELfyhtiec+06phEJSHitgjjf/1L3y5jj4X46Ow1Ltt
 lKhnD5qwHlV02x9s6NM9IRdqezOJaEc/JJI38SqbSveGPnRDPr9oF1w5nSF/0uaQ+M
 e+CYO5KBJDaT3Rjff6ZfSCLsoCT024Q8UN+0deB8=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20230117082223epcas5p30d96a87717f66f31413d89d8b19ab37c~7CvdMHV5f2311823118epcas5p3o;
 Tue, 17 Jan 2023 08:22:23 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.178]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4Nx21p1Pgdz4x9QG; Tue, 17 Jan
 2023 08:22:22 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 D7.99.02301.EBA56C36; Tue, 17 Jan 2023 17:22:22 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20230116103912epcas5p2ae807f1b6435e103a6527332e42f03a2~6w9oRywb_2875628756epcas5p2P;
 Mon, 16 Jan 2023 10:39:12 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230116103912epsmtrp26ed9e08d942b406dd67e5923ca62dc16~6w9oQ4NPR0521705217epsmtrp2U;
 Mon, 16 Jan 2023 10:39:12 +0000 (GMT)
X-AuditID: b6c32a49-201ff700000108fd-3c-63c65abe3009
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 77.FC.02211.05925C36; Mon, 16 Jan 2023 19:39:12 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
 [107.109.115.53]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230116103910epsmtip17ec3fe4fe8dc616cea44286cea985488~6w9lrLA720241202412epsmtip1f;
 Mon, 16 Jan 2023 10:39:09 +0000 (GMT)
From: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, s.nawrocki@samsung.com, perex@perex.cz,
 tiwai@suse.com, pankaj.dubey@samsung.com, alim.akhtar@samsung.com,
 rcsekar@samsung.com, aswani.reddy@samsung.com
Subject: [PATCH v4 5/5] arm64: dts: fsd: Add sound card node for Tesla FSD
Date: Mon, 16 Jan 2023 16:08:23 +0530
Message-Id: <20230116103823.90757-6-p.rajanbabu@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230116103823.90757-1-p.rajanbabu@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSfUwTZxzHee7au4NYcyvMPXSo5BIk4MAWaXeMVpfM6LkR18S5RP9Yd2lv
 wPq6XiuObAzLyxAzh++ADUUwqDDGyyhgoUiKo3GLDiMyM0eERQ1jsvEmRMzGWg62/z6/3/P9
 5vs8v+dHoNILmIzItTg4u4U1UViUqHMgKTGl79CgXj7dg9NjNZ0YPXwngNCB77w4fXb8EUZ7
 btwW0ycmxlF6YbgMoe/63Bhd+VMfQn/ftp+u887j9DHf12K6eqhbTJf4b+D0wNMvxXTrYjN4
 k2Ra51wYc616FGfaG49hzK8jvRjTN9WAMSc6GgHT0nFPxMy1b9ISh4zqHI41cPZ4zqK3GnIt
 2Rrqnf26t3RKlVyRosigX6fiLayZ01C7srQpu3NNoRdQ8YdZkzPU0rI8T23bobZbnQ4uPsfK
 OzQUZzOYbOm2VJ41805LdqqFc7yhkMvTlCHhh8ac64X9wHYz6khg2osXgtNEOYgkIJkOB3+Z
 EpWDKEJK9gBY7LoChGIWwN6KWrFQLADYHLyDrVm6vPPiMEtJP4D+SqMgKkFgx2w9Hj7ASCVs
 dB9dcceQLgSWPj25EoKSbQD+ODiOhFXR5NuwrmICDbOITIDn20ZDTBASUg2bgmlC2mbY1Nq/
 IokkNfCZ/z4q9C8SsLtwvcC7YG3DOVzgaDgZ7FhlGZz70796ays8N1O0ykdg6UwrIvBO2D/s
 FoVjUTIJtvi2Ce2N8OwP365IUHI9/OrFo1W5BHbXrHECbLncDgR+Ffb97F9lBjbPj+LCUCoA
 rLtUhleATdX/R9QC0AhiORtvzuZ4pU1h4fL++zW91dwOVrY0eW83GB2bTg0AhAABAAmUipHs
 8w3opRID+2k+Z7fq7E4TxweAMjS+k6jsZb01tOYWh06RniFPV6lU6RnbVQrqFQnn9eilZDbr
 4IwcZ+Psaz6EiJQVIurzsCDWeW9pqklbcjDpE+XuHRvqSyt7v/lcr8geOYP3FBaNGbY4cqIl
 G36/XXnc/rzKp7FqErd6TO8PfbbHtVTvfm/5qOzjmdGHics7NZUvaYOdr00aYmX3C4xXL6gf
 e+KCtUU9flyRiTxocMn1xZFdZeu4yT3Bdc0pqVOZ717+qMp7+PHFW8+PKxOe/ZFvU97UuUY8
 tU/+Ur2g45yL6HJGl/lhzObl4u0RwWBNw9/Fv7UP9e07xVyPX+qi3dqtDyKu5lXtjcpDImo+
 ME9OZPm/mK0iqm/dnVH+E8woyHJ6xw6YrzWM85kLgH/Ss4VITkxzsu7u8rgDGz2nVGcW8w9S
 Ij6HVSSjdp79Fz0x2aguBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrELMWRmVeSWpSXmKPExsWy7bCSnG6A5tFkg45tuhYP5m1js7hy8RCT
 xaHNW9ktpj58wmYx/8g5Vou+Fw+ZLb5d6WCyuLxrDpvFjPP7mCyObgy2WLT1C7tF565+VotZ
 F3awWrTuPcJucfhNO6vFhu9rGR0EPDZ8bmLz2DnrLrvHplWdbB53ru1h89j3dhmbR9+WVYwe
 67dcZfH4vEkugCOKyyYlNSezLLVI3y6BK2N/wwHGgpNcFYc+bGVvYJzM0cXIySEhYCKxfesX
 1i5GLg4hgd2MEscnrGaCSEhLTO/fwwZhC0us/PecHaKomUni47ytzCAJNgFTiVVzGsG6RQQm
 MEmcfHeMBSTBLLCVUWLqZyMQW1jAS2LRhBdgDSwCqhLTN94Fsjk4eAVsJFYfN4JYIC+xesMB
 sBJOAVuJr3tvgNlCQCVPJpxnnMDIt4CRYRWjZGpBcW56brFhgWFearlecWJucWleul5yfu4m
 RnCwa2nuYNy+6oPeIUYmDsZDjBIczEoivH67DicL8aYkVlalFuXHF5XmpBYfYpTmYFES573Q
 dTJeSCA9sSQ1OzW1ILUIJsvEwSnVwHS4+cxlubTfvnFclzNfeDTsevLr2p70FcHVmw9xOO54
 WJj/qn+O5GnO629Kjji6/7xs+a/eaM/KWluVKoWgjWLxq26afn23otBn2xSjV9z3T7zi7thz
 9oxl8eH3nuYftRcbrnuQe+RR2pF7tlc/njR2Y0g3YmtfbH8/kbGRd1+wTpy86gKx2ZZZHa//
 HXUR72h1L8pc4tW2eS+32DYJPY9JtkKWqRvVa3TPqkwTZGbl/Xzxb27Dms/r2OSjGP9yxYl+
 3vrdsfDROp/L205NNix8xGGXer9C77wg08nwmPisv6+XdWQ8Xn/7QL3Tt1PpkRtVWI4a/vs/
 16nL8OZKtitRScf/Z/MuvSKl9b79SqoSS3FGoqEWc1FxIgBRqa9q5QIAAA==
X-CMS-MailID: 20230116103912epcas5p2ae807f1b6435e103a6527332e42f03a2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230116103912epcas5p2ae807f1b6435e103a6527332e42f03a2
References: <20230116103823.90757-1-p.rajanbabu@samsung.com>
 <CGME20230116103912epcas5p2ae807f1b6435e103a6527332e42f03a2@epcas5p2.samsung.com>
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
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add device tree node support for sound card on Tesla FSD platform

Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
---
 arch/arm64/boot/dts/tesla/fsd-evb.dts | 33 +++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
index 2cd721564a4f..8d7794642900 100644
--- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
+++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
@@ -29,6 +29,39 @@
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x2 0x00000000>;
 	};
+
+	sound {
+		compatible = "simple-audio-card";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		simple-audio-card,name = "FSD Audio Card";
+		simple-audio-card,widgets = "Line", "Line Out",
+					    "Line", "Line In";
+		simple-audio-card,routing = "Line Out", "LLOUT",
+					    "Line Out", "RLOUT",
+					    "MIC2L", "Line In",
+					    "MIC2R", "Line In";
+
+		simple-audio-card,dai-link@0 {
+			reg = <0>;
+			format = "i2s";
+			bitclock-master = <&tlv320aic3x>;
+			frame-master = <&tlv320aic3x>;
+
+			cpu-0 {
+				sound-dai = <&i2s_0 0>;
+			};
+			cpu-1 {
+				sound-dai = <&i2s_0 1>;
+			};
+			codec {
+				sound-dai = <&tlv320aic3x>;
+				system-clock-frequency = <33000000>;
+			};
+		};
+	};
 };
 
 &fin_pll {
-- 
2.17.1

