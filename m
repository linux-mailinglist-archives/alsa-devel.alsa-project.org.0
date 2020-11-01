Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CACA62A2047
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Nov 2020 18:21:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E76C4E;
	Sun,  1 Nov 2020 18:20:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E76C4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604251289;
	bh=C5r2/UALqlE/qwep9RGQrKlXKGbzczbcUlhPA1okBiQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rPdVQ89lBYS9+epXiENulFRQPSuc87czF7dw17SllMlvUyJBACn+fJfcnjF2wh2Ab
	 +FnT+UdLLAzQTnxbL/0s73FPHQdeoObooaDngMgaTYiJvuxumaj+BrMhySMogqx9eE
	 LDg3pECferdqAxlSGU2E6KAqSCuStDNo9V//E45E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5C0AF8012B;
	Sun,  1 Nov 2020 18:19:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7F77F80162; Sun,  1 Nov 2020 18:19:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B775F8012B
 for <alsa-devel@alsa-project.org>; Sun,  1 Nov 2020 18:19:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B775F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Jo6kCRiz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604251190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=MG7ZjUbnC9bYoypOenWcBrCKIrvzFUn3uVH6so601go=;
 b=Jo6kCRizD3DBGxv4ELwEMqhsPQ1ZTq7j9qf/eipwdBs3dKonlPrlzPwk0IM8cGcInL/098
 8MvE+NPzBoF+C99oqdGYOTxCBlIDVcP+gARF2nBYwZcMhdVSCbJaNR/KtlmRWD79GzhxGa
 Z2w95ZEAxLZ5HPndBCB+o0YbNsKo674=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-TnXl-l1sOTiR4HKAyAbL-g-1; Sun, 01 Nov 2020 12:19:49 -0500
X-MC-Unique: TnXl-l1sOTiR4HKAyAbL-g-1
Received: by mail-oo1-f72.google.com with SMTP id g9so4706655ooq.17
 for <alsa-devel@alsa-project.org>; Sun, 01 Nov 2020 09:19:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=MG7ZjUbnC9bYoypOenWcBrCKIrvzFUn3uVH6so601go=;
 b=hsncE6rk9pLxHr2kQyVheYzo6I/jsjERVrSZ1Vcg5lMPuZQEs8x/mHpLYucAp+Kc5n
 +fgMegjNS1EOraxlZ73e2TlUuJMjtQK0AwsanKt07VXSpT7PKDUI0W1OKRnFM9mY+n9t
 aN6PhlpotHwhSZFdK8wmeU7SnR4Hcz9ELSvqr51xT26sAuFIy7tGw78+W1jT10SltAri
 iK8kJdMLnjT1oCVRSatWKZ1m3c1k5XnBJRmgIqv9+Mf9eQGvSQJXwgHBw1ogoxgHSVId
 xhH1QtuWNN5tOyLEpcpq3VXnXhw4bjn6mJ2yXIdgacPChxs5ONdwfosHPQTrusKpAq5x
 Q3Cw==
X-Gm-Message-State: AOAM531AEEMGjLzQLWE0ZtoK7daCwllcaluIMY2txyH10VRQIiVqdDU5
 ++HDhKJTCy2BVoC3IjqgUTWPeZTpFCOVIVEg68YrcgAjVrxkVwwMu8wpAc8mEMnUUpuk0YjDhsC
 xdLLWj9NPgbfsccJm2KrMwmE=
X-Received: by 2002:a4a:d0a4:: with SMTP id t4mr9281678oor.21.1604251188926;
 Sun, 01 Nov 2020 09:19:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpjmkZMmnB1Awl//UN6quNahuHTPKTNd6C8do/e/GSTG+H002yN77vGHXnBRFYcAFHCape1g==
X-Received: by 2002:a4a:d0a4:: with SMTP id t4mr9281653oor.21.1604251188562;
 Sun, 01 Nov 2020 09:19:48 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id q24sm206054otm.22.2020.11.01.09.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2020 09:19:48 -0800 (PST)
From: trix@redhat.com
To: cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, yang.jie@linux.intel.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 amit.kucheria@linaro.org, rafael.j.wysocki@intel.com,
 yuehaibing@huawei.com, andriy.shevchenko@linux.intel.com
Subject: [PATCH] ASoC: Intel: remove unneeded semicolon
Date: Sun,  1 Nov 2020 09:19:43 -0800
Message-Id: <20201101171943.2305030-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Cc: Tom Rix <trix@redhat.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

From: Tom Rix <trix@redhat.com>

A semicolon is not needed after a switch statement.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/soc/intel/atom/sst/sst.c | 2 +-
 sound/soc/intel/catpt/loader.c | 2 +-
 sound/soc/intel/catpt/pcm.c    | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst.c b/sound/soc/intel/atom/sst/sst.c
index e90590559185..e21e11dac000 100644
--- a/sound/soc/intel/atom/sst/sst.c
+++ b/sound/soc/intel/atom/sst/sst.c
@@ -186,7 +186,7 @@ int sst_driver_ops(struct intel_sst_drv *sst)
 			"SST Driver capabilities missing for dev_id: %x",
 			sst->dev_id);
 		return -EINVAL;
-	};
+	}
 }
 
 void sst_process_pending_msg(struct work_struct *work)
diff --git a/sound/soc/intel/catpt/loader.c b/sound/soc/intel/catpt/loader.c
index 8a5f20abcadb..40c22e4bb263 100644
--- a/sound/soc/intel/catpt/loader.c
+++ b/sound/soc/intel/catpt/loader.c
@@ -304,7 +304,7 @@ static int catpt_load_block(struct catpt_dev *cdev,
 	default:
 		sram = &cdev->dram;
 		break;
-	};
+	}
 
 	dst_addr = sram->start + blk->ram_offset;
 	if (alloc) {
diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index ba653ebea7d1..1775540ac92b 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -92,7 +92,7 @@ catpt_get_stream_template(struct snd_pcm_substream *substream)
 		break;
 	default:
 		break;
-	};
+	}
 
 	return catpt_topology[type];
 }
@@ -419,7 +419,7 @@ static int catpt_dai_apply_usettings(struct snd_soc_dai *dai,
 		break;
 	default:
 		return 0;
-	};
+	}
 
 	list_for_each_entry(pos, &component->card->snd_card->controls, list) {
 		if (pos->private_data == component &&
-- 
2.18.1

