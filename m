Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F645196BC1
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Mar 2020 09:58:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3AB91675;
	Sun, 29 Mar 2020 09:57:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3AB91675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585468706;
	bh=w6rNVLbb9h5jJBdGnLfyrofx4KLoqioQgN2DqGsKz+U=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qqJweiBt4T59S0QtkY8Any4LFgqswC8gOEbX3NxyhJInHe4+lqwE/55UZwBg5po9t
	 bLqBBNfVJmFGd3qHDYrnQGSQpc9rUxZUCgj+QQQiFtV2Tki4c/0j8fbSe7R9WRKvRg
	 jNdw8dAhoRBeKZUlWv3AurO6Lg/tSFmUAyxmQCTY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3011F8029A;
	Sun, 29 Mar 2020 09:54:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25A07F80234; Sat, 28 Mar 2020 17:43:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DATE_IN_PAST_96_XX,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx.sdf.org (mx.sdf.org [205.166.94.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4E62F80146
 for <alsa-devel@alsa-project.org>; Sat, 28 Mar 2020 17:43:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4E62F80146
Received: from sdf.org (IDENT:lkml@sdf.lonestar.org [205.166.94.16])
 by mx.sdf.org (8.15.2/8.14.5) with ESMTPS id 02SGhBmk014221
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits) verified NO);
 Sat, 28 Mar 2020 16:43:12 GMT
Received: (from lkml@localhost)
 by sdf.org (8.15.2/8.12.8/Submit) id 02SGhBrh000992;
 Sat, 28 Mar 2020 16:43:11 GMT
Message-Id: <202003281643.02SGhBrh000992@sdf.org>
From: George Spelvin <lkml@sdf.org>
Date: Wed, 21 Aug 2019 20:25:10 -0400
Subject: [RFC PATCH v1 13/50] Avoid some useless msecs/jiffies conversions
To: linux-kernel@vger.kernel.org, lkml@sdf.org
X-Mailman-Approved-At: Sun, 29 Mar 2020 09:54:16 +0200
Cc: alsa-devel@alsa-project.org, Marek Lindner <mareklindner@neomailbox.ch>,
 linux-scsi@vger.kernel.org, Simon Wunderlich <sw@simonwunderlich.de>,
 linux-wireless@vger.kernel.org, Antonio Quartulli <a@unstable.cc>,
 Takashi Iwai <tiwai@suse.com>, b.a.t.m.a.n@diktynna.open-mesh.org,
 Hannes Reinecke <hare@suse.de>, Johannes Berg <johannes@sipsolutions.net>,
 Sven Eckelmann <sven@narfation.org>
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

Rather than generating a random number of milliseconds in a
constant range and then converting to jiffies, convert the range
to jiffies (evaluated at compile time) and choose a random number
of jiffies in that range.

Likewise, "msecs_to_jiffies(seconds * 1000)" is more
conveniently written "seconds * HZ".

Signed-off-by: George Spelvin <lkml@sdf.org>
Cc: Hannes Reinecke <hare@suse.de>
Cc: linux-scsi@vger.kernel.org
Cc: Marek Lindner <mareklindner@neomailbox.ch>
Cc: Simon Wunderlich <sw@simonwunderlich.de>
Cc: Antonio Quartulli <a@unstable.cc>
Cc: Sven Eckelmann <sven@narfation.org>
Cc: b.a.t.m.a.n@lists.open-mesh.org
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
---
 drivers/scsi/fcoe/fcoe_ctlr.c | 10 +++++-----
 net/batman-adv/bat_iv_ogm.c   |  2 +-
 net/batman-adv/bat_v_ogm.c    |  8 ++++----
 net/bluetooth/hci_request.c   |  2 +-
 net/wireless/scan.c           |  2 +-
 sound/core/pcm_lib.c          |  2 +-
 sound/core/pcm_native.c       |  2 +-
 7 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/scsi/fcoe/fcoe_ctlr.c b/drivers/scsi/fcoe/fcoe_ctlr.c
index 1791a393795da..9c530f8827518 100644
--- a/drivers/scsi/fcoe/fcoe_ctlr.c
+++ b/drivers/scsi/fcoe/fcoe_ctlr.c
@@ -2238,10 +2238,10 @@ static void fcoe_ctlr_vn_restart(struct fcoe_ctlr *fip)
 
 	if (fip->probe_tries < FIP_VN_RLIM_COUNT) {
 		fip->probe_tries++;
-		wait = prandom_u32() % FIP_VN_PROBE_WAIT;
+		wait = prandom_u32_max(msecs_to_jiffies(FIP_VN_PROBE_WAIT));
 	} else
-		wait = FIP_VN_RLIM_INT;
-	mod_timer(&fip->timer, jiffies + msecs_to_jiffies(wait));
+		wait = msecs_to_jiffies(FIP_VN_RLIM_INT);
+	mod_timer(&fip->timer, jiffies + wait);
 	fcoe_ctlr_set_state(fip, FIP_ST_VNMP_START);
 }
 
