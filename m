Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26701146964
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jan 2020 14:42:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD27C1685;
	Thu, 23 Jan 2020 14:42:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD27C1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579786975;
	bh=ZuQoMMMX3aFUqGnkqFe8SJxMP23op/gsGtKgCL+in1M=;
	h=From:To:Date:References:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ja6pdSon3jZU3rZtxFq96FeBqfrvrJYhRYm4sKq+iHn35mMHMVZzTYdP8Qm9iYMyo
	 HuoiZztEWe73ZTJgSQ1dWbXqF83WnAPJFjp5Ta52Srj523fCcWHzuRhyzNNf2L3+e3
	 PQVZbGHKaC+8kTwubI1o5RT/XivdpOsOHVG7ewM0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F6FBF801D9;
	Thu, 23 Jan 2020 14:41:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2613F801D9; Thu, 23 Jan 2020 14:41:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BD8DF800E7
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 14:41:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BD8DF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="XJS0Z/EQ"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200123134101euoutp02a46f1c5d23059f327951ade4fb14d28a~sh8fcyvsd0123601236euoutp02k
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 13:41:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200123134101euoutp02a46f1c5d23059f327951ade4fb14d28a~sh8fcyvsd0123601236euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579786861;
 bh=ZGbG1trnMfxnxiOl694oQYbvwi99MZvwy2VPOXqw/Nw=;
 h=From:To:Cc:Subject:Date:References:From;
 b=XJS0Z/EQrvW98RqKrAECYBQrX+XrU6YAM8n31oeZLea2XYQTplS/MZ09lMemqAp/e
 vQqqMBlyqgHWkehYASISqrslh+ZFuxeo1hhwUiNhLAByxUZEgB6jJ8ze4B6lhYnuR0
 K1NITMEfY1grdP9k/Ijn6/DlvELCwxIOHYWURbpI=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200123134101eucas1p20fad4ad4210c6069f083d42a303dafad~sh8fKLoi41835818358eucas1p2U;
 Thu, 23 Jan 2020 13:41:01 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 5D.B0.60698.D62A92E5; Thu, 23
 Jan 2020 13:41:01 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200123134100eucas1p1078c46b83d1ef49f9b1616f8f7789cf1~sh8eurSxH0264902649eucas1p1C;
 Thu, 23 Jan 2020 13:41:00 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200123134100eusmtrp256b30342263bd08b6496efc722a5d914~sh8euBVjK2966729667eusmtrp2U;
 Thu, 23 Jan 2020 13:41:00 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-6a-5e29a26d67d4
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id F6.A9.07950.C62A92E5; Thu, 23
 Jan 2020 13:41:00 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200123134100eusmtip2724e809f5bc1bdb2b25003c7e6f041c5~sh8eKFQUE0505605056eusmtip2D;
 Thu, 23 Jan 2020 13:41:00 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
