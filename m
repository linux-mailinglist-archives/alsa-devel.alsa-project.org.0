Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2626665BAC8
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 07:42:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 548EFC823;
	Tue,  3 Jan 2023 07:41:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 548EFC823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672728128;
	bh=N7LKRoNWo5qF/zXAbYhEKfZR3EEWYZDxbItjEaEHhB0=;
	h=From:To:Subject:Date:References:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:From;
	b=C6ZzTWmP3cXeTtZ1Z4qdkHFsQ/Q4rIqYrmkhgtc+KqIQ4jz4RHbK99lJz5/qLO/yl
	 ftJCxNqpmkdshHr9JQAut1khJMQHOOF+aeHzZN8dotdLNBOtd3ZOrvMnjJRvvZsSHC
	 i5/okqzCUUfCtZLX2WknItlnaZAVDztKT/3mCmAE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DE27F8001F;
	Tue,  3 Jan 2023 07:41:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F343F804AA; Tue,  3 Jan 2023 07:41:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22F21F8001F
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 07:41:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22F21F8001F
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=ueCnYXFw
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20230103064105epoutp03a114c9b0b00b0fccd958f4106207b322~2uVAvTlGz2513725137epoutp03f
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 06:41:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20230103064105epoutp03a114c9b0b00b0fccd958f4106207b322~2uVAvTlGz2513725137epoutp03f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1672728065;
 bh=sJrBsryZL8QBCKShIN5Y8ReoEPW8pUkX9vNKkHRbpRI=;
 h=From:To:Cc:Subject:Date:References:From;
 b=ueCnYXFwQAdeGYqrZPNotJ0gH/OcQOHEX4BGWV7CfcEk9dOakUiksdGcJeHApPs20
 o2cebDaLyfuIZyZacnQA37MwW9Rern2FTWAw+4UdUvYS2CtYhXbykaN7u9Hs7u3MM5
 rLtj33UMsWSCKQqGpobe0zIAZxJfQRaNs1ijFdFk=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20230103064104epcas5p33bb2641ea1e66b4ea15a9d132cf81cd3~2uU-X139U1851818518epcas5p33;
 Tue,  3 Jan 2023 06:41:04 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.179]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4NmNRL4kyXz4x9Q9; Tue,  3 Jan
 2023 06:41:02 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 24.49.03362.EFDC3B36; Tue,  3 Jan 2023 15:41:02 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20230103045646epcas5p2a9c43bc3bd187ca69653239a0de73152~2s57QlceS2841728417epcas5p27;
 Tue,  3 Jan 2023 04:56:46 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230103045646epsmtrp1eb30a7ec29e7ef8854b2317fbad38068~2s57L1MLP0134001340epsmtrp1S;
 Tue,  3 Jan 2023 04:56:46 +0000 (GMT)
X-AuditID: b6c32a4b-4e5fa70000010d22-17-63b3cdfea0ef
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 78.05.10542.E85B3B36; Tue,  3 Jan 2023 13:56:46 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
 [107.109.115.53]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230103045643epsmtip2c7798c7769dce991de46496089b04bc8~2s5411mp90074100741epsmtip2p;
 Tue,  3 Jan 2023 04:56:43 +0000 (GMT)
From: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, s.nawrocki@samsung.com, perex@perex.cz,
 tiwai@suse.com, pankaj.dubey@samsung.com, alim.akhtar@samsung.com,
 rcsekar@samsung.com, aswani.reddy@samsung.com
