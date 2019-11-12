Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9BFF940B
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 16:22:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3716C1673;
	Tue, 12 Nov 2019 16:22:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3716C1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573572178;
	bh=xdKZwbmmV0M+mNMAjKA3Vg9UGGDs2h5A1p1K/2J85fE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mm2qnOYLblNMCORxAHzGlaxW38CdqoFzOGqtRIY2cP6+6UPhNVUHJg3kzCwNfltBb
	 03/2H5REkYZYDv2Z3hcjxURtzu0hjCkhw2SFvaXHSJOQah85CprgfpNtra/H0s2j2u
	 Bj9WfTEHFA65BRGD4OBATnPGPEbLMCwmOyInzjr8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D582F80671;
	Tue, 12 Nov 2019 16:18:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFE7EF80635; Tue, 12 Nov 2019 16:18:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF1A1F80635
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 16:18:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF1A1F80635
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MtfRp-1hc9qA0Y5H-00v4Hm; Tue, 12 Nov 2019 16:16:57 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.com>
Date: Tue, 12 Nov 2019 16:16:37 +0100
Message-Id: <20191112151642.680072-4-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191112151642.680072-1-arnd@arndb.de>
References: <20191112151642.680072-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:lAmj6kwQ3S1uoAqMviQM0k/X4NCJC4z7wsHW/iJ6hmK73azYUPt
 LeTeoMm+SHmEwAZSSGex8hmlIuQz1YByD4R8gEFDR4S+8G55DbnRcj0W0ApNMll1LTV74a0
 eMmTSt5CgtWlHtvPZzJeGmfuKGcw5DNGmAbCUAJLXaT7Q1+DC17XLuD9xk4rBfumKtKNjGg
 81fE5bja9OklrzP2MBUJw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NBo0lQzLa3c=:TO19rw24nS3btXFzrd006z
 LH86aIw7gIdJ1DH9EzgtWisBKUxfHshRNwfm6je6GgCiQh1JWB17Ilq3e7N13lsbNAt5f3d41
 YjJUYkVoQdvx9Z1iat/l5h/N9b2TjHp8v6NAm2LWn5cOqWHy1OeWIC2fGXA6PwwIdvdQd0392
 oAZk2ix/wgG+bdCQKbQsrAmEw0VnpjUWOm+/Ia5YTRmIYvPgRUmS1fSIy50OvVWtuOS/xnIfe
 PVvEXxGKggyvU7VHTDWY3RfXIZ3lnAawDoi6eptSKIC+dF88FATHjsXCVF3+ZLVuDLmf4Oc7m
 wgl1j/bNO/22zESP/fxR0i8Xu6z7n80I6WL9+9x3UK3KpkTxAttrVOzPUe1WFD53MF9SqC2Pz
 Rf8dw6lAi0LzG/BkdXaHO9sumnOCpb5hDVUqj6sk3q/VS9WmS46RYghR3TJ8G05de7aiUa9wk
 AVlTOYNOAeUBVkwzrC9WM5cahcmMVXlNKV1vnakMfDZkGvCBwez09eOnVLKMA578el4yvpeFj
 CfIY3lrRaJ+z0bpEAoPEiHcCxBjV2ukhd9+Sqq7dbj/X+JVErMseRlb50e7cSNVPjjsUmGKvN
 i8rqbtgmSsPJP7HX/uvY8b6IzAuCxafnWmhT8xHDT2Wh5uTZN8xbyxjPRQXtNi/ZLzNY2o8Xc
 RxbvsLDLwyLlP/Ke/+3XeAep6/hUUMyCNPi4nDjauabkZGig4aOMT0We4ZkAwlO4KLfr9bncX
 d7W5sXZ1dnuh8dZi4yt3oHeDnZr5C52ECiVRTMOG+i8bA0Fv3s1t1/jDnsR6rUJY/mqQkEFUj
 jvpyaraqnBYUW/zQgOgJsxvhyv71jJ9P4IJJDAmkxZ4OKsoqYKPtYXEGJ2JUL7Sg7GoybdGh7
 Ql4RYV1KciH+TmKXFnjg==
Cc: Arnd Bergmann <arnd@arndb.de>, Baolin Wang <baolin.wang@linaro.org>,
 y2038@lists.linaro.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Baolin Wang <baolin.wang7@gmail.com>
Subject: [alsa-devel] [PATCH v6 3/8] ALSA: Avoid using timespec for struct
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
