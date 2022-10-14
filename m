Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B9B5FFDF4
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Oct 2022 09:34:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2F366E0A;
	Sun, 16 Oct 2022 09:33:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2F366E0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665905652;
	bh=lZ8TVJQgXBejKqenPQhoxeb0GBpQ1MS4oW7Z//ejw4k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LypAsdNNHgl9kCYL3eMHtcA4YG0TdrSSmvC1oj9uKHRtrUIYMtbtO36gr9zvFU6G5
	 fJxFmegQk2hjzdu8fcOE4ktub1yPHvsmUh2blFjqIpHDvdLsnBZTcavf0Nbv9GLU5K
	 gM1cFCJ90cAhyJlX1zvz8btMFAWYR+FR5l2cmtk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DF56F805BF;
	Sun, 16 Oct 2022 09:28:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 255ABF80224; Fri, 14 Oct 2022 13:10:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CC3AF802E3
 for <alsa-devel@alsa-project.org>; Fri, 14 Oct 2022 13:10:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CC3AF802E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="MziZwkX1"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20221014111036epoutp01fbdb694e6e497dc80f659370284baaee~d6wNNBbvG2407624076epoutp01W
 for <alsa-devel@alsa-project.org>; Fri, 14 Oct 2022 11:10:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20221014111036epoutp01fbdb694e6e497dc80f659370284baaee~d6wNNBbvG2407624076epoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1665745836;
 bh=9SsgF3hWBhdrZJfljS7+eBsGPvly+gPDoy3K5tTIdBg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MziZwkX127b95mJ65tK57IEgMd6yRO/4O7vIf6qiGp0UkJQNE5yTHcM+DWe/S2gGC
 eGyzElqVDK9bCamL7KJ+u32TJYITSx2UO70XGZRktALjUdIX61EMJwBINyUKOpEUhs
 nF/FF3LPa7hJRRGPfkvwElApyezT9VBa7b6+38ig=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20221014111036epcas5p34c04fce5100e24c348de56cf4482979a~d6wMq8x480410004100epcas5p38;
 Fri, 14 Oct 2022 11:10:36 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.174]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4MpkFj3t7Hz4x9Pt; Fri, 14 Oct
 2022 11:10:33 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 80.31.26992.9A349436; Fri, 14 Oct 2022 20:10:33 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20221014104915epcas5p12414b87ea127b2d5bf521556bf841b00~d6dj9NWX52011520115epcas5p1k;
 Fri, 14 Oct 2022 10:49:15 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20221014104915epsmtrp2f5c4039270bdfe8644ff8738d6f79eac~d6dj8SSSL0248602486epsmtrp2M;
 Fri, 14 Oct 2022 10:49:15 +0000 (GMT)
X-AuditID: b6c32a49-0c7ff70000016970-3a-634943a9ba47
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 6D.56.14392.BAE39436; Fri, 14 Oct 2022 19:49:15 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
 [107.109.115.53]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20221014104913epsmtip10879994e360ec84ae6bd8e31ffc0b4ea~d6dh1ysO_2736727367epsmtip1j;
 Fri, 14 Oct 2022 10:49:12 +0000 (GMT)
From: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, s.nawrocki@samsung.com, perex@perex.cz,
 tiwai@suse.com, pankaj.dubey@samsung.com, alim.akhtar@samsung.com,
 rcsekar@samsung.com, aswani.reddy@samsung.com