@@ -3132,8 +3132,8 @@ static void fcoe_ctlr_vn_timeout(struct fcoe_ctlr *fip)
 			fcoe_ctlr_vn_send(fip, FIP_SC_VN_BEACON,
 					  fcoe_all_vn2vn, 0);
 			fip->port_ka_time = jiffies +
-				 msecs_to_jiffies(FIP_VN_BEACON_INT +
-					(prandom_u32() % FIP_VN_BEACON_FUZZ));
+			  msecs_to_jiffies(FIP_VN_BEACON_INT) +
+			  prandom_u32_max(msecs_to_jiffies(FIP_VN_BEACON_FUZZ));
 		}
 		if (time_before(fip->port_ka_time, next_time))
 			next_time = fip->port_ka_time;
diff --git a/net/batman-adv/bat_iv_ogm.c b/net/batman-adv/bat_iv_ogm.c
index 46c5cd9f8019e..9efd96e91d53e 100644
--- a/net/batman-adv/bat_iv_ogm.c
+++ b/net/batman-adv/bat_iv_ogm.c
@@ -288,7 +288,7 @@ batadv_iv_ogm_emit_send_time(const struct batadv_priv *bat_priv)
 /* when do we schedule a ogm packet to be sent */
 static unsigned long batadv_iv_ogm_fwd_send_time(void)
 {
-	return jiffies + msecs_to_jiffies(prandom_u32() % (BATADV_JITTER / 2));
+	return jiffies + prandom_u32_max(msecs_to_jiffies(BATADV_JITTER / 2));
 }
 
 /* apply hop penalty for a normal link */
diff --git a/net/batman-adv/bat_v_ogm.c b/net/batman-adv/bat_v_ogm.c
index 411ce5fc6492f..61fa742ff5501 100644
--- a/net/batman-adv/bat_v_ogm.c
+++ b/net/batman-adv/bat_v_ogm.c
@@ -85,12 +85,12 @@ struct batadv_orig_node *batadv_v_ogm_orig_get(struct batadv_priv *bat_priv,
  */
 static void batadv_v_ogm_start_queue_timer(struct batadv_hard_iface *hard_iface)
 {
-	unsigned int msecs = BATADV_MAX_AGGREGATION_MS * 1000;
+	unsigned int delay = msecs_to_jiffies(BATADV_MAX_AGGREGATION_MS);
 
-	/* msecs * [0.9, 1.1] */
-	msecs += prandom_u32() % (msecs / 5) - (msecs / 10);
+	/* delay * [0.9, 1.1] */
+	delay += prandom_u32_max(delay / 5) - (delay / 10);
 	queue_delayed_work(batadv_event_workqueue, &hard_iface->bat_v.aggr_wq,
-			   msecs_to_jiffies(msecs / 1000));
+			   delay);
 }
 
 /**
diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
index 2a1b64dbf76e4..8b46e23b4abe7 100644
--- a/net/bluetooth/hci_request.c
+++ b/net/bluetooth/hci_request.c
@@ -1505,7 +1505,7 @@ int hci_get_random_address(struct hci_dev *hdev, bool require_privacy,
 
 		bacpy(rand_addr, &hdev->rpa);
 
-		to = msecs_to_jiffies(hdev->rpa_timeout * 1000);
+		to = hdev->rpa_timeout * HZ;
 		if (adv_instance)
 			queue_delayed_work(hdev->workqueue,
 					   &adv_instance->rpa_expired_cb, to);
diff --git a/net/wireless/scan.c b/net/wireless/scan.c
index aef240fdf8df6..b6856cbb68d3b 100644
--- a/net/wireless/scan.c
+++ b/net/wireless/scan.c
@@ -700,7 +700,7 @@ void cfg80211_bss_age(struct cfg80211_registered_device *rdev,
                       unsigned long age_secs)
 {
 	struct cfg80211_internal_bss *bss;
-	unsigned long age_jiffies = msecs_to_jiffies(age_secs * MSEC_PER_SEC);
+	unsigned long age_jiffies = age_secs * HZ;
 
 	spin_lock_bh(&rdev->bss_lock);
 	list_for_each_entry(bss, &rdev->bss_list, list)
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 2236b5e0c1f25..8a2bf333200c1 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1839,7 +1839,7 @@ static int wait_for_avail(struct snd_pcm_substream *substream,
 					 runtime->rate;
 				wait_time = max(t, wait_time);
 			}
-			wait_time = msecs_to_jiffies(wait_time * 1000);
+			wait_time *= HZ;
 		}
 	}
 
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index df40d38f6e290..1ea763f9f956d 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1937,7 +1937,7 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 				long t = runtime->period_size * 2 / runtime->rate;
 				tout = max(t, tout);
 			}
-			tout = msecs_to_jiffies(tout * 1000);
+			tout *= HZ;
 		}
 		tout = schedule_timeout(tout);
 
-- 
2.26.0