Date: Thu, 23 Jan 2020 14:40:46 +0100
Message-Id: <20200123134046.9769-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRju2zk7O5sujlPw84LRomBBmpl6IJGipPXPX+Ukl1MPU3JTdjZT
 g/CGlyXNbjotnCwkm+nWEE0z02O1yNy8FAZqJgiRJV5W0DSyzbMu/54r7/PjxRFRFTccz1Nr
 KY1akS/GBGjvS4/zkMoskR9uWoDk20mGQz4yWrnk7cUljHw1Wo6QNc21gHS5bDxyeuAuRhpd
 Qxyy6/k8jxz9WsMlByeXeccDpDZ3BSZts+ukdksdJr3WYwFStz0qlZsuSMqh8vOKKE1McqYg
 d6C3Dy0s31e89NqBloH1SD3g45A4Ck1zZkQPBLiI6ADQZGr3k28AXh/RYyxxA7jYaeD8qVS+
 2wSscR/AiZnZ/yoWJ8+XwohYqF/x1fl4CJEFXW1sCCGmObCz3ID4jGCChGsMs4NRYj9sXl9F
 fVhIJMEux4b/3B7YaRveKUPCjUHmpglhjVOw9YsBsDgYLjt6eCyOhNv9Jg5bqPQOd3bxWFIP
 4HSF0d84Buecm959uHeTBFoHYlj5BPSMPuX5ZEjshu9Xgnwy4oU3epsQVhbC2moRmz4AWxzd
 f8+OTEz5p0mh1cxwfVhEZMA6xydOA4hq+XerDQALCKV0tEpJ0XFq6lI0rVDROrUyOrtAZQfe
 3xj75fj+GAz9zGIAgQNxoHBYL5GLuIoiukTFAIgj4hAhOOuVhDmKklJKU3BBo8unaAZE4Kg4
 VBhn/pwhIpQKLXWRogopzR+Xg/PDy4DZcm457cgH7HxKxNpSrXYX5TkZKz+tlUXeOhN0h6/V
 zxaO/7hSb4t/UpqcELhlTB2UdWTHBTSOf2xFH4x1J4YYEsPSpiTI8MTCM1nY5fTU4ofKftdm
 qPxNlSyxnfA09CeNxZszUxKitqs5Wy829I3z1TV9e1XWdvPM1axV+T0xSucqYg8iGlrxG8Nx
 NQUXAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJLMWRmVeSWpSXmKPExsVy+t/xe7o5izTjDJoOWFlcuXiIyWLjjPWs
 FlMfPmGzOHG4kdmifWYHo8X58xvYLS7vmsNmMeP8PiaLtUfuslscftPOarHn4it2B26PDZ+b
 2DwWbCr12LSqk82jb8sqRo/Pm+QCWKP0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1j
 rYxMlfTtbFJSczLLUov07RL0MnZt285S0Khc8eTUcZYGxo8yXYycHBICJhLNV38xdjFycQgJ
 LGWUmHDoAAtEQkbi5LQGVghbWOLPtS42iKJPjBKn3u9kAkmwCRhKdL0FSXByiAikSPycsQ5s
 ErPATSaJH4uXM4MkhAUsJD4cOgRmswioSsz8+B5sA6+AjcTa45+YIDbIS6zecIB5AiPPAkaG
 VYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmbGIHBuu3Yzy07GLveBR9iFOBgVOLhlejVjBNiTSwr
 rsw9xCjBwawkwssYBhTiTUmsrEotyo8vKs1JLT7EaAq0fCKzlGhyPjCS8kriDU0NzS0sDc2N
 zY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1MJp6fao4deDcfRut/0+WR845cuGLqmCg
 XOmq0vzOos9n6wL+rZzqc+hImp15GG/G6ikZDokTTq9hWphnJ7T6XbW+7jW20Ar/vMObsv96
 Fig+ZHCe8tOd22b1hounGVUkXu4U5jO7enrOxGuJbLFHkk7O3/b+aGoOozd7ppd2PGO7vVD+
 41dHfyqxFGckGmoxFxUnAgC351VtbAIAAA==
X-CMS-MailID: 20200123134100eucas1p1078c46b83d1ef49f9b1616f8f7789cf1
X-Msg-Generator: CA
X-RootMTR: 20200123134100eucas1p1078c46b83d1ef49f9b1616f8f7789cf1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200123134100eucas1p1078c46b83d1ef49f9b1616f8f7789cf1
References: <CGME20200123134100eucas1p1078c46b83d1ef49f9b1616f8f7789cf1@eucas1p1.samsung.com>
Cc: Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Tzung-Bi Shih <tzungbi@google.com>,
 Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Dylan Reid <dgreid@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [alsa-devel] [PATCH] ASoC: max98090: silence lockdep warning
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

Commit 08df0d9a00f7 ("ASoC: max98090: revert "ASoC: max98090: fix lockdep
warning"") provided a good rationale for removing separate lock for the
SHDN register access. However it restored the lockdep warning during the
system boot. To silence the lockdep warning, mark the mutex taken in the
max98090_shdn_save() function with the lockdep class dedicated for the
runtime DAPM operations: SND_SOC_DAPM_CLASS_RUNTIME. This finally fixes
the following lockdep warning observed on Exynos4412-based Odroid U3
board:

======================================================
WARNING: possible circular locking dependency detected
5.5.0-rc7-next-20200123 #7329 Not tainted
------------------------------------------------------
alsactl/1105 is trying to acquire lock:
ed4f7cf4 (&card->dapm_mutex){+.+.}, at: max98090_shdn_save+0x1c/0x28

