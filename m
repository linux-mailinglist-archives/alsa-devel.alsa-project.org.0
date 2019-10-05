Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87824CC84C
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Oct 2019 08:04:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D15DF1682;
	Sat,  5 Oct 2019 08:03:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D15DF1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570255459;
	bh=v0Bdj7/isEnSQYPIhkBS+NGX6VBf1u8wq4N637ca6Kw=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GMdQQMhRLcrsrUTBRVjaZSlrlekZPnjYcL6S2UshfAd/vYg0zx8TZzi6BC6nFgwt7
	 JCEPiJo2CSuQP6SclJsTm00fsF+ckW9bOjrGWLZuZPGYowwn/UGZpP3DXJewoTa3mi
	 XKaEMZFLE6ZYlowaIpYGrqwZ8XhRPUw0jYbsHHv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1236F8064C;
	Sat,  5 Oct 2019 07:59:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B49FF80659; Sat,  5 Oct 2019 07:59:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14941F8063A
 for <alsa-devel@alsa-project.org>; Sat,  5 Oct 2019 07:59:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14941F8063A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="pwuDtpdQ"
Received: by mail-qk1-x749.google.com with SMTP id y189so8788916qkb.14
 for <alsa-devel@alsa-project.org>; Fri, 04 Oct 2019 22:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=kmoQ5EfiuLPugExVdasoEEQ+xSgNc8VlrAlw91YpZWU=;
 b=pwuDtpdQkUw37uPBkawWEH5UEbyKj/92rsZLEWnMWLxMfJsAhZ9w0XOUMla9UL+ict
 zwTJ951sb4e9imqEeEaRAqKqbyUKdpUPjfonRAMwhU6n29cI0HDW69Uvn5a03TSrTvLt
 C0879QsGt9rxTp4jVoYBu64vGTnrB/BrwXDw3x9E1W/6mZkccSQi+fJAKqPWzEUkY8/7
 iukTLAEUGlZQm/jIBZREsZ0YcZmrPvfs5qjfFoXn8PeK168mCKeBATVj+Jud/JL0gM1y
 yYq66LTRfNBzUT4sWo4jigQOdsPTM1xBqZ7SqxJUir6hmFrdERt+j+8hqfYWpmJZc86s
 Ochg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=kmoQ5EfiuLPugExVdasoEEQ+xSgNc8VlrAlw91YpZWU=;
 b=BfmticvS1+Tsb/5wfrvBW7IiZLjGqDlysyFyKiA3Fl03F0OX5K3aZG0sVb3PA8kP1l
 sPoCXkO8y/iN13KUkjxYUZE9voBbw1It6Oav6Sp6Lpimy8sOPKiQpXfrE3u9kNnpq/zm
 QdBsjI1CGvh8FRowXGWmu/ENyB75ZVfYhnyiskzWfwJKPhgv3aNfw8347loAyVNBd4bR
 /VEk8+gEVKT6Ick/HeGJWrCeE8RpHOkocNizIa1UAkjf1T9ZkZbfrdfds2tnhUoU7Idj
 P1EBXfevGStyx4Muie4EOYeNOAIKHpbrEzQvROMYmnk8TUs0XTaSTx+nkM/3RqL8Ye0X
 DucQ==
X-Gm-Message-State: APjAAAUq/VDH5UmihaQ8e49HH3G5qpMh8IbFlR6UaQUgX4lsPMYWON+Q
 6/3XDgeXxJNkaoeBT4fHT2EX1o6+KrX8
X-Google-Smtp-Source: APXvYqwJeuGRCNWl0Jv58EQx56XvBq9ESjXplaVSwszfGBRajq9VaPPIgdc6Sw1gP56WuO7IHjsEaEu7Mh72
X-Received: by 2002:a05:6214:1189:: with SMTP id
 t9mr17900493qvv.89.1570255142531; 
 Fri, 04 Oct 2019 22:59:02 -0700 (PDT)
Date: Sat,  5 Oct 2019 13:58:04 +0800
In-Reply-To: <20191005055808.249089-1-tzungbi@google.com>
Message-Id: <20191005130552.6.I0df85fe54162426e31f60a589d9b461c65df2faa@changeid>
Mime-Version: 1.0
References: <20191005055808.249089-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, tzungbi@google.com,
 robh+dt@kernel.org, enric.balletbo@collabora.com, bleung@google.com,
 dgreid@google.com
Subject: [alsa-devel] [PATCH 06/10] ASoC: dt-bindings: cros_ec_codec: add
	SHM bindings
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

- Add "ec-shm" for binding to shared memory exposed by EC.
- Add "memory-region" for binding to memory region shared by AP.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../bindings/sound/google,cros-ec-codec.txt   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
index 0ce9fafc78e2..cb46bc082b4b 100644
--- a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
+++ b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
@@ -10,8 +10,26 @@ Required properties:
 - compatible: Must contain "google,cros-ec-codec"
 - #sound-dai-cells: Should be 1. The cell specifies number of DAIs.
 
+Optional properties:
+- ec-shm: Shared memory region from EC.  It contains 3 unsigned 32-bit
+          integer.  The first 2 integers combine to become an unsigned
+	  64-bit address.  The last one integer is length of the shared
+	  memory.
+- memory-region: Shared memory region to EC.  A "shared-dma-pool".  See
+                 ../reserved-memory/reserved-memory.txt for details.
+
 Example:
 
+{
+	...
+
+	reserved_mem: reserved_mem {
+		compatible = "shared-dma-pool";
+		reg = <0 0x52800000 0 0x100000>;
+		no-map;
+	};
+}
+
 cros-ec@0 {
 	compatible = "google,cros-ec-spi";
 
@@ -20,5 +38,7 @@ cros-ec@0 {
 	cros_ec_codec: ec-codec {
 		compatible = "google,cros-ec-codec";
 		#sound-dai-cells = <1>;
+		ec-shm = <0x0 0x10500000 0x80000>;
+		memory-region = <&reserved_mem>;
 	};
 };
-- 
2.23.0.581.g78d2f28ef7-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