Subject: [PATCH 6/6] arm64: dts: fsd: Add sound card node for Tesla FSD
Date: Fri, 14 Oct 2022 15:51:51 +0530
Message-Id: <20221014102151.108539-7-p.rajanbabu@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221014102151.108539-1-p.rajanbabu@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLJsWRmVeSWpSXmKPExsWy7bCmuu5KZ89kg4cdMhYP5m1js7hy8RCT
 xaHNW9ktpj58wmYx/8g5Vou+Fw+ZLb5d6WCyuLxrDpvFjPP7mCyObgy2WLT1C7tF565+VotZ
 F3awWrTuPcJucfhNO6vFhu9rGR0EPDZ8bmLz2DnrLrvHplWdbB53ru1h89j3dhmbR9+WVYwe
 67dcZfH4vEkugCMq2yYjNTEltUghNS85PyUzL91WyTs43jne1MzAUNfQ0sJcSSEvMTfVVsnF
 J0DXLTMH6AMlhbLEnFKgUEBicbGSvp1NUX5pSapCRn5xia1SakFKToFJgV5xYm5xaV66Xl5q
 iZWhgYGRKVBhQnbG1/VHGQse8Vds/XWdsYHxMk8XIyeHhICJxLZpi9m7GLk4hAR2M0q8PLsf
 yvnEKDFz1ismCOcbo8TXv1+BMhxgLTMPxEPE9zJKfJ73ghXCaWWSWP3zMTvIXDYBU4lVcxrB
 EiICTUwSbW8msoA4zAIbGSVOH3vIBFIlLOAuMXN7K5jNIqAq0bbqOVg3r4CtxMprm1ghLpSX
 WL3hADOIzSlgJ/G8pQlsqoTAUg6JZVt2sUAUuUjs63gPZQtLvDq+hR3ClpL4/G4vG4SdLzHt
 YzOUXSHR9nEDE4RtL3HgyhwWkN+YBTQl1u/ShwjLSkw9tQ6shFmAT6L39xOocl6JHfNgbFWJ
 9cs3MULY0hL7ru+Fsj0kPvW0s0CCZSKjxKljD1gmMMrNQlixgJFxFaNkakFxbnpqsWmBYV5q
 OTzekvNzNzGC06mW5w7Guw8+6B1iZOJgPMQowcGsJML7WskzWYg3JbGyKrUoP76oNCe1+BCj
 KTAAJzJLiSbnAxN6Xkm8oYmlgYmZmZmJpbGZoZI47+IZWslCAumJJanZqakFqUUwfUwcnFIN
 TN3yMQfuzH0VIVN+/N3Z0ml7hL/NbElskLr1UGjS0z+PDU8GHK0JV1lfcmuDKMevjfm3jzBf
 a2MS/HX3y+17Ez4XRW+/rjNRYMGUH3VKntHCDV+dgVko4ri+7OLUVy+t7r0td+W6+EPLeNKj
 B5yTNivnHPhdvZX35+tL1udCDx4+k3L7zVwRicIXIUwWq6bGL7BRurwwfWb0t0XqNT8tniRK
 XI/32aKfEqlX17VP2l5rnhmDNG/7jHMTM7rap7A3PjZ5XMm56ey9SUzOjz9dWihb+pZ50Z0A
 /11cKy4z/sgJWexYxXbOe8fEJzn+TT6HStxmiuvIs6c92ucuxHT4F9fd6ktB04/feTJbeGvU
 ckElluKMREMt5qLiRAAffWYQMAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrELMWRmVeSWpSXmKPExsWy7bCSnO5qO89kg/uHBSwezNvGZnHl4iEm
 i0Obt7JbTH34hM1i/pFzrBZ9Lx4yW3y70sFkcXnXHDaLGef3MVkc3RhssWjrF3aLzl39rBaz
 LuxgtWjde4Td4vCbdlaLDd/XMjoIeGz43MTmsXPWXXaPTas62TzuXNvD5rHv7TI2j74tqxg9
 1m+5yuLxeZNcAEcUl01Kak5mWWqRvl0CV8bX9UcZCx7xV2z9dZ2xgfEyTxcjB4eEgInEzAPx
 XYxcHEICuxklLp1pYO5i5ASKS0tM79/DBmELS6z895wdoqiZSWLCmcesIAk2AVOJVXMaWUES
 IgITmCROvjvGApJgFtjKKDH1sxGILSzgLjFzeysTiM0ioCrRtgpkEicHr4CtxMprm1ghNshL
 rN5wAGwzp4CdxPOWJrC4EFDN8/PvGCcw8i1gZFjFKJlaUJybnltsWGCYl1quV5yYW1yal66X
 nJ+7iREc7FqaOxi3r/qgd4iRiYPxEKMEB7OSCO9rJc9kId6UxMqq1KL8+KLSnNTiQ4zSHCxK
 4rwXuk7GCwmkJ5akZqemFqQWwWSZODilGpimFXTcfB8msDMkzbuk9qHxyZZj7C0GclzvX/9Y
 VF5yVHSa+uqSd2eMFfeWmlw1Ygt1EZSRnBTy8DTz39Y/Fj85FNUbbm756JbmFH5/NnPQ5qAj
 GzICU06ni7ZxqW4/kJh5abfc3sBdsjsXrLdaZS9bfu7Drpg3aaluxW+5WlskZYR+heUrr09w
 V796el3j8wmvHDI8vz3ZqR7teIVdzo2rPNP4ZZusmnohu6+W5PrM/+XKjvd8rpz4emDv59KP
 Ny+8e3Hy5rN7LNpVKxvWnecJCxTUZdy4hZOpSazz+5VVvqeMzSpzF3mqBp+dv3fVy6CZ2/V/
 y9m1nt4gefV8CfcNZ/lFH9rMbS74XttYp6fEUpyRaKjFXFScCADuAJ825QIAAA==
