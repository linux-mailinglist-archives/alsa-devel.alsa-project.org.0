Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3600B60A1
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 11:46:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D21CA166A;
	Wed, 18 Sep 2019 11:45:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D21CA166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568799960;
	bh=smq/DA6fW46fBv7hJh6oV+zimE6ZHBAo9KSZ65zKDTE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hOVtZQHWH/RGn+HJdKLC2PYkfGrP0dmOXFFLWZLTTwedOZz0yt1JEzn55XxNsuCjn
	 b9nNogs23tRqpCYUhjzfHbTQKwzGHB6CW0zUSVzeAoPmjxT2QURg+sJ7wsQ5AsJAHm
	 FuWQnsglRjfOSS+8PFnAP9aH9CTxbSC91Jt8fWc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D843EF8053A;
	Wed, 18 Sep 2019 11:43:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CA01F803D6; Tue, 17 Sep 2019 13:14:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C021F802BD
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 13:14:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C021F802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="ghdUJHKM"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190917111424euoutp02f51bd8c24e6c74600dcc754e0fb32538~FNX74W_Cm1841318413euoutp02E
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 11:14:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190917111424euoutp02f51bd8c24e6c74600dcc754e0fb32538~FNX74W_Cm1841318413euoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1568718864;
 bh=O+tpv5YH60GH75cK5y76RSwCxfMXAXTR6xr+6tD+6eo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ghdUJHKMyMujScDNd7AyQEDnAoIx2aewGZ6LFK0gkpFPIWxZhEmziEXLpBhrDUmyO
 gapkUaLxexOgUJSaviYIAjCa1W3ZUxl1KlE+HWC9igugG3vAmCGRRX9sOW36x5B+kI
 Su3rC71dTbdX8PPkoBadSgt2xrdmEJOO+3E7XQEM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190917111424eucas1p13132111e39c3ad4ddbf23e0f27c223cb~FNX7azAfY1744217442eucas1p1U;
 Tue, 17 Sep 2019 11:14:24 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id AD.D0.04374.F00C08D5; Tue, 17
 Sep 2019 12:14:23 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190917111423eucas1p2efddf7b93fe21dcfa262d8f539116517~FNX6pwabL2246722467eucas1p2I;
 Tue, 17 Sep 2019 11:14:23 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190917111423eusmtrp20315d096d0928d0371daf2db35c5e55f~FNX6biU4I0712107121eusmtrp2P;
 Tue, 17 Sep 2019 11:14:23 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-9d-5d80c00fe71d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 4C.5C.04166.F00C08D5; Tue, 17
 Sep 2019 12:14:23 +0100 (BST)