but task is already holding lock:
edb8d49c (&card->controls_rwsem){++++}, at: snd_ctl_ioctl+0xcc/0xbb8

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&card->controls_rwsem){++++}:
       snd_ctl_add_replace+0x3c/0x84
       dapm_create_or_share_kcontrol+0x24c/0x2e0
       snd_soc_dapm_new_widgets+0x308/0x594
       snd_soc_bind_card+0x834/0xa94
       devm_snd_soc_register_card+0x34/0x6c
       odroid_audio_probe+0x288/0x34c
       platform_drv_probe+0x6c/0xa4
       really_probe+0x200/0x48c
       driver_probe_device+0x78/0x1f8
       bus_for_each_drv+0x74/0xb8
       __device_attach+0xd4/0x16c
       bus_probe_device+0x88/0x90
       deferred_probe_work_func+0x3c/0xd0
       process_one_work+0x230/0x7bc
       worker_thread+0x44/0x524
       kthread+0x130/0x164
       ret_from_fork+0x14/0x20
       0x0

-> #0 (&card->dapm_mutex){+.+.}:
       lock_acquire+0xe8/0x270
       __mutex_lock+0x9c/0xb18
       mutex_lock_nested+0x1c/0x24
       max98090_shdn_save+0x1c/0x28
       max98090_put_enum_double+0x20/0x40
       snd_ctl_ioctl+0x190/0xbb8
       ksys_ioctl+0x484/0xb10
       ret_fast_syscall+0x0/0x28
       0xbede0564

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&card->controls_rwsem);
                               lock(&card->dapm_mutex);
                               lock(&card->controls_rwsem);
  lock(&card->dapm_mutex);

 *** DEADLOCK ***

1 lock held by alsactl/1105:
 #0: edb8d49c (&card->controls_rwsem){++++}, at: snd_ctl_ioctl+0xcc/0xbb8

stack backtrace:
CPU: 2 PID: 1105 Comm: alsactl Not tainted 5.5.0-rc7-next-20200123 #7329
Hardware name: Samsung Exynos (Flattened Device Tree)
[<c01126f0>] (unwind_backtrace) from [<c010e1e8>] (show_stack+0x10/0x14)
[<c010e1e8>] (show_stack) from [<c0b5234c>] (dump_stack+0xb4/0xe0)
[<c0b5234c>] (dump_stack) from [<c018a610>] (check_noncircular+0x1ec/0x208)
[<c018a610>] (check_noncircular) from [<c018ca2c>] (__lock_acquire+0x1210/0x25ec)
[<c018ca2c>] (__lock_acquire) from [<c018e728>] (lock_acquire+0xe8/0x270)
[<c018e728>] (lock_acquire) from [<c0b71928>] (__mutex_lock+0x9c/0xb18)
[<c0b71928>] (__mutex_lock) from [<c0b723c0>] (mutex_lock_nested+0x1c/0x24)
[<c0b723c0>] (mutex_lock_nested) from [<c086097c>] (max98090_shdn_save+0x1c/0x28)
[<c086097c>] (max98090_shdn_save) from [<c08613f8>] (max98090_put_enum_double+0x20/0x40)
[<c08613f8>] (max98090_put_enum_double) from [<c0833f20>] (snd_ctl_ioctl+0x190/0xbb8)
[<c0833f20>] (snd_ctl_ioctl) from [<c02cae14>] (ksys_ioctl+0x484/0xb10)
[<c02cae14>] (ksys_ioctl) from [<c0101000>] (ret_fast_syscall+0x0/0x28)
Exception stack(0xed331fa8 to 0xed331ff0)
...

Fixes: 08df0d9a00f7 ("ASoC: max98090: revert "ASoC: max98090: fix lockdep warning"")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 sound/soc/codecs/max98090.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 0313e1183167..5bc2c6411b33 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -52,7 +52,8 @@ static void max98090_shdn_restore_locked(struct max98090_priv *max98090)
 
 static void max98090_shdn_save(struct max98090_priv *max98090)
 {
-	mutex_lock(&max98090->component->card->dapm_mutex);
+	mutex_lock_nested(&max98090->component->card->dapm_mutex,
+			  SND_SOC_DAPM_CLASS_RUNTIME);
 	max98090_shdn_save_locked(max98090);
 }
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