X-CMS-MailID: 20221014104915epcas5p12414b87ea127b2d5bf521556bf841b00
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20221014104915epcas5p12414b87ea127b2d5bf521556bf841b00
References: <20221014102151.108539-1-p.rajanbabu@samsung.com>
 <CGME20221014104915epcas5p12414b87ea127b2d5bf521556bf841b00@epcas5p1.samsung.com>
X-Mailman-Approved-At: Sun, 16 Oct 2022 09:28:43 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
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

Add device tree node support for sound card on Tesla FSD board

Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
---
 arch/arm64/boot/dts/tesla/fsd-evb.dts | 49 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/tesla/fsd.dtsi    |  3 ++
 2 files changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
index c0a4509499ab..ecaa3c2e3045 100644
--- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
+++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
@@ -49,3 +49,52 @@
 &tdm_1 {
 	status = "okay";
 };
+
+&sound {
+	compatible = "tesla,fsd-sndcard";
+	status = "okay";
+	model = "fsd-i2s";
+	widgets =
+		"Speaker", "MAIN SPK",
+		"Microphone", "MAIN MIC";
+
+	primary-dai-link-0 {
+		link-name = "fsd-primary-0";
+		dai-format = "i2s";
+		tesla,bitclock-master = <&tdm_0>;
+		tesla,frame-master = <&tdm_0>;
+		cpu {
+			sound-dai = <&tdm_0 0>;
+		};
+	};
+
+	secondary-dai-link-0 {
+		link-name = "fsd-secondary-0";
+		dai-format = "i2s";
+		tesla,bitclock-master = <&tdm_0>;
+		tesla,frame-master = <&tdm_0>;
+		cpu {
+			sound-dai = <&tdm_0 1>;
+		};
+	};
+
+	primary-dai-link-1 {
+		link-name = "fsd-primary-1";
+		dai-format = "i2s";
+		tesla,bitclock-master = <&tdm_1>;
+		tesla,frame-master = <&tdm_1>;
+		cpu {
+			sound-dai = <&tdm_1 0>;
+		};
+	};
+
+	secondary-dai-link-1 {
+		link-name = "fsd-secondary-1";
+		dai-format = "i2s";
+		tesla,bitclock-master = <&tdm_1>;
+		tesla,frame-master = <&tdm_1>;
+		cpu {
+			sound-dai = <&tdm_1 1>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index 5decad45a1b6..fc8931f830a7 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -847,6 +847,9 @@
 			status = "disabled";
 		};
 
+		sound: sound {
+		};
+
 		timer@10040000 {
 			compatible = "tesla,fsd-mct", "samsung,exynos4210-mct";
 			reg = <0x0 0x10040000 0x0 0x800>;
-- 
2.17.1

