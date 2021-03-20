Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D1F342B66
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Mar 2021 10:17:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A7E3168D;
	Sat, 20 Mar 2021 10:16:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A7E3168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616231866;
	bh=2atiRzHqHBqiVdTWEsTP2+R11HNKKVJfvc5bK4mvAr8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r8Pkh/4qZiJOSaGTKzc1zsqQ/sAEUPXPNLX3QTXclR7DkiUSoO+VgjJ7ld7x85XIe
	 cZDk+piPEynEMA+VM23fH+LwUJRYuauTDSKMLR5PgfWRoVZeX+vIg7nJzFgjpTWtLz
	 a3qls0ZQAR7zlYY0SHVUE8fC3uFX2IahTT1j2b6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D030F80118;
	Sat, 20 Mar 2021 10:16:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E067AF8012D; Sat, 20 Mar 2021 10:16:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E102F800BB
 for <alsa-devel@alsa-project.org>; Sat, 20 Mar 2021 10:15:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E102F800BB
Received: from [123.112.71.70] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1lNXi6-0001zg-B2; Sat, 20 Mar 2021 09:15:55 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org, tiwai@suse.de, kailang@realtek.com,
 stable@vger.kernel.org
Subject: [PATCH v3 2/2] ALSA: hda/realtek: call alc_update_headset_mode() in
 hp_automute_hook
Date: Sat, 20 Mar 2021 17:15:42 +0800
Message-Id: <20210320091542.6748-2-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210320091542.6748-1-hui.wang@canonical.com>
References: <20210320091542.6748-1-hui.wang@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

We found the alc_update_headset_mode() is not called on some machines
when unplugging the headset, as a result, the mode of the
ALC_HEADSET_MODE_UNPLUGGED can't be set, then the current_headset_type
is not cleared, if users plug a differnt type of headset next time,
the determine_headset_type() will not be called and the audio jack is
set to the headset type of previous time.

On the Dell machines which connect the dmic to the PCH, if we open
the gnome-sound-setting and unplug the headset, this issue will
happen. Those machines disable the auto-mute by ucm and has no
internal mic in the input source, so the update_headset_mode() will
not be called by cap_sync_hook or automute_hook when unplugging, and
because the gnome-sound-setting is opened, the codec will not enter
the runtime_suspend state, so the update_headset_mode() will not be
called by alc_resume when unplugging. In this case the
hp_automute_hook is called when unplugging, so add
update_headset_mode() calling to this function.

Cc: <stable@vger.kernel.org>
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 442e555de44c..01d9d44aeec1 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -5447,6 +5447,7 @@ static void alc_update_headset_jack_cb(struct hda_codec *codec,
 				       struct hda_jack_callback *jack)
 {
 	snd_hda_gen_hp_automute(codec, jack);
+	alc_update_headset_mode(codec);
 }
 
 static void alc_probe_headset_mode(struct hda_codec *codec)
-- 
2.25.1