Received: from AMDC2459.digital.local (unknown [106.120.51.95]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190917111422eusmtip133de2112be1ae796ddc8d4a96eeb72bc~FNX51WbHb2351623516eusmtip1B;
 Tue, 17 Sep 2019 11:14:22 +0000 (GMT)
From: Maciej Falkowski <m.falkowski@samsung.com>
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Date: Tue, 17 Sep 2019 13:14:13 +0200
Message-Id: <20190917111413.22711-2-m.falkowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190917111413.22711-1-m.falkowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRmVeSWpSXmKPExsWy7djP87r8BxpiDf5uNrO4te4cq8WVi4eY
 LKY+fMJmMf8IkHv+/AZ2i29XOpgsLu+aw2Yx4/w+JosHzevYLNYeuctusfT6RSaL1r1H2C0O
 v2lntbi44guTA5/Hhs9NbB5r5q1h9Ng56y67x6ZVnWwefVtWMXp83iQXwBbFZZOSmpNZllqk
 b5fAlXH18BrGgj3CFad2PmNtYDwu0MXIySEhYCJxbettli5GLg4hgRWMEgumNrBBOF8YJRbe
 +gWV+cwoceP7PUaYlrnT/rFDJJYzSrR/nc4M17L7+TxWkCo2AQOJ/jd7WUBsEYE6iYnT5oEV
 MQs8ZJS4s/czO0hCWMBbYsrEp8wgNouAqsSCeSvA4rwCNhJt9x+xQqyTl1i94QBYDaeArcTc
 W39ZQQZJCKxil/h14As7RJGLxI6pq6FsYYlXx7dA2TIS/3fOZ+pi5ACyqyWufZOF6G1hlLg+
 7S0bRI21xJ9VE9lAapgFNCXW79KHCDtKbFhwiw2ilU/ixltBkDAzkDlpG8jDIGFeiY42IQhT
 VeLNhFiIRmmJ1jX7GSHCHhIvXltDQmcCo8S+BQfYJjDKz0JYtYCRcRWjeGppcW56arFxXmq5
 XnFibnFpXrpecn7uJkZgyjn97/jXHYz7/iQdYhTgYFTi4b2xuT5WiDWxrLgy9xCjBAezkghv
 QC1QiDclsbIqtSg/vqg0J7X4EKM0B4uSOG81w4NoIYH0xJLU7NTUgtQimCwTB6dUA2PZT/mN
 U/T/eM7yXrG55ZL+lLNufQcZZZ64K/6U4C7W+f5F5vWyVaXbfhju+8xW75Nf5sKjncZ+9eaM
 t+bJXrGqhsuWaHRcvqtwMPR34b6Uf74NFTx7a0pvvTIWT7XUnenZM3/Krdwg+/3m3xtZtgcl
 ut1yfpO++J3TnXOTyrsl58tuaZv2qF2JpTgj0VCLuag4EQAyXu5mNQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnkeLIzCtJLcpLzFFi42I5/e/4XV3+Aw2xBqdeM1vcWneO1eLKxUNM
 FlMfPmGzmH8EyD1/fgO7xbcrHUwWl3fNYbOYcX4fk8WD5nVsFmuP3GW3WHr9IpNF694j7BaH
 37SzWlxc8YXJgc9jw+cmNo8189YweuycdZfdY9OqTjaPvi2rGD0+b5ILYIvSsynKLy1JVcjI
 Ly6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy7h6eA1jwR7hilM7n7E2
 MB4X6GLk5JAQMJGYO+0fexcjF4eQwFJGiTU7d7NDJKQl9l/7CGULS/y51sUGUfQJqOjqJhaQ
 BJuAgUT/m70sIAkRgSZGifk3f4I5zAJvGSVadhxiAqkSFvCWmDLxKTOIzSKgKrFg3gqwsbwC
 NhJt9x+xQqyQl1i94QBYDaeArcTcW3/B4kJANUufnGGfwMi3gJFhFaNIamlxbnpusaFecWJu
 cWleul5yfu4mRmAkbDv2c/MOxksbgw8xCnAwKvHwGmyrjxViTSwrrsw9xCjBwawkwhtQCxTi
 TUmsrEotyo8vKs1JLT7EaAp01ERmKdHkfGCU5pXEG5oamltYGpobmxubWSiJ83YIHIwREkhP
 LEnNTk0tSC2C6WPi4JRqYMxaZ/f+/Ddzx80i11ImTa5e7Ddbk8v/xHeOppLNdhfsL1gHTrCX
 /XPveHbmBx8bRtnjCtqOrJfMJ51PciyZdZXrshLvr9obk7/ZZW7mOqh3hDlKasfuz5e8g/Pm
 cE76qL3gjcQ7P7NdLsY/w89ef9l28k1n1dM3ZobiPHmiNufOnWBZ63N7voESS3FGoqEWc1Fx
 IgCO5+XamgIAAA==
X-CMS-MailID: 20190917111423eucas1p2efddf7b93fe21dcfa262d8f539116517
X-Msg-Generator: CA
X-RootMTR: 20190917111423eucas1p2efddf7b93fe21dcfa262d8f539116517
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190917111423eucas1p2efddf7b93fe21dcfa262d8f539116517
References: <20190917111413.22711-1-m.falkowski@samsung.com>
 <CGME20190917111423eucas1p2efddf7b93fe21dcfa262d8f539116517@eucas1p2.samsung.com>
X-Mailman-Approved-At: Wed, 18 Sep 2019 11:43:26 +0200
Cc: mark.rutland@arm.com, m.falkowski@samsung.com, sbkim73@samsung.com,
 broonie@kernel.org, lgirdwood@gmail.com, krzk@kernel.org, a.hajda@samsung.com,
 robh+dt@kernel.org, s.nawrocki@samsung.com, m.szyprowski@samsung.com
Subject: [alsa-devel] [PATCH 2/2] dt-bindings: sound: Convert Samsung SMDK
	audio complex
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Convert Samsung SMDK audio complex to newer dt-schema format.

Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
---
 .../bindings/sound/samsung,smdk-wm8994.txt    | 14 -------
 .../bindings/sound/samsung,smdk-wm8994.yaml   | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.yaml

diff --git a/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt b/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt
deleted file mode 100644
index 4686646fb122..000000000000
--- a/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-Samsung SMDK audio complex
-
-Required properties:
-- compatible : "samsung,smdk-wm8994"
-- samsung,i2s-controller: The phandle of the Samsung I2S0 controller
-- samsung,audio-codec: The phandle of the WM8994 audio codec
-Example:
-
-sound {
-		compatible = "samsung,smdk-wm8994";
-
-		samsung,i2s-controller = <&i2s0>;
-		samsung,audio-codec = <&wm8994>;
-};
diff --git a/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.yaml b/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.yaml
new file mode 100644
index 000000000000..a66c0dfdeb57
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/samsung,smdk-wm8994.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung SoC SMDK audio complex
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Sangbeom Kim <sbkim73@samsung.com>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+
+properties:
+  compatible:
+    const: "samsung,smdk-wm8994"
+
+  samsung,i2s-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the Samsung I2S0 controller
+
+  samsung,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the WM8994 audio codec
+
+required:
+  - compatible
+  - samsung,i2s-controller
+  - samsung,audio-codec
+
+examples:
+  - |
+    sound {
+        compatible = "samsung,smdk-wm8994";
+        samsung,i2s-controller = <&i2s0>;
+        samsung,audio-codec = <&wm8994>;
+    };
+
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
