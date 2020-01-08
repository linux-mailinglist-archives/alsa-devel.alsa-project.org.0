Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F651134139
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jan 2020 12:53:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97744173B;
	Wed,  8 Jan 2020 12:52:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97744173B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578484381;
	bh=GW72vant9q/lje30JiFF4dK140NQaAEkAI0YUOXGR5U=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cnrr33WNcfGyl6YvUuFhnc5z2u+xNxV5TUpzU7u5Giu02A3BmNoI+4rRgqQCEnDZJ
	 A06ox1IKSdlTwPCNd9NWwoB+y9E8Sj0M+QSrp2Bbs4TDBPUEJVUEWCnkHgOLRifEm3
	 66mnXIwF91uuhOOQfsK44WOOdNuwCxcN6pshpIyk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8D5EF8026F;
	Wed,  8 Jan 2020 12:50:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97F1EF80159; Wed,  8 Jan 2020 12:50:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A7F0F8010B
 for <alsa-devel@alsa-project.org>; Wed,  8 Jan 2020 12:50:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A7F0F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="Le4Zpk76"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200108115028euoutp0159b57c3ae19f151f96ed2f95e86b9e08~n5wrxRVyc0535205352euoutp01T
 for <alsa-devel@alsa-project.org>; Wed,  8 Jan 2020 11:50:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200108115028euoutp0159b57c3ae19f151f96ed2f95e86b9e08~n5wrxRVyc0535205352euoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578484228;
 bh=+tf4GNTb84v10z63faMIMGJF9BpS6VYqSHVRHe4D8GQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Le4Zpk76bIibTVmOwU78VHbBOtjpJ6lrVCygD6Kr6b2Tt876+PZ1fnfnkXP9WJD9P
 Xn4LU01uOR2awCY8ECTVU25vcT572IRVXF3VCIxEYR8sVHDvFuqmIA2trQZqj0z53q
 +rmJvMsUyuvBiKuw/M6Hf+kkNDzWxbjJMq9NPr90=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200108115028eucas1p16b28b9fc0c43953728d94c2f857fd01f~n5wrORNFD2632626326eucas1p18;
 Wed,  8 Jan 2020 11:50:28 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 46.A5.60679.302C51E5; Wed,  8
 Jan 2020 11:50:27 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200108115027eucas1p1d3645ba53703780679c662921efbca78~n5wq2ZUJc0954609546eucas1p1D;
 Wed,  8 Jan 2020 11:50:27 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200108115027eusmtrp2440bee433050820256d5907847ffbc3b~n5wq1vIf-1831018310eusmtrp2d;
 Wed,  8 Jan 2020 11:50:27 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-4e-5e15c2038a2d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 0F.16.08375.302C51E5; Wed,  8
 Jan 2020 11:50:27 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200108115027eusmtip130fdd566eb8e26c80f969ea589089877~n5wqXbJew1795217952eusmtip18;
 Wed,  8 Jan 2020 11:50:27 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
