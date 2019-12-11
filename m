Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F2311BF18
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 22:23:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FDF1166A;
	Wed, 11 Dec 2019 22:23:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FDF1166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576099439;
	bh=xdKZwbmmV0M+mNMAjKA3Vg9UGGDs2h5A1p1K/2J85fE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kr+la/1LbKjZ3Pz4uo74cyQNWjP4hh3d5V5mK1swCrPfxb6krlackk9P/kBB7mHd4
	 Cz7tmtxC0p1WiXvvEcsQmIKkbIWfISmQt8i01bo1XJrIn1NrSr1NMj+LE5s4CdkpJd
	 b6l3vKnnGt09TR3EZOCPpS13uvl+xvlxmG0d1WNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A01BEF80269;
	Wed, 11 Dec 2019 22:20:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 607CAF80259; Wed, 11 Dec 2019 22:20:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FDD3F8023E
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 22:20:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FDD3F8023E
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MgNtR-1i5Ehb062B-00hwBH; Wed, 11 Dec 2019 22:20:32 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.com>
Date: Wed, 11 Dec 2019 22:20:19 +0100
Message-Id: <20191211212025.1981822-4-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191211212025.1981822-1-arnd@arndb.de>
References: <20191211212025.1981822-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:iykmUU2XsgojNUhRxWJ9NKMPyV+S5EjEfc7usTwDkBJbIBAqrkL
 3tFrJsChkCKQQP8cc6PcvoPSVrNMveKGCfO//KYYhF5BZEkAz9nv5oL08XPfmj9fljInh8q
 rRf67DV8uhtHRsp9SY1WD/jT2xx1Vqy6lmulsPlTyWWvw6URc0bIQ6o8EfwfYVi0Vv8OvSB
 jF1jI6Q1fulMXykAIa3lg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zyamFrw9k0o=:87xM/lq8CmcweWUktkqZrD
 T1dkqosterDjtfnqKNe+tq0c18geQ4i/1gRHbssNpQfn6DiOsLrEtSz8cyuF1t/R6zL78O7EU
 qFu7RO4yf/7qU9NtMORtsVIZHUnk8LPUYgoTqGOOqNvnqi7s5MCjcrDGOqiokj5d5Wgt5CpEs
 thlc0yK0XV6A28RYJohNo5rtUUxXvJarW70Uj33T6m1SkBgMDI+EEBQ3ASlOwrLxGqfAVje99
 8QlEdo/VqAwsby9HfgNy3J0lqBy6K0fPeBkCyKIPfIlgPSNb2vK3yEhmmf/4wIeLRlCDLL2f7
 k9DFJKnloMSUxZsOVw8J2MXeFACrrMxFnvping3zVkl3us7jfoXxfLmz6tDu3C5UzIuYhTrxz
 2hMrbXcQLj13u8YgPNWefQnxzad0Szy+peaaCaEwMtqTnK43zCxt+NVJ+nqnIma0jeXEFdsjl
 PGJ52Fp8EbZbv2ttcCzB75JJhJ1OxyAEaVXuRBi83G8sO6Upd06+NpIukp7z3wibwPLl7jZQD
 OLF2GgMBst6YVp/JPmJXGEH+b3hx0xHGgJBhK4NnLI+uEc9SeIBPE3gEZB+xWVHo2QcUD2/rg
 XWhk8YRoth4ZzslVgecvX8D/ILyvW06+LZBaFm8IQPofAf1/gFYNnZthNDwxvqKjXmmulhlTR
 ZVlE/AEph24o3styRMjlWspEnDniKtPuQNBOgkx6GqFJjbmO/3LnMznCSIkhprsvjLbBi0adA
 ejPH+nbkYDNVXtdDBCEWCDubvbRr1l921DJ3IknP3NL3F9BdxD0fB39VWTnpXWkt26JvA+TGk
 x0aBuuQ4SkS4y/5CREQlUT2HC0gsU/YrVThX1GumgA9IaBkC6rR6H/YtG3NguumgwkB5e7v81
 GP0tEdDFyR6fVAFHU4jA==
Cc: Arnd Bergmann <arnd@arndb.de>, Baolin Wang <baolin.wang@linaro.org>,
 y2038@lists.linaro.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Baolin Wang <baolin.wang7@gmail.com>
Subject: [alsa-devel] [PATCH v7 3/9] ALSA: Avoid using timespec for struct
	snd_ctl_elem_value
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Baolin Wang <baolin.wang@linaro.org>

The struct snd_ctl_elem_value will use 'timespec' type variables to record
timestamp, which is not year 2038 safe on 32bits system.

Since there are no drivers will implemented the tstamp member of the
struct snd_ctl_elem_value, and also the stucture size will not be changed
if we change timespec to s64 for tstamp member of struct snd_ctl_elem_value.

From Takashi's comments, "In the library, applications are not expected
to access to this structure directly. The applications get opaque pointer
to the structure and must use any control APIs to operate it. Actually the
library produce no API to handle 'struct snd_ctl_elem_value.tstamp'. This
means that we can drop this member from alsa-lib without decline of
functionality." Thus we can simply remove the tstamp member to avoid using
the type which is not year 2038 safe on 32bits system.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/uapi/sound/asound.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 930854f67fd3..40a23d8418fe 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -957,8 +957,7 @@ struct snd_ctl_elem_value {
 		} bytes;
 		struct snd_aes_iec958 iec958;
 	} value;		/* RO */
-	struct timespec tstamp;
-	unsigned char reserved[128-sizeof(struct timespec)];
+	unsigned char reserved[128];
 };
 
 struct snd_ctl_tlv {
-- 
2.20.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
