Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5E6348C32
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 10:08:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C1B31669;
	Thu, 25 Mar 2021 10:07:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C1B31669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616663283;
	bh=vbTG9DouHIwOe5L7HGI9TqP3KBQ4r283kyG7ZzfmUwo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z575GVvEzvlbFMg73sDZKZaFJZmB4TCRy4C/hck6VrT53HyJzCyzC5LXpUeNxdyAw
	 vQl/+keUhMXLuTEx9K3ub4oa3XbGTEWmJh57XsApe8UIi53Mfd9zTDMdNvmFvtUD+T
	 B55eXx+XkYAfesHZocuYxgyqpgaDuGGEm0il2boQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D110BF8025F;
	Thu, 25 Mar 2021 10:06:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70DC0F80257; Thu, 25 Mar 2021 10:06:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43FE0F800FF
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 10:06:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43FE0F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="R1Q7CsCv"
Received: by mail-qt1-x82a.google.com with SMTP id a11so1139198qto.2
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 02:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1iQsxiYdCxGG35lUzN/bRMfo6zLxSuYNH36J3LPifEg=;
 b=R1Q7CsCvGvVokufbBExDBRunUscl/o0IH7tDK2xOA8M5KLzlVGIdiuJNMXYp3/LneJ
 vCsg1fu8x4V6GDycZpqL6Z+SW05YJR4v40fxJ+LeovKsn2jYY09PPrC+8DD8TjD060cm
 lK0va4m90Ni9Prn9RpkWVaXuVWPfmC7gs0LowBxWXBy8kikyTsuLAXP72a6ng9AwrfUt
 ugcRoCckiQ8t9oE5CLSRnIdTQbjfyIreAcR0r6GXXHPmof/uD4kJoJZuzLrO4bt2e+T7
 nmADafWBNsKEzusqxIMzyXGZNm+AGFN4uUJ2Fkxu1tdUjqXyxwHIrLvp4We0Ub58XcJX
 ygTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1iQsxiYdCxGG35lUzN/bRMfo6zLxSuYNH36J3LPifEg=;
 b=WJkTiFjKjWa082Nk1iRfAYBOU9BDO0mFS/bKQ/K+RJF8AFwCI2Cj5klUY31zpiQA6n
 zhmO6kQA/zIQamytIGZBzDDLBVHDqUPxDTJ8D4gnVm69BH/HWItfL+gEi+zq90gOgLMt
 iukIqv5GTByHr7lkyGYAlrF533+KAZ+z7rZnug64hfUNzB9238itNbhh5hviAN4rc8AD
 Fl5ikZQIsUg71zFnYhBvs6h4U0L5Snf3l+jN1Ylqh7XdhSoS5eyqyghvU/kYevy5RqZM
 8dGTse5hHcCMfnNMUL4zdsDzVPD/wM2HQOCmBfWCsv+su1QlCvfUOY8b4KPsuNzSblVZ
 xzfg==
X-Gm-Message-State: AOAM5312R1VLte5irGuiYzclXyg4LvS4e5NC7CsHzJljguWL33kOSKZh
 Ong19wPP/s3geWZMd+q1yrU=
X-Google-Smtp-Source: ABdhPJxn+XGD1U+hviYeiWDtQH8F0XbnCOvTE8dAhQABDS9YoeVHFOe+IlQ3s4fPwjZUsJ8Pc/R2xA==
X-Received: by 2002:a05:622a:1194:: with SMTP id
 m20mr6616454qtk.164.1616663183811; 
 Thu, 25 Mar 2021 02:06:23 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.54])
 by smtp.gmail.com with ESMTPSA id m13sm3610943qkm.103.2021.03.25.02.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 02:06:23 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: perex@perex.cz, tiwai@suse.com, unixbhaskar@gmail.com, broonie@kernel.org,
 mirq-linux@rere.qmqm.pl, lars@metafoo.de, gustavoars@kernel.org,
 huawei@kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH V3]  ALSA: pcm: Fix couple of typos
Date: Thu, 25 Mar 2021 14:36:09 +0530
Message-Id: <20210325090609.10372-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: rdunlap@infradead.org
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

s/unconditonally/unconditionally/
s/succesful/successful/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Changes from V2:
 Takashi pointed out that the patch was not applicable due to some unwanted
 stuff get into it. Resending it with the new patch creation.

 sound/core/pcm_native.c | 82 ++++++++++++++++++++---------------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 17a85f4815d5..afb670d7fd53 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1425,7 +1425,7 @@ static int snd_pcm_do_stop(struct snd_pcm_substream *substream,
 		substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_STOP);
 		substream->runtime->stop_operating = true;
 	}
-	return 0; /* unconditonally stop all substreams */
+	return 0; /* unconditionally stop all substreams */
 }

 static void snd_pcm_post_stop(struct snd_pcm_substream *substream,
@@ -1469,7 +1469,7 @@ EXPORT_SYMBOL(snd_pcm_stop);
  * After stopping, the state is changed to SETUP.
  * Unlike snd_pcm_stop(), this affects only the given stream.
  *
- * Return: Zero if succesful, or a negative error code.
+ * Return: Zero if successful, or a negative error code.
--
2.30.1