Date: Wed,  8 Jan 2020 12:50:07 +0100
Message-Id: <20200108115007.31095-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108115007.31095-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjleLIzCtJLcpLzFFi42LZduznOV3mQ6JxBltvW1hcuXiIyWLjjPWs
 FlMfPmGzOHG4kdmifWYHo8X58xvYLS7vmsNmMeP8PiaLtUfuslscftPOarHn4it2B26PDZ+b
 2DwWbCr12LSqk82jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4Mt7+vcBaMFuvYsO2IywNjFPU
 uhg5OSQETCQudM5h7GLk4hASWMEocezwdRYI5wujxOGn19ghnM+MEkdevWaFafn64xorRGI5
 o8TmDYtY4Vo237zOBlLFJmAo0fW2C8wWEUiSOL/gNjNIEbPAZSaJ1Y39zCAJYQELiWffvwPZ
 HBwsAqoS9xurQMK8ArYSB2a8YYbYJi+xesMBsBJOATuJR0ug7m5nlzixIQzCdpG4daUZqlxY
 4tXxLewQtozE/53zmUDWSgg0M0o8PLeWHcLpYZS43DSDEaLKWuLOuV9sIAuYBTQl1u/Shwg7
 Smza/J4dJCwhwCdx460gSJgZyJy0bTozRJhXoqNNCKJaTWLW8XVwaw9euAR1jofE87MzoME7
 kVFi7ZPnrBMY5WchLFvAyLiKUTy1tDg3PbXYKC+1XK84Mbe4NC9dLzk/dxMjMJWc/nf8yw7G
 XX+SDjEKcDAq8fD+WCwSJ8SaWFZcmXuIUYKDWUmEV0sHKMSbklhZlVqUH19UmpNafIhRmoNF
 SZzXeNHLWCGB9MSS1OzU1ILUIpgsEwenVAOj0Zq7R3M5ZbfVl1c2F3ZVtP+Rctpg97Rnwfzc
 p6uTJC73xa+SsG6J6O7W8mMM+XhBq/HD1n/n1T60Vh/gP27gM92XS+Lm59tdj5/KTdVV2d+Q
 GvS89JdZruy8BaaPn5oUy+8pXR+uUt3qsHH+lsDSP+6Gsb/mnJoVEG7qXJnYacCwZJrP8g9K
 LMUZiYZazEXFiQCSPfbeIQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHLMWRmVeSWpSXmKPExsVy+t/xu7rMh0TjDJbdULa4cvEQk8XGGetZ
 LaY+fMJmceJwI7NF+8wORovz5zewW1zeNYfNYsb5fUwWa4/cZbc4/Kad1WLPxVfsDtweGz43
 sXks2FTqsWlVJ5tH35ZVjB6fN8kFsEbp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvH
 WhmZKunb2aSk5mSWpRbp2yXoZbz9e4G1YLZexYZtR1gaGKeodTFyckgImEh8/XGNFcQWEljK
 KLF7HhdEXEbi5LQGVghbWOLPtS62LkYuoJpPjBJ/ln4AS7AJGEp0vQVJcHKICKRI/JyxjhGk
 iFngJpPEj8XLmUESwgIWEs++fweyOThYBFQl7jdWgYR5BWwlDsx4wwyxQF5i9YYDYCWcAnYS
 j5aoQdxjK7H76ATmCYx8CxgZVjGKpJYW56bnFhvqFSfmFpfmpesl5+duYgSG9bZjPzfvYLy0
 MfgQowAHoxIP74/FInFCrIllxZW5hxglOJiVRHi1dIBCvCmJlVWpRfnxRaU5qcWHGE2BTprI
 LCWanA+MubySeENTQ3MLS0NzY3NjMwslcd4OgYMxQgLpiSWp2ampBalFMH1MHJxSDYxCk0x2
 Vi8o2OReIHbsw1rf3dYhOWmd6cI501Pj2247hcQvuHA6QqYzad1GkVde2Q0xvAqr6zqvN7ye
 liC4sf3M4zfml9c8qolbHTYvrapukdCvk/VtgZIVTxbdyTx5VVxN69D1X70zmWxt7bJYA+1y
 5wgKHU9W/vabM5+Z55RHdl5MrKPpcSWW4oxEQy3mouJEAM1aaCyBAgAA
X-CMS-MailID: 20200108115027eucas1p1d3645ba53703780679c662921efbca78
X-Msg-Generator: CA
X-RootMTR: 20200108115027eucas1p1d3645ba53703780679c662921efbca78
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200108115027eucas1p1d3645ba53703780679c662921efbca78
References: <20200108115007.31095-1-m.szyprowski@samsung.com>
 <CGME20200108115027eucas1p1d3645ba53703780679c662921efbca78@eucas1p1.samsung.com>
Cc: Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Tzung-Bi Shih <tzungbi@google.com>,
 Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Dylan Reid <dgreid@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [alsa-devel] [PATCH 2/2] ASoC: max98090: fix lockdep warning
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

Commit 62d5ae4cafb7 ("ASoC: max98090: save and restore SHDN when changing
sensitive registers") extended the code for handling many controls by
adding a custom put function to them. That new custom put function
properly handles relations between codec's hardware registers. However
they used card->dapm_mutex to properly serialize those operations. This
in turn triggers a lockdep warning about possible circular dependency.
Fix this by introducing a separate mutex only for serializing the SHDN
hardware register related operations.

This fixes the following lockdep warning observed on Exynos4412-based
Odroid U3 board:
======================================================
WARNING: possible circular locking dependency detected
5.5.0-rc5-next-20200107 #166 Not tainted
------------------------------------------------------
alsactl/1104 is trying to acquire lock:
ed0d50f4 (&card->dapm_mutex){+.+.}, at: max98090_shdn_save+0x1c/0x28

but task is already holding lock:
edb4b49c (&card->controls_rwsem){++++}, at: snd_ctl_ioctl+0xcc/0xbb8

which lock already depends on the new lock.

the existing dependency chain (in reverse order) is:

-> #1 (&card->controls_rwsem){++++}:
       snd_ctl_add_replace+0x3c/0x84
       dapm_create_or_share_kcontrol+0x24c/0x2e0
       snd_soc_dapm_new_widgets+0x308/0x594
       snd_soc_bind_card+0x80c/0xad4
       devm_snd_soc_register_card+0x34/0x6c
       odroid_audio_probe+0x288/0x34c
       platform_drv_probe+0x6c/0xa4
       really_probe+0x200/0x490
       driver_probe_device+0x78/0x1f8
       bus_for_each_drv+0x74/0xb8
       __device_attach+0xd4/0x16c
       bus_probe_device+0x88/0x90
       deferred_probe_work_func+0x3c/0xd0
       process_one_work+0x22c/0x7c4
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
       ksys_ioctl+0x470/0xaf8
       ret_fast_syscall+0x0/0x28
       0xbefaa564

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&card->controls_rwsem);
                               lock(&card->dapm_mutex);
                               lock(&card->controls_rwsem);
  lock(&card->dapm_mutex);

 *** DEADLOCK ***