Subject: [PATCH v2 0/5] ASoC: samsung: fsd: audio support for FSD SoC
Date: Tue,  3 Jan 2023 10:26:08 +0530
Message-Id: <20230103045613.100309-1-p.rajanbabu@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAJsWRmVeSWpSXmKPExsWy7bCmpu6/s5uTDXaeVrV4MG8bm8WVi4eY
 LA5t3spuMfXhEzaL+UfOsVr0vXjIbPHtSgeTxeVdc9gsZpzfx2RxdGOwxaKtX9gtOnf1s1rM
 urCD1aJ17xF2i8Nv2lktNnxfy+gg4LHhcxObx85Zd9k9Nq3qZPO4c20Pm8e+t8vYPPq2rGL0
 WL/lKovH501yARxR2TYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkou
 PgG6bpk5QB8oKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgpMCvSKE3OLS/PS9fJS
 S6wMDQyMTIEKE7IzJjTNYSzYwVWxZ+U89gbGXo4uRk4OCQETiSNrZjN3MXJxCAnsZpQ4vXc7
 K4TziVHiwOtWNgjnM6PE+8+L2GBaFs1/yApiCwnsYpQ42h0BUdTKJDF9/R9GkASbgKnEqjmN
 YKNEBJqYJNreTGQBcZgFNgItOfaQCaRKWMBV4vvvu2AdLAKqEh+ObmEGsXkFbCXWvO+FWicv
 sXrDAbALJQRaOSQ+TZzLApFwkWjZOoEVwhaWeHV8CzuELSXxsr8Nys6XmPaxGWpQhUTbxw1M
 ELa9xIErc4DmcABdpCmxfpc+RFhWYuqpdWAlzAJ8Er2/n0CV80rsmAdjq0qsX76JEcKWlth3
 fS+U7SFxtW8ZNFhiJZq73jJOYJSdhbBhASPjKkbJ1ILi3PTUYtMC47zUcnhUJefnbmIEJ00t
 7x2Mjx580DvEyMTBeIhRgoNZSYR30otNyUK8KYmVValF+fFFpTmpxYcYTYFhNpFZSjQ5H5i2
 80riDU0sDUzMzMxMLI3NDJXEeVO3zk8WEkhPLEnNTk0tSC2C6WPi4JRqYArrj2e6q7L80csE
 I/bqJM2HyjMZvW6s2KM9LWGdg8cn3tZa60MzqhplksQ/e16+K3lp24J1TlqqIvaCd74/8LCr
 L7pj6NU/V/hc1y59Do9XFakeqVHclya35y5YMf8ej01coNj0YPbq3OjZf0y0guNemZXOfnEw
 9uTl12HXNr897ak848g652Py9r84DTKVv945XNUuY9sgH7LNOztlK9/8PevPWpa1RHXOc+Ku
 6nVtaNC0CDWZe6Rpxf26eJHvmYFCP35udf0y43pstuecaFeZkqYpEvIntSUv207aNWEiq2lb
 jUa9pexEuZA07rXq63cGr0u7vPLO+ZWy2rP6NZfftHjOZ52W9mLmxP++SizFGYmGWsxFxYkA
 7lf+uyMEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNLMWRmVeSWpSXmKPExsWy7bCSvG7f1s3JBidfsls8mLeNzeLKxUNM
 Foc2b2W3mPrwCZvF/CPnWC36Xjxktvh2pYPJ4vKuOWwWM87vY7I4ujHYYtHWL+wWnbv6WS1m
 XdjBatG69wi7xeE37awWG76vZXQQ8NjwuYnNY+esu+wem1Z1snncubaHzWPf22VsHn1bVjF6
 rN9ylcXj8ya5AI4oLpuU1JzMstQifbsErowJTXMYC3ZwVexZOY+9gbGXo4uRk0NCwERi0fyH
 rF2MXBxCAjsYJU49m88GkZCWmN6/B8oWllj57zk7RFEzk8S+K9vAEmwCphKr5jSCdYsITGCS
 OPnuGAtIgllgK6PE1M9GILawgKvE9993GUFsFgFViQ9HtzCD2LwCthJr3vdCbZCXWL3hAPME
 Rp4FjAyrGCVTC4pz03OLDQuM8lLL9YoTc4tL89L1kvNzNzGCw1dLawfjnlUf9A4xMnEwHmKU
 4GBWEuGd9GJTshBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHeC10n44UE0hNLUrNTUwtSi2CyTByc
 Ug1M+UHiG9esrk8/F6+g/bb5nexUJ7+dN7yeXGOb2b3IQZ519cbqgzaZbM02et/1ztnlOC2Z
 eX5hXP+K7s3J87Ll19kv+5jNFPn6yLuo18ue9zxRW93R/6q9cNGUSRP8m/e82X3RZlnFhv5T
 S5I12naG6R1xyLyZ5xRy8vCjmh2em4RmWP9imfU3R6bepfAo+0+GIKZ8yzUXHkZtSK1+VHj5
 Nsft787bsj7PWCO+4HewDVMcj+uKVIntN9YIsq5KfPZDXk6fz/Rq+7Qjc5/P/qC0XHTFM2nH
 33xqBfdjquv6BeJYZnteif3/LfScX9Y0q1zp2doByjuqRMXKpbqeKP6oit3WLfhl/U2fInnm
 W7zXlFiKMxINtZiLihMBMlzURM4CAAA=
X-CMS-MailID: 20230103045646epcas5p2a9c43bc3bd187ca69653239a0de73152
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230103045646epcas5p2a9c43bc3bd187ca69653239a0de73152
References: <CGME20230103045646epcas5p2a9c43bc3bd187ca69653239a0de73152@epcas5p2.samsung.com>
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

The intention of this patch series is to enable audio support on FSD SoC.

Changes in v2:
1. New compatible added in Exynos I2S driver for FSD platform.
2. Added Fixup support for Exynos I2S CPU DAI.
3. Migration of manual PSR, OPCLK configuration to Exynos CPU DAI driver as
fixup.
4. Migrated from dedicated sound card to simple audio card.
5. Support added for tlv320aic3x-i2c codec on FSD platform.

Changes in v1:
1. Add TDM support on samsung I2S interface.
2. Allow sound card to directly configure I2S prescaler divider instead of
calculating it from frame clock.
3. The sound card support for FSD SoC which utilizes samsung I2S interface
as CPU DAI.

Padmanabhan Rajanbabu (5):
  ASoC: samsung-i2s: add FSD compatibile string
  ASoC: samsung: i2s: add support for FSD I2S
  arm64: dts: fsd: Add I2S DAI node for Tesla FSD
  arm64: dts: fsd: Add codec node for Tesla FSD
  arm64: dts: fsd: Add sound card node for Tesla FSD

 .../bindings/sound/samsung-i2s.yaml           |  4 ++
 arch/arm64/boot/dts/tesla/fsd-evb.dts         | 59 +++++++++++++++++++
 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi    | 14 +++++
 arch/arm64/boot/dts/tesla/fsd.dtsi            | 34 +++++++++++
 sound/soc/samsung/i2s.c                       | 57 ++++++++++++++++++
 5 files changed, 168 insertions(+)

-- 
2.17.1