1 lock held by alsactl/1104:
 #0: edb4b49c (&card->controls_rwsem){++++}, at: snd_ctl_ioctl+0xcc/0xbb8

stack backtrace:
CPU: 0 PID: 1104 Comm: alsactl Not tainted 5.5.0-rc5-next-20200107 #166
Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
(unwind_backtrace) from [<c010e180>] (show_stack+0x10/0x14)
(show_stack) from [<c0b2a09c>] (dump_stack+0xb4/0xe0)
(dump_stack) from [<c018a1c0>] (check_noncircular+0x1ec/0x208)
(check_noncircular) from [<c018c5dc>] (__lock_acquire+0x1210/0x25ec)
(__lock_acquire) from [<c018e2d8>] (lock_acquire+0xe8/0x270)
(lock_acquire) from [<c0b49678>] (__mutex_lock+0x9c/0xb18)
(__mutex_lock) from [<c0b4a110>] (mutex_lock_nested+0x1c/0x24)
(mutex_lock_nested) from [<c0839b3c>] (max98090_shdn_save+0x1c/0x28)
(max98090_shdn_save) from [<c083a5b8>] (max98090_put_enum_double+0x20/0x40)
(max98090_put_enum_double) from [<c080d0e8>] (snd_ctl_ioctl+0x190/0xbb8)
(snd_ctl_ioctl) from [<c02cafec>] (ksys_ioctl+0x470/0xaf8)
(ksys_ioctl) from [<c0101000>] (ret_fast_syscall+0x0/0x28)
...

Fixes: 62d5ae4cafb7 ("ASoC: max98090: save and restore SHDN when changing sensitive registers")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 sound/soc/codecs/max98090.c | 10 ++++++----
 sound/soc/codecs/max98090.h |  1 +
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index c01ce4a3f86d..454cb8e5b0a1 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -52,14 +52,14 @@ static void max98090_shdn_restore_locked(struct max98090_priv *max98090)
 
 static void max98090_shdn_save(struct max98090_priv *max98090)
 {
-	mutex_lock(&max98090->component->card->dapm_mutex);
+	mutex_lock(&max98090->shdn_lock);
 	max98090_shdn_save_locked(max98090);
 }
 
 static void max98090_shdn_restore(struct max98090_priv *max98090)
 {
 	max98090_shdn_restore_locked(max98090);
-	mutex_unlock(&max98090->component->card->dapm_mutex);
+	mutex_unlock(&max98090->shdn_lock);
 }
 
 static int max98090_put_volsw(struct snd_kcontrol *kcontrol,
@@ -2313,12 +2313,12 @@ static void max98090_pll_work(struct max98090_priv *max98090)
 	 */
 
 	/* Toggle shutdown OFF then ON */
-	mutex_lock(&component->card->dapm_mutex);
+	mutex_lock(&max98090->shdn_lock);
 	snd_soc_component_update_bits(component, M98090_REG_DEVICE_SHUTDOWN,
 			    M98090_SHDNN_MASK, 0);
 	snd_soc_component_update_bits(component, M98090_REG_DEVICE_SHUTDOWN,
 			    M98090_SHDNN_MASK, M98090_SHDNN_MASK);
-	mutex_unlock(&component->card->dapm_mutex);
+	mutex_unlock(&max98090->shdn_lock);
 
 	for (i = 0; i < 10; ++i) {
 		/* Give PLL time to lock */
@@ -2731,6 +2731,8 @@ static int max98090_i2c_probe(struct i2c_client *i2c,
 	if (max98090 == NULL)
 		return -ENOMEM;
 
+	mutex_init(&max98090->shdn_lock);
+
 	if (ACPI_HANDLE(&i2c->dev)) {
 		acpi_id = acpi_match_device(i2c->dev.driver->acpi_match_table,
 					    &i2c->dev);
diff --git a/sound/soc/codecs/max98090.h b/sound/soc/codecs/max98090.h
index 0a31708b7df7..dabd8be34a01 100644
--- a/sound/soc/codecs/max98090.h
+++ b/sound/soc/codecs/max98090.h
@@ -1539,6 +1539,7 @@ struct max98090_priv {
 	unsigned int pa2en;
 	unsigned int sidetone;
 	bool master;
+	struct mutex shdn_lock;
 	int saved_count;
 	int saved_shdn;
 };
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
